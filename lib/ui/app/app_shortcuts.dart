import 'package:flutter/material.dart';

class UndoIntent extends Intent {
  const UndoIntent();
}

class RedoIntent extends Intent {
  const RedoIntent();
}

class SaveIntent extends Intent {
  const SaveIntent();
}

class AppShortcuts {
  static Map<ShortcutActivator, Intent> getShortcuts() {
    return {
      LogicalKeySet(LogicalKeyboardKey.control, LogicalKeyboardKey.keyZ):
          const UndoIntent(),
      LogicalKeySet(LogicalKeyboardKey.control, LogicalKeyboardKey.shift,
          LogicalKeyboardKey.keyZ): const RedoIntent(),
      LogicalKeySet(LogicalKeyboardKey.control, LogicalKeyboardKey.keyS):
          const SaveIntent(),
    };
  }
}
