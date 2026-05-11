import '../scene_system/scene.dart';
import '../node_system/node.dart';
import '../variable_system/variable_store.dart';
import '../character_system/character_manager.dart';
import '../event_system/event_bus.dart';
import '../event_system/event_types.dart';

class RuntimeState {
  final Scene currentScene;
  final Node? currentNode;
  final VariableStore variableStore;
  final CharacterManager characterManager;
  final int saveSlot;

  RuntimeState({
    required this.currentScene,
    this.currentNode,
    required this.variableStore,
    required this.characterManager,
    this.saveSlot = 1,
  });

  RuntimeState copyWith({
    Scene? currentScene,
    Node? currentNode,
    VariableStore? variableStore,
    CharacterManager? characterManager,
    int? saveSlot,
  }) {
    return RuntimeState(
      currentScene: currentScene ?? this.currentScene,
      currentNode: currentNode ?? this.currentNode,
      variableStore: variableStore ?? this.variableStore,
      characterManager: characterManager ?? this.characterManager,
      saveSlot: saveSlot ?? this.saveSlot,
    );
  }
}

class RuntimeContext {
  final EventBus eventBus;
  RuntimeContext(this.eventBus);
}

class RuntimeInterpreter {
  Future<RuntimeState> executeNode(Node node, RuntimeContext context, RuntimeState state) async {
    // In a fully working interpreter, it walks the node graph executing custom logic depending on node properties/types.
    context.eventBus.emit(NodeDisplayedEvent(node.id.toString()));

    // Perform operations based on triggers
    if (node.triggers.isNotEmpty) {
      for (final trigger in node.triggers.values) {
        if (trigger.actions.isNotEmpty) {
           for (final action in trigger.actions) {
             if (action.actionType == 'setVariable' && action.parameters.containsKey('name') && action.parameters.containsKey('value')) {
                state.variableStore.setValue(action.parameters['name'], action.parameters['value']);
             }
           }
        }
      }
    }

    // Recursive execution logic for children
    RuntimeState updatedState = state.copyWith(currentNode: node);
    if (node.childrenIds.isNotEmpty && node.canHaveChildren()) {
      for (final childId in node.childrenIds) {
        final childNode = state.currentScene.findNodeById(childId);
        if (childNode != null) {
          updatedState = await executeNode(childNode, context, updatedState);
        }
      }
    }

    return updatedState;
  }

  Future<RuntimeState> executeScene(Scene scene, RuntimeContext context, RuntimeState state) async {
    return executeNode(scene.rootNode, context, state);
  }
}
