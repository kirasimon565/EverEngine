import 'package:flutter_test/flutter_test.dart';
import 'package:everengine/core/node_system/node_registry.dart';
import 'package:everengine/core/node_system/node_id.dart';
import 'package:everengine/core/node_system/types/ui_nodes/container_node.dart';

void main() {
  setUp(() {
    NodeRegistry.registerAll();
  });

  group('NodeRegistry', () {
    test('register and create roundtrip', () {
      final id = NodeId.generate();
      final node = NodeRegistry.create('ContainerNode', {'id': id.toString(), 'type': 'ContainerNode'});
      expect(node, isA<ContainerNode>());
      expect(node.id, equals(id));
    });

    test('isRegistered returns correct values', () {
      expect(NodeRegistry.isRegistered('ContainerNode'), isTrue);
      expect(NodeRegistry.isRegistered('UnknownNode'), isFalse);
    });

    test('creating unregistered type throws', () {
      expect(() => NodeRegistry.create('UnknownNode', {'type': 'UnknownNode'}), throwsException);
    });

    test('registeredTypes returns all types', () {
      final types = NodeRegistry.registeredTypes;
      expect(types.contains('ContainerNode'), isTrue);
      expect(types.contains('TextNode'), isTrue);
    });
  });
}
