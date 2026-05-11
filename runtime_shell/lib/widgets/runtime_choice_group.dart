import 'package:flutter/material.dart';
import '../../../lib/core/node_system/types/story_nodes/choice_group_node.dart';

class RuntimeChoiceGroup extends StatelessWidget {
  final ChoiceGroupNode node;
  final List<Widget> choiceWidgets;

  const RuntimeChoiceGroup({super.key, required this.node, required this.choiceWidgets});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      child: Column(
        children: choiceWidgets,
      ),
    );
  }
}
