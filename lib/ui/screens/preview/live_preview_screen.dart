import 'package:flutter/material.dart';

class LivePreviewScreen extends StatelessWidget {
  const LivePreviewScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        children: [
          const Center(
              child: Text('Live Preview',
                  style: TextStyle(color: Colors.white, fontSize: 24))),
          Positioned(
            bottom: 20,
            left: 20,
            right: 20,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                IconButton(
                    icon: const Icon(Icons.close, color: Colors.white),
                    onPressed: () {}),
                IconButton(
                    icon: const Icon(Icons.camera_alt, color: Colors.white),
                    onPressed: () {}),
                IconButton(
                    icon: const Icon(Icons.bug_report, color: Colors.white),
                    onPressed: () {}),
              ],
            ),
          )
        ],
      ),
    );
  }
}
