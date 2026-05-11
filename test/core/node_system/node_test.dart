import 'package:flutter_test/flutter_test.dart';
import 'package:everengine/core/node_system/node.dart';
import 'package:everengine/core/node_system/node_id.dart';
import 'package:everengine/core/node_system/node_registry.dart';
import 'package:everengine/core/node_system/types/ui_nodes/container_node.dart';

void main() {
  setUpAll(() {
    NodeRegistry.register(
        'ContainerNode', (json) => ContainerNode.fromJson(json));
  });

  group('Node', () {
    test('copyWith returns new instance', () {
      final node = ContainerNode(id: NodeId.generate());
      final newId = NodeId.generate();
      final copied = node.copyWith(id: newId);

      expect(copied.id, equals(newId));
      expect(copied, isNot(same(node)));
    });

    test('toJson includes all fields', () {
      final node = ContainerNode(id: NodeId.fromString('test-id'));
      final json = node.toJson();

      expect(json['id'], equals('test-id'));
      expect(json['type'], equals('ContainerNode'));
    });

    test('fromJson dispatches to correct type', () {
      final json = {
        'id': 'test-id',
        'type': 'ContainerNode',
      };
      final node = Node.fromJson(json);
      expect(node, isA<ContainerNode>());
    });
  });
}
