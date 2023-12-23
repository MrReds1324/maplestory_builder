import 'dart:math';

import 'package:flutter/material.dart';
import 'package:maplestory_builder/constants/legion/legion_stats.dart';
import 'package:maplestory_builder/constants/constants.dart';
import 'package:maplestory_builder/modules/base.dart';
import 'package:maplestory_builder/modules/legion/legion_mod.dart';
import 'package:maplestory_builder/modules/utilities/utilities.dart';

import 'package:maplestory_builder/providers/character/character_provider.dart';

class LegionStatsProvider with ChangeNotifier implements Copyable {

  CharacterProvider characterProvider;
  
  LegionBoardRank? legionBoardRank;
  // This will be used to track the direct legion members added
  late Map<int, LegionCharacter> allLegionCharacters;
  late Map<int, LegionModule> legionSets;
  late LegionModule activeLegionSet;
  int activeSetNumber = 1;
  // 0 is a reserved hash, for the character this whole program is about
  int legionCharacterHash = 1;
  int totalCharacterLevels = 0;

  Widget hoverTooltip = const SizedBox.shrink();

  LegionStatsProvider({
    required this.characterProvider,
    this.activeSetNumber = 1,
    this.legionBoardRank,
    this.legionCharacterHash = 1,
    Map<int, LegionModule>? legionSets,
    Map<int, LegionCharacter>? allLegionCharacters,
    LegionModule? activeLegionSet,
  }) {
    this.allLegionCharacters = allLegionCharacters ?? {
      0: LegionCharacter(
        legionBlock: characterProvider.characterClass.legionBlock,
        legionCharacterLevel: characterProvider.characterLevel,
        legionCharacterHash: 0,
      )
    };
    this.legionSets = legionSets ?? {
      1: LegionModule(getLegionBoardRankCallback: getLegionBoardRankCallback, getLegionCharacterCallback: getLegionCharacterCallback),
      2: LegionModule(getLegionBoardRankCallback: getLegionBoardRankCallback, getLegionCharacterCallback: getLegionCharacterCallback),
      3: LegionModule(getLegionBoardRankCallback: getLegionBoardRankCallback, getLegionCharacterCallback: getLegionCharacterCallback),
      4: LegionModule(getLegionBoardRankCallback: getLegionBoardRankCallback, getLegionCharacterCallback: getLegionCharacterCallback),
      5: LegionModule(getLegionBoardRankCallback: getLegionBoardRankCallback, getLegionCharacterCallback: getLegionCharacterCallback),
    };
    this.activeLegionSet = activeLegionSet ?? this.legionSets[activeSetNumber]!;
    calculateLegionBoardRank();
  }

  @override
  LegionStatsProvider copyWith({
    CharacterProvider? characterProvider,
    int? activeSetNumber,
    LegionBoardRank? legionBoardRank,
    int? legionCharacterHash,
    Map<int, LegionModule>? legionSets,
    Map<int, LegionCharacter>? allLegionCharacters,
    LegionModule? activeLegionSet
  }) {
    return LegionStatsProvider(
      characterProvider: characterProvider ?? this.characterProvider.copyWith(),
      activeSetNumber: activeSetNumber ?? this.activeSetNumber,
      activeLegionSet: activeLegionSet ?? this.activeLegionSet.copyWith(),
      legionBoardRank: legionBoardRank ?? this.legionBoardRank,
      legionSets: legionSets ?? mapDeepCopy(this.legionSets),
      allLegionCharacters: allLegionCharacters ?? Map<int, LegionCharacter>.of(this.allLegionCharacters),
      legionCharacterHash: legionCharacterHash ?? this.legionCharacterHash,
    );
  }

  LegionStatsProvider update(CharacterProvider characterProvider) {
    allLegionCharacters[0]!.legionCharacterLevel = characterProvider.characterLevel;
    allLegionCharacters[0]!.legionBlock = characterProvider.characterClass.legionBlock;
    calculateLegionBoardRank();
    calculateStats();
    notifyListeners();
    return this;
  }

  LegionCharacter? getLegionCharacterCallback(int? legionCharacterHash) {
    return allLegionCharacters[legionCharacterHash];
  }

  LegionBoardRank? getLegionBoardRankCallback() {
    return legionBoardRank;
  }

  Map<StatType, num> calculateStats() {
    return activeLegionSet.calculateModuleStats();
  }

  void addLegionStatLevels(int levelsToAdd, StatType statType, {bool isOuterBoard = false}) {
    if (activeLegionSet.addLegionStatLevels(levelsToAdd, statType, isOuterBoard: isOuterBoard)) {
      notifyListeners();
    }
  }

  void subtractLegionStatLevels(int levelsToSubtract, StatType statType, {bool isOuterBoard = false}) {
    if (activeLegionSet.subtractLegionStatLevels(levelsToSubtract, statType, isOuterBoard: isOuterBoard)) {
      notifyListeners();
    }
  }

  void placeLegionCharacter(LegionCharacter? legionCharacter) {
    var didPlace = activeLegionSet.placeLegionCharacter(legionCharacter);
    
    if (didPlace) {
      notifyListeners();
    }
  }

  void removePlacedLegionCharacter(LegionCharacter? legionCharacter) {
    var didRemove = activeLegionSet.removeLegionCharacter(legionCharacter);
    
    if (didRemove) {
      notifyListeners();
    }
  }

  void deleteLegionCharacter(LegionCharacter legionCharacter) {
    allLegionCharacters.remove(legionCharacter.legionCharacterHash);

    for (LegionModule legionModule in legionSets.values) {
      legionModule.removeLegionCharacter(legionCharacter);
    }

    calculateLegionBoardRank();

    notifyListeners();
  }

  void calculateLegionBoardRank() {
    var sortedCharacters = allLegionCharacters.values.toList()..sort(LegionCharacter.comparator);
    sortedCharacters = sortedCharacters.where((element) => !LegionBlock.specialBlocks.contains(element.legionBlock)).toList();
    sortedCharacters = sortedCharacters.sublist(0, min(42, sortedCharacters.length));
    totalCharacterLevels = sortedCharacters.fold(0, (int previous, LegionCharacter current) => previous + current.legionCharacterLevel);
    legionBoardRank = LegionBoardRank.getLegionBoardRank(totalCharacterLevels);
  }

  void saveEditingLegionCharacter(LegionCharacter? editingLegionCharacter) {
    // Nothing to actually save, return immediately
    if (editingLegionCharacter == null) {
      return;
    }
    
    // New legion Character
    if (editingLegionCharacter.legionCharacterHash == -1) {
      editingLegionCharacter.legionCharacterHash = legionCharacterHash;
      allLegionCharacters[editingLegionCharacter.legionCharacterHash] = editingLegionCharacter;
      legionCharacterHash++;
    }
    // Repalce the old version of the character with the new one if we updated one that already exists
    else {
      allLegionCharacters[editingLegionCharacter.legionCharacterHash] = editingLegionCharacter;
      // Recalculate the board coverage because it may have changed due to going up or down a rank
      for (LegionModule legionModule in legionSets.values) {
        legionModule.calculateMaximumBoardCoverage();
      }
    }
    calculateLegionBoardRank();
    notifyListeners();
  }

  List<LegionCharacter> getUnplacedLegionCharacters() {
    List<LegionCharacter> returnValue = [];

    var placedLegionCharacters = activeLegionSet.placedCharacters;
    for (LegionCharacter legionCharacter in allLegionCharacters.values) {
      if (!placedLegionCharacters.contains(legionCharacter.legionCharacterHash)) {
        returnValue.add(legionCharacter);
      }
    }

    return returnValue;
  }

  void changeActiveSet(int legionSetPosition) {
    activeSetNumber = legionSetPosition;
    activeLegionSet = legionSets[legionSetPosition]!;

    notifyListeners();
  }
}