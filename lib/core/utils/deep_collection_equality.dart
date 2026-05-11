import 'package:collection/collection.dart';

class DeepCollectionEquality {
  static const _equality = DeepCollectionEquality();

  static bool equals(dynamic a, dynamic b) {
    return const collection.DeepCollectionEquality().equals(a, b);
  }

  static int hash(dynamic object) {
    return const collection.DeepCollectionEquality().hash(object);
  }
}
