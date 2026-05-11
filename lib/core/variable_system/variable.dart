enum VariableType { string, integer, double_, boolean, list, map_, enum_ }

enum VariableScope { global, scene }

class Variable {
  final String name;
  final VariableType type;
  final dynamic defaultValue;
  final String? description;
  final VariableScope scope;
  final String? sceneName;
  final List<String>? enumValues;
  final String? group;

  const Variable({
    required this.name,
    required this.type,
    required this.defaultValue,
    this.description,
    this.scope = VariableScope.global,
    this.sceneName,
    this.enumValues,
    this.group,
  });

  dynamic validateValue(dynamic value) {
    if (value == null) return defaultValue;
    switch (type) {
      case VariableType.string:
        return value.toString();
      case VariableType.integer:
        if (value is int) return value;
        if (value is double) return value.toInt();
        if (value is String) return int.tryParse(value) ?? defaultValue;
        return defaultValue;
      case VariableType.double_:
        if (value is double) return value;
        if (value is int) return value.toDouble();
        if (value is String) return double.tryParse(value) ?? defaultValue;
        return defaultValue;
      case VariableType.boolean:
        if (value is bool) return value;
        if (value is String) return value.toLowerCase() == 'true';
        if (value is int) return value != 0;
        return defaultValue;
      case VariableType.list:
        if (value is List) return value;
        return defaultValue;
      case VariableType.map_:
        if (value is Map) return value;
        return defaultValue;
      case VariableType.enum_:
        if (enumValues?.contains(value.toString()) ?? false)
          return value.toString();
        return defaultValue;
    }
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'type': type.name,
      'defaultValue': defaultValue,
      if (description != null) 'description': description,
      'scope': scope.name,
      if (sceneName != null) 'sceneName': sceneName,
      if (enumValues != null) 'enumValues': enumValues,
      if (group != null) 'group': group,
    };
  }

  factory Variable.fromJson(Map<String, dynamic> json) {
    return Variable(
      name: json['name'] as String,
      type: VariableType.values.byName(json['type'] as String),
      defaultValue: json['defaultValue'],
      description: json['description'] as String?,
      scope: VariableScope.values.byName(json['scope'] as String? ?? 'global'),
      sceneName: json['sceneName'] as String?,
      enumValues: (json['enumValues'] as List?)?.cast<String>(),
      group: json['group'] as String?,
    );
  }
}
