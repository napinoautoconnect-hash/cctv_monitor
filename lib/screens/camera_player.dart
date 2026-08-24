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
  //
  // Har active CameraPlayer yahan register hoga.
  //
  // Exit karte waqt:
  //
  // CameraPlayer.stopAllPlayers()
  //
  // call karke saare RTSP players ko properly stop/dispose
  // kar sakte hain.
  //
  // ============================================================

  static final Set<_CameraPlayerState> _players = <_CameraPlayerState>{};

  static void _register(_CameraPlayerState player) {
    _players.add(player);

    debugPrint('CameraPlayer REGISTERED | Total: ${_players.length}');
  }

  static void _unregister(_CameraPlayerState player) {
    _players.remove(player);

    debugPrint('CameraPlayer UNREGISTERED | Total: ${_players.length}');
  }

  // ============================================================
  // STOP ALL PLAYERS
  // ============================================================

  static Future<void> stopAllPlayers() async {
    debugPrint('');
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

    // Android Surface / media_kit / mpv ko thoda
    // time dena important hai.
    await Future.delayed(const Duration(milliseconds: 400));

    debugPrint('============================================');
    debugPrint('ALL CCTV PLAYERS STOPPED');
    debugPrint('============================================');
    debugPrint('');
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

  static const int maxAttempts = 3;

  // ============================================================
  // INIT
  // ============================================================

  @override
  void initState() {
    super.initState();

    // Register this player globally.
    CameraPlayer._register(this);

    // ============================================================
    // PLAYER
    // ============================================================

    _player = Player(
      configuration: const PlayerConfiguration(bufferSize: 4 * 1024 * 1024),
    );

    _controller = VideoController(_player);

    // ============================================================
    // ERROR LISTENER
    // ============================================================

    _errorSub = _player.stream.error.listen((error) {
      if (_disposed) return;

      debugPrint('RTSP ERROR: $error');

      debugPrint('URL: ${widget.rtspUrl}');

      _connectionFailed(error.toString());
    });

    // ============================================================
    // PLAYING LISTENER
    // ============================================================

    _playingSub = _player.stream.playing.listen((playing) {
      if (_disposed) return;

      debugPrint('RTSP PLAYING: $playing | ${widget.rtspUrl}');

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

    // ============================================================
    // INITIAL OPEN
    // ============================================================

    if (widget.visible) {
      Future.delayed(const Duration(milliseconds: 200), () {
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
      // ----------------------------------------------------------
      // Stop previous connection first
      // ----------------------------------------------------------

      try {
        await _player.stop();
      } catch (_) {}

      if (_disposed) return;

      _isPlaying = false;

      debugPrint('--------------------------------------------');

      debugPrint('OPEN RTSP');

      debugPrint('Attempt: $_attempt');

      debugPrint(widget.rtspUrl);

      debugPrint('--------------------------------------------');

      // ----------------------------------------------------------
      // OPEN RTSP
      // ----------------------------------------------------------

      await _player.open(
        Media(widget.rtspUrl, extras: const {'rtsp_transport': 'tcp'}),
        play: true,
      );

      if (_disposed || !mounted) {
        return;
      }

      // ----------------------------------------------------------
      // CONNECTION TIMEOUT
      // ----------------------------------------------------------

      _timeoutTimer = Timer(const Duration(seconds: 3), () {
        if (_disposed || !mounted) return;

        if (!_isPlaying) {
          debugPrint('RTSP TIMEOUT - starting retry');

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
    // AUTOMATIC RETRY
    // ----------------------------------------------------------

    if (_attempt < maxAttempts) {
      _attempt++;

      debugPrint('RTSP RETRY $_attempt/$maxAttempts');

      _retryTimer?.cancel();

      _retryTimer = Timer(const Duration(milliseconds: 400), () {
        if (!_disposed && mounted && widget.visible) {
          _open();
        }
      });
    }
    // ----------------------------------------------------------
    // FINAL ERROR
    // ----------------------------------------------------------
    else {
      if (mounted) {
        setState(() {
          _loading = false;
          _error = error;
        });
      }
    }
  }

  // ============================================================
  // MANUAL RETRY
  // ============================================================

  Future<void> _manualRetry() async {
    if (_disposed || !mounted) return;

    _retryTimer?.cancel();
    _retryTimer = null;

    _timeoutTimer?.cancel();
    _timeoutTimer = null;

    _attempt = 0;
    _isPlaying = false;

    try {
      await _player.stop();
    } catch (_) {}

    if (_disposed) return;

    await Future.delayed(const Duration(milliseconds: 200));

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
  //
  // Ye method specifically application exit ke liye hai.
  //
  // Pehle timers/subscriptions stop.
  // Phir media player stop.
  // Phir player dispose.
  //
  // ============================================================

  Future<void> stopAndDispose() async {
    if (_disposed) {
      return;
    }

    debugPrint('CameraPlayer STOP + DISPOSE:');

    debugPrint(widget.rtspUrl);

    // ----------------------------------------------------------
    // Mark disposed FIRST
    // ----------------------------------------------------------

    _disposed = true;

    _opening = false;
    _isPlaying = false;

    // ----------------------------------------------------------
    // Cancel timers
    // ----------------------------------------------------------

    _retryTimer?.cancel();
    _retryTimer = null;

    _timeoutTimer?.cancel();
    _timeoutTimer = null;

    // ----------------------------------------------------------
    // Cancel streams
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
    // Stop media player
    // ----------------------------------------------------------

    try {
      await _player.stop();
    } catch (e) {
      debugPrint('Player stop error: $e');
    }

    // ----------------------------------------------------------
    // Dispose media player
    // ----------------------------------------------------------

    try {
      await _player.dispose();
    } catch (e) {
      debugPrint('Player dispose error: $e');
    }

    // ----------------------------------------------------------
    // Remove from registry
    // ----------------------------------------------------------

    CameraPlayer._unregister(this);
  }

  // ============================================================
  // DID UPDATE WIDGET
  // ============================================================

  @override
  void didUpdateWidget(covariant CameraPlayer oldWidget) {
    super.didUpdateWidget(oldWidget);

    // ==========================================================
    // URL CHANGED
    // ==========================================================

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

    // ==========================================================
    // VISIBILITY CHANGED
    // ==========================================================

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
    // ----------------------------------------------------------
    // Prevent double dispose
    // ----------------------------------------------------------

    if (_disposed) {
      CameraPlayer._unregister(this);

      super.dispose();
      return;
    }

    _disposed = true;

    _opening = false;
    _isPlaying = false;

    // ----------------------------------------------------------
    // Cancel timers
    // ----------------------------------------------------------

    _retryTimer?.cancel();
    _retryTimer = null;

    _timeoutTimer?.cancel();
    _timeoutTimer = null;

    // ----------------------------------------------------------
    // Cancel listeners
    // ----------------------------------------------------------

    _errorSub?.cancel();
    _playingSub?.cancel();

    _errorSub = null;
    _playingSub = null;

    // ----------------------------------------------------------
    // Stop player
    // ----------------------------------------------------------

    try {
      _player.stop();
    } catch (_) {}

    // ----------------------------------------------------------
    // Dispose player
    // ----------------------------------------------------------

    try {
      _player.dispose();
    } catch (_) {}

    // ----------------------------------------------------------
    // Remove registry
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
      color: const Color(0xFF0057B8),

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
                CircularProgressIndicator(color: Colors.white),

                SizedBox(height: 12),

                Text('Connecting...', style: TextStyle(color: Colors.white)),
              ],
            ),

          // ======================================================
          // ERROR + RETRY
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
