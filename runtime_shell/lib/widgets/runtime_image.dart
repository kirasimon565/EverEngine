import 'package:flutter/material.dart';
import 'package:everengine/core/node_system/types/ui_nodes/image_node.dart';

class RuntimeImage extends StatelessWidget {
  final ImageNode node;

  const RuntimeImage({super.key, required this.node});

  @override
  Widget build(BuildContext context) {
    final width = node.properties['width']?.value as double? ?? 100.0;
    final height = node.properties['height']?.value as double? ?? 100.0;
    final source = node.properties['source']?.value as String? ?? '';

    if (source.isNotEmpty) {
      return Image.asset(
        'assets/project_assets/$source',
        width: width,
        height: height,
        errorBuilder: (_, __, ___) => const Center(child: Icon(Icons.error)),
      );
    }
    return Container(
      width: width,
      height: height,
      color: Colors.grey[300],
      child: const Center(child: Icon(Icons.image, color: Colors.grey)),
    );
  }
}
