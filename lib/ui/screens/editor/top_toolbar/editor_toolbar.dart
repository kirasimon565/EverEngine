import 'package:flutter/material.dart';
import '../../../shared_widgets/toolbar.dart';
import 'mode_switcher.dart';

class EditorToolbar extends StatelessWidget {
  const EditorToolbar({super.key});

  @override
  Widget build(BuildContext context) {
    return EEToolbar(
      leftActions: [
        IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            // Navigate back
          },
        ),
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 8.0),
          child: Text('Project Name',
              style: TextStyle(fontWeight: FontWeight.bold)),
        ),
      ],
      title: const ModeSwitcher(),
      rightActions: [
        IconButton(
          icon: const Icon(Icons.play_arrow, color: Colors.green),
          onPressed: () {
            // Live Preview
          },
        ),
        IconButton(
          icon: const Icon(Icons.download),
          onPressed: () {
            // Export
          },
        ),
        IconButton(
          icon: const Icon(Icons.settings),
          onPressed: () {
            // Settings
          },
        ),
      ],
    );
  }
}
