import 'package:flutter/material.dart';
import 'package:maplestory_builder/constants/character/classes.dart';

class CharacterProvider extends ChangeNotifier {
  String characterName;
  int characterLevel;
  CharacterClass characterClass; 

  CharacterProvider({
    this.characterLevel = 0,
    this.characterName = '',
    this.characterClass = CharacterClass.beginner,
  });

  void updateCharacterLevel(int selectedLevel) {
    // apStatsProvider.setAvailableAPFromLevel(selectedLevel);
    // hyperStatsProvider.setAvailableHyperStatsFromLevel(selectedLevel);
    characterLevel = selectedLevel;
    notifyListeners();
  }

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
}