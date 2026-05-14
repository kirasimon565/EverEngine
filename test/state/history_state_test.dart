import 'package:flutter_test/flutter_test.dart';
import 'package:everengine/state/history_state.dart';
import 'package:everengine/core/scene_system/scene.dart';
import 'package:everengine/core/node_system/node_id.dart';
import 'package:everengine/core/node_system/types/ui_nodes/container_node.dart';

void main() {
  group('HistoryNotifier', () {
    test('pushState adds to undo stack', () {
      final notifier = HistoryNotifier();
      final scene = Scene(
          name: 's1',
          displayName: 'S1',
          rootNode: ContainerNode(id: NodeId.generate()),
          createdAt: DateTime.now(),
          updatedAt: DateTime.now());

      notifier.pushState(scene);

      expect(notifier.state.undoStack.length, equals(1));
      expect(notifier.canUndo, isTrue);
    });

    test('undo returns previous scene', () {
      final notifier = HistoryNotifier();
      final scene1 = Scene(
          name: 's1',
          displayName: 'S1',
          rootNode: ContainerNode(id: NodeId.generate()),
          createdAt: DateTime.now(),
          updatedAt: DateTime.now());
      final scene2 = Scene(
          name: 's2',
          displayName: 'S2',
          rootNode: ContainerNode(id: NodeId.generate()),
          createdAt: DateTime.now(),
          updatedAt: DateTime.now());

      notifier.pushState(scene1);
      notifier.pushState(scene2);

      final undone = notifier.undo();

      expect(undone?.name, equals('s1'));
      expect(notifier.canUndo, isTrue); // scene1 is still in undo stack
      expect(notifier.canRedo, isTrue);
    });

    test('redo returns next scene', () {
      final notifier = HistoryNotifier();
      final scene1 = Scene(
          name: 's1',
          displayName: 'S1',
          rootNode: ContainerNode(id: NodeId.generate()),
          createdAt: DateTime.now(),
          updatedAt: DateTime.now());
      final scene2 = Scene(
          name: 's2',
          displayName: 'S2',
          rootNode: ContainerNode(id: NodeId.generate()),
          createdAt: DateTime.now(),
          updatedAt: DateTime.now());

      notifier.pushState(scene1);
      notifier.pushState(scene2);

      notifier.undo();
      final redone = notifier.redo();

      expect(redone?.name, equals('s2'));
    });

    test('canUndo / canRedo return correct values', () {
      final notifier = HistoryNotifier();
      expect(notifier.canUndo, isFalse);
      expect(notifier.canRedo, isFalse);
    });

    test('stack capped at maxHistory', () {
      final notifier = HistoryNotifier();
      for (int i = 0; i < 105; i++) {
        notifier.pushState(Scene(
            name: 's$i',
            displayName: 'S$i',
            rootNode: ContainerNode(id: NodeId.generate()),
            createdAt: DateTime.now(),
            updatedAt: DateTime.now()));
      }
      expect(notifier.state.undoStack.length, equals(100));
    });
  });
}
