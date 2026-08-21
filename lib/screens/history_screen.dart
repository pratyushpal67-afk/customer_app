import 'package:flutter/material.dart';
import '../models/product_model.dart';
import 'product_details_screen.dart';

class HistoryScreen extends StatelessWidget {
  const HistoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Scan History')),
      body: ListView(
        padding: const EdgeInsets.all(12),
        children: [
          _buildCard(context, 'Ashwagandha Powder', 'ASH-2026-001', '21 August 2026'),
          _buildCard(context, 'Tulsi Extract', 'TUL-2026-004', '18 August 2026'),
        ],
      ),
    );
  }

  Widget _buildCard(BuildContext context, String name, String id, String date) {
    return Card(
      elevation: 0,
      margin: const EdgeInsets.symmetric(vertical: 4),
      shape: RoundedRectangleBorder(
        side: BorderSide(color: Colors.grey.shade200),
        borderRadius: BorderRadius.circular(10),
      ),
      child: ListTile(
        leading: const CircleAvatar(
          backgroundColor: Color(0xFFDCFCE7),
          child: Icon(Icons.verified, color: Color(0xFF14532D), size: 20),
        ),
        title: Text(name, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 13)),
        subtitle: Text('Batch: $id • Scanned: $date', style: const TextStyle(fontSize: 11)),
        trailing: const Icon(Icons.chevron_right, size: 18),
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (_) => ProductDetailsScreen(product: ProductModel.mockAshwagandha()),
            ),
          );
        },
      ),
    );
  }
}