import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../state/state.dart';

class LivePreviewScreen extends ConsumerWidget {
  const LivePreviewScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final activeScene = ref.watch(editorProvider).activeScene;

    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: const Text('Live Preview'),
        leading: IconButton(
          icon: const Icon(Icons.close),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      body: Center(
        child: Container(
          width: 412, // Pixel 7 width
          height: 915, // Pixel 7 height
          decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(color: Colors.grey[800]!, width: 10),
            borderRadius: BorderRadius.circular(24),
          ),
          clipBehavior: Clip.hardEdge,
          child: activeScene != null
              ? activeScene.rootNode.buildPreview(context)
              : const Center(
                  child: Text('No scene to preview',
                      style: TextStyle(color: Colors.black))),
        ),
      ),
    );
  }
}
