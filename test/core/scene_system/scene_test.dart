import 'package:flutter_test/flutter_test.dart';
import 'package:everengine/core/scene_system/scene.dart';
import 'package:everengine/core/node_system/node_id.dart';
import 'package:everengine/core/node_system/types/ui_nodes/container_node.dart';

void main() {
  group('Scene', () {
    test('Scene creates with root node', () {
      final rootNode = ContainerNode(id: NodeId.generate());
      final scene = Scene(
        name: 'test_scene',
        displayName: 'Test Scene',
        rootNode: rootNode,
        createdAt: DateTime.now(),
        updatedAt: DateTime.now(),
      );

      expect(scene.rootNode.id, equals(rootNode.id));
      expect(scene.nodeCount, equals(1));
    });
  });
}
