import 'package:flutter/material.dart';

import '../widgets/camera_card.dart';
import '../models/camera_list.dart';

class Sec3Screen extends StatelessWidget {
  const Sec3Screen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("CCTV Monitor"), centerTitle: true),
      body: ListView.builder(
        itemCount: cameras.length,
        itemBuilder: (context, index) {
          return CameraCard(camera: cameras[index]);
        },
      ),
    );
  }
}
