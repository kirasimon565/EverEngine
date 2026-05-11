import 'package:flutter/material.dart';

class NodeGraphView extends StatelessWidget {
  const NodeGraphView({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.grey[850],
      child: Stack(
        children: [
          // Grid background
          CustomPaint(
            painter: _GridPainter(),
            child: Container(),
          ),
          // Example Node Card
          Positioned(
            left: 100,
            top: 100,
            child: Container(
              width: 150,
              height: 60,
              decoration: BoxDecoration(
                color: Colors.grey[800],
                borderRadius: BorderRadius.circular(8),
                border: Border.all(color: Colors.blueAccent),
              ),
              child: Row(
                children: [
                  Container(
                      width: 8,
                      decoration: const BoxDecoration(
                          color: Colors.green,
                          borderRadius: BorderRadius.horizontal(
                              left: Radius.circular(8)))),
                  const SizedBox(width: 8),
                  const Icon(Icons.play_arrow, color: Colors.white70),
                  const SizedBox(width: 8),
                  const Text('Start', style: TextStyle(color: Colors.white)),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _GridPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.white12
      ..strokeWidth = 1;

    for (double i = 0; i < size.width; i += 20) {
      canvas.drawLine(Offset(i, 0), Offset(i, size.height), paint);
    }
    for (double i = 0; i < size.height; i += 20) {
      canvas.drawLine(Offset(0, i), Offset(size.width, i), paint);
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
