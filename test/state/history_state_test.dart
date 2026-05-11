import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:everengine/state/state.dart';
import 'package:everengine/core/scene_system/scene.dart';
import 'package:everengine/core/node_system/node_id.dart';
import 'package:everengine/core/node_system/types/ui_nodes/container_node.dart';

void main() {
  group('HistoryNotifier', () {
    test('pushState adds to undo stack', () {
      final container = ProviderContainer();
      final notifier = container.read(historyProvider.notifier);

      final scene = Scene(
        name: 'Test',
        displayName: 'Test',
        rootNode: ContainerNode(id: NodeId.generate()),
        createdAt: DateTime.now(),
        updatedAt: DateTime.now(),
      );

      notifier.pushState(scene);

      final state = container.read(historyProvider);
      expect(state.undoStack.length, equals(1));
      expect(state.undoStack.first, equals(scene));
      expect(notifier.canUndo, isTrue);
    });

    test('undo returns previous scene', () {
      final container = ProviderContainer();
      final notifier = container.read(historyProvider.notifier);

      final scene1 = Scene(
          name: 'S1',
          displayName: 'S1',
          rootNode: ContainerNode(id: NodeId.generate()),
          createdAt: DateTime.now(),
          updatedAt: DateTime.now());
      final scene2 = Scene(
          name: 'S2',
          displayName: 'S2',
          rootNode: ContainerNode(id: NodeId.generate()),
          createdAt: DateTime.now(),
          updatedAt: DateTime.now());

      notifier.pushState(scene1);
      notifier.pushState(scene2);

      final undone = notifier.undo();

      final state = container.read(historyProvider);
      expect(undone, equals(scene2));
      expect(state.undoStack.length, equals(1));
      expect(state.undoStack.first, equals(scene1));
      expect(state.redoStack.length, equals(1));
    });
  });
}
