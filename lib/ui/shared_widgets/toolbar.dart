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
      color: backgroundColor ?? Theme.of(context).appBarTheme.backgroundColor,
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Row(
        children: [
          ...leftActions,
          if (leftActions.isNotEmpty && title != null)
            const SizedBox(width: 16),
          if (title != null) Expanded(child: title!),
          if (title == null) const Spacer(),
          ...rightActions,
        ],
      ),
    );
  }
}
