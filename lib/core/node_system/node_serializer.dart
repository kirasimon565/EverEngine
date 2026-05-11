import 'node.dart';
import 'node_id.dart';

class NodeSerializer {
  static Map<String, dynamic> serialize(Node node) {
    return node.toJson();
  }

  static Node deserialize(Map<String, dynamic> json) {
    return Node.fromJson(json);
  }

  static List<Map<String, dynamic>> serializeList(List<Node> nodes) {
    return nodes.map((node) => node.toJson()).toList();
  }

  static List<Node> deserializeList(List<Map<String, dynamic>> jsonList) {
    return jsonList.map((json) => Node.fromJson(json)).toList();
  }

  static Map<String, dynamic> serializeTree(Node root,
      [Map<NodeId, Node> nodeMap = const {}]) {
    final json = root.toJson();
    if (root.childrenIds.isNotEmpty) {
      final children = <Map<String, dynamic>>[];
      for (final childId in root.childrenIds) {
        if (nodeMap.containsKey(childId)) {
          children.add(serializeTree(nodeMap[childId]!, nodeMap));
        }
      }
      json['children'] = children;
    }
    return json;
  }

  static Node deserializeTree(Map<String, dynamic> json,
      [Map<NodeId, Node>? nodeMapOut]) {
    final node = Node.fromJson(json);
    nodeMapOut?[node.id] = node;

    if (json.containsKey('children')) {
      final childrenList = json['children'] as List;
      for (final childJson in childrenList) {
        deserializeTree(childJson as Map<String, dynamic>, nodeMapOut);
      }
    }
    return node;
  }
}
