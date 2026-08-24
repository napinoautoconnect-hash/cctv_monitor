import 'dart:async';

import 'package:flutter/material.dart';
import 'package:media_kit/media_kit.dart';
import 'package:media_kit_video/media_kit_video.dart';

class CameraPlayer extends StatefulWidget {
  final String rtspUrl;

  const CameraPlayer({super.key, required this.rtspUrl});

  @override
  State<CameraPlayer> createState() => _CameraPlayerState();
}

class _CameraPlayerState extends State<CameraPlayer> {
  Player? _player;
  VideoController? _controller;

  StreamSubscription? _playingSubscription;
  StreamSubscription? _bufferingSubscription;
  StreamSubscription? _errorSubscription;

  bool _loading = true;
  bool _error = false;
  bool _disposed = false;
  bool _opening = false;

  @override
  void initState() {
    super.initState();

    debugPrint('================================');
    debugPrint('CAMERA PLAYER INIT');
    debugPrint(widget.rtspUrl);
    debugPrint('================================');

    _startPlayer();
  }

  @override
  void didUpdateWidget(covariant CameraPlayer oldWidget) {
    super.didUpdateWidget(oldWidget);

    if (oldWidget.rtspUrl != widget.rtspUrl) {
      debugPrint('RTSP URL CHANGED');
      debugPrint('OLD: ${oldWidget.rtspUrl}');
      debugPrint('NEW: ${widget.rtspUrl}');

      _restartPlayer();
    }
  }

  Future<void> _restartPlayer() async {
    await _stopPlayer();

    if (!_disposed) {
      await _startPlayer();
    }
  }

  Future<void> _startPlayer() async {
    if (_disposed || _opening || _player != null) {
      return;
    }

    _opening = true;

    Player? player;

    try {
      player = Player();

      final controller = VideoController(player);

      if (_disposed) {
        await player.dispose();
        return;
      }

      _player = player;
      _controller = controller;

      if (mounted) {
        setState(() {
          _loading = true;
          _error = false;
        });
      }

      // PLAYING
      _playingSubscription = player.stream.playing.listen((playing) {
        debugPrint('PLAYER PLAYING: $playing');

        if (_disposed || !mounted) return;

        if (playing) {
          setState(() {
            _loading = false;
            _error = false;
          });
        }
      });

      // BUFFERING
      _bufferingSubscription = player.stream.buffering.listen((buffering) {
        debugPrint('PLAYER BUFFERING: $buffering');

        if (_disposed || !mounted) return;

        if (buffering) {
          setState(() {
            _loading = true;
          });
        } else {
          setState(() {
            _loading = false;
          });
        }
      });

      // ERROR
      _errorSubscription = player.stream.error.listen((error) {
        debugPrint('================================');
        debugPrint('CAMERA ERROR');
        debugPrint('ERROR: $error');
        debugPrint('URL: ${widget.rtspUrl}');
        debugPrint('================================');

        if (_disposed || !mounted) return;

        setState(() {
          _loading = false;
          _error = true;
        });
      });

      debugPrint('================================');
      debugPrint('OPENING RTSP');
      debugPrint(widget.rtspUrl);
      debugPrint('================================');

      await player.open(
        Media(widget.rtspUrl, extras: const {'rtsp_transport': 'tcp'}),
        play: true,
      );

      debugPrint('================================');
      debugPrint('RTSP OPEN COMMAND COMPLETED');
      debugPrint('================================');
    } catch (e, stackTrace) {
      debugPrint('================================');
      debugPrint('CAMERA PLAYER EXCEPTION');
      debugPrint(e.toString());
      debugPrint(stackTrace.toString());
      debugPrint('================================');

      if (!_disposed && mounted) {
        setState(() {
          _loading = false;
          _error = true;
        });
      }

      if (player != null && _player == null) {
        try {
          await player.dispose();
        } catch (_) {}
      }
    } finally {
      _opening = false;
    }
  }

  Future<void> _stopPlayer() async {
    final player = _player;

    if (player == null) {
      return;
    }

    _player = null;
    _controller = null;

    final playingSubscription = _playingSubscription;
    final bufferingSubscription = _bufferingSubscription;
    final errorSubscription = _errorSubscription;

    _playingSubscription = null;
    _bufferingSubscription = null;
    _errorSubscription = null;

    try {
      await playingSubscription?.cancel();
    } catch (_) {}

    try {
      await bufferingSubscription?.cancel();
    } catch (_) {}

    try {
      await errorSubscription?.cancel();
    } catch (_) {}

    try {
      await player.stop();
    } catch (_) {}

    try {
      await player.dispose();
    } catch (_) {}

    if (mounted && !_disposed) {
      setState(() {
        _loading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final controller = _controller;

    if (controller == null) {
      return Container(
        color: Colors.black,
        child: Center(
          child: _error
              ? const Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(Icons.videocam_off, color: Colors.red, size: 50),
                    SizedBox(height: 10),
                    Text(
                      'Camera Offline',
                      style: TextStyle(color: Colors.white, fontSize: 16),
                    ),
                  ],
                )
              : const CircularProgressIndicator(color: Colors.white),
        ),
      );
    }

    return Stack(
      fit: StackFit.expand,
      children: [
        // VIDEO
        Video(controller: controller, fit: BoxFit.contain),

        // LOADING
        if (_loading)
          Container(
            color: Colors.black,
            child: const Center(
              child: CircularProgressIndicator(color: Colors.white),
            ),
          ),

        // ERROR
        if (_error)
          Container(
            color: Colors.black,
            child: const Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(Icons.videocam_off, color: Colors.red, size: 50),
                  SizedBox(height: 10),
                  Text(
                    'Camera Offline',
                    style: TextStyle(color: Colors.white, fontSize: 16),
                  ),
                ],
              ),
            ),
          ),
      ],
    );
  }

  @override
  void dispose() {
    _disposed = true;

    final player = _player;

    _player = null;
    _controller = null;

    final playingSubscription = _playingSubscription;
    final bufferingSubscription = _bufferingSubscription;
    final errorSubscription = _errorSubscription;

    _playingSubscription = null;
    _bufferingSubscription = null;
    _errorSubscription = null;

    playingSubscription?.cancel();
    bufferingSubscription?.cancel();
    errorSubscription?.cancel();

    if (player != null) {
      player.stop().catchError((_) {});
      player.dispose().catchError((_) {});
    }

    super.dispose();
  }
}
