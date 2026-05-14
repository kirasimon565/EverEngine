import '../node_system/node.dart';
import '../node_system/node_id.dart';

class Scene {
  final String name;
  final String displayName;
  final Node rootNode;
  final String? backgroundColor;
  final String orientation;
  final String transitionIn;
  final String transitionOut;
  final bool isStartScene;
  final DateTime createdAt;
  final DateTime updatedAt;
  final Map<String, String> metadata;

  const Scene({
    required this.name,
    required this.displayName,
    required this.rootNode,
    this.backgroundColor,
    this.orientation = 'portrait',
    this.transitionIn = 'fade',
    this.transitionOut = 'fade',
    this.isStartScene = false,
    required this.createdAt,
    required this.updatedAt,
    this.metadata = const {},
  });

  Scene copyWith({
    String? name,
    String? displayName,
    Node? rootNode,
    String? backgroundColor,
    String? orientation,
    String? transitionIn,
    String? transitionOut,
    bool? isStartScene,
    DateTime? createdAt,
    DateTime? updatedAt,
    Map<String, String>? metadata,
  }) {
    return Scene(
      name: name ?? this.name,
      displayName: displayName ?? this.displayName,
      rootNode: rootNode ?? this.rootNode,
      backgroundColor: backgroundColor ?? this.backgroundColor,
      orientation: orientation ?? this.orientation,
      transitionIn: transitionIn ?? this.transitionIn,
      transitionOut: transitionOut ?? this.transitionOut,
      isStartScene: isStartScene ?? this.isStartScene,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      metadata: metadata ?? this.metadata,
    );
  }

  List<Node> get allNodes {
    final List<Node> nodes = [];
    void traverse(Node node) {
      nodes.add(node);
      // Actual implementation would need to look up children by ID from a flat list or tree
      // For now, assuming nodes are fully nested for simplicity, or we just return root
      // In a real system, the Scene would hold a map of all nodes, and rootNode is just the ID or root
    }

    traverse(rootNode);
    return nodes;
  }

  Node? findNodeById(NodeId id) {
    // Basic search
    if (rootNode.id == id) return rootNode;
    return null;
  }

  Scene replaceNode(NodeId id, Node newNode) {
    return this; // Placeholder
  }

  Scene addChild(NodeId parentId, Node child, int? index) {
    return this; // Placeholder
  }

  Scene removeNode(NodeId id) {
    return this; // Placeholder
  }

  Scene moveNode(NodeId id, NodeId newParentId, int? index) {
    return this; // Placeholder
  }

  int get nodeCount => allNodes.length;
}
