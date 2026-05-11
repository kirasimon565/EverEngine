import 'package:flutter_test/flutter_test.dart';
import 'package:everengine/core/variable_system/variable.dart';

void main() {
  group('Variable', () {
    test('creation with all types', () {
      final vStr = Variable(
          name: 'test', type: VariableType.string, defaultValue: 'val');
      expect(vStr.type, equals(VariableType.string));
      expect(vStr.defaultValue, equals('val'));
    });

    test('validation string', () {
      final v =
          Variable(name: 'v', type: VariableType.string, defaultValue: 'd');
      expect(v.validateValue('test'), equals('test'));
      expect(v.validateValue(123), equals('123'));
    });

    test('validation int', () {
      final v =
          Variable(name: 'v', type: VariableType.integer, defaultValue: 0);
      expect(v.validateValue(1), equals(1));
      expect(v.validateValue(1.5), equals(1));
      expect(v.validateValue('123'), equals(123));
      expect(v.validateValue('abc'), equals(0));
    });

    test('serialization roundtrip', () {
      final v = Variable(
          name: 'v',
          type: VariableType.boolean,
          defaultValue: false,
          scope: VariableScope.scene,
          sceneName: 's1');
      final json = v.toJson();
      final decoded = Variable.fromJson(json);
      expect(decoded.name, equals('v'));
      expect(decoded.type, equals(VariableType.boolean));
      expect(decoded.scope, equals(VariableScope.scene));
    });
  });
}
