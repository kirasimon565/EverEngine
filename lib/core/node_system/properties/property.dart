import 'property_types.dart';

typedef PropertyValidator = String? Function(dynamic value);

class Range {
  final double min;
  final double max;
  final double? step;

  const Range({required this.min, required this.max, this.step});
}

class PropertyDefinition {
  final String name;
  final PropertyType type;
  final dynamic defaultValue;
  final String displayName;
  final String? description;
  final bool isRequired;
  final List<EnumOption>? enumOptions;
  final Range? range;
  final String? validationRegex;
  final List<PropertyValidator> validators;
  final bool isAnimatable;
  final String? section;
  final int? displayOrder;

  const PropertyDefinition({
    required this.name,
    required this.type,
    required this.displayName,
    this.defaultValue,
    this.description,
    this.isRequired = false,
    this.enumOptions,
    this.range,
    this.validationRegex,
    this.validators = const [],
    this.isAnimatable = false,
    this.section,
    this.displayOrder,
  });

  String? validate(dynamic value) {
    if (isRequired && value == null) {
      return '$displayName is required';
    }

    if (value != null) {
      if (validationRegex != null && value is String) {
        if (!RegExp(validationRegex!).hasMatch(value)) {
          return '$displayName format is invalid';
        }
      }

      for (final validator in validators) {
        final error = validator(value);
        if (error != null) {
          return error;
        }
      }
    }
    return null;
  }
}
