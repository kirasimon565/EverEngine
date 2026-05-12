import 'package:flutter/material.dart';

class NodeGraphView extends StatelessWidget {
  const NodeGraphView({super.key});

  @override
  Widget build(BuildContext context) {
    return InteractiveViewer(
      child: Stack(
        children: [
          // Graph dot grid
          Container(
            color: Colors.blueGrey[900], // Placeholder background
          ),
          const Center(child: Text('Node Graph UI', style: TextStyle(color: Colors.white))),
        ],
      ),
    );
  }
}
