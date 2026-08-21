import 'package:flutter/material.dart';
import '../models/product_model.dart';
import 'source_screen.dart';
import 'processing_screen.dart';
import 'quality_screen.dart';
import 'manufacturer_screen.dart';
import 'journey_screen.dart';
import '../widgets/verification_tile.dart';

class ProductDetailsScreen extends StatelessWidget {
  final ProductModel product;
  const ProductDetailsScreen({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Product Details')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Verified Status Banner
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
                        Text('🟢 VERIFIED PRODUCT', style: TextStyle(fontWeight: FontWeight.bold, color: Color(0xFF15803D))),
                        Text('This product has a valid traceability record.', style: TextStyle(fontSize: 11, color: Color(0xFF166534))),
                      ],
                    ),
                  )
                ],
              ),
            ),
            const SizedBox(height: 14),

            // Product Information Card
            Card(
              elevation: 0,
              shape: RoundedRectangleBorder(side: BorderSide(color: Colors.grey.shade300), borderRadius: BorderRadius.circular(10)),
              child: Padding(
                padding: const EdgeInsets.all(14.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(product.productName, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Color(0xFF14532D))),
                    Text(product.botanicalName, style: const TextStyle(fontStyle: FontStyle.italic, color: Colors.black54, fontSize: 12)),
                    const Divider(height: 20),
                    _buildRow('Batch ID:', product.batchId),
                    _buildRow('Product Type:', product.productType),
                    _buildRow('Manufacturing Date:', product.mfgDate),
                    _buildRow('Product Status:', '🟢 Verified'),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 14),

            ElevatedButton.icon(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (_) => JourneyScreen(product: product)));
              },
              icon: const Icon(Icons.alt_route),
              label: const Text('VIEW FULL JOURNEY', style: TextStyle(fontWeight: FontWeight.bold)),
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF14532D),
                foregroundColor: Colors.white,
                padding: const EdgeInsets.symmetric(vertical: 14),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
              ),
            ),
            const SizedBox(height: 18),

            const Text('Verification Summary', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 13)),
            const SizedBox(height: 6),
            VerificationTile(
              icon: Icons.eco,
              title: '🌱 Source Information',
              subtitle: '✓ Geo-tagged Origin Verified',
              onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => SourceScreen(product: product))),
            ),
            VerificationTile(
              icon: Icons.inventory_2_outlined,
              title: '📦 Processing History',
              subtitle: '✓ 25 kg Received → 20 kg Processed',
              onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => ProcessingScreen(product: product))),
            ),
            VerificationTile(
              icon: Icons.science_outlined,
              title: '🧪 Quality Verification',
              subtitle: '✓ 100% Tests Passed (AYUR Quality Lab)',
              onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => QualityScreen(product: product))),
            ),
            VerificationTile(
              icon: Icons.factory_outlined,
              title: '🏭 Manufacturer Details',
              subtitle: '✓ ABC Ayurveda Ltd. (Verified)',
              onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => ManufacturerScreen(product: product))),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 2.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(label, style: const TextStyle(fontSize: 12, color: Colors.black54)),
          Text(value, style: const TextStyle(fontSize: 12, fontWeight: FontWeight.bold)),
        ],
      ),
    );
  }
}