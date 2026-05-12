import 'package:flutter/material.dart';

class EEToolbar extends StatelessWidget {
  final List<Widget> leftActions;
  final Widget? title;
  final List<Widget> rightActions;
  final double height;
  final Color? backgroundColor;

  const EEToolbar({
    super.key,
    this.leftActions = const [],
    this.title,
    this.rightActions = const [],
    this.height = 48.0,
    this.backgroundColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      color: backgroundColor ?? Theme.of(context).primaryColor,
      child: Row(
        children: [
          Row(children: leftActions),
          if (title != null) Expanded(child: Center(child: title!)),
          if (title == null) const Spacer(),
          Row(children: rightActions),
        ],
      ),
    );
  }
}
