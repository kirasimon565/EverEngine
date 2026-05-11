import 'package:flutter/material.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Settings')),
      body: ListView(
        children: [
          ListTile(
            leading: const Icon(Icons.palette),
            title: const Text('Editor Theme'),
            subtitle: const Text('Dark Mode'),
            onTap: () {},
          ),
          ListTile(
            leading: const Icon(Icons.save),
            title: const Text('Auto-save Interval'),
            subtitle: const Text('5 minutes'),
            onTap: () {},
          ),
          ListTile(
            leading: const Icon(Icons.build),
            title: const Text('SDK Management'),
            trailing: const Icon(Icons.chevron_right),
            onTap: () {},
          ),
          ListTile(
            leading: const Icon(Icons.cloud_sync),
            title: const Text('Cloud Sync'),
            subtitle: const Text('Not connected'),
            onTap: () {},
          ),
          ListTile(
            leading: const Icon(Icons.info),
            title: const Text('About EverEngine'),
            subtitle: const Text('Version 1.0.0'),
            onTap: () {},
          ),
        ],
      ),
    );
  }
}
