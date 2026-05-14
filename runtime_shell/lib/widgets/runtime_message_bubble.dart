import 'package:flutter/material.dart';
import 'package:everengine/core/node_system/types/story_nodes/message_bubble_node.dart';
import 'package:everengine/core/utils/color_utils.dart';

class RuntimeMessageBubble extends StatelessWidget {
  final MessageBubbleNode node;

  const RuntimeMessageBubble({super.key, required this.node});

  @override
  Widget build(BuildContext context) {
    final text = node.properties['messageText']?.value as String? ?? 'Hello';
    final colorHex =
        node.properties['bubbleColor']?.value as String? ?? '#2D2D44';

    return Align(
      alignment: Alignment.centerLeft,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
        decoration: BoxDecoration(
          color: ColorUtils.fromHex(colorHex),
          borderRadius: BorderRadius.circular(16),
        ),
        child: Text(text, style: const TextStyle(color: Colors.white)),
      ),
    );
  }
}
