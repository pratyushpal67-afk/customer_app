import 'package:flutter/material.dart';
import 'screens/splash_screen.dart';

void main() {
  runApp(const AyurTraceApp());
}

class AyurTraceApp extends StatelessWidget {
  const AyurTraceApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'AYURTRACE',
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF14532D),
          primary: const Color(0xFF14532D),
          secondary: const Color(0xFF16A34A),
          surface: const Color(0xFFFCFBF9),
        ),
      ),
      home: const SplashScreen(),
    );
  }
}