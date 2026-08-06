import 'package:flutter/material.dart';
import 'package:media_kit/media_kit.dart';
import 'package:media_kit_video/media_kit_video.dart';

class CameraPlayer extends StatefulWidget {
  final String url;

  const CameraPlayer({super.key, required this.url});

  @override
  State<CameraPlayer> createState() => _CameraPlayerState();
}

class _CameraPlayerState extends State<CameraPlayer> {
  late final Player player;
  late final VideoController controller;

  bool _loading = true;
  bool _error = false;

  @override
  void initState() {
    super.initState();

    player = Player();
    controller = VideoController(player);

    /// Listen player state
    player.stream.playing.listen((playing) {
      if (!mounted) return;

      if (playing) {
        setState(() {
          _loading = false;
          _error = false;
        });
      }
    });

    /// Listen buffering
    player.stream.buffering.listen((buffering) {
      if (!mounted) return;

      setState(() {
        _loading = buffering;
      });
    });

    /// Listen errors
    player.stream.error.listen((_) {
      if (!mounted) return;

      setState(() {
        _loading = false;
        _error = true;
      });
    });

    player.open(Media(widget.url), play: true);
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.expand,
      children: [
        Video(controller: controller),

        if (_loading)
          Container(
            color: Colors.black,
            child: const Center(
              child: CircularProgressIndicator(color: Colors.white),
            ),
          ),

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
                    "Camera Offline",
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
    player.dispose();
    super.dispose();
  }
}
