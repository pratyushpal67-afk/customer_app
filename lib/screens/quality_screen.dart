import 'package:flutter/material.dart';
import '../models/product_model.dart';
import 'lab_report_screen.dart';

class QualityScreen extends StatelessWidget {
  final ProductModel product;
  const QualityScreen({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Quality Verification')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Status Card
            Card(
              elevation: 0,
              color: const Color(0xFFDCFCE7),
              shape: RoundedRectangleBorder(
                side: const BorderSide(color: Color(0xFF86EFAC)),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Padding(
                padding: const EdgeInsets.all(14.0),
                child: Row(
                  children: [
                    const Icon(Icons.verified, color: Color(0xFF15803D), size: 28),
                    const SizedBox(width: 10),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          '🟢 QUALITY VERIFIED (PASSED)',
                          style: TextStyle(fontWeight: FontWeight.bold, color: Color(0xFF15803D)),
                        ),
                        Text('Laboratory: ${product.labName}', style: const TextStyle(fontSize: 11, color: Colors.black54)),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 14),

            // Summary Test Table
            Card(
              elevation: 0,
              shape: RoundedRectangleBorder(
                side: BorderSide(color: Colors.grey.shade300),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Column(
                  children: [
                    _buildCheckRow('Species Authentication', '✓ PASS'),
                    _buildCheckRow('Moisture Test', '✓ PASS (${product.moisturePercent}%)'),
                    _buildCheckRow('Heavy Metals Test', '✓ PASS (${product.heavyMetalsPpm} ppm)'),
                    _buildCheckRow('Pesticide Residue', '✓ PASS (Not Detected)'),
                    _buildCheckRow('Required Pharmacopoeia Tests', '✓ PASS'),
                    const Divider(height: 16),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text('Test Verification Date:', style: TextStyle(color: Colors.black54, fontSize: 11)),
                        Text(product.labVerificationDate, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 11)),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            const Spacer(),

            // Primary Navigation to Full Lab Report
            ElevatedButton.icon(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => LabReportScreen(product: product)),
                );
              },
              icon: const Icon(Icons.description_outlined),
              label: const Text('VIEW FULL LAB REPORT', style: TextStyle(fontWeight: FontWeight.bold)),
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF14532D),
                foregroundColor: Colors.white,
                padding: const EdgeInsets.symmetric(vertical: 14),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCheckRow(String label, String status) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 3.5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(label, style: const TextStyle(fontSize: 12, color: Colors.black87)),
          Text(status, style: const TextStyle(fontSize: 12, fontWeight: FontWeight.bold, color: Colors.green)),
        ],
      ),
    );
  }
}