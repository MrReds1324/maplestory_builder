import 'package:flutter/material.dart';
import 'package:maplestory_builder/constants/character/legion_stats.dart';
import 'package:maplestory_builder/constants/constants.dart';
import 'package:maplestory_builder/modules/legion/legion_mod.dart';

import 'package:maplestory_builder/providers/character/character_provider.dart';

class LegionStatsProvider with ChangeNotifier{

  CharacterProvider characterProvider;
  
  LegionBoardRank? legionBoardRank;
  // This will be used to track the direct legion members added
  late Map<int, LegionCharacter> allLegionCharacters;
  late Map<int, LegionModule> legionSets;
  late LegionModule activeLegionSet;
  int activeSetNumber = 1;
  // 0 is a reserved hash, for the character this whole program is about
  int legionCharacterHash = 1;

  Map<StatType, num>? cacheValue;
  Widget hoverTooltip = const SizedBox.shrink();

  LegionStatsProvider({
    required this.characterProvider,
    this.legionBoardRank = LegionBoardRank.legendaryLegionR2,
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
  }

  LegionStatsProvider copyWith({
    CharacterProvider? characterProvider,
    LegionBoardRank? legionBoardRank,
    Map<int, LegionCharacter>? allLegionCharacters,
    int? legionCharacterHash,
  }) {
    return LegionStatsProvider(
      characterProvider: characterProvider ?? this.characterProvider.copyWith(),
      legionBoardRank: legionBoardRank ?? this.legionBoardRank,
      allLegionCharacters: allLegionCharacters ?? Map<int, LegionCharacter>.of(this.allLegionCharacters), // TODO: deepcopy?
      legionCharacterHash: legionCharacterHash ?? this.legionCharacterHash,
    );
  }

  LegionStatsProvider update(CharacterProvider characterProvider) {
    cacheValue = null;
    allLegionCharacters[0]!.legionCharacterLevel = characterProvider.characterLevel;
    allLegionCharacters[0]!.legionBlock = characterProvider.characterClass.legionBlock;
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
    if (cacheValue != null) {
      return cacheValue!;
    }
    else {
      cacheValue = activeLegionSet.calculateModuleStats();
      return cacheValue!;
    }
  }

  void addLegionStatLevels(int levelsToAdd, StatType statType, {bool isOuterBoard = false}) {
    if (activeLegionSet.addLegionStatLevels(levelsToAdd, statType, isOuterBoard: isOuterBoard)) {
      cacheValue = null;
      notifyListeners();
    }
  }

  void subtractLegionStatLevels(int levelsToSubtract, StatType statType, {bool isOuterBoard = false}) {
    if (activeLegionSet.subtractLegionStatLevels(levelsToSubtract, statType, isOuterBoard: isOuterBoard)) {
      cacheValue = null;
      notifyListeners();
    }
  }

  void placeLegionCharacter(LegionCharacter? legionCharacter) {
    var didPlace = activeLegionSet.placeLegionCharacter(legionCharacter);
    
    if (didPlace) {
      notifyListeners();
    }
  }

  void saveEditingLegionCharacter(LegionCharacter? editingLegionCharacter) {
    // Nothing to actually save, return immediately
    if (editingLegionCharacter == null) {
      return;
    }
    
    // New equip that cannot be equipped
    if (editingLegionCharacter.legionCharacterHash == -1) {
      editingLegionCharacter.legionCharacterHash = legionCharacterHash;
      allLegionCharacters[editingLegionCharacter.legionCharacterHash] = editingLegionCharacter;
      legionCharacterHash++;
    }
    // Repalce the old version of the item with the new one if we updated one that already exists
    else {
      allLegionCharacters[editingLegionCharacter.legionCharacterHash] = editingLegionCharacter;
    }
    notifyListeners();
  }

  void changeActiveSet(int legionSetPosition) {
    activeSetNumber = legionSetPosition;
    activeLegionSet = legionSets[legionSetPosition]!;

    notifyListeners();
  }
}