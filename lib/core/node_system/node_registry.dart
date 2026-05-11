import 'node.dart';

enum NodeCategory { ui, story, logic, media, system }

class NodeRegistry {
  static final Map<String, Node Function(Map<String, dynamic>)> _constructors =
      {};

  static void register(
      String type, Node Function(Map<String, dynamic>) constructor) {
    _constructors[type] = constructor;
  }

  static Node create(String type, Map<String, dynamic> json) {
    final constructor = _constructors[type];
    if (constructor == null) {
      throw ArgumentError('Node type "$type" is not registered.');
    }
    return constructor(json);
  }

  static bool isRegistered(String type) {
    return _constructors.containsKey(type);
  }

  static List<String> get registeredTypes => _constructors.keys.toList();

  static List<String> typesByCategory(String category) {
    return registeredTypes;
  }

  static void registerAll() {}
}
