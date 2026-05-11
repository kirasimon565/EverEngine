import 'node.dart';
import 'types/ui_nodes/container_node.dart';
import 'types/ui_nodes/text_node.dart';
import 'types/ui_nodes/button_node.dart';
import 'types/ui_nodes/image_node.dart';
import 'types/ui_nodes/column_node.dart';
import 'types/ui_nodes/row_node.dart';
import 'types/ui_nodes/stack_node.dart';
import 'types/ui_nodes/scroll_view_node.dart';
import 'types/ui_nodes/safe_area_node.dart';
import 'types/ui_nodes/expanded_node.dart';
import 'types/ui_nodes/spacer_node.dart';
import 'types/ui_nodes/divider_node.dart';
import 'types/ui_nodes/icon_node.dart';
import 'types/ui_nodes/list_view_node.dart';
import 'types/ui_nodes/grid_view_node.dart';
import 'types/ui_nodes/custom_paint_node.dart';

import 'types/story_nodes/message_bubble_node.dart';
import 'types/story_nodes/choice_group_node.dart';
import 'types/story_nodes/choice_option_node.dart';
import 'types/story_nodes/typing_indicator_node.dart';
import 'types/story_nodes/timer_event_node.dart';
import 'types/story_nodes/notification_node.dart';
import 'types/story_nodes/phone_call_node.dart';
import 'types/story_nodes/gallery_viewer_node.dart';
import 'types/story_nodes/contact_list_node.dart';
import 'types/story_nodes/map_node.dart';
import 'types/story_nodes/journal_node.dart';
import 'types/story_nodes/cutscene_node.dart';
import 'types/story_nodes/dialogue_tree_node.dart';
import 'types/story_nodes/chapter_end_node.dart';

import 'types/logic_nodes/variable_set_node.dart';
import 'types/logic_nodes/condition_node.dart';
import 'types/logic_nodes/variable_check_node.dart';
import 'types/logic_nodes/switch_node.dart';
import 'types/logic_nodes/loop_node.dart';
import 'types/logic_nodes/randomizer_node.dart';
import 'types/logic_nodes/delay_node.dart';
import 'types/logic_nodes/parallel_node.dart';
import 'types/logic_nodes/script_trigger_node.dart';
import 'types/logic_nodes/save_point_node.dart';
import 'types/logic_nodes/scene_loader_node.dart';
import 'types/logic_nodes/end_node.dart';

import 'types/media_nodes/audio_node.dart';
import 'types/media_nodes/video_node.dart';
import 'types/media_nodes/lottie_animation_node.dart';
import 'types/media_nodes/particle_effect_node.dart';
import 'types/media_nodes/audio_mix_node.dart';

import 'types/system_nodes/scene_node.dart';
import 'types/system_nodes/input_capture_node.dart';
import 'types/system_nodes/network_request_node.dart';
import 'types/system_nodes/data_save_node.dart';
import 'types/system_nodes/data_load_node.dart';
import 'types/system_nodes/plugin_node.dart';

enum NodeCategory { ui, story, logic, media, system }

class NodeRegistry {
  static final Map<String, Node Function(Map<String, dynamic>)> _constructors = {};

  static void register(String type, Node Function(Map<String, dynamic>) constructor) {
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

  static void registerAll() {
    register('ContainerNode', (json) => ContainerNode.fromJson(json));
    register('TextNode', (json) => TextNode.fromJson(json));
    register('ButtonNode', (json) => ButtonNode.fromJson(json));
    register('ImageNode', (json) => ImageNode.fromJson(json));
    register('ColumnNode', (json) => ColumnNode.fromJson(json));
    register('RowNode', (json) => RowNode.fromJson(json));
    register('StackNode', (json) => StackNode.fromJson(json));
    register('ScrollViewNode', (json) => ScrollViewNode.fromJson(json));
    register('SafeAreaNode', (json) => SafeAreaNode.fromJson(json));
    register('ExpandedNode', (json) => ExpandedNode.fromJson(json));
    register('SpacerNode', (json) => SpacerNode.fromJson(json));
    register('DividerNode', (json) => DividerNode.fromJson(json));
    register('IconNode', (json) => IconNode.fromJson(json));
    register('ListViewNode', (json) => ListViewNode.fromJson(json));
    register('GridViewNode', (json) => GridViewNode.fromJson(json));
    register('CustomPaintNode', (json) => CustomPaintNode.fromJson(json));

    register('MessageBubbleNode', (json) => MessageBubbleNode.fromJson(json));
    register('ChoiceGroupNode', (json) => ChoiceGroupNode.fromJson(json));
    register('ChoiceOptionNode', (json) => ChoiceOptionNode.fromJson(json));
    register('TypingIndicatorNode', (json) => TypingIndicatorNode.fromJson(json));
    register('TimerEventNode', (json) => TimerEventNode.fromJson(json));
    register('NotificationNode', (json) => NotificationNode.fromJson(json));
    register('PhoneCallNode', (json) => PhoneCallNode.fromJson(json));
    register('GalleryViewerNode', (json) => GalleryViewerNode.fromJson(json));
    register('ContactListNode', (json) => ContactListNode.fromJson(json));
    register('MapNode', (json) => MapNode.fromJson(json));
    register('JournalNode', (json) => JournalNode.fromJson(json));
    register('CutsceneNode', (json) => CutsceneNode.fromJson(json));
    register('DialogueTreeNode', (json) => DialogueTreeNode.fromJson(json));
    register('ChapterEndNode', (json) => ChapterEndNode.fromJson(json));

    register('ConditionNode', (json) => ConditionNode.fromJson(json));
    register('VariableSetNode', (json) => VariableSetNode.fromJson(json));
    register('VariableCheckNode', (json) => VariableCheckNode.fromJson(json));
    register('SwitchNode', (json) => SwitchNode.fromJson(json));
    register('LoopNode', (json) => LoopNode.fromJson(json));
    register('RandomizerNode', (json) => RandomizerNode.fromJson(json));
    register('DelayNode', (json) => DelayNode.fromJson(json));
    register('ParallelNode', (json) => ParallelNode.fromJson(json));
    register('ScriptTriggerNode', (json) => ScriptTriggerNode.fromJson(json));
    register('SavePointNode', (json) => SavePointNode.fromJson(json));
    register('SceneLoaderNode', (json) => SceneLoaderNode.fromJson(json));
    register('EndNode', (json) => EndNode.fromJson(json));

    register('AudioNode', (json) => AudioNode.fromJson(json));
    register('VideoNode', (json) => VideoNode.fromJson(json));
    register('LottieAnimationNode', (json) => LottieAnimationNode.fromJson(json));
    register('ParticleEffectNode', (json) => ParticleEffectNode.fromJson(json));
    register('AudioMixNode', (json) => AudioMixNode.fromJson(json));

    register('SceneNode', (json) => SceneNode.fromJson(json));
    register('InputCaptureNode', (json) => InputCaptureNode.fromJson(json));
    register('NetworkRequestNode', (json) => NetworkRequestNode.fromJson(json));
    register('DataSaveNode', (json) => DataSaveNode.fromJson(json));
    register('DataLoadNode', (json) => DataLoadNode.fromJson(json));
    register('PluginNode', (json) => PluginNode.fromJson(json));
  }
}
