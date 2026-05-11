import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../shared_widgets/toolbar.dart';
import '../../shared_widgets/sidebar.dart';
import 'left_panel/node_palette.dart';
import 'canvas/editor_canvas.dart';
import 'right_panel/inspector_panel.dart';
import 'bottom_panel/scene_tab_bar.dart';

class EditorScreen extends ConsumerWidget {
  const EditorScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: Column(
        children: [
          EEToolbar(
            title: const Text('Project Name'),
            leftActions: [
              IconButton(icon: const Icon(Icons.arrow_back), onPressed: () {}),
            ],
            rightActions: [
              IconButton(icon: const Icon(Icons.play_arrow), onPressed: () {}),
            ],
          ),
          Expanded(
            child: Row(
              children: [
                EESidebar(
                  side: SidebarSide.left,
                  width: 250,
                  child: const NodePalette(),
                ),
                Expanded(
                  child: Column(
                    children: [
                      const Expanded(child: EditorCanvas()),
                      const SceneTabBar(),
                    ],
                  ),
                ),
                EESidebar(
                  side: SidebarSide.right,
                  width: 300,
                  child: const InspectorPanel(),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
