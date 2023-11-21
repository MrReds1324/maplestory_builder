import 'dart:math';

import 'package:flutter/material.dart';
import 'package:maplestory_builder/constants/character/classes.dart';

class CharacterProvider extends ChangeNotifier {
  String characterName;
  int characterLevel;
  CharacterClass characterClass; 

  TextEditingController textController;

  CharacterProvider({
    this.characterLevel = 0,
    this.characterName = '',
    this.characterClass = CharacterClass.beginner,
  }): textController = TextEditingController(text: characterName);

  CharacterProvider copyWith({
    int? characterLevel,
    String? characterName,
    CharacterClass? characterClass,
  }) {
    return CharacterProvider(
      characterLevel: characterLevel ?? this.characterLevel,
      characterName: characterName ?? this.characterName,
      characterClass: characterClass ?? this.characterClass
    );
  }

  void updateCharacterClass(CharacterClass characterClass) {
    this.characterClass = characterClass;
    notifyListeners();
  }

  void addLevels(int levelsToAdd) {
    if(characterLevel == 300) {
      return;
    }

    characterLevel += min(levelsToAdd, 300 - characterLevel);
    notifyListeners();
  }

  void subtractLevels(int levelsToSubtract) {
    if (characterLevel == 1) {
      return;
    }

    characterLevel -= min(levelsToSubtract, characterLevel - 1);
    notifyListeners();
  }
}