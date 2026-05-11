import 'package:flutter_test/flutter_test.dart';
import 'package:everengine/core/variable_system/variable.dart';
import 'package:everengine/core/variable_system/variable_store.dart';

void main() {
  group('VariableStore', () {
    test('Set and get values', () {
      final store = VariableStore();
      store.defineVariable(
          Variable(name: 'v', type: VariableType.integer, defaultValue: 0));
      expect(store.getValue('v'), equals(0));
      store.setValue('v', 10);
      expect(store.getValue('v'), equals(10));
    });

    test('Setting undefined throws', () {
      final store = VariableStore();
      expect(() => store.setValue('undefined', 1), throwsArgumentError);
    });

    test('Reset to default', () {
      final store = VariableStore();
      store.defineVariable(
          Variable(name: 'v', type: VariableType.integer, defaultValue: 0));
      store.setValue('v', 10);
      store.resetToDefault('v');
      expect(store.getValue('v'), equals(0));
    });
  });
}
