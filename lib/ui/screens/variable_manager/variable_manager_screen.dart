import 'package:flutter/material.dart';

class VariableManagerScreen extends StatelessWidget {
  const VariableManagerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Variable Manager')),
      body: Row(
        children: [
          Expanded(
            flex: 2,
            child: ListView(
              children: const [
                ListTile(
                    title: Text('player_name (String)'),
                    subtitle: Text('Global')),
                ListTile(
                    title: Text('trust_level (Int)'), subtitle: Text('Global')),
              ],
            ),
          ),
          const VerticalDivider(),
          Expanded(
            flex: 3,
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Text('Variable Details', style: TextStyle(fontSize: 20)),
                  SizedBox(height: 16),
                  TextField(decoration: InputDecoration(labelText: 'Name')),
                  SizedBox(height: 16),
                  TextField(
                      decoration: InputDecoration(labelText: 'Default Value')),
                ],
              ),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: const Icon(Icons.add),
      ),
    );
  }
}
