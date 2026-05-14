import 'variable_store.dart';

class VariableExpressionParser {
  static bool evaluateCondition(String expression, VariableStore store) {
    // Highly simplified mock evaluator. A real implementation would parse the string properly.
    if (expression.contains('==')) {
      final parts = expression.split('==');
      if (parts.length == 2) {
        final left = parts[0].trim();
        final right = parts[1].trim();

        dynamic leftVal = left;
        if (left.startsWith('\$')) {
          leftVal = store.getValue(left.substring(1).trim());
        }

        dynamic rightVal = right;
        if (right == 'true') {
          rightVal = true;
        } else if (right == 'false')
          rightVal = false;
        else if (int.tryParse(right) != null)
          rightVal = int.parse(right);
        else if (right.startsWith('\$')) {
          rightVal = store.getValue(right.substring(1).trim());
        }

        return leftVal.toString() ==
            rightVal.toString(); // simplified comparison
      }
    }
    return true; // Default fallback
  }

  static dynamic evaluateExpression(String expression, VariableStore store) {
    // simplified
    return 0;
  }

  static List<String> extractVariableNames(String expression) {
    final matches = RegExp(r'\$([a-zA-Z0-9_]+)').allMatches(expression);
    return matches.map((m) => m.group(1)!).toList();
  }
}
