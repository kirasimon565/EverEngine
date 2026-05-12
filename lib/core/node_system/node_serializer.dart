import 'node.dart';

class NodeSerializer {
  static Map<String, dynamic> serialize(Node node) {
    return node.toJson();
  }

  static Node deserialize(Map<String, dynamic> json) {
    return Node.fromJson(json);
  }

  static List<Map<String, dynamic>> serializeList(List<Node> nodes) {
    return nodes.map((n) => n.toJson()).toList();
  }

  static List<Node> deserializeList(List<Map<String, dynamic>> jsonList) {
    return jsonList.map((j) => Node.fromJson(j)).toList();
  }

  static Map<String, dynamic> serializeTree(Node root) {
    final json = root.toJson();
    // Assuming children are not nested in basic serialization, but here we can nest them
    // This is a placeholder for actual recursive logic if needed, but standard is flat list
    return json;
  }

  static Node deserializeTree(Map<String, dynamic> json) {
    // Same placeholder for tree
    return Node.fromJson(json);
  }
}
