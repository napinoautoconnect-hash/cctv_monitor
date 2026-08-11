import 'package:flutter/material.dart';

import '../widgets/camera_card.dart';
import '../models/haridwar_camera_list.dart';

class HaridwarScreen extends StatelessWidget {
  const HaridwarScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Haridwar CCTV",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: ListView.builder(
        itemCount: haridwarCameras.length,
        itemBuilder: (context, index) {
          return CameraCard(camera: haridwarCameras[index]);
        },
      ),
    );
  }
}
