import 'package:flutter/material.dart';

class ExportWizardScreen extends StatelessWidget {
  const ExportWizardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Export Project')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.build, size: 64, color: Colors.blue),
            const SizedBox(height: 16),
            const Text('Export Options', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
            const SizedBox(height: 24),
            ElevatedButton(
              onPressed: () {},
              child: const Text('Export APK (Minimal)'),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {},
              child: const Text('Export APK (Full SDK)'),
            ),
          ],
        ),
      ),
    );
  }
}
