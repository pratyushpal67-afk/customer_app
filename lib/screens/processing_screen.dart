import 'package:flutter/material.dart';
import '../models/product_model.dart';

class ProcessingScreen extends StatelessWidget {
  final ProductModel product;
  const ProcessingScreen({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Processing History')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Card(
              elevation: 0,
              shape: RoundedRectangleBorder(side: BorderSide(color: Colors.grey.shade300), borderRadius: BorderRadius.circular(12)),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _buildRow('Batch ID:', product.batchId),
                    _buildRow('Received Quantity:', '${product.rawQuantityKg} kg'),
                    _buildRow('Processed Quantity:', '${product.processedQuantityKg} kg'),
                    _buildRow('Processing Date:', product.processingDate),
                    _buildRow('Processing Status:', '🟢 Completed'),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 16),
            const Text('Processing Milestones', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14)),
            const SizedBox(height: 8),
            _buildCheckTile('✓ Batch received at collection center'),
            _buildCheckTile('✓ Sorting, cleaning & solar drying recorded'),
            _buildCheckTile('✓ Net quantity mass balance updated'),
            _buildCheckTile('✓ Full batch traceability maintained on-chain'),
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

  Widget _buildCheckTile(String text) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Row(
        children: [
          const Icon(Icons.check_circle, color: Colors.green, size: 18),
          const SizedBox(width: 8),
          Text(text, style: const TextStyle(fontSize: 12, color: Colors.black87)),
        ],
      ),
    );
  }
}