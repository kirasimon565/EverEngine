import 'package:flutter_test/flutter_test.dart';
import 'package:everengine/core/scene_system/scene.dart';
import 'package:everengine/core/node_system/node_id.dart';
import 'package:everengine/core/node_system/types/ui_nodes/container_node.dart';

void main() {
  group('Scene', () {
    test('Scene creates with root node', () {
      final root = ContainerNode(id: NodeId.generate());
      final scene = Scene(
        name: 'test',
        displayName: 'Test',
        rootNode: root,
        createdAt: DateTime.now(),
        updatedAt: DateTime.now(),
      );

      expect(scene.rootNode.id, equals(root.id));
    });

    test('findNodeById finds correct node', () {
      final root = ContainerNode(id: NodeId.generate());
      final scene = Scene(
        name: 'test',
        displayName: 'Test',
        rootNode: root,
        createdAt: DateTime.now(),
        updatedAt: DateTime.now(),
      );

      expect(scene.findNodeById(root.id)?.id, equals(root.id));
      expect(scene.findNodeById(NodeId.generate()), isNull);
    });

    test('allNodes flattens tree correctly', () {
      final root = ContainerNode(id: NodeId.generate());
      final scene = Scene(
        name: 'test',
        displayName: 'Test',
        rootNode: root,
        createdAt: DateTime.now(),
        updatedAt: DateTime.now(),
      );

      expect(scene.allNodes.length, equals(1));
    });

    // addChild, removeNode, moveNode are placeholders in implementation, skipping deep tests for now
  });
}
