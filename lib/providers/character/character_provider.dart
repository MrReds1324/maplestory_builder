import 'dart:math';

import 'package:flutter/material.dart';
import 'package:maplestory_builder/constants/character/classes.dart';
import 'package:maplestory_builder/constants/constants.dart';
import 'package:maplestory_builder/modules/base.dart';

class CharacterProvider extends ChangeNotifier implements Copyable {
  String characterName;
  int characterLevel;
  CharacterClass characterClass;

  TextEditingController textController;

  CharacterProvider({
    this.characterLevel = MINIMUM_CHARACTER_LEVEL,
    this.characterName = '',
    this.characterClass = CharacterClass.beginner,
  }) : textController = TextEditingController(text: characterName);

  @override
  CharacterProvider copyWith({
    int? characterLevel,
    String? characterName,
    CharacterClass? characterClass,
  }) {
    return CharacterProvider(
        characterLevel: characterLevel ?? this.characterLevel,
        characterName: characterName ?? this.characterName,
        characterClass: characterClass ?? this.characterClass);
  }

  void updateCharacterClass(CharacterClass characterClass) {
    this.characterClass = characterClass;
    notifyListeners();
  }

  void addLevels(int levelsToAdd) {
    if (characterLevel == MAX_CHARACTER_LEVEL) {
      return;
    }

    characterLevel += min(levelsToAdd, MAX_CHARACTER_LEVEL - characterLevel);
    notifyListeners();
  }

  void subtractLevels(int levelsToSubtract) {
    if (characterLevel == 1) {
      return;
    }

    characterLevel -=
        min(levelsToSubtract, characterLevel - MINIMUM_CHARACTER_LEVEL);
    notifyListeners();
  }
}
