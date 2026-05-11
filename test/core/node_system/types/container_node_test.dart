import 'package:flutter_test/flutter_test.dart';
import 'package:flutter/material.dart' hide Rect;
import 'package:everengine/core/node_system/node_id.dart';
import 'package:everengine/core/node_system/types/ui_nodes/container_node.dart';

void main() {
  group('ContainerNode', () {
    test('ContainerNode has expected type string', () {
      final node = ContainerNode(id: NodeId.generate());
      expect(node.type, equals('ContainerNode'));
    });

    test('canHaveChildren returns true', () {
      final node = ContainerNode(id: NodeId.generate());
      expect(node.canHaveChildren(), isTrue);
    });
  });
}
