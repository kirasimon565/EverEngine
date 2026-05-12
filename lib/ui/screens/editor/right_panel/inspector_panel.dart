import 'package:flutter/material.dart';

class InspectorPanel extends StatelessWidget {
  const InspectorPanel({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Padding(
          padding: EdgeInsets.all(8.0),
          child: Text('Inspector', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
        ),
        const Expanded(
          child: Center(child: Text('No node selected')),
        ),
      ],
    );
  }
}
