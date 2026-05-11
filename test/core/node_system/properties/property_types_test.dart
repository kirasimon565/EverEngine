import 'package:flutter_test/flutter_test.dart';
import 'package:everengine/core/node_system/properties/property_types.dart';

void main() {
  group('PropertyValue', () {
    test('serializes and deserializes', () {
      final prop = PropertyValue(
          value: 'test',
          type: PropertyType.string,
          isBound: true,
          boundVariableName: 'var');
      final json = prop.toJson();
      final decoded = PropertyValue.fromJson(json);

      expect(decoded.value, equals('test'));
      expect(decoded.type, equals(PropertyType.string));
      expect(decoded.isBound, isTrue);
      expect(decoded.boundVariableName, equals('var'));
    });
  });

  group('EnumOption', () {
    test('equality', () {
      final opt1 = EnumOption(value: 'val', label: 'Label');
      final opt2 = EnumOption(value: 'val', label: 'Label');
      expect(opt1, equals(opt2));
    });
  });
}
