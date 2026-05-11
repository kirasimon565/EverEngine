import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../shared_widgets/sidebar.dart';
import 'top_toolbar/editor_toolbar.dart';
import 'left_panel/node_palette.dart';
import 'canvas/editor_canvas.dart';
import 'right_panel/inspector_panel.dart';
import 'bottom_panel/scene_tab_bar.dart';
import 'code_editor/code_editor_view.dart';
import 'node_graph/node_graph_view.dart';
import '../../../../state/state.dart';

class EditorScreen extends ConsumerWidget {
  const EditorScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final viewMode = ref.watch(editorProvider).viewMode;

    return Scaffold(
      body: Column(
        children: [
          const EditorToolbar(),
          Expanded(
            child: Row(
              children: [
                if (viewMode == EditorViewMode.design || viewMode == EditorViewMode.split)
                  EESidebar(
                    side: SidebarSide.left,
                    width: 250,
                    child: const NodePalette(),
                  ),
                Expanded(
                  child: Column(
                    children: [
                      Expanded(
                        child: _buildCenterView(viewMode),
                      ),
                      const SceneTabBar(),
                    ],
                  ),
                ),
                if (viewMode == EditorViewMode.design || viewMode == EditorViewMode.split)
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

  Widget _buildCenterView(EditorViewMode viewMode) {
    switch (viewMode) {
      case EditorViewMode.design:
        // Mocking graph view toggling manually for the exercise scope.
        // It could swap between EditorCanvas and NodeGraphView
        return const EditorCanvas();
      case EditorViewMode.code:
        return const CodeEditorView();
      case EditorViewMode.split:
        return Row(
          children: const [
             Expanded(child: EditorCanvas()),
             Expanded(child: CodeEditorView()),
          ]
        );
    }
  }
}
