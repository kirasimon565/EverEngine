import 'package:flutter/material.dart';

class ContextMenuItem {
  final String label;
  final IconData? icon;
  final VoidCallback? onTap;
  final List<ContextMenuItem>? children;
  final bool isDivider;
  final String? shortcutText;
  final bool isEnabled;

  const ContextMenuItem({
    required this.label,
    this.icon,
    this.onTap,
    this.children,
    this.isDivider = false,
    this.shortcutText,
    this.isEnabled = true,
  });
}

class EEContextMenu extends StatelessWidget {
  final List<ContextMenuItem> items;
  final Offset position;
  final VoidCallback onDismiss;

  const EEContextMenu({
    super.key,
    required this.items,
    required this.position,
    required this.onDismiss,
  });

  @override
  Widget build(BuildContext context) {
    // Placeholder implementation
    return Positioned(
      left: position.dx,
      top: position.dy,
      child: Material(
        elevation: 8,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: items.map((item) {
            if (item.isDivider) return const Divider();
            return ListTile(
              leading: item.icon != null ? Icon(item.icon) : null,
              title: Text(item.label),
              trailing:
                  item.shortcutText != null ? Text(item.shortcutText!) : null,
              onTap: () {
                if (item.onTap != null) item.onTap!();
                onDismiss();
              },
            );
          }).toList(),
        ),
      ),
    );
  }
}
