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
    final newUndo = List<Scene>.from(state.undoStack)..add(scene);
    if (newUndo.length > state.maxHistory) {
      newUndo.removeAt(0);
    }
    state = state.copyWith(undoStack: newUndo, redoStack: []);
  }

  Scene? undo() {
    if (!canUndo) return null;
    final sceneToRedo = state.undoStack.last;
    final newUndo = List<Scene>.from(state.undoStack)..removeLast();
    final newRedo = List<Scene>.from(state.redoStack)..add(sceneToRedo);

    state = state.copyWith(undoStack: newUndo, redoStack: newRedo);

    return newUndo.isNotEmpty ? newUndo.last : null;
  }

  Scene? redo() {
    if (!canRedo) return null;
    final sceneToUndo = state.redoStack.last;
    final newRedo = List<Scene>.from(state.redoStack)..removeLast();
    final newUndo = List<Scene>.from(state.undoStack)..add(sceneToUndo);

    state = state.copyWith(undoStack: newUndo, redoStack: newRedo);

    return sceneToUndo;
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
