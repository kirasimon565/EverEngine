import 'package:flutter_test/flutter_test.dart';
import 'package:everengine/core/node_system/node_id.dart';

void main() {
  group('NodeId', () {
    test('two NodeIds with same UUID are equal', () {
      const uuid = '123e4567-e89b-12d3-a456-426614174000';
      final id1 = NodeId.fromString(uuid);
      final id2 = NodeId.fromString(uuid);
      expect(id1, equals(id2));
    });

    test('two NodeIds with different UUIDs are not equal', () {
      final id1 = NodeId.generate();
      final id2 = NodeId.generate();
      expect(id1, isNot(equals(id2)));
    });

    test('fromString and toString roundtrip', () {
      const uuid = '123e4567-e89b-12d3-a456-426614174000';
      final id = NodeId.fromString(uuid);
      expect(id.toString(), equals(uuid));
    });
  });
}
