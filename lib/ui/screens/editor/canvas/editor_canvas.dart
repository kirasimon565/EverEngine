import 'package:flutter/material.dart';

class EditorCanvas extends StatelessWidget {
  const EditorCanvas({super.key});

  @override
  Widget build(BuildContext context) {
    return InteractiveViewer(
      minScale: 0.25,
      maxScale: 4.0,
      child: Stack(
        children: [
          // Grid background here
          Container(
            color: Colors.black, // Placeholder grid
          ),
          // Canvas content here
          const Center(
              child: Text('Canvas Content Area',
                  style: TextStyle(color: Colors.white))),
        ],
      ),
    );
  }
}
