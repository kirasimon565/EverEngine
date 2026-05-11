import 'package:flutter/material.dart';
import '../../../lib/core/node_system/types/ui_nodes/button_node.dart';
import '../../../lib/core/utils/color_utils.dart';

class RuntimeButton extends StatelessWidget {
  final ButtonNode node;

  const RuntimeButton({super.key, required this.node});

  @override
  Widget build(BuildContext context) {
    final label = node.properties['label']?.value as String? ?? 'Button';
    final bgColorHex = node.properties['backgroundColor']?.value as String? ?? '#2196F3';
    final textColorHex = node.properties['textColor']?.value as String? ?? '#FFFFFF';

    return ElevatedButton(
      onPressed: () {
        // Execute triggers mapped via ID
      },
      style: ElevatedButton.styleFrom(
        backgroundColor: ColorUtils.fromHex(bgColorHex),
        foregroundColor: ColorUtils.fromHex(textColorHex),
      ),
      child: Text(label),
    );
  }
}
