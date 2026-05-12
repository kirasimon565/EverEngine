import 'package:flutter_test/flutter_test.dart';
import 'package:everengine/core/node_system/properties/property.dart';
import 'package:everengine/core/node_system/properties/property_types.dart';

void main() {
  group('PropertyDefinition', () {
    test('PropertyDefinition with validators', () {
      final def = PropertyDefinition(
        name: 'test',
        type: PropertyType.string,
        displayName: 'Test',
        validators: [(v) => v == 'invalid' ? 'Error' : null],
      );

      expect(def.validate('valid'), isNull);
      expect(def.validate('invalid'), equals('Error'));
    });

    test('validator returns error for invalid value', () {
      final def = PropertyDefinition(
        name: 'test',
        type: PropertyType.string,
        displayName: 'Test',
        isRequired: true,
      );

      expect(def.validate(null), equals('Test is required'));
    });

    test('validator returns null for valid value', () {
      final def = PropertyDefinition(
        name: 'test',
        type: PropertyType.string,
        displayName: 'Test',
        isRequired: true,
      );

      expect(def.validate('some value'), isNull);
    });
  });
}
