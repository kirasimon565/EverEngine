import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../shared_widgets/toolbar.dart';
import '../../../../state/state.dart';

class EditorToolbar extends ConsumerWidget {
  const EditorToolbar({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final editorState = ref.watch(editorProvider);

    return EEToolbar(
      height: 48,
      backgroundColor: Theme.of(context).appBarTheme.backgroundColor,
      leftActions: [
        IconButton(
          icon: const Icon(Icons.arrow_back),
          tooltip: 'Back to Hub',
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        const SizedBox(width: 8),
        const Text('My Project', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
        const SizedBox(width: 8),
        Icon(editorState.hasUnsavedChanges ? Icons.circle : Icons.check, size: 12, color: editorState.hasUnsavedChanges ? Colors.orange : Colors.green),
      ],
      title: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          _ModeSegment(
            title: 'Design',
            icon: Icons.brush,
            isSelected: editorState.viewMode == EditorViewMode.design,
            onTap: () => ref.read(editorProvider.notifier).setViewMode(EditorViewMode.design),
          ),
          _ModeSegment(
            title: 'Code',
            icon: Icons.code,
            isSelected: editorState.viewMode == EditorViewMode.code,
            onTap: () => ref.read(editorProvider.notifier).setViewMode(EditorViewMode.code),
          ),
          _ModeSegment(
            title: 'Split',
            icon: Icons.vertical_split,
            isSelected: editorState.viewMode == EditorViewMode.split,
            onTap: () => ref.read(editorProvider.notifier).setViewMode(EditorViewMode.split),
          ),
        ],
      ),
      rightActions: [
        DropdownButton<String>(
          value: 'Pixel 7',
          items: const [
            DropdownMenuItem(value: 'Pixel 7', child: Text('Pixel 7')),
            DropdownMenuItem(value: 'Galaxy S24', child: Text('Galaxy S24')),
            DropdownMenuItem(value: 'Tablet', child: Text('Tablet')),
          ],
          onChanged: (_) {},
          underline: const SizedBox(),
        ),
        const SizedBox(width: 16),
        IconButton(
          icon: const Icon(Icons.play_arrow, color: Colors.green),
          tooltip: 'Play Preview',
          onPressed: () {
            Navigator.of(context).pushNamed('/preview');
          },
        ),
        IconButton(
          icon: const Icon(Icons.build),
          tooltip: 'Export',
          onPressed: () {
            Navigator.of(context).pushNamed('/export');
          },
        ),
        IconButton(
          icon: const Icon(Icons.settings),
          tooltip: 'Settings',
          onPressed: () {
            Navigator.of(context).pushNamed('/settings');
          },
        ),
      ],
    );
  }
}

class _ModeSegment extends StatelessWidget {
  final String title;
  final IconData icon;
  final bool isSelected;
  final VoidCallback onTap;

  const _ModeSegment({
    required this.title,
    required this.icon,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        decoration: BoxDecoration(
          color: isSelected ? Theme.of(context).primaryColor.withOpacity(0.2) : Colors.transparent,
          border: Border(bottom: BorderSide(color: isSelected ? Theme.of(context).primaryColor : Colors.transparent, width: 2)),
        ),
        child: Row(
          children: [
            Icon(icon, size: 16, color: isSelected ? Theme.of(context).primaryColor : Colors.grey),
            const SizedBox(width: 8),
            Text(title, style: TextStyle(color: isSelected ? Theme.of(context).primaryColor : Colors.grey)),
          ],
        ),
      ),
    );
  }
}
