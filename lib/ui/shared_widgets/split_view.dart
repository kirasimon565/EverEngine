import 'package:flutter/material.dart';

class SplitView extends StatelessWidget {
  final Widget left;
  final Widget right;
  final double initialRatio;
  final double minRatio;
  final Axis direction;

  const SplitView({
    super.key,
    required this.left,
    required this.right,
    this.initialRatio = 0.5,
    this.minRatio = 0.2,
    this.direction = Axis.horizontal,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(flex: (initialRatio * 100).toInt(), child: left),
        Expanded(flex: ((1 - initialRatio) * 100).toInt(), child: right),
      ],
    ); // Basic implementation for now
  }
}
