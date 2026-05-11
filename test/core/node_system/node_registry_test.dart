import 'package:flutter_test/flutter_test.dart';
import 'package:everengine/core/node_system/node_registry.dart';
import 'package:everengine/core/node_system/node_id.dart';
import 'package:everengine/core/node_system/types/ui_nodes/container_node.dart';

void main() {
  group('NodeRegistry', () {
    test('register and create roundtrip', () {
      NodeRegistry.register(
          'TestNode', (json) => ContainerNode(id: NodeId.fromString('test')));
      final node = NodeRegistry.create('TestNode', {'id': 'test'});
      expect(node, isA<ContainerNode>());
    });

    test('isRegistered returns correct values', () {
      expect(NodeRegistry.isRegistered('TestNode'), isTrue);
      expect(NodeRegistry.isRegistered('UnknownNode'), isFalse);
    });

    test('creating unregistered type throws', () {
      expect(() => NodeRegistry.create('UnknownNode', {}), throwsArgumentError);
    });
  });
}
