import 'package:flutter/material.dart';

class NotificationsScreen extends StatelessWidget {
  const NotificationsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Notifications')),
      body: ListView(
        padding: const EdgeInsets.all(12),
        children: const [
          ListTile(
            leading: Icon(Icons.verified_outlined, color: Colors.green),
            title: Text('🟢 Product Verified', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 13)),
            subtitle: Text('ASH-2026-001 has been successfully verified.', style: TextStyle(fontSize: 11)),
          ),
          Divider(),
          ListTile(
            leading: Icon(Icons.science_outlined, color: Colors.blue),
            title: Text('🧪 Quality Update', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 13)),
            subtitle: Text('A new quality record has been added for Ashwagandha batch.', style: TextStyle(fontSize: 11)),
          ),
          Divider(),
          ListTile(
            leading: Icon(Icons.warning_amber_outlined, color: Colors.orange),
            title: Text('🚨 Product Alert', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 13)),
            subtitle: Text('A verification query was flagged for review on batch XYZ-999.', style: TextStyle(fontSize: 11)),
          ),
        ],
      ),
    );
  }
}