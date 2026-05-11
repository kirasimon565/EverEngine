import 'package:flutter/material.dart';

class SplitView extends StatefulWidget {
  final Widget left;
  final Widget right;
  final double initialRatio;
  final Axis direction;

  const SplitView({
    super.key,
    required this.left,
    required this.right,
    this.initialRatio = 0.5,
    this.direction = Axis.horizontal,
  });

  @override
  State<SplitView> createState() => _SplitViewState();
}

class _SplitViewState extends State<SplitView> {
  late double _ratio;

  @override
  void initState() {
    super.initState();
    _ratio = widget.initialRatio;
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final maxSize = widget.direction == Axis.horizontal
            ? constraints.maxWidth
            : constraints.maxHeight;

        return Flex(
          direction: widget.direction,
          children: [
            Flexible(
              flex: (_ratio * 10000).toInt(),
              child: widget.left,
            ),
            GestureDetector(
              behavior: HitTestBehavior.translucent,
              onPanUpdate: (details) {
                final delta = widget.direction == Axis.horizontal
                    ? details.delta.dx
                    : details.delta.dy;
                setState(() {
                  _ratio = (_ratio + delta / maxSize).clamp(0.1, 0.9);
                });
              },
              child: MouseRegion(
                cursor: widget.direction == Axis.horizontal
                    ? SystemMouseCursors.resizeLeftRight
                    : SystemMouseCursors.resizeUpDown,
                child: Container(
                  width: widget.direction == Axis.horizontal
                      ? 8.0
                      : double.infinity,
                  height:
                      widget.direction == Axis.vertical ? 8.0 : double.infinity,
                  color: Colors.black12,
                ),
              ),
            ),
            Flexible(
              flex: ((1 - _ratio) * 10000).toInt(),
              child: widget.right,
            ),
          ],
        );
      },
    );
  }
}
