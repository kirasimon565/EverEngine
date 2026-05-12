import 'node.dart';
import 'types/ui_nodes/container_node.dart';
import 'types/ui_nodes/text_node.dart';
import 'types/ui_nodes/button_node.dart';
import 'types/ui_nodes/image_node.dart';
import 'types/ui_nodes/column_node.dart';
import 'types/ui_nodes/row_node.dart';
import 'types/ui_nodes/stack_node.dart';
import 'types/ui_nodes/scroll_view_node.dart';

enum NodeCategory { ui, story, logic, media, system }

class NodeRegistry {
  static final Map<String, Node Function(Map<String, dynamic>)> _constructors = {};

  static void register(String type, Node Function(Map<String, dynamic>) constructor) {
    _constructors[type] = constructor;
  }

  static Node create(String type, Map<String, dynamic> json) {
    final constructor = _constructors[type];
    if (constructor == null) {
      throw Exception('Node type "$type" is not registered.');
    }
    return constructor(json);
  }

  static bool isRegistered(String type) {
    return _constructors.containsKey(type);
  }

  static List<String> get registeredTypes => _constructors.keys.toList();

  static List<String> typesByCategory(String category) {
    // Basic mapping implementation. Can be extended based on actual metadata.
    switch (category) {
      case 'ui':
        return [
          'ContainerNode', 'TextNode', 'ButtonNode', 'ImageNode',
          'ColumnNode', 'RowNode', 'StackNode', 'ScrollViewNode'
        ].where(isRegistered).toList();
      default:
        return [];
    }
  }

  static void registerAll() {
    register('ContainerNode', (json) => ContainerNode.fromJson(json));
    register('TextNode', (json) => TextNode.fromJson(json));
    register('ButtonNode', (json) => ButtonNode.fromJson(json));
    register('ImageNode', (json) => ImageNode.fromJson(json));
    register('ColumnNode', (json) => ColumnNode.fromJson(json));
    register('RowNode', (json) => RowNode.fromJson(json));
    register('StackNode', (json) => StackNode.fromJson(json));
    register('ScrollViewNode', (json) => ScrollViewNode.fromJson(json));
  }
}
