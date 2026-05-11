import 'package:flutter_test/flutter_test.dart';
import 'package:everengine/core/scene_system/scene.dart';
import 'package:everengine/core/scene_system/scene_serializer.dart';
import 'package:everengine/core/node_system/node_id.dart';
import 'package:everengine/core/node_system/node_registry.dart';
import 'package:everengine/core/node_system/types/ui_nodes/container_node.dart';

void main() {
  setUpAll(() {
    NodeRegistry.register(
        'ContainerNode', (json) => ContainerNode.fromJson(json));
  });

  group('SceneSerializer', () {
    test('serialize and deserialize scene roundtrip', () {
      final rootNode = ContainerNode(id: NodeId.fromString('root-id'));
      final scene = Scene(
        name: 'test_scene',
        displayName: 'Test Scene',
        rootNode: rootNode,
        createdAt: DateTime(2023),
        updatedAt: DateTime(2023),
      );

      final json = SceneSerializer.serialize(scene);
      final deserialized = SceneSerializer.deserialize(json);

      expect(deserialized.name, equals('test_scene'));
      expect(deserialized.rootNode.id.toString(), equals('root-id'));
    });
  });
}
