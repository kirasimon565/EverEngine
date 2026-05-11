import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../state/state.dart';

class SceneTabBar extends ConsumerWidget {
  const SceneTabBar({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final openSceneNames = ref.watch(editorProvider).openSceneNames;

    return Container(
      height: 36.0,
      color: Colors.black12,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: openSceneNames.length + 1,
        itemBuilder: (context, index) {
          if (index == openSceneNames.length) {
            return IconButton(
              icon: const Icon(Icons.add, size: 16),
              onPressed: () {},
            );
          }
          final name = openSceneNames[index];
          return Container(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            alignment: Alignment.center,
            decoration: const BoxDecoration(
              border: Border(right: BorderSide(color: Colors.black26)),
            ),
            child: Text(name),
          );
        },
      ),
    );
  }
}
