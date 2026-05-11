import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../core/scene_system/scene.dart';

class HistoryState {
  final List<Scene> undoStack;
  final List<Scene> redoStack;
  final int maxHistory;

  const HistoryState({
    this.undoStack = const [],
    this.redoStack = const [],
    this.maxHistory = 100,
  });

  HistoryState copyWith({
    List<Scene>? undoStack,
    List<Scene>? redoStack,
    int? maxHistory,
  }) {
    return HistoryState(
      undoStack: undoStack ?? this.undoStack,
      redoStack: redoStack ?? this.redoStack,
      maxHistory: maxHistory ?? this.maxHistory,
    );
  }
}

class HistoryNotifier extends StateNotifier<HistoryState> {
  HistoryNotifier() : super(const HistoryState());

  void pushState(Scene scene) {
    final newUndoStack = List<Scene>.from(state.undoStack)..add(scene);
    if (newUndoStack.length > state.maxHistory) {
      newUndoStack.removeAt(0);
    }
    state = state.copyWith(
      undoStack: newUndoStack,
      redoStack: [],
    );
  }

  Scene? undo() {
    if (!canUndo) return null;
    final scene = state.undoStack.last;
    final newUndoStack = List<Scene>.from(state.undoStack)..removeLast();
    state = state.copyWith(
      undoStack: newUndoStack,
      redoStack: List<Scene>.from(state.redoStack)
        ..add(scene), // In a real app we need the current state to push to redo
    );
    return scene;
  }

  Scene? redo() {
    if (!canRedo) return null;
    final scene = state.redoStack.last;
    final newRedoStack = List<Scene>.from(state.redoStack)..removeLast();
    state = state.copyWith(
      undoStack: List<Scene>.from(state.undoStack)..add(scene),
      redoStack: newRedoStack,
    );
    return scene;
  }

  bool get canUndo => state.undoStack.isNotEmpty;
  bool get canRedo => state.redoStack.isNotEmpty;

  void clear() {
    state = state.copyWith(undoStack: [], redoStack: []);
  }
}

final historyProvider =
    StateNotifierProvider<HistoryNotifier, HistoryState>((ref) {
  return HistoryNotifier();
});
