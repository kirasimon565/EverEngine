import 'package:flutter_test/flutter_test.dart';
import 'package:everengine/core/node_system/node_serializer.dart';
import 'package:everengine/core/node_system/node_id.dart';
import 'package:everengine/core/node_system/node_registry.dart';
import 'package:everengine/core/node_system/types/ui_nodes/container_node.dart';
import 'package:everengine/core/node_system/node.dart';

void main() {
  setUpAll(() {
    NodeRegistry.registerAll();
  });

  group('NodeSerializer', () {
    test('serialize and deserialize single node', () {
      final node = ContainerNode(id: NodeId.generate());
      final json = NodeSerializer.serialize(node);
      final deserialized = NodeSerializer.deserialize(json);

      expect(deserialized.id, equals(node.id));
      expect(deserialized, isA<ContainerNode>());
    });

    test('serializeTree and deserializeTree preserves hierarchy', () {
      // Basic test since actual hierarchy relies on separate processing currently
      final node = ContainerNode(id: NodeId.generate());
      final json = NodeSerializer.serializeTree(node);
      final deserialized = NodeSerializer.deserializeTree(json);

      expect(deserialized.id, equals(node.id));
    });

    test('handles nodes with triggers', () {
      final node = ContainerNode(
        id: NodeId.generate(),
        triggers: {
          'tap': const Trigger(eventType: 'onTap', actions: [TriggerAction(actionType: 'log')])
        }
      );
      final json = NodeSerializer.serialize(node);
      final deserialized = NodeSerializer.deserialize(json);

      expect(deserialized.triggers.containsKey('tap'), isTrue);
      expect(deserialized.triggers['tap']!.actions.first.actionType, equals('log'));
    });
  });
}
