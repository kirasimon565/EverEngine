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
    this.width = 250.0,
    this.side = SidebarSide.left,
    this.resizable = true,
    this.minWidth = 160.0,
    this.maxWidth = 500.0,
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
    final handle = GestureDetector(
      behavior: HitTestBehavior.translucent,
      onPanUpdate: widget.resizable
          ? (details) {
              setState(() {
                final delta = widget.side == SidebarSide.left
                    ? details.delta.dx
                    : -details.delta.dx;
                _currentWidth = (_currentWidth + delta)
                    .clamp(widget.minWidth, widget.maxWidth);
              });
            }
          : null,
      child: MouseRegion(
        cursor: widget.resizable
            ? SystemMouseCursors.resizeLeftRight
            : MouseCursor.defer,
        child: Container(
          width: 4.0,
          color: Colors.black12,
        ),
      ),
    );

    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        if (widget.side == SidebarSide.right) handle,
        SizedBox(
          width: _currentWidth,
          child: widget.child,
        ),
        if (widget.side == SidebarSide.left) handle,
      ],
    );
  }
}
