import 'package:flutter/widgets.dart';
import 'package:flutter/services.dart';

class AppShortcuts {
  static Map<ShortcutActivator, Intent> getShortcuts() {
    return {
      const SingleActivator(LogicalKeyboardKey.keyZ, control: true): const UndoIntent(),
      const SingleActivator(LogicalKeyboardKey.keyZ, control: true, shift: true): const RedoIntent(),
      const SingleActivator(LogicalKeyboardKey.keyY, control: true): const RedoIntent(),
      const SingleActivator(LogicalKeyboardKey.keyS, control: true): const SaveIntent(),
      const SingleActivator(LogicalKeyboardKey.keyD, control: true): const DuplicateIntent(),
      const SingleActivator(LogicalKeyboardKey.delete): const DeleteSelectedIntent(),
      const SingleActivator(LogicalKeyboardKey.keyC, control: true): const CopyIntent(),
      const SingleActivator(LogicalKeyboardKey.keyV, control: true): const PasteIntent(),
      const SingleActivator(LogicalKeyboardKey.keyX, control: true): const CutIntent(),
      const SingleActivator(LogicalKeyboardKey.keyA, control: true): const SelectAllIntent(),
      const SingleActivator(LogicalKeyboardKey.keyF, control: true): const FindIntent(),
      const SingleActivator(LogicalKeyboardKey.keyG, control: true): const GoToSceneIntent(),
      const SingleActivator(LogicalKeyboardKey.escape): const DeselectIntent(),
      const SingleActivator(LogicalKeyboardKey.space): const PanCanvasIntent(),
    };
  }
}

class UndoIntent extends Intent { const UndoIntent(); }
class RedoIntent extends Intent { const RedoIntent(); }
class SaveIntent extends Intent { const SaveIntent(); }
class DuplicateIntent extends Intent { const DuplicateIntent(); }
class DeleteSelectedIntent extends Intent { const DeleteSelectedIntent(); }
class CopyIntent extends Intent { const CopyIntent(); }
class PasteIntent extends Intent { const PasteIntent(); }
class CutIntent extends Intent { const CutIntent(); }
class SelectAllIntent extends Intent { const SelectAllIntent(); }
class FindIntent extends Intent { const FindIntent(); }
class GoToSceneIntent extends Intent { const GoToSceneIntent(); }
class DeselectIntent extends Intent { const DeselectIntent(); }
class PanCanvasIntent extends Intent { const PanCanvasIntent(); }
