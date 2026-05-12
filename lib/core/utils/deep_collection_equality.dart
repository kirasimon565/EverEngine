import 'package:collection/collection.dart';

class DeepCollectionEquality {
  static const Equality<dynamic> _equality = CustomDeepEquality();

  static bool equals(dynamic a, dynamic b) {
    if (identical(a, b)) return true;
    if (a is Map && b is Map) {
      return MapEquality(keys: _equality, values: _equality).equals(a, b);
    }
    if (a is List && b is List) {
      return ListEquality(_equality).equals(a, b);
    }
    if (a is Set && b is Set) {
      return SetEquality(_equality).equals(a, b);
    }
    return a == b;
  }

  static int hash(dynamic object) {
    if (object is Map) {
      return MapEquality(keys: _equality, values: _equality).hash(object);
    }
    if (object is List) {
      return ListEquality(_equality).hash(object);
    }
    if (object is Set) {
      return SetEquality(_equality).hash(object);
    }
    return object.hashCode;
  }
}

class CustomDeepEquality implements Equality<dynamic> {
  const CustomDeepEquality();

  @override
  bool equals(dynamic e1, dynamic e2) {
    return DeepCollectionEquality.equals(e1, e2);
  }

  @override
  int hash(dynamic e) {
    return DeepCollectionEquality.hash(e);
  }

  @override
  bool isValidKey(Object? o) => true;
}
