import 'package:uuid/uuid.dart';

class IdGenerator {
  static const Uuid _uuid = Uuid();

  static String generate() {
    return _uuid.v4();
  }

  static String generateShort() {
    return _uuid.v4().substring(0, 8);
  }

  static bool isValid(String id) {
    return Uuid.isValidUUID(fromString: id);
  }
}
