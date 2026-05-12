import 'package:flutter/material.dart';

class NodePalette extends StatelessWidget {
  const NodePalette({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: TextField(
            decoration: const InputDecoration(
              hintText: 'Search nodes...',
              prefixIcon: Icon(Icons.search),
              border: OutlineInputBorder(),
              isDense: true,
            ),
          ),
        ),
        const Expanded(
          child: Center(child: Text('Node Palette Categories')),
        ),
      ],
    );
  }
}
