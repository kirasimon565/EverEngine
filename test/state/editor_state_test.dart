import 'package:flutter_test/flutter_test.dart';
import 'package:everengine/state/editor_state.dart';
import 'package:everengine/core/scene_system/scene.dart';
import 'package:everengine/core/node_system/node_id.dart';
import 'package:everengine/core/node_system/types/ui_nodes/container_node.dart';

void main() {
  group('EditorNotifier', () {
    test('setActiveScene updates state', () {
      final notifier = EditorNotifier();
      final scene = Scene(
          name: 's1',
          displayName: 'S1',
          rootNode: ContainerNode(id: NodeId.generate()),
          createdAt: DateTime.now(),
          updatedAt: DateTime.now());

      notifier.setActiveScene(scene);

      expect(notifier.state.activeScene, equals(scene));
    });

    test('selectNode updates selectedNodeId', () {
      final notifier = EditorNotifier();
      notifier.selectNode('test-id');

      expect(notifier.state.selectedNodeId, equals('test-id'));
      expect(notifier.state.selectedNodeIds, equals(['test-id']));
    });

    test('multiSelectAdd adds to list', () {
      final notifier = EditorNotifier();
      notifier.selectNode('id1');
      notifier.multiSelectAdd('id2');

      expect(notifier.state.selectedNodeIds, equals(['id1', 'id2']));
    });

    test('clearSelection empties selection', () {
      final notifier = EditorNotifier();
      notifier.selectNode('test-id');
      notifier.clearSelection();

      expect(notifier.state.selectedNodeId, isNull);
      expect(notifier.state.selectedNodeIds, isEmpty);
    });

    test('setViewMode changes mode', () {
      final notifier = EditorNotifier();
      notifier.setViewMode(EditorViewMode.code);

      expect(notifier.state.viewMode, equals(EditorViewMode.code));
    });

    test('updateCanvas updates canvas state', () {
      final notifier = EditorNotifier();
      const newState = CanvasState(zoom: 2.0);
      notifier.updateCanvas(newState);

      expect(notifier.state.canvasState.zoom, equals(2.0));
    });
  });
}
