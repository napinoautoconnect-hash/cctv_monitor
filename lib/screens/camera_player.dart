import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_webrtc/flutter_webrtc.dart';

import 'package:media_kit/media_kit.dart';
import 'package:media_kit_video/media_kit_video.dart';

class CameraPlayer extends StatefulWidget {
  final String rtspUrl;

  // MediaMTX path used only on Flutter Web.
  //
  // Example:
  // haridwar-awp-wip-old
  //
  // Android/iOS will continue using RTSP.
  final String? mediaMtxPath;

  final bool visible;

  const CameraPlayer({
    super.key,
    required this.rtspUrl,
    this.mediaMtxPath,
    this.visible = true,
  });

  @override
  State<CameraPlayer> createState() => _CameraPlayerState();

  static final Set<_CameraPlayerState> _players = <_CameraPlayerState>{};

  static void _register(_CameraPlayerState player) {
    _players.add(player);

    debugPrint('CameraPlayer REGISTERED | Total: ${_players.length}');
  }

  static void _unregister(_CameraPlayerState player) {
    _players.remove(player);

    debugPrint('CameraPlayer UNREGISTERED | Total: ${_players.length}');
  }

  static Future<void> stopAllPlayers() async {
    debugPrint('============================================');
    debugPrint('STOPPING ALL CCTV PLAYERS');
    debugPrint('Players: ${_players.length}');
    debugPrint('============================================');

    final players = List<_CameraPlayerState>.from(_players);

    for (final player in players) {
      try {
        await player.stopAndDispose();
      } catch (e) {
        debugPrint('Error stopping CameraPlayer: $e');
      }
    }

    _players.clear();

    await Future.delayed(const Duration(milliseconds: 250));

    debugPrint('ALL CCTV PLAYERS STOPPED');
  }
}

class _CameraPlayerState extends State<CameraPlayer> {
  // ==============================================================
  // MEDIA KIT
  // ==============================================================

  Player? _player;
  VideoController? _controller;

  StreamSubscription? _errorSub;
  StreamSubscription? _playingSub;

  // ==============================================================
  // COMMON TIMERS
  // ==============================================================

  Timer? _timeoutTimer;
  Timer? _retryTimer;

  // ==============================================================
  // COMMON STATE
  // ==============================================================

  bool _loading = true;
  bool _opening = false;
  bool _disposed = false;
  bool _isPlaying = false;

  String? _error;

  int _attempt = 0;

  static const int maxAttempts = 3;

  static const Duration connectionTimeout = Duration(seconds: 10);

  bool get _isWeb => kIsWeb;

  // ==============================================================
  // WEBRTC
  // ==============================================================

  RTCPeerConnection? _webPeerConnection;

  RTCVideoRenderer? _webRenderer;

  bool _webConnected = false;
  bool _webOpening = false;

  Timer? _webTimeoutTimer;
  Timer? _webRetryTimer;

  int _webAttempt = 0;

  static const int maxWebAttempts = 3;

  static const Duration webConnectionTimeout = Duration(seconds: 12);

  // ==============================================================
  // MEDIAMTX
  // ==============================================================

  // static const String mediaMtxServer = '172.16.86.209';
  static const String mediaMtxServer = '172.16.34.43';
  // static const String mediaMtxServer = '14.140.246.38';

  static const int mediaMtxWebRtcPort = 8889;

  String get _whepUrl {
    final path = widget.mediaMtxPath;

    if (path == null || path.trim().isEmpty) {
      return '';
    }

    return 'http://$mediaMtxServer:$mediaMtxWebRtcPort/$path/whep';
  }

  // ==============================================================
  // INIT
  // ==============================================================

  @override
  void initState() {
    super.initState();

    CameraPlayer._register(this);

    // ============================================================
    // WEB
    // ============================================================

    if (_isWeb) {
      debugPrint('CCTV WEB: CameraPlayer initialized');

      debugPrint(
        'CCTV WEB: MediaMTX path = '
        '${widget.mediaMtxPath}',
      );

      WidgetsBinding.instance.addPostFrameCallback((_) {
        if (!_disposed && mounted && widget.visible) {
          _openWebRtc();
        }
      });

      return;
    }

    // ============================================================
    // ANDROID / IOS
    // ============================================================

    _player = Player(
      configuration: const PlayerConfiguration(bufferSize: 4 * 1024 * 1024),
    );

    _controller = VideoController(_player!);

    _errorSub = _player!.stream.error.listen((error) {
      if (_disposed) return;

      debugPrint('============================================');

      debugPrint('RTSP ERROR: $error');

      debugPrint('============================================');

      _connectionFailed(error.toString());
    });

    _playingSub = _player!.stream.playing.listen((playing) {
      if (_disposed) return;

      debugPrint(
        'RTSP PLAYING: $playing | '
        '${widget.rtspUrl}',
      );

      if (playing) {
        _isPlaying = true;

        _timeoutTimer?.cancel();
        _timeoutTimer = null;

        _retryTimer?.cancel();
        _retryTimer = null;

        if (mounted) {
          setState(() {
            _loading = false;
            _error = null;
          });
        }
      }
    });

    if (widget.visible) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        if (!_disposed && mounted && widget.visible) {
          _open();
        }
      });
    }
  }

  // ==============================================================
  // OPEN RTSP
  // ==============================================================

  Future<void> _open() async {
    if (_isWeb) {
      return;
    }

    if (_disposed || !mounted) return;

    if (!widget.visible) return;

    if (_opening) return;

    final player = _player;

    if (player == null) return;

    _opening = true;

    _timeoutTimer?.cancel();
    _timeoutTimer = null;

    if (mounted) {
      setState(() {
        _loading = true;
        _error = null;
      });
    }

    try {
      try {
        await player.stop();
      } catch (_) {}

      if (_disposed || !mounted) {
        return;
      }

      _isPlaying = false;

      debugPrint('--------------------------------------------');

      debugPrint('OPEN RTSP');

      debugPrint('Attempt: $_attempt');

      debugPrint(widget.rtspUrl);

      debugPrint('--------------------------------------------');

      final media = Media(
        widget.rtspUrl,
        extras: const {'rtsp_transport': 'tcp'},
      );

      await player.open(media, play: true);

      if (_disposed || !mounted) {
        return;
      }

      _timeoutTimer = Timer(connectionTimeout, () {
        if (_disposed || !mounted) {
          return;
        }

        if (!_isPlaying) {
          debugPrint('RTSP TIMEOUT: ${widget.rtspUrl}');

          _connectionFailed('Connection timeout');
        }
      });
    } catch (e) {
      debugPrint('RTSP OPEN EXCEPTION: $e');

      if (!_disposed && mounted) {
        _connectionFailed(e.toString());
      }
    } finally {
      _opening = false;
    }
  }

  // ==============================================================
  // RTSP CONNECTION FAILED
  // ==============================================================

  void _connectionFailed(String error) {
    if (_disposed || !mounted || !widget.visible) {
      return;
    }

    _timeoutTimer?.cancel();
    _timeoutTimer = null;

    _isPlaying = false;

    if (_attempt < maxAttempts) {
      _attempt++;

      debugPrint('RTSP RETRY $_attempt/$maxAttempts');

      _retryTimer?.cancel();

      _retryTimer = Timer(const Duration(milliseconds: 700), () {
        if (!_disposed && mounted && widget.visible) {
          _open();
        }
      });

      return;
    }

    debugPrint('RTSP FINAL ERROR: $error');

    if (mounted) {
      setState(() {
        _loading = false;
        _error = error;
      });
    }
  }

  // ==============================================================
  // WEBRTC OPEN
  // ==============================================================

  Future<void> _openWebRtc() async {
    if (!_isWeb) {
      return;
    }

    if (_disposed || !mounted) {
      return;
    }

    if (!widget.visible) {
      return;
    }

    if (_webOpening) {
      return;
    }

    final path = widget.mediaMtxPath;

    if (path == null || path.trim().isEmpty) {
      debugPrint('CCTV WEB: MediaMTX path missing');

      if (mounted) {
        setState(() {
          _loading = false;
          _error = 'Web stream is not configured for this camera.';
        });
      }

      return;
    }

    _webOpening = true;

    _webTimeoutTimer?.cancel();
    _webTimeoutTimer = null;

    _webRetryTimer?.cancel();
    _webRetryTimer = null;

    if (mounted) {
      setState(() {
        _loading = true;
        _error = null;
      });
    }

    try {
      await _disposeWebRtc();

      if (_disposed || !mounted) {
        return;
      }

      debugPrint('============================================');

      debugPrint('OPEN WEBRTC');

      debugPrint('Attempt: $_webAttempt');

      debugPrint('MediaMTX Path: $path');

      debugPrint('WHEP URL: $_whepUrl');

      debugPrint('============================================');

      // ----------------------------------------------------------
      // Renderer
      // ----------------------------------------------------------

      final renderer = RTCVideoRenderer();

      await renderer.initialize();

      if (_disposed || !mounted) {
        await renderer.dispose();
        return;
      }

      _webRenderer = renderer;

      // ----------------------------------------------------------
      // Peer Connection
      // ----------------------------------------------------------

      final peerConnection = await createPeerConnection(<String, dynamic>{
        'sdpSemantics': 'unified-plan',
      });

      if (_disposed || !mounted) {
        await peerConnection.close();
        await peerConnection.dispose();
        return;
      }

      _webPeerConnection = peerConnection;

      // ----------------------------------------------------------
      // Remote Track
      // ----------------------------------------------------------

      peerConnection.onTrack = (RTCTrackEvent event) {
        if (_disposed) {
          return;
        }

        debugPrint(
          'CCTV WEB: Remote track received '
          '| kind=${event.track.kind}',
        );

        final streams = event.streams;

        if (streams.isNotEmpty) {
          final stream = streams.first;

          _webRenderer?.srcObject = stream;

          debugPrint('CCTV WEB: Renderer attached');

          if (mounted) {
            setState(() {
              _webConnected = true;
              _loading = false;
              _error = null;
            });
          }

          _webTimeoutTimer?.cancel();
          _webTimeoutTimer = null;

          _webRetryTimer?.cancel();
          _webRetryTimer = null;
        }
      };

      // ----------------------------------------------------------
      // Connection state
      // ----------------------------------------------------------

      peerConnection.onConnectionState = (RTCPeerConnectionState state) {
        debugPrint('CCTV WEB: Connection state = $state');

        if (_disposed) {
          return;
        }

        if (state == RTCPeerConnectionState.RTCPeerConnectionStateConnected ||
            state == RTCPeerConnectionState.RTCPeerConnectionStateConnecting) {
          return;
        }

        if (state == RTCPeerConnectionState.RTCPeerConnectionStateFailed ||
            state ==
                RTCPeerConnectionState.RTCPeerConnectionStateDisconnected ||
            state == RTCPeerConnectionState.RTCPeerConnectionStateClosed) {
          if (!_webConnected) {
            _webConnectionFailed('WebRTC connection $state');
          }
        }
      };

      // ----------------------------------------------------------
      // ICE state logging
      // ----------------------------------------------------------

      peerConnection.onIceConnectionState = (RTCIceConnectionState state) {
        debugPrint('CCTV WEB: ICE connection state = $state');
      };

      peerConnection.onIceGatheringState = (RTCIceGatheringState state) {
        debugPrint('CCTV WEB: ICE gathering state = $state');
      };

      // ----------------------------------------------------------
      // Receive video
      // ----------------------------------------------------------

      await peerConnection.addTransceiver(
        kind: RTCRtpMediaType.RTCRtpMediaTypeVideo,
      );

      // ----------------------------------------------------------
      // Receive audio
      // ----------------------------------------------------------

      await peerConnection.addTransceiver(
        kind: RTCRtpMediaType.RTCRtpMediaTypeAudio,
      );

      // ----------------------------------------------------------
      // Create offer
      // ----------------------------------------------------------

      final offer = await peerConnection.createOffer();

      await peerConnection.setLocalDescription(offer);

      // ----------------------------------------------------------
      // Wait for ICE gathering
      // ----------------------------------------------------------

      await _waitForIceGathering(peerConnection);

      if (_disposed || !mounted) {
        return;
      }

      final localDescription = await peerConnection.getLocalDescription();

      if (localDescription == null ||
          localDescription.sdp == null ||
          localDescription.sdp!.isEmpty) {
        throw Exception('WebRTC local SDP is empty.');
      }

      // ----------------------------------------------------------
      // WHEP POST
      // ----------------------------------------------------------

      final response = await http.post(
        Uri.parse(_whepUrl),
        headers: const {
          'Content-Type': 'application/sdp',
          'Accept': 'application/sdp',
        },
        body: localDescription.sdp!,
      );

      debugPrint(
        'CCTV WEB: WHEP response = '
        '${response.statusCode}',
      );

      if (response.statusCode < 200 || response.statusCode >= 300) {
        throw Exception(
          'MediaMTX WHEP HTTP '
          '${response.statusCode}: '
          '${response.body}',
        );
      }

      if (response.body.trim().isEmpty) {
        throw Exception('MediaMTX returned an empty SDP answer.');
      }

      // ----------------------------------------------------------
      // Remote answer
      // ----------------------------------------------------------

      final answer = RTCSessionDescription(response.body, 'answer');

      await peerConnection.setRemoteDescription(answer);

      debugPrint('CCTV WEB: Remote SDP applied');

      // ----------------------------------------------------------
      // Connection timeout
      // ----------------------------------------------------------

      _webTimeoutTimer = Timer(webConnectionTimeout, () {
        if (_disposed || !mounted) {
          return;
        }

        if (!_webConnected) {
          debugPrint('CCTV WEB: WebRTC connection timeout');

          _webConnectionFailed('WebRTC connection timeout');
        }
      });
    } catch (e, stackTrace) {
      debugPrint('============================================');

      debugPrint('CCTV WEBRTC ERROR: $e');

      debugPrint('$stackTrace');

      debugPrint('============================================');

      if (!_disposed && mounted && widget.visible) {
        _webConnectionFailed(e.toString());
      }
    } finally {
      _webOpening = false;
    }
  }

  // ==============================================================
  // WAIT ICE
  // ==============================================================

  Future<void> _waitForIceGathering(RTCPeerConnection peerConnection) async {
    final current = peerConnection.iceGatheringState;

    if (current == RTCIceGatheringState.RTCIceGatheringStateComplete) {
      return;
    }

    final completer = Completer<void>();

    Timer? timer;

    void finish() {
      if (!completer.isCompleted) {
        completer.complete();
      }

      timer?.cancel();

      peerConnection.onIceGatheringState = null;
    }

    peerConnection.onIceGatheringState = (RTCIceGatheringState state) {
      debugPrint('CCTV WEB: ICE gathering = $state');

      if (state == RTCIceGatheringState.RTCIceGatheringStateComplete) {
        finish();
      }
    };

    timer = Timer(const Duration(seconds: 5), finish);

    await completer.future;
  }

  // ==============================================================
  // WEBRTC FAILED
  // ==============================================================

  void _webConnectionFailed(String error) {
    if (_disposed || !mounted || !widget.visible) {
      return;
    }

    _webTimeoutTimer?.cancel();
    _webTimeoutTimer = null;

    _webConnected = false;

    if (_webAttempt < maxWebAttempts) {
      _webAttempt++;

      debugPrint(
        'CCTV WEB RETRY '
        '$_webAttempt/$maxWebAttempts',
      );

      _webRetryTimer?.cancel();

      _webRetryTimer = Timer(const Duration(milliseconds: 800), () {
        if (!_disposed && mounted && widget.visible) {
          _openWebRtc();
        }
      });

      return;
    }

    debugPrint('CCTV WEB FINAL ERROR: $error');

    if (mounted) {
      setState(() {
        _loading = false;
        _error = error;
      });
    }
  }

  // ==============================================================
  // DISPOSE WEBRTC
  // ==============================================================

  Future<void> _disposeWebRtc() async {
    _webTimeoutTimer?.cancel();
    _webTimeoutTimer = null;

    _webRetryTimer?.cancel();
    _webRetryTimer = null;

    _webConnected = false;

    final renderer = _webRenderer;
    _webRenderer = null;

    if (renderer != null) {
      try {
        renderer.srcObject = null;
      } catch (_) {}

      try {
        await renderer.dispose();
      } catch (e) {
        debugPrint('CCTV WEB: Renderer dispose error: $e');
      }
    }

    final peerConnection = _webPeerConnection;

    _webPeerConnection = null;

    if (peerConnection != null) {
      try {
        await peerConnection.close();
      } catch (e) {
        debugPrint('CCTV WEB: Peer close error: $e');
      }

      try {
        await peerConnection.dispose();
      } catch (e) {
        debugPrint('CCTV WEB: Peer dispose error: $e');
      }
    }
  }

  // ==============================================================
  // MANUAL RETRY
  // ==============================================================

  Future<void> _manualRetry() async {
    if (_disposed || !mounted) {
      return;
    }

    // ------------------------------------------------------------
    // WEB
    // ------------------------------------------------------------

    if (_isWeb) {
      _webRetryTimer?.cancel();
      _webRetryTimer = null;

      _webTimeoutTimer?.cancel();
      _webTimeoutTimer = null;

      _webAttempt = 0;
      _webConnected = false;

      if (mounted) {
        setState(() {
          _loading = true;
          _error = null;
        });
      }

      await _disposeWebRtc();

      if (!_disposed && mounted && widget.visible) {
        await Future.delayed(const Duration(milliseconds: 300));

        if (!_disposed && mounted && widget.visible) {
          _openWebRtc();
        }
      }

      return;
    }

    // ------------------------------------------------------------
    // ANDROID / IOS
    // ------------------------------------------------------------

    _retryTimer?.cancel();
    _retryTimer = null;

    _timeoutTimer?.cancel();
    _timeoutTimer = null;

    _attempt = 0;
    _isPlaying = false;

    if (mounted) {
      setState(() {
        _loading = true;
        _error = null;
      });
    }

    try {
      await _player?.stop();
    } catch (_) {}

    if (_disposed) {
      return;
    }

    await Future.delayed(const Duration(milliseconds: 300));

    if (!_disposed && mounted && widget.visible) {
      _open();
    }
  }

  // ==============================================================
  // STOP
  // ==============================================================

  Future<void> _stop() async {
    _retryTimer?.cancel();
    _retryTimer = null;

    _timeoutTimer?.cancel();
    _timeoutTimer = null;

    _attempt = 0;
    _isPlaying = false;

    if (!_isWeb) {
      try {
        await _player?.stop();
      } catch (_) {}
    }

    if (!_disposed && mounted) {
      setState(() {
        _loading = false;
        _error = null;
      });
    }
  }

  // ==============================================================
  // STOP ALL + DISPOSE
  // ==============================================================

  Future<void> stopAndDispose() async {
    if (_disposed) {
      return;
    }

    debugPrint('CameraPlayer STOP + DISPOSE:');

    debugPrint(widget.rtspUrl);

    _disposed = true;

    _opening = false;
    _webOpening = false;

    _isPlaying = false;
    _webConnected = false;

    _retryTimer?.cancel();
    _retryTimer = null;

    _timeoutTimer?.cancel();
    _timeoutTimer = null;

    _webRetryTimer?.cancel();
    _webRetryTimer = null;

    _webTimeoutTimer?.cancel();
    _webTimeoutTimer = null;

    try {
      await _errorSub?.cancel();
    } catch (_) {}

    try {
      await _playingSub?.cancel();
    } catch (_) {}

    _errorSub = null;
    _playingSub = null;

    // ------------------------------------------------------------
    // WEB
    // ------------------------------------------------------------

    if (_isWeb) {
      await _disposeWebRtc();
    }

    // ------------------------------------------------------------
    // ANDROID / IOS
    // ------------------------------------------------------------

    if (!_isWeb) {
      try {
        await _player?.stop();
      } catch (e) {
        debugPrint('Player stop error: $e');
      }

      try {
        await _player?.dispose();
      } catch (e) {
        debugPrint('Player dispose error: $e');
      }
    }

    _player = null;
    _controller = null;

    CameraPlayer._unregister(this);
  }

  // ==============================================================
  // WIDGET UPDATE
  // ==============================================================

  @override
  void didUpdateWidget(covariant CameraPlayer oldWidget) {
    super.didUpdateWidget(oldWidget);

    // ============================================================
    // WEB
    // ============================================================

    if (_isWeb) {
      if (oldWidget.mediaMtxPath != widget.mediaMtxPath) {
        _webAttempt = 0;
        _webConnected = false;

        _disposeWebRtc().then((_) {
          if (!_disposed && mounted && widget.visible) {
            Future.delayed(const Duration(milliseconds: 200), () {
              if (!_disposed && mounted && widget.visible) {
                _openWebRtc();
              }
            });
          }
        });

        return;
      }

      if (oldWidget.visible != widget.visible) {
        if (widget.visible) {
          _webAttempt = 0;
          _webConnected = false;

          Future.delayed(const Duration(milliseconds: 200), () {
            if (!_disposed && mounted && widget.visible) {
              _openWebRtc();
            }
          });
        } else {
          _disposeWebRtc();

          if (mounted) {
            setState(() {
              _loading = false;
              _error = null;
            });
          }
        }
      }

      return;
    }

    // ============================================================
    // ANDROID / IOS
    // ============================================================

    if (oldWidget.rtspUrl != widget.rtspUrl) {
      _retryTimer?.cancel();
      _retryTimer = null;

      _timeoutTimer?.cancel();
      _timeoutTimer = null;

      _attempt = 0;
      _isPlaying = false;

      _stop().then((_) {
        if (!_disposed && mounted && widget.visible) {
          Future.delayed(const Duration(milliseconds: 200), () {
            if (!_disposed && mounted && widget.visible) {
              _open();
            }
          });
        }
      });

      return;
    }

    if (oldWidget.visible != widget.visible) {
      if (widget.visible) {
        _attempt = 0;
        _isPlaying = false;

        Future.delayed(const Duration(milliseconds: 200), () {
          if (!_disposed && mounted && widget.visible) {
            _open();
          }
        });
      } else {
        _stop();
      }
    }
  }

  // ==============================================================
  // DISPOSE
  // ==============================================================

  @override
  void dispose() {
    if (_disposed) {
      CameraPlayer._unregister(this);

      super.dispose();

      return;
    }

    _disposed = true;

    _opening = false;
    _webOpening = false;

    _isPlaying = false;
    _webConnected = false;

    _retryTimer?.cancel();
    _retryTimer = null;

    _timeoutTimer?.cancel();
    _timeoutTimer = null;

    _webRetryTimer?.cancel();
    _webRetryTimer = null;

    _webTimeoutTimer?.cancel();
    _webTimeoutTimer = null;

    _errorSub?.cancel();
    _playingSub?.cancel();

    _errorSub = null;
    _playingSub = null;

    // ------------------------------------------------------------
    // WEB
    // ------------------------------------------------------------

    if (_isWeb) {
      final renderer = _webRenderer;
      _webRenderer = null;

      try {
        renderer?.srcObject = null;
      } catch (_) {}

      renderer?.dispose();

      final peerConnection = _webPeerConnection;

      _webPeerConnection = null;

      try {
        peerConnection?.close();
      } catch (_) {}

      try {
        peerConnection?.dispose();
      } catch (_) {}
    }

    // ------------------------------------------------------------
    // ANDROID / IOS
    // ------------------------------------------------------------

    if (!_isWeb) {
      try {
        _player?.stop();
      } catch (_) {}

      try {
        _player?.dispose();
      } catch (_) {}
    }

    _player = null;
    _controller = null;

    CameraPlayer._unregister(this);

    super.dispose();
  }

  // ==============================================================
  // WEB ERROR CONTENT
  // ==============================================================

  Widget _buildWebErrorContent(BoxConstraints constraints) {
    final width = constraints.maxWidth;
    final height = constraints.maxHeight;

    final bool verySmall = height < 170;
    final bool small = height < 230;

    final double iconSize = verySmall
        ? 28
        : small
        ? 36
        : 45;

    final double titleSize = verySmall
        ? 12
        : small
        ? 13
        : 15;

    final double errorSize = verySmall
        ? 9
        : small
        ? 10
        : 11;

    final double horizontalPadding = width < 220 ? 8 : 16;

    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: horizontalPadding,
        vertical: verySmall ? 4 : 10,
      ),
      child: SingleChildScrollView(
        physics: const NeverScrollableScrollPhysics(),
        child: ConstrainedBox(
          constraints: BoxConstraints(
            maxWidth: 420,
            maxHeight: height.isFinite ? height : double.infinity,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.videocam_off, color: Colors.white54, size: iconSize),

              if (!verySmall) SizedBox(height: small ? 5 : 8),

              Text(
                'Unable to play camera',
                textAlign: TextAlign.center,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: titleSize,
                  fontWeight: FontWeight.w500,
                ),
              ),

              if (!verySmall) SizedBox(height: small ? 4 : 6),

              if (!verySmall)
                Flexible(
                  child: Text(
                    _error ?? '',
                    textAlign: TextAlign.center,
                    maxLines: small ? 2 : 4,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      color: Colors.grey.shade400,
                      fontSize: errorSize,
                      height: 1.25,
                    ),
                  ),
                ),

              SizedBox(
                height: verySmall
                    ? 4
                    : small
                    ? 6
                    : 10,
              ),

              SizedBox(
                height: verySmall ? 28 : 34,
                child: ElevatedButton(
                  onPressed: _manualRetry,
                  style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.symmetric(
                      horizontal: verySmall ? 12 : 18,
                    ),
                    minimumSize: Size(verySmall ? 55 : 70, verySmall ? 28 : 34),
                  ),
                  child: Text(
                    'Retry',
                    style: TextStyle(fontSize: verySmall ? 10 : 12),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // ==============================================================
  // WEB LOADING CONTENT
  // ==============================================================

  Widget _buildWebLoadingContent(BoxConstraints constraints) {
    final height = constraints.maxHeight;

    final bool verySmall = height < 120;

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        SizedBox(
          width: verySmall ? 22 : 30,
          height: verySmall ? 22 : 30,
          child: const CircularProgressIndicator(
            color: Colors.white,
            strokeWidth: 3,
          ),
        ),
        if (!verySmall) const SizedBox(height: 10),
        if (!verySmall)
          const Text(
            'Connecting WebRTC...',
            textAlign: TextAlign.center,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(color: Colors.white, fontSize: 13),
          ),
      ],
    );
  }

  // ==============================================================
  // MOBILE ERROR CONTENT
  // ==============================================================

  Widget _buildMobileErrorContent(BoxConstraints constraints) {
    final height = constraints.maxHeight;

    final bool verySmall = height < 130;

    return Padding(
      padding: const EdgeInsets.all(8),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.videocam_off,
            color: Colors.white54,
            size: verySmall ? 30 : 45,
          ),

          if (!verySmall) const SizedBox(height: 8),

          if (!verySmall)
            const Text(
              'Unable to play camera',
              textAlign: TextAlign.center,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(color: Colors.white, fontSize: 14),
            ),

          SizedBox(height: verySmall ? 4 : 8),

          SizedBox(
            height: verySmall ? 28 : 34,
            child: ElevatedButton(
              onPressed: _manualRetry,
              style: ElevatedButton.styleFrom(
                minimumSize: Size(verySmall ? 55 : 70, verySmall ? 28 : 34),
                padding: const EdgeInsets.symmetric(horizontal: 14),
              ),
              child: Text(
                'Retry',
                style: TextStyle(fontSize: verySmall ? 10 : 12),
              ),
            ),
          ),
        ],
      ),
    );
  }

  // ==============================================================
  // BUILD
  // ==============================================================

  @override
  Widget build(BuildContext context) {
    // ============================================================
    // WEB
    // ============================================================

    if (_isWeb) {
      final renderer = _webRenderer;

      return SizedBox(
        width: double.infinity,
        height: double.infinity,
        child: Container(
          width: double.infinity,
          height: double.infinity,
          color: Colors.black,
          child: LayoutBuilder(
            builder: (context, constraints) {
              return Stack(
                fit: StackFit.expand,
                children: [
                  // ------------------------------------------------
                  // VIDEO
                  // ------------------------------------------------
                  if (renderer != null)
                    Positioned.fill(
                      child: RTCVideoView(
                        renderer,
                        objectFit:
                            RTCVideoViewObjectFit.RTCVideoViewObjectFitContain,
                        mirror: false,
                      ),
                    ),

                  // ------------------------------------------------
                  // LOADING
                  // ------------------------------------------------
                  if (_loading)
                    Positioned.fill(
                      child: Center(
                        child: _buildWebLoadingContent(constraints),
                      ),
                    ),

                  // ------------------------------------------------
                  // ERROR
                  // ------------------------------------------------
                  if (_error != null && !_loading)
                    Positioned.fill(child: _buildWebErrorContent(constraints)),
                ],
              );
            },
          ),
        ),
      );
    }

    // ============================================================
    // ANDROID / IOS
    // ============================================================

    final controller = _controller;

    if (controller == null) {
      return const SizedBox(
        width: double.infinity,
        height: double.infinity,
        child: ColoredBox(color: Colors.black),
      );
    }

    return SizedBox(
      width: double.infinity,
      height: double.infinity,
      child: Container(
        width: double.infinity,
        height: double.infinity,
        color: Colors.black,
        child: LayoutBuilder(
          builder: (context, constraints) {
            return Stack(
              fit: StackFit.expand,
              children: [
                // ------------------------------------------------
                // VIDEO
                // ------------------------------------------------
                Positioned.fill(
                  child: Video(
                    controller: controller,
                    controls: NoVideoControls,
                    fit: BoxFit.contain,
                  ),
                ),

                // ------------------------------------------------
                // LOADING
                // ------------------------------------------------
                if (_loading)
                  const Positioned.fill(
                    child: Center(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          SizedBox(
                            width: 30,
                            height: 30,
                            child: CircularProgressIndicator(
                              color: Colors.white,
                              strokeWidth: 3,
                            ),
                          ),
                          SizedBox(height: 12),
                          Text(
                            'Connecting...',
                            style: TextStyle(color: Colors.white, fontSize: 14),
                          ),
                        ],
                      ),
                    ),
                  ),

                // ------------------------------------------------
                // ERROR
                // ------------------------------------------------
                if (_error != null && !_loading)
                  Positioned.fill(child: _buildMobileErrorContent(constraints)),
              ],
            );
          },
        ),
      ),
    );
  }
}
