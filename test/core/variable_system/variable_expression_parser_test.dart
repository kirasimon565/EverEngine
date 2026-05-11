import 'package:flutter_test/flutter_test.dart';
import 'package:everengine/core/variable_system/variable.dart';
import 'package:everengine/core/variable_system/variable_store.dart';
import 'package:everengine/core/variable_system/variable_expression_parser.dart';

void main() {
  group('VariableExpressionParser', () {
    test('Simple equality condition', () {
      final store = VariableStore();
      store.defineVariable(
          Variable(name: 'v', type: VariableType.integer, defaultValue: 10));

      expect(VariableExpressionParser.evaluateCondition('\$v == 10', store),
          isTrue);
      expect(VariableExpressionParser.evaluateCondition('\$v == 5', store),
          isFalse);
    });

    test('Extract variable names', () {
      final names = VariableExpressionParser.extractVariableNames(
          '\$v1 >= 5 && \$v2 == true');
      expect(names, equals(['v1', 'v2']));
    });
  });
}
