import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../state/editor_state.dart';

class ModeSwitcher extends ConsumerWidget {
  const ModeSwitcher({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final viewMode = ref.watch(editorProvider).viewMode;

    return SegmentedButton<EditorViewMode>(
      segments: const [
        ButtonSegment(
          value: EditorViewMode.design,
          icon: Icon(Icons.brush),
          label: Text('Design'),
        ),
        ButtonSegment(
          value: EditorViewMode.code,
          icon: Icon(Icons.code),
          label: Text('Code'),
        ),
        ButtonSegment(
          value: EditorViewMode.split,
          icon: Icon(Icons.vertical_split),
          label: Text('Split'),
        ),
      ],
      selected: {viewMode},
      onSelectionChanged: (Set<EditorViewMode> newSelection) {
        ref.read(editorProvider.notifier).setViewMode(newSelection.first);
      },
    );
  }
}
