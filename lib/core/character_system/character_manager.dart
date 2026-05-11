import 'dart:convert';
import 'dart:io';
import 'character.dart';
import '../variable_system/variable_store.dart';
import '../variable_system/variable_expression_parser.dart';

class CharacterManager {
  final List<Character> _characters = [];

  void addCharacter(Character character) {
    _characters.removeWhere((c) => c.id == character.id);
    _characters.add(character);
  }

  void updateCharacter(String id, Character updated) {
    final index = _characters.indexWhere((c) => c.id == id);
    if (index != -1) {
      _characters[index] = updated;
    }
  }

  void removeCharacter(String id) {
    _characters.removeWhere((c) => c.id == id);
  }

  Character? getCharacter(String id) {
    try {
      return _characters.firstWhere((c) => c.id == id);
    } catch (_) {
      return null;
    }
  }

  List<Character> getAllCharacters() => List.unmodifiable(_characters);

  List<Character> getVisibleCharacters(VariableStore store) {
    return _characters.where((c) {
      if (c.conditionToShow == null || c.conditionToShow!.isEmpty) return true;
      return VariableExpressionParser.evaluateCondition(
          c.conditionToShow!, store);
    }).toList();
  }

  List<Character> searchCharacters(String query) {
    final lowerQuery = query.toLowerCase();
    return _characters
        .where((c) =>
            c.displayName.toLowerCase().contains(lowerQuery) ||
            c.id.toLowerCase().contains(lowerQuery))
        .toList();
  }
}
