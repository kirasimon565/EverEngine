import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../state/state.dart';

class EditorCanvas extends ConsumerWidget {
  const EditorCanvas({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final activeScene = ref.watch(editorProvider).activeScene;

    return Container(
      color: Colors.grey[900],
      child: Center(
        child: activeScene == null
            ? const Text('No active scene',
                style: TextStyle(color: Colors.white))
            : activeScene.rootNode.buildEditor(context),
      ),
    );
  }
}
