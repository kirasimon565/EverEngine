class JsonUtils {
  static Map<String, dynamic> deepMerge(
      Map<String, dynamic> target, Map<String, dynamic> source) {
    final result = Map<String, dynamic>.from(target);
    for (final key in source.keys) {
      if (source[key] is Map<String, dynamic> &&
          result[key] is Map<String, dynamic>) {
        result[key] = deepMerge(result[key] as Map<String, dynamic>,
            source[key] as Map<String, dynamic>);
      } else {
        result[key] = source[key];
      }
    }
    return result;
  }

  static Map<String, dynamic> sanitize(Map<String, dynamic> data) {
    final result = <String, dynamic>{};
    for (final entry in data.entries) {
      if (entry.value != null) {
        if (entry.value is Map<String, dynamic>) {
          result[entry.key] = sanitize(entry.value as Map<String, dynamic>);
        } else if (entry.value is List) {
          result[entry.key] = (entry.value as List).map((item) {
            if (item is Map<String, dynamic>) {
              return sanitize(item);
            }
            return item;
          }).toList();
        } else {
          result[entry.key] = entry.value;
        }
      }
    }
    return result;
  }

  static bool validateSchema(
      Map<String, dynamic> data, Map<String, Type> schema) {
    for (final entry in schema.entries) {
      if (!data.containsKey(entry.key) ||
          data[entry.key].runtimeType != entry.value) {
        return false;
      }
    }
    return true;
  }
}
