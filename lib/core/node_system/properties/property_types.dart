enum PropertyType {
  string,
  integer,
  double_,
  boolean,
  color,
  enum_,
  font,
  image,
  audio,
  video,
  animation,
  variableRef,
  expression,
  action,
  condition
}

class PropertyValue {
  final dynamic value;
  final PropertyType type;
  final bool isBound;
  final String? boundVariableName;

  const PropertyValue({
    required this.value,
    required this.type,
    this.isBound = false,
    this.boundVariableName,
  });

  Map<String, dynamic> toJson() {
    return {
      'value': value,
      'type': type.name,
      'isBound': isBound,
      'boundVariableName': boundVariableName,
    };
  }

  factory PropertyValue.fromJson(Map<String, dynamic> json) {
    return PropertyValue(
      value: json['value'],
      type: PropertyType.values.byName(json['type'] as String),
      isBound: json['isBound'] as bool? ?? false,
      boundVariableName: json['boundVariableName'] as String?,
    );
  }
}

class EnumOption {
  final String value;
  final String label;

  const EnumOption({
    required this.value,
    required this.label,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is EnumOption &&
          runtimeType == other.runtimeType &&
          value == other.value &&
          label == other.label;

  @override
  int get hashCode => value.hashCode ^ label.hashCode;
}
