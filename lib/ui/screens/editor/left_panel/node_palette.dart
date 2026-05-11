import 'package:flutter/material.dart';
import '../../../../core/node_system/node_registry.dart';

class NodePalette extends StatelessWidget {
  const NodePalette({super.key});

  @override
  Widget build(BuildContext context) {
    final types = NodeRegistry.registeredTypes;

    return Column(
      children: [
        const Padding(
          padding: EdgeInsets.all(8.0),
          child: TextField(
            decoration: InputDecoration(
              labelText: 'Search nodes...',
              prefixIcon: Icon(Icons.search),
            ),
          ),
        ),
        Expanded(
          child: ListView.builder(
            itemCount: types.length,
            itemBuilder: (context, index) {
              final type = types[index];
              return ListTile(
                leading: const Icon(Icons.widgets),
                title: Text(type),
                onTap: () {},
              );
            },
          ),
        ),
      ],
    );
  }
}
