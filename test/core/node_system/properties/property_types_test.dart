import 'package:flutter_test/flutter_test.dart';
import 'package:everengine/core/node_system/properties/property_types.dart';

void main() {
  group('PropertyTypes', () {
    test('PropertyValue serializes and deserializes all types', () {
      final prop = PropertyValue(
          value: 'test',
          type: PropertyType.string,
          isBound: true,
          boundVariableName: 'var1');
      final json = prop.toJson();
      final newProp = PropertyValue.fromJson(json);

      expect(newProp.value, equals('test'));
      expect(newProp.type, equals(PropertyType.string));
      expect(newProp.isBound, isTrue);
      expect(newProp.boundVariableName, equals('var1'));
    });

    test('PropertyValue correctly reports isBound', () {
      final prop = PropertyValue(
          value: 'test', type: PropertyType.string, isBound: true);
      expect(prop.isBound, isTrue);
    });

    test('EnumOption equality', () {
      const opt1 = EnumOption(value: '1', label: 'One');
      const opt2 = EnumOption(value: '1', label: 'One');
      const opt3 = EnumOption(value: '2', label: 'Two');

      expect(opt1, equals(opt2));
      expect(opt1, isNot(equals(opt3)));
    });
  });
}
