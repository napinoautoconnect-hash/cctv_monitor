import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:media_kit/media_kit.dart';

import 'package:cctv_monitor/screens/splash_screen.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  // MediaKit is required only on Android/iOS.
  // Do NOT initialize MediaKit on Chrome/Web.
  if (!kIsWeb) {
    MediaKit.ensureInitialized();
  }

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'CCTV Monitor',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFF0057B8)),
        useMaterial3: true,
      ),
      home: const SplashScreen(),
    );
  }
}
