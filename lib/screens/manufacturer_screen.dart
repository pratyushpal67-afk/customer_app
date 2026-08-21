import 'package:flutter/material.dart';
import '../models/product_model.dart';

class ManufacturerScreen extends StatelessWidget {
  final ProductModel product;
  const ManufacturerScreen({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Manufacturer Details')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Card(
          elevation: 0,
          shape: RoundedRectangleBorder(side: BorderSide(color: Colors.grey.shade300), borderRadius: BorderRadius.circular(12)),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                _buildRow('Manufacturer Name:', product.manufacturerName),
                _buildRow('Product Formulation:', product.productName),
                _buildRow('Batch ID:', product.batchId),
                _buildRow('Manufacturing Date:', product.mfgDate),
                _buildRow('AYUSH License Number:', product.licenseNumber),
                _buildRow('Facility Status:', '✓ Verified Licensed Unit'),
              ],
            ),
          ),
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