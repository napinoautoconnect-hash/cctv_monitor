import 'package:flutter/material.dart';

import '../data/camera.dart';
import '../screens/fullscreen_player.dart';
import 'camera_player.dart';

class CameraCard extends StatelessWidget {
  final Camera camera;

  const CameraCard({super.key, required this.camera});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(10),
      elevation: 5,
      child: Column(
        children: [
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => FullScreenPlayer(camera: camera),
                ),
              );
            },
            child: SizedBox(
              height: 220,
              width: double.infinity,
              child: CameraPlayer(url: camera.url),
            ),
          ),

          Padding(
            padding: const EdgeInsets.all(8),
            child: Text(
              camera.name,
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
          ),
        ],
      ),
    );
  }
}
