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
            child: ListView(children: const [
              ListTile(
                  leading: Icon(Icons.folder, color: Colors.blue),
                  title: Text('lib', style: TextStyle(color: Colors.white))),
              Padding(
                padding: EdgeInsets.only(left: 16.0),
                child: ListTile(
                    leading: Icon(Icons.insert_drive_file, color: Colors.white),
                    title: Text('main.dart',
                        style: TextStyle(color: Colors.white))),
              )
            ])),
        Expanded(
          child: Column(
            children: [
              Container(
                  height: 36,
                  color: Colors.black26,
                  child: Row(children: [
                    Container(
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        decoration: const BoxDecoration(
                            border: Border(
                                bottom:
                                    BorderSide(color: Colors.blue, width: 2))),
                        child: const Center(
                            child: Text('main.dart',
                                style: TextStyle(color: Colors.white))))
                  ])),
              Expanded(
                  child: Container(
                      color: const Color(0xFF1E1E1E),
                      width: double.infinity,
                      padding: const EdgeInsets.all(16),
                      child: const Text('''
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}
''', style: TextStyle(fontFamily: 'monospace', color: Colors.white)))),
              Container(
                  height: 150,
                  color: Colors.grey[900],
                  width: double.infinity,
                  padding: const EdgeInsets.all(8),
                  child: const Text('> flutter run',
                      style: TextStyle(
                          fontFamily: 'monospace', color: Colors.green))),
            ],
          ),
        ),
        Container(
            width: 250,
            color: Colors.grey[850],
            padding: const EdgeInsets.all(16),
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Text('Inspector',
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 16)),
                  SizedBox(height: 16),
                  Text('Widget: MyApp',
                      style: TextStyle(color: Colors.white70)),
                  SizedBox(height: 8),
                  Text('Type: StatelessWidget',
                      style: TextStyle(color: Colors.white70)),
                ])),
      ],
    );
  }
}
