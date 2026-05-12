import 'package:flutter/material.dart';
import '../../shared_widgets/sidebar.dart';
import 'top_toolbar/editor_toolbar.dart';
import 'left_panel/node_palette.dart';
import 'canvas/editor_canvas.dart';
import 'right_panel/inspector_panel.dart';

class EditorScreen extends StatelessWidget {
  const EditorScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const EditorToolbar(),
          Expanded(
            child: Row(
              children: [
                EESidebar(
                  side: SidebarSide.left,
                  child: Container(
                    color: Colors.grey[900],
                    child: const NodePalette(),
                  ),
                ),
                Expanded(
                  child: Container(
                    color: Colors.black87,
                    child: const EditorCanvas(),
                  ),
                ),
                EESidebar(
                  side: SidebarSide.right,
                  child: Container(
                    color: Colors.grey[900],
                    child: const InspectorPanel(),
                  ),
                ),
              ],
            ),
          ),
          Container(
            height: 36,
            color: Colors.grey[850],
            child: const Row(
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 8.0),
                  child: Text('Scene Tabs'),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
