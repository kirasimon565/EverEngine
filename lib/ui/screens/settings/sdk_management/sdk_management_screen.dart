import 'package:flutter/material.dart';

class SdkManagementScreen extends StatelessWidget {
  const SdkManagementScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('SDK Management')),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: const [
          ListTile(
              title: Text('Flutter SDK'),
              subtitle: Text('3.43.0 • Found'),
              leading: Icon(Icons.check_circle, color: Colors.green)),
          ListTile(
              title: Text('Android SDK'),
              subtitle: Text('API 35 • Found'),
              leading: Icon(Icons.check_circle, color: Colors.green)),
          ListTile(
              title: Text('NDK'),
              subtitle: Text('28.0 • Found'),
              leading: Icon(Icons.check_circle, color: Colors.green)),
        ],
      ),
    );
  }
}
