import 'package:flutter_test/flutter_test.dart';
import 'package:everengine/core/node_system/node_id.dart';

void main() {
  group('NodeId', () {
    test('two NodeIds with same UUID are equal', () {
      final id1 = NodeId.fromString('test-uuid');
      final id2 = NodeId.fromString('test-uuid');
      expect(id1, equals(id2));
      expect(id1.hashCode, equals(id2.hashCode));
    });

    test('two NodeIds with different UUIDs are not equal', () {
      final id1 = NodeId.fromString('test-uuid-1');
      final id2 = NodeId.fromString('test-uuid-2');
      expect(id1, isNot(equals(id2)));
    });

    test('fromString and toString roundtrip', () {
      final idString = 'test-uuid';
      final id = NodeId.fromString(idString);
      expect(id.toString(), equals(idString));
    });
  });
}
