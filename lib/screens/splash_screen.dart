import 'package:flutter/material.dart';
import 'home_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 2), () {
      if (mounted) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (_) => const HomeScreen()),
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF14532D),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Icon(Icons.eco, size: 72, color: Color(0xFF86EFAC)),
            SizedBox(height: 16),
            Text(
              'AYURTRACE',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                letterSpacing: 1.2,
                color: Colors.white,
              ),
            ),
            SizedBox(height: 6),
            Text(
              'Know your product. Know its journey.',
              style: TextStyle(fontSize: 13, color: Color(0xFFBBF7D0)),
            ),
            SizedBox(height: 32),
            CircularProgressIndicator(color: Color(0xFF86EFAC), strokeWidth: 2.5),
          ],
        ),
      ),
    );
  }
}