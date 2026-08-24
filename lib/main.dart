import 'package:flutter/material.dart';
import 'package:media_kit/media_kit.dart';
import 'package:media_kit_video/media_kit_video.dart';

import 'package:cctv_monitor/screens/splash_screen.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  // ====================================================
  // MEDIakit INITIALIZE
  // ====================================================
  MediaKit.ensureInitialized();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFF0057B8)),
        useMaterial3: true,
      ),
      title: 'CCTV Monitor',
      home: const SplashScreen(),
    );
  }
}
