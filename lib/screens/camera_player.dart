import 'dart:async';

import 'package:flutter/material.dart';
import 'package:media_kit/media_kit.dart';
import 'package:media_kit_video/media_kit_video.dart';

class CameraPlayer extends StatefulWidget {
  final String rtspUrl;
  final bool visible;

  const CameraPlayer({super.key, required this.rtspUrl, this.visible = true});

  @override
  State<CameraPlayer> createState() => _CameraPlayerState();

  // ============================================================
  // GLOBAL PLAYER REGISTRY
  // ============================================================

  static final Set<_CameraPlayerState> _players = <_CameraPlayerState>{};

  static void _register(_CameraPlayerState player) {
    _players.add(player);

    debugPrint(
      'CameraPlayer REGISTERED | '
      'Total: ${_players.length}',
    );
  }

  static void _unregister(_CameraPlayerState player) {
    _players.remove(player);

    debugPrint(
      'CameraPlayer UNREGISTERED | '
      'Total: ${_players.length}',
    );
  }

  // ============================================================
  // STOP ALL PLAYERS
  // ============================================================

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

    // Give Android Surface / mpv time to clean up.
    await Future.delayed(const Duration(milliseconds: 250));

    debugPrint('ALL CCTV PLAYERS STOPPED');
  }
}

// =================================================================
// CAMERA PLAYER STATE
// =================================================================

class _CameraPlayerState extends State<CameraPlayer> {
  late final Player _player;
  late final VideoController _controller;

  StreamSubscription? _errorSub;
  StreamSubscription? _playingSub;

  Timer? _timeoutTimer;
  Timer? _retryTimer;

  bool _loading = true;
  bool _opening = false;
  bool _disposed = false;
  bool _isPlaying = false;

  String? _error;

  int _attempt = 0;

  // ------------------------------------------------------------
  // Three connection attempts.
  // ------------------------------------------------------------

  static const int maxAttempts = 3;

  // ------------------------------------------------------------
  // RTSP timeout.
  //
  // 3 seconds was too aggressive for some CCTV streams.
  // ------------------------------------------------------------

  static const Duration connectionTimeout = Duration(seconds: 10);

  // ============================================================
  // INIT
  // ============================================================

  @override
  void initState() {
    super.initState();

    // ----------------------------------------------------------
    // VERY IMPORTANT
    //
    // MediaKit must be initialized BEFORE Player() is created.
    //
    // We deliberately keep this here instead of HomeScreen.
    // This means HomeScreen / logout / back are independent.
    // ----------------------------------------------------------

    try {
      MediaKit.ensureInitialized();

      debugPrint('CCTV: MediaKit initialized');
    } catch (e) {
      debugPrint('CCTV: MediaKit initialization error: $e');
    }

    // ----------------------------------------------------------
    // REGISTER
    // ----------------------------------------------------------

    CameraPlayer._register(this);

    // ----------------------------------------------------------
    // CREATE PLAYER
    // ----------------------------------------------------------

    _player = Player(
      configuration: const PlayerConfiguration(bufferSize: 4 * 1024 * 1024),
    );

    // ----------------------------------------------------------
    // CREATE VIDEO CONTROLLER
    // ----------------------------------------------------------

    _controller = VideoController(_player);

    // ----------------------------------------------------------
    // ERROR LISTENER
    // ----------------------------------------------------------

    _errorSub = _player.stream.error.listen((error) {
      if (_disposed) return;

      debugPrint('============================================');

      debugPrint('RTSP ERROR: $error');

      debugPrint('URL: ${widget.rtspUrl}');

      debugPrint('============================================');

      _connectionFailed(error.toString());
    });

    // ----------------------------------------------------------
    // PLAYING LISTENER
    // ----------------------------------------------------------

    _playingSub = _player.stream.playing.listen((playing) {
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

    // ----------------------------------------------------------
    // OPEN AFTER WIDGET IS READY
    // ----------------------------------------------------------

    if (widget.visible) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        if (!_disposed && mounted && widget.visible) {
          _open();
        }
      });
    }
  }

  // ============================================================
  // OPEN RTSP
  // ============================================================

  Future<void> _open() async {
    if (_disposed || !mounted) return;

    if (!widget.visible) return;

    if (_opening) return;

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
      // --------------------------------------------------------
      // Stop old playback.
      // --------------------------------------------------------

      try {
        await _player.stop();
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

      // --------------------------------------------------------
      // OPEN RTSP
      // --------------------------------------------------------

      final media = Media(
        widget.rtspUrl,
        extras: const {'rtsp_transport': 'tcp'},
      );

      await _player.open(media, play: true);

      if (_disposed || !mounted) {
        return;
      }

      // --------------------------------------------------------
      // CONNECTION TIMEOUT
      // --------------------------------------------------------

      _timeoutTimer = Timer(connectionTimeout, () {
        if (_disposed || !mounted) {
          return;
        }

        if (!_isPlaying) {
          debugPrint(
            'RTSP TIMEOUT: '
            '${widget.rtspUrl}',
          );

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

  // ============================================================
  // CONNECTION FAILED
  // ============================================================

  void _connectionFailed(String error) {
    if (_disposed || !mounted || !widget.visible) {
      return;
    }

    _timeoutTimer?.cancel();
    _timeoutTimer = null;

    _isPlaying = false;

    // ----------------------------------------------------------
    // RETRY
    // ----------------------------------------------------------

    if (_attempt < maxAttempts) {
      _attempt++;

      debugPrint(
        'RTSP RETRY '
        '$_attempt/$maxAttempts',
      );

      _retryTimer?.cancel();

      _retryTimer = Timer(const Duration(milliseconds: 700), () {
        if (!_disposed && mounted && widget.visible) {
          _open();
        }
      });

      return;
    }

    // ----------------------------------------------------------
    // FINAL ERROR
    // ----------------------------------------------------------

    debugPrint('RTSP FINAL ERROR: $error');

    if (mounted) {
      setState(() {
        _loading = false;
        _error = error;
      });
    }
  }

  // ============================================================
  // MANUAL RETRY
  // ============================================================

  Future<void> _manualRetry() async {
    if (_disposed || !mounted) {
      return;
    }

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
      await _player.stop();
    } catch (_) {}

    if (_disposed) {
      return;
    }

    await Future.delayed(const Duration(milliseconds: 300));

    if (!_disposed && mounted && widget.visible) {
      _open();
    }
  }

  // ============================================================
  // STOP ONLY
  // ============================================================

  Future<void> _stop() async {
    _retryTimer?.cancel();
    _retryTimer = null;

    _timeoutTimer?.cancel();
    _timeoutTimer = null;

    _attempt = 0;
    _isPlaying = false;

    try {
      await _player.stop();
    } catch (_) {}

    if (!_disposed && mounted) {
      setState(() {
        _loading = false;
        _error = null;
      });
    }
  }

  // ============================================================
  // STOP + DISPOSE
  // ============================================================

  Future<void> stopAndDispose() async {
    if (_disposed) {
      return;
    }

    debugPrint('CameraPlayer STOP + DISPOSE:');

    debugPrint(widget.rtspUrl);

    // ----------------------------------------------------------
    // Mark disposed FIRST.
    // ----------------------------------------------------------

    _disposed = true;

    _opening = false;
    _isPlaying = false;

    // ----------------------------------------------------------
    // Cancel timers.
    // ----------------------------------------------------------

    _retryTimer?.cancel();
    _retryTimer = null;

    _timeoutTimer?.cancel();
    _timeoutTimer = null;

    // ----------------------------------------------------------
    // Cancel listeners.
    // ----------------------------------------------------------

    try {
      await _errorSub?.cancel();
    } catch (_) {}

    try {
      await _playingSub?.cancel();
    } catch (_) {}

    _errorSub = null;
    _playingSub = null;

    // ----------------------------------------------------------
    // Stop player.
    // ----------------------------------------------------------

    try {
      await _player.stop();
    } catch (e) {
      debugPrint('Player stop error: $e');
    }

    // ----------------------------------------------------------
    // Dispose player.
    // ----------------------------------------------------------

    try {
      await _player.dispose();
    } catch (e) {
      debugPrint('Player dispose error: $e');
    }

    // ----------------------------------------------------------
    // Registry.
    // ----------------------------------------------------------

    CameraPlayer._unregister(this);
  }

  // ============================================================
  // DID UPDATE WIDGET
  // ============================================================

  @override
  void didUpdateWidget(covariant CameraPlayer oldWidget) {
    super.didUpdateWidget(oldWidget);

    // ----------------------------------------------------------
    // URL CHANGED
    // ----------------------------------------------------------

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

    // ----------------------------------------------------------
    // VISIBILITY CHANGED
    // ----------------------------------------------------------

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

  // ============================================================
  // DISPOSE
  // ============================================================

  @override
  void dispose() {
    if (_disposed) {
      CameraPlayer._unregister(this);

      super.dispose();
      return;
    }

    _disposed = true;

    _opening = false;
    _isPlaying = false;

    // ----------------------------------------------------------
    // Cancel timers.
    // ----------------------------------------------------------

    _retryTimer?.cancel();
    _retryTimer = null;

    _timeoutTimer?.cancel();
    _timeoutTimer = null;

    // ----------------------------------------------------------
    // Cancel listeners.
    // ----------------------------------------------------------

    _errorSub?.cancel();
    _playingSub?.cancel();

    _errorSub = null;
    _playingSub = null;

    // ----------------------------------------------------------
    // Stop player.
    // ----------------------------------------------------------

    try {
      _player.stop();
    } catch (_) {}

    // ----------------------------------------------------------
    // Dispose player.
    // ----------------------------------------------------------

    try {
      _player.dispose();
    } catch (_) {}

    // ----------------------------------------------------------
    // Registry.
    // ----------------------------------------------------------

    CameraPlayer._unregister(this);

    super.dispose();
  }

  // ============================================================
  // UI
  // ============================================================

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black,

      child: Stack(
        alignment: Alignment.center,

        children: [
          // ======================================================
          // VIDEO
          // ======================================================
          Positioned.fill(
            child: Video(
              controller: _controller,

              controls: NoVideoControls,

              fit: BoxFit.contain,
            ),
          ),

          // ======================================================
          // CONNECTING
          // ======================================================
          if (_loading)
            const Column(
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

          // ======================================================
          // ERROR
          // ======================================================
          if (_error != null && !_loading)
            Column(
              mainAxisSize: MainAxisSize.min,

              children: [
                const Icon(Icons.videocam_off, color: Colors.white54, size: 45),

                const SizedBox(height: 10),

                const Text(
                  'Unable to play camera',
                  style: TextStyle(color: Colors.white, fontSize: 15),
                ),

                const SizedBox(height: 12),

                ElevatedButton(
                  onPressed: _manualRetry,

                  child: const Text('Retry'),
                ),
              ],
            ),
        ],
      ),
    );
  }
}
