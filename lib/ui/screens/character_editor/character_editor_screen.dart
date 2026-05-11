import 'package:flutter/material.dart';

class CharacterEditorScreen extends StatelessWidget {
  const CharacterEditorScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Character Editor')),
      body: Row(
        children: [
          Expanded(
            flex: 1,
            child: ListView(
              children: const [
                ListTile(
                    leading: CircleAvatar(child: Text('J')),
                    title: Text('Jake')),
                ListTile(
                    leading: CircleAvatar(child: Text('L')),
                    title: Text('Lily')),
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
                  Text('Character Details', style: TextStyle(fontSize: 20)),
                  SizedBox(height: 16),
                  TextField(
                      decoration: InputDecoration(labelText: 'Display Name')),
                  SizedBox(height: 16),
                  TextField(
                      decoration:
                          InputDecoration(labelText: 'Bubble Color (Hex)')),
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
