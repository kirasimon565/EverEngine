import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../state/state.dart';

class InspectorPanel extends ConsumerWidget {
  const InspectorPanel({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedNode = ref.watch(selectedNodeProvider);

    if (selectedNode == null) {
      return const Center(child: Text('No node selected'));
    }

    return ListView(
      children: [
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Text(
            selectedNode.type,
            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
        ),
        const Divider(),
        ...selectedNode.propertyDefinitions.map((def) {
          return ListTile(
            title: Text(def.displayName),
            subtitle: Text(
                selectedNode.properties[def.name]?.value.toString() ??
                    def.defaultValue.toString()),
          );
        }).toList(),
      ],
    );
  }
}
