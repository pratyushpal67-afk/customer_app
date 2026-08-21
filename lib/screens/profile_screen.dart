import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('My Profile')),
      body: Padding(
        padding: const EdgeInsets.all(18.0),
        child: Column(
          children: const [
            CircleAvatar(
              radius: 36,
              backgroundColor: Color(0xFFDCFCE7),
              child: Icon(Icons.person, size: 40, color: Color(0xFF14532D)),
            ),
            SizedBox(height: 12),
            Text('Pratyush', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
            Text('Verified Consumer Node', style: TextStyle(fontSize: 12, color: Colors.black54)),
            SizedBox(height: 20),
            Divider(),
            ListTile(
              leading: Icon(Icons.verified_user_outlined),
              title: Text('Verified Products'),
              trailing: Text('12', style: TextStyle(fontWeight: FontWeight.bold)),
            ),
            ListTile(
              leading: Icon(Icons.language),
              title: Text('Language'),
              trailing: Text('English'),
            ),
            ListTile(
              leading: Icon(Icons.notifications_none),
              title: Text('Notification Preferences'),
            ),
            ListTile(
              leading: Icon(Icons.privacy_tip_outlined),
              title: Text('Privacy & Data Ledger Policy'),
            ),
            ListTile(
              leading: Icon(Icons.help_outline),
              title: Text('Help & Documentation'),
            ),
            ListTile(
              leading: Icon(Icons.info_outline),
              title: Text('About AYURTRACE'),
              subtitle: Text('SIH25027 Ministry of Ayush Provenance Engine'),
            ),
          ],
        ),
      ),
    );
  }
}