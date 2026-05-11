import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'everengine_app.dart';
import 'core/node_system/node_registry.dart';
import 'core/node_system/types/ui_nodes/container_node.dart';
import 'core/node_system/types/ui_nodes/text_node.dart';
import 'core/node_system/types/ui_nodes/button_node.dart';
import 'core/node_system/types/ui_nodes/image_node.dart';
import 'core/node_system/types/ui_nodes/column_node.dart';
import 'core/node_system/types/ui_nodes/row_node.dart';
import 'core/node_system/types/ui_nodes/stack_node.dart';
import 'core/node_system/types/ui_nodes/scroll_view_node.dart';
import 'core/node_system/types/story_nodes/message_bubble_node.dart';
import 'core/node_system/types/logic_nodes/variable_set_node.dart';
import 'core/node_system/types/logic_nodes/condition_node.dart';
import 'core/node_system/types/media_nodes/audio_node.dart';
import 'core/node_system/types/system_nodes/scene_node.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Register initial nodes
  NodeRegistry.register('ContainerNode', (json) => ContainerNode.fromJson(json));
  NodeRegistry.register('TextNode', (json) => TextNode.fromJson(json));
  NodeRegistry.register('ButtonNode', (json) => ButtonNode.fromJson(json));
  NodeRegistry.register('ImageNode', (json) => ImageNode.fromJson(json));
  NodeRegistry.register('ColumnNode', (json) => ColumnNode.fromJson(json));
  NodeRegistry.register('RowNode', (json) => RowNode.fromJson(json));
  NodeRegistry.register('StackNode', (json) => StackNode.fromJson(json));
  NodeRegistry.register('ScrollViewNode', (json) => ScrollViewNode.fromJson(json));

  NodeRegistry.register('MessageBubbleNode', (json) => MessageBubbleNode.fromJson(json));
  NodeRegistry.register('ConditionNode', (json) => ConditionNode.fromJson(json));
  NodeRegistry.register('VariableSetNode', (json) => VariableSetNode.fromJson(json));
  NodeRegistry.register('AudioNode', (json) => AudioNode.fromJson(json));
  NodeRegistry.register('SceneNode', (json) => SceneNode.fromJson(json));

  runApp(
    const ProviderScope(
      child: EverEngineApp(),
    ),
  );
}
