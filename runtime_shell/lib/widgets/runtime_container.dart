import 'package:flutter/material.dart';
import 'package:everengine/core/node_system/types/ui_nodes/container_node.dart';
import 'package:everengine/core/utils/color_utils.dart';

class RuntimeContainer extends StatelessWidget {
  final ContainerNode node;
  final Widget? child; // We might recurse over children later

  const RuntimeContainer({super.key, required this.node, this.child});

  @override
  Widget build(BuildContext context) {
    final width = node.properties['width']?.value as double? ?? 100.0;
    final height = node.properties['height']?.value as double? ?? 100.0;
    final colorHex = node.properties['color']?.value as String? ?? '#FFFFFF';
    final borderRadius =
        node.properties['borderRadius']?.value as double? ?? 0.0;

    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        color: ColorUtils.fromHex(colorHex),
        borderRadius: BorderRadius.circular(borderRadius),
      ),
      child: child,
    );
  }
}
