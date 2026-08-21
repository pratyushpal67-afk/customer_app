import 'package:flutter/material.dart';

import '../models/product_model.dart';
import 'product_details_screen.dart';

class VerificationScreen extends StatefulWidget {
  final String batchId;
  const VerificationScreen({super.key, required this.batchId});

  @override
  State<VerificationScreen> createState() => _VerificationScreenState();
}

class _VerificationScreenState extends State<VerificationScreen> {
  int _step = 0;
  bool _isFinished = false;

  @override
  void initState() {
    super.initState();
    _runVerification();
  }

  void _runVerification() async {
    for (int i = 1; i <= 4; i++) {
      await Future.delayed(const Duration(milliseconds: 450));
      if (mounted) setState(() => _step = i);
    }
    await Future.delayed(const Duration(milliseconds: 300));
    if (mounted) setState(() => _isFinished = true);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_isFinished ? 'Verification Result' : 'Verifying...'),
      ),
      body: _isFinished ? _buildVerifiedResult() : _buildLoadingState(),
    );
  }

  Widget _buildLoadingState() {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Center(
              child: CircularProgressIndicator(color: Color(0xFF14532D)),
            ),
            const SizedBox(height: 24),
            Center(
              child: Text(
                'Verifying Batch ${widget.batchId}',
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(height: 20),
            _buildCheckItem(1, 'Checking batch information...'),
            _buildCheckItem(2, 'Checking traceability record...'),
            _buildCheckItem(3, 'Checking quality status...'),
            _buildCheckItem(4, 'Checking manufacturer...'),
          ],
        ),
      ),
    );
  }

  Widget _buildCheckItem(int index, String label) {
    final isDone = _step >= index;
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Row(
        children: [
          Icon(
            isDone ? Icons.check_circle : Icons.radio_button_unchecked,
            color: isDone ? Colors.green : Colors.grey,
            size: 18,
          ),
          const SizedBox(width: 10),
          Text(
            isDone ? '$label ✓' : label,
            style: TextStyle(
              color: isDone ? Colors.black87 : Colors.black45,
              fontSize: 12,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildVerifiedResult() {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
            padding: const EdgeInsets.all(14),
            decoration: BoxDecoration(
              color: const Color(0xFFDCFCE7),
              border: Border.all(color: const Color(0xFF86EFAC)),
              borderRadius: BorderRadius.circular(10),
            ),
            child: const Row(
              children: [
                Icon(Icons.verified, color: Color(0xFF15803D), size: 32),
                SizedBox(width: 10),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '🟢 VERIFIED PRODUCT',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF15803D),
                        ),
                      ),
                      Text(
                        'This product has a valid traceability record.',
                        style: TextStyle(
                          fontSize: 11,
                          color: Color(0xFF166534),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 14),
          Card(
            elevation: 0,
            shape: RoundedRectangleBorder(
              side: BorderSide(color: Colors.grey.shade300),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Padding(
              padding: const EdgeInsets.all(14.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    '🌿 ASHWAGANDHA POWDER',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF14532D),
                    ),
                  ),
                  const Text(
                    'Withania somnifera',
                    style: TextStyle(
                      fontStyle: FontStyle.italic,
                      color: Colors.black54,
                      fontSize: 12,
                    ),
                  ),
                  const Divider(height: 20),
                  _buildSummaryItem('🌱 Source', '✓ Verified'),
                  _buildSummaryItem('📍 Collection', '✓ Verified'),
                  _buildSummaryItem('📦 Processing', '✓ Verified'),
                  _buildSummaryItem('🧪 Quality', '✓ Verified'),
                  _buildSummaryItem('🏭 Manufacturer', '✓ Verified'),
                  _buildSummaryItem('⛓️ Traceability', '✓ Verified'),
                ],
              ),
            ),
          ),
          const SizedBox(height: 16),
          ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => ProductDetailsScreen(
                    product: ProductModel.mockAshwagandha(),
                  ),
                ),
              );
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFF14532D),
              foregroundColor: Colors.white,
              padding: const EdgeInsets.symmetric(vertical: 14),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
            ),
            child: const Text(
              'VIEW FULL DETAILS & JOURNEY',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSummaryItem(String label, String status) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 2.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style: const TextStyle(fontSize: 12, color: Colors.black87),
          ),
          Text(
            status,
            style: const TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.bold,
              color: Colors.green,
            ),
          ),
        ],
      ),
    );
  }
}
