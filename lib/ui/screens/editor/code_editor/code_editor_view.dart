import 'package:flutter/material.dart';

class CodeEditorView extends StatelessWidget {
  const CodeEditorView({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
            width: 200,
            color: Colors.grey[900],
            child: const Center(child: Text('File Explorer'))),
        Expanded(
          child: Column(
            children: [
              Container(
                  height: 36, color: Colors.black26, child: const Text('Tabs')),
              Expanded(
                  child: Container(
                      color: Colors.black,
                      child: const Center(child: Text('Code Area')))),
              Container(
                  height: 150,
                  color: Colors.grey[900],
                  child: const Center(child: Text('Console'))),
            ],
          ),
        ),
        Container(
            width: 250,
            color: Colors.grey[850],
            child: const Center(child: Text('Code Inspector'))),
      ],
    );
  }
}
