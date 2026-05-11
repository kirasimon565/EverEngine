import 'package:flutter_test/flutter_test.dart';
import 'package:everengine/core/node_system/node_id.dart';
import 'package:everengine/core/node_system/types/ui_nodes/text_node.dart';

void main() {
  group('TextNode', () {
    test('TextNode has expected type string', () {
      final node = TextNode(id: NodeId.generate());
      expect(node.type, equals('TextNode'));
    });

    test('canHaveChildren returns false', () {
      final node = TextNode(id: NodeId.generate());
      expect(node.canHaveChildren(), isFalse);
    });
  });
}
