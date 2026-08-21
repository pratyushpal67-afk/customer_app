import 'package:flutter/material.dart';
import '../models/product_model.dart';

class JourneyScreen extends StatelessWidget {
  final ProductModel product;
  const JourneyScreen({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('From Source to Shelf')),
      body: ListView(
        padding: const EdgeInsets.all(18),
        children: [
          const Text('🌿 FROM SOURCE TO SHELF', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Color(0xFF14532D))),
          const SizedBox(height: 16),
          _buildMilestone('🌱 1. SOURCE', 'Ashwagandha identified', '✓ Source recorded'),
          _buildMilestone('📍 2. COLLECTION', '${product.collectionDate} (Hooghly Block)', '✓ Location & Collector verified'),
          _buildMilestone('📦 3. PROCESSING', 'Cleaned & dried (${product.rawQuantityKg}kg → ${product.processedQuantityKg}kg)', '✓ Quantity & processing recorded'),
          _buildMilestone('🧪 4. LABORATORY', '${product.labName}', '✓ All quality tests passed'),
          _buildMilestone('🏭 5. MANUFACTURING', '${product.manufacturerName}', '✓ Product manufactured & verified'),
          _buildMilestone('🏷️ 6. FINAL PRODUCT', 'Product linked to batch ID ${product.batchId}', '✓ QR code generated on ledger', isLast: true),
        ],
      ),
    );
  }

  Widget _buildMilestone(String title, String subtitle, String status, {bool isLast = false}) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Column(
          children: [
            const CircleAvatar(radius: 12, backgroundColor: Color(0xFF14532D), child: Icon(Icons.check, size: 14, color: Colors.white)),
            if (!isLast) Container(width: 2, height: 50, color: const Color(0xFF86EFAC)),
          ],
        ),
        const SizedBox(width: 14),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(title, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 13, color: Color(0xFF14532D))),
              Text(subtitle, style: const TextStyle(fontSize: 11, color: Colors.black87)),
              Text(status, style: const TextStyle(fontSize: 11, color: Colors.green, fontWeight: FontWeight.w600)),
              const SizedBox(height: 18),
            ],
          ),
        ),
      ],
    );
  }
}