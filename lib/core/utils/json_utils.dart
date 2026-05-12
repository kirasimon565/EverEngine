class JsonUtils {
  static Map<String, dynamic> deepMerge(
      Map<String, dynamic> target, Map<String, dynamic> source) {
    final result = Map<String, dynamic>.from(target);
    source.forEach((key, value) {
      if (value is Map<String, dynamic> &&
          result[key] is Map<String, dynamic>) {
        result[key] = deepMerge(
            result[key] as Map<String, dynamic>, value);
      } else {
        result[key] = value;
      }
    });
    return result;
  }

  static Map<String, dynamic> sanitize(Map<String, dynamic> input) {
    final result = <String, dynamic>{};
    input.forEach((key, value) {
      if (value != null) {
        if (value is Map<String, dynamic>) {
          final sanitizedValue = sanitize(value);
          if (sanitizedValue.isNotEmpty) {
            result[key] = sanitizedValue;
          }
        } else if (value is List) {
          final sanitizedList = value.map((e) {
            if (e is Map<String, dynamic>) {
              return sanitize(e);
            }
            return e;
          }).where((e) => e != null).toList();
          if (sanitizedList.isNotEmpty) {
            result[key] = sanitizedList;
          }
        } else {
          result[key] = value;
        }
      }
    });
    return result;
  }

  static bool validateSchema(Map<String, dynamic> json, Map<String, String> schema) {
    for (final entry in schema.entries) {
      final key = entry.key;
      final type = entry.value;

      if (!json.containsKey(key)) return false;

      final value = json[key];
      switch (type) {
        case 'string':
          if (value is! String) return false;
          break;
        case 'int':
        case 'integer':
          if (value is! int) return false;
          break;
        case 'double':
        case 'number':
          if (value is! double && value is! int) return false;
          break;
        case 'bool':
        case 'boolean':
          if (value is! bool) return false;
          break;
        case 'list':
        case 'array':
          if (value is! List) return false;
          break;
        case 'map':
        case 'object':
          if (value is! Map) return false;
          break;
        default:
          return false;
      }
    }
    return true;
  }
}
