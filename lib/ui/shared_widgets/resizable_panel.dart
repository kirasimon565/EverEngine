import 'package:flutter/material.dart';

class ResizablePanel extends StatefulWidget {
  final Widget child;
  final Axis direction;
  final double initialSize;
  final double minSize;
  final double maxSize;
  final bool isCollapsible;

  const ResizablePanel({
    super.key,
    required this.child,
    this.direction = Axis.horizontal,
    this.initialSize = 200,
    this.minSize = 50,
    this.maxSize = 500,
    this.isCollapsible = false,
  });

  @override
  State<ResizablePanel> createState() => _ResizablePanelState();
}

class _ResizablePanelState extends State<ResizablePanel> {
  late double _currentSize;

  @override
  void initState() {
    super.initState();
    _currentSize = widget.initialSize;
  }

  @override
  Widget build(BuildContext context) {
    if (widget.direction == Axis.horizontal) {
      return SizedBox(width: _currentSize, child: widget.child);
    } else {
      return SizedBox(height: _currentSize, child: widget.child);
    }
  }
}
