import 'package:flutter/material.dart';
import 'package:everengine/core/node_system/types/ui_nodes/text_node.dart';
import 'package:everengine/core/utils/color_utils.dart';

class RuntimeText extends StatelessWidget {
  final TextNode node;

  const RuntimeText({super.key, required this.node});

  @override
  Widget build(BuildContext context) {
    final content = node.properties['content']?.value as String? ?? 'Text';
    final fontSize = node.properties['fontSize']?.value as double? ?? 14.0;
    final colorHex = node.properties['color']?.value as String? ?? '#000000';

    return Text(
      content,
      style: TextStyle(
        fontSize: fontSize,
        color: ColorUtils.fromHex(colorHex),
      ),
    );
  }
}
