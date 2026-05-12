import 'package:flutter_test/flutter_test.dart';
import 'package:everengine/core/node_system/node.dart';
import 'package:everengine/core/node_system/node_id.dart';
import 'package:everengine/core/node_system/node_registry.dart';
import 'package:everengine/core/node_system/types/ui_nodes/container_node.dart';

void main() {
  setUpAll(() {
    NodeRegistry.registerAll();
  });

  group('Node', () {
    test('Node copyWith returns new instance', () {
      final node = ContainerNode(id: NodeId.generate());
      final newNode = node.copyWith(isLocked: true);

      expect(node.id, equals(newNode.id));
      expect(node.isLocked, isFalse);
      expect(newNode.isLocked, isTrue);
    });

    test('Node toJson includes all fields', () {
      final node = ContainerNode(id: NodeId.generate());
      final json = node.toJson();

      expect(json.containsKey('id'), isTrue);
      expect(json.containsKey('type'), isTrue);
      expect(json['type'], equals('ContainerNode'));
    });

    test('Node fromJson dispatches to correct type', () {
      final id = NodeId.generate();
      final json = {'id': id.toString(), 'type': 'ContainerNode'};
      final node = Node.fromJson(json);

      expect(node, isA<ContainerNode>());
      expect(node.id, equals(id));
    });

    test('canHaveChildren respects type setting', () {
      final node = ContainerNode(id: NodeId.generate());
      expect(node.canHaveChildren(), isTrue);
    });
  });
}
