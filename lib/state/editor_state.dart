import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../core/scene_system/scene.dart';
import '../core/node_system/node.dart';

enum EditorViewMode { design, code, split }

class CanvasState {
  final double zoom;
  final Offset panOffset;
  final bool showGrid;
  final bool showGuides;
  final bool snapToGrid;
  final double gridSize;

  const CanvasState({
    this.zoom = 1.0,
    this.panOffset = Offset.zero,
    this.showGrid = true,
    this.showGuides = true,
    this.snapToGrid = true,
    this.gridSize = 8.0,
  });

  CanvasState copyWith({
    double? zoom,
    Offset? panOffset,
    bool? showGrid,
    bool? showGuides,
    bool? snapToGrid,
    double? gridSize,
  }) {
    return CanvasState(
      zoom: zoom ?? this.zoom,
      panOffset: panOffset ?? this.panOffset,
      showGrid: showGrid ?? this.showGrid,
      showGuides: showGuides ?? this.showGuides,
      snapToGrid: snapToGrid ?? this.snapToGrid,
      gridSize: gridSize ?? this.gridSize,
    );
  }
}

class EditorState {
  final Scene? activeScene;
  final List<String> openSceneNames;
  final String? selectedNodeId;
  final List<String> selectedNodeIds;
  final EditorViewMode viewMode;
  final CanvasState canvasState;
  final bool hasUnsavedChanges;

  const EditorState({
    this.activeScene,
    this.openSceneNames = const [],
    this.selectedNodeId,
    this.selectedNodeIds = const [],
    this.viewMode = EditorViewMode.design,
    this.canvasState = const CanvasState(),
    this.hasUnsavedChanges = false,
  });

  EditorState copyWith({
    Scene? activeScene,
    List<String>? openSceneNames,
    String? selectedNodeId,
    List<String>? selectedNodeIds,
    EditorViewMode? viewMode,
    CanvasState? canvasState,
    bool? hasUnsavedChanges,
    bool clearSelectedNodeId = false,
  }) {
    return EditorState(
      activeScene: activeScene ?? this.activeScene,
      openSceneNames: openSceneNames ?? this.openSceneNames,
      selectedNodeId:
          clearSelectedNodeId ? null : (selectedNodeId ?? this.selectedNodeId),
      selectedNodeIds: selectedNodeIds ?? this.selectedNodeIds,
      viewMode: viewMode ?? this.viewMode,
      canvasState: canvasState ?? this.canvasState,
      hasUnsavedChanges: hasUnsavedChanges ?? this.hasUnsavedChanges,
    );
  }
}

class EditorNotifier extends StateNotifier<EditorState> {
  EditorNotifier() : super(const EditorState());

  void setActiveScene(Scene scene) {
    state = state.copyWith(activeScene: scene);
  }

  void selectNode(String? nodeId) {
    state = state.copyWith(
      selectedNodeId: nodeId,
      selectedNodeIds: nodeId != null ? [nodeId] : [],
      clearSelectedNodeId: nodeId == null,
    );
  }

  void multiSelectAdd(String nodeId) {
    if (!state.selectedNodeIds.contains(nodeId)) {
      state = state.copyWith(
        selectedNodeIds: [...state.selectedNodeIds, nodeId],
        selectedNodeId: state.selectedNodeId ?? nodeId,
      );
    }
  }

  void clearSelection() {
    state = state.copyWith(
        selectedNodeId: null, selectedNodeIds: [], clearSelectedNodeId: true);
  }

  void setViewMode(EditorViewMode mode) {
    state = state.copyWith(viewMode: mode);
  }

  void updateCanvas(CanvasState canvasState) {
    state = state.copyWith(canvasState: canvasState);
  }
}

final editorProvider =
    StateNotifierProvider<EditorNotifier, EditorState>((ref) {
  return EditorNotifier();
});

final selectedNodeProvider = Provider<Node?>((ref) {
  final state = ref.watch(editorProvider);
  if (state.selectedNodeId != null && state.activeScene != null) {
    // simplified lookup
    if (state.activeScene!.rootNode.id.toString() == state.selectedNodeId) {
      return state.activeScene!.rootNode;
    }
  }
  return null;
});

final canvasStateProvider = Provider<CanvasState>((ref) {
  return ref.watch(editorProvider).canvasState;
});
