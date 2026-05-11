import 'package:flutter_test/flutter_test.dart';
import 'package:everengine/core/node_system/node_serializer.dart';
import 'package:everengine/core/node_system/node_id.dart';
import 'package:everengine/core/node_system/node_registry.dart';
import 'package:everengine/core/node_system/types/ui_nodes/container_node.dart';

void main() {
  setUpAll(() {
    NodeRegistry.register(
        'ContainerNode', (json) => ContainerNode.fromJson(json));
  });

  group('NodeSerializer', () {
    test('serialize and deserialize single node', () {
      final node = ContainerNode(id: NodeId.fromString('test-id'));
      final json = NodeSerializer.serialize(node);
      final deserialized = NodeSerializer.deserialize(json);

      expect(deserialized.id.toString(), equals('test-id'));
      expect(deserialized.type, equals('ContainerNode'));
    });
  });
}
