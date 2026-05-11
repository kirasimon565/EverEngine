import 'package:flutter/material.dart';

class TimelineScreen extends StatelessWidget {
  const TimelineScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Story Timeline')),
      body: ListView(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.all(16.0),
        children: [
          _buildChapterCard('Chapter 1', ['Prologue', 'The Incident']),
          const SizedBox(width: 16),
          _buildChapterCard('Chapter 2', ['Investigation', 'The Suspect']),
          const SizedBox(width: 16),
          _buildChapterCard('Chapter 3', ['The Truth', 'Ending']),
        ],
      ),
    );
  }

  Widget _buildChapterCard(String title, List<String> scenes) {
    return Container(
      width: 250,
      decoration: BoxDecoration(
        color: Colors.grey[800],
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: Colors.grey[700]!),
      ),
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(12),
            color: Colors.grey[900],
            width: double.infinity,
            child: Text(title,
                style:
                    const TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
          ),
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.all(8),
              itemCount: scenes.length,
              itemBuilder: (context, index) {
                return Card(
                  color: Colors.grey[700],
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(scenes[index]),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
