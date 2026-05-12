import 'package:flutter_test/flutter_test.dart';
import 'package:everengine/core/scene_system/scene.dart';
import 'package:everengine/core/scene_system/scene_serializer.dart';
import 'package:everengine/core/node_system/node_id.dart';
import 'package:everengine/core/node_system/node_registry.dart';
import 'package:everengine/core/node_system/types/ui_nodes/container_node.dart';

void main() {
  setUpAll(() {
    NodeRegistry.registerAll();
  });

  group('SceneSerializer', () {
    test('serialize and deserialize scene roundtrip', () {
      final root = ContainerNode(id: NodeId.generate());
      final scene = Scene(
        name: 'test_scene',
        displayName: 'Test Scene',
        rootNode: root,
        createdAt: DateTime.now(),
        updatedAt: DateTime.now(),
      );

      final json = SceneSerializer.serialize(scene);
      final deserialized = SceneSerializer.deserialize(json);

      expect(deserialized.name, equals(scene.name));
      expect(deserialized.rootNode.id, equals(scene.rootNode.id));
    });

    test('deserialized scene has same node count', () {
      final root = ContainerNode(id: NodeId.generate());
      final scene = Scene(
        name: 'test_scene',
        displayName: 'Test Scene',
        rootNode: root,
        createdAt: DateTime.now(),
        updatedAt: DateTime.now(),
      );

      final json = SceneSerializer.serialize(scene);
      final deserialized = SceneSerializer.deserialize(json);

      expect(deserialized.allNodes.length, equals(scene.allNodes.length));
    });
  });
}
