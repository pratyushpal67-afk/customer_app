import 'package:flutter/material.dart';
import 'verification_screen.dart';

class QrScannerScreen extends StatelessWidget {
  const QrScannerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Scan Product')),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text('Place the QR code inside the frame to verify your product.'),
              const SizedBox(height: 20),
              Container(
                width: 240,
                height: 240,
                decoration: BoxDecoration(
                  border: Border.all(color: const Color(0xFF14532D), width: 3),
                  borderRadius: BorderRadius.circular(16),
                  color: Colors.black.withOpacity(0.04),
                ),
                child: const Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.qr_code_scanner, size: 80, color: Color(0xFF14532D)),
                    SizedBox(height: 8),
                    Text('Scanner Viewport', style: TextStyle(fontSize: 11, color: Colors.black54)),
                  ],
                ),
              ),
              const SizedBox(height: 24),
              ElevatedButton.icon(
                onPressed: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (_) => const VerificationScreen(batchId: 'ASH-2026-001')),
                  );
                },
                icon: const Icon(Icons.check_circle_outline),
                label: const Text('Simulate Scan: ASH-2026-001'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF14532D),
                  foregroundColor: Colors.white,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}