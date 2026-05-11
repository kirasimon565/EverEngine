import 'package:flutter_test/flutter_test.dart';
import 'package:everengine/core/node_system/properties/property.dart';
import 'package:everengine/core/node_system/properties/property_types.dart';

void main() {
  group('PropertyDefinition', () {
    test('validator returns error for invalid value', () {
      final propDef = PropertyDefinition(
        name: 'test',
        type: PropertyType.integer,
        defaultValue: 0,
        displayName: 'Test',
        validators: [(value) => value < 0 ? 'Cannot be negative' : null],
      );

      expect(propDef.validators.first(-1), equals('Cannot be negative'));
    });

    test('validator returns null for valid value', () {
      final propDef = PropertyDefinition(
        name: 'test',
        type: PropertyType.integer,
        defaultValue: 0,
        displayName: 'Test',
        validators: [(value) => value < 0 ? 'Cannot be negative' : null],
      );

      expect(propDef.validators.first(1), isNull);
    });
  });
}
