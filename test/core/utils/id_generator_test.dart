import 'package:flutter_test/flutter_test.dart';
import 'package:everengine/core/utils/id_generator.dart';

void main() {
  group('IdGenerator', () {
    test('generates valid UUID v4', () {
      final id = IdGenerator.generate();
      expect(IdGenerator.isValid(id), isTrue);
    });

    test('generates unique IDs', () {
      final id1 = IdGenerator.generate();
      final id2 = IdGenerator.generate();
      expect(id1, isNot(equals(id2)));
    });

    test('generates short IDs of 8 characters', () {
      final shortId = IdGenerator.generateShort();
      expect(shortId.length, equals(8));
    });

    test('correctly validates UUIDs', () {
      final validId = IdGenerator.generate();
      expect(IdGenerator.isValid(validId), isTrue);
      expect(IdGenerator.isValid('invalid-uuid'), isFalse);
    });
  });
}
