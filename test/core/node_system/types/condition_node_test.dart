import 'package:flutter_test/flutter_test.dart';
import 'package:everengine/core/node_system/node_id.dart';
import 'package:everengine/core/node_system/types/logic_nodes/condition_node.dart';

void main() {
  group('ConditionNode', () {
    test('Type is correct', () {
      final node = ConditionNode(id: NodeId.generate());
      expect(node.type, equals('ConditionNode'));
    });
  });
}
