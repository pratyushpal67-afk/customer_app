import 'package:flutter/material.dart';
import '../models/product_model.dart';

class SourceScreen extends StatelessWidget {
  final ProductModel product;
  const SourceScreen({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Source of Herb')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              height: 220,
              decoration: BoxDecoration(
                color: const Color(0xFFDCFCE7),
                borderRadius: BorderRadius.circular(14),
                border: Border.all(color: const Color(0xFF86EFAC)),
              ),
              child: const Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.location_on, size: 48, color: Color(0xFF14532D)),
                    SizedBox(height: 8),
                    Text('📍 Verified Collection Origin', style: TextStyle(fontWeight: FontWeight.bold, color: Color(0xFF14532D))),
                    Text('Hooghly Forest Division Authorized Cluster', style: TextStyle(fontSize: 12, color: Colors.black54)),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 16),
            Card(
              elevation: 0,
              shape: RoundedRectangleBorder(side: BorderSide(color: Colors.grey.shade300), borderRadius: BorderRadius.circular(12)),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    _buildRow('Herb:', product.productName),
                    _buildRow('Botanical Name:', product.botanicalName),
                    _buildRow('Collection Date:', product.collectionDate),
                    _buildRow('Origin:', product.origin),
                    _buildRow('Collector Status:', product.collectorStatus),
                    _buildRow('Location Status:', '🟢 Geo-tagged (±3.2m accuracy)'),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(label, style: const TextStyle(color: Colors.black54, fontSize: 12)),
          Text(value, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 12)),
        ],
      ),
    );
  }
}