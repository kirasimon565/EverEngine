import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:everengine/state/state.dart';
import 'package:everengine/core/scene_system/scene.dart';
import 'package:everengine/core/node_system/node_id.dart';
import 'package:everengine/core/node_system/types/ui_nodes/container_node.dart';

void main() {
  group('EditorNotifier', () {
    test('setActiveScene updates state', () {
      final container = ProviderContainer();
      final notifier = container.read(editorProvider.notifier);

      final scene = Scene(
        name: 'Test',
        displayName: 'Test',
        rootNode: ContainerNode(id: NodeId.generate()),
        createdAt: DateTime.now(),
        updatedAt: DateTime.now(),
      );

      notifier.setActiveScene(scene);

      final state = container.read(editorProvider);
      expect(state.activeScene, equals(scene));
    });

    test('selectNode updates selectedNodeId', () {
      final container = ProviderContainer();
      final notifier = container.read(editorProvider.notifier);

      notifier.selectNode('test-id');

      final state = container.read(editorProvider);
      expect(state.selectedNodeId, equals('test-id'));
      expect(state.selectedNodeIds, equals(['test-id']));
    });

    test('clearSelection empties selection', () {
      final container = ProviderContainer();
      final notifier = container.read(editorProvider.notifier);

      notifier.selectNode('test-id');
      notifier.clearSelection();

      final state = container.read(editorProvider);
      expect(state.selectedNodeId, isNull);
      expect(state.selectedNodeIds, isEmpty);
    });
  });
}
