import 'variable.dart';

class VariableStore {
  final Map<String, dynamic> _values = {};
  final Map<String, Variable> _definitions = {};

  void defineVariable(Variable variable) {
    _definitions[variable.name] = variable;
    if (!_values.containsKey(variable.name)) {
      _values[variable.name] = variable.defaultValue;
    }
  }

  dynamic getValue(String name) {
    return _values[name] ?? _definitions[name]?.defaultValue;
  }

  void setValue(String name, dynamic value) {
    if (!_definitions.containsKey(name)) {
      throw ArgumentError('Variable "$name" is not defined.');
    }
    final variable = _definitions[name]!;
    _values[name] = variable.validateValue(value);
  }

  void resetToDefault(String name) {
    if (_definitions.containsKey(name)) {
      _values[name] = _definitions[name]!.defaultValue;
    }
  }

  void resetAll() {
    for (final name in _definitions.keys) {
      _values[name] = _definitions[name]!.defaultValue;
    }
  }

  Map<String, dynamic> toJson() => Map.from(_values);

  void loadFromJson(Map<String, dynamic> json) {
    for (final entry in json.entries) {
      if (_definitions.containsKey(entry.key)) {
        setValue(entry.key, entry.value);
      }
    }
  }

  List<String> get definedVariableNames => _definitions.keys.toList();
  bool isDefined(String name) => _definitions.containsKey(name);
}
