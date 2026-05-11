import 'package:flutter_test/flutter_test.dart';
import 'package:everengine/core/utils/id_generator.dart';

void main() {
  group('IdGenerator', () {
    test('generate returns a valid UUID v4', () {
      final id = IdGenerator.generate();
      expect(IdGenerator.isValid(id), isTrue);
    });

    test('generate returns unique IDs', () {
      final id1 = IdGenerator.generate();
      final id2 = IdGenerator.generate();
      expect(id1, isNot(equals(id2)));
    });

    test('generateShort returns 8 characters', () {
      final shortId = IdGenerator.generateShort();
      expect(shortId.length, equals(8));
    });
  });
}
