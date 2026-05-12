import 'package:flutter/material.dart';

enum SidebarSide { left, right }

class EESidebar extends StatefulWidget {
  final Widget child;
  final double width;
  final SidebarSide side;
  final bool resizable;
  final double minWidth;
  final double maxWidth;

  const EESidebar({
    super.key,
    required this.child,
    this.width = 250,
    this.side = SidebarSide.left,
    this.resizable = true,
    this.minWidth = 160,
    this.maxWidth = 500,
  });

  @override
  State<EESidebar> createState() => _EESidebarState();
}

class _EESidebarState extends State<EESidebar> {
  late double _currentWidth;

  @override
  void initState() {
    super.initState();
    _currentWidth = widget.width;
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: _currentWidth,
      child: widget.child,
    );
  }
}
