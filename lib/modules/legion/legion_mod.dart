import 'dart:math';

import 'package:flutter/material.dart';
import 'package:maplestory_builder/constants/character/legion_stats.dart';
import 'package:maplestory_builder/constants/constants.dart';
import 'package:maplestory_builder/modules/utilities/utilities.dart';

enum CalculationSelector {
  all,
  board,
  characters,
  ;
}

class LegionModule {
  // Used to track the characters placed on the board
  late List<int> placedCharacters;
  // Used to track the highest level character for each block
  late Map<LegionBlock, int?> legionCharacters;
  LegionCharacter? Function(int? legionCharacterHash) getLegionCharacterCallback;
  LegionBoardRank? Function() getLegionBoardRankCallback;
  // This will be used to track the direct stats added via the board
  late Map<StatType, int> legionBoardStatLevels;
  int maximumBoardCoverage = 0;

  Map<StatType, num>? cacheValue;
  Widget hoverTooltip = const SizedBox.shrink();

  LegionModule({
    List<int>? placedCharacters,
    Map<LegionBlock, int?>? legionCharacters,
    Map<StatType, int>? legionBoardStatLevels,
    required this.getLegionCharacterCallback,
    required this.getLegionBoardRankCallback,
  }) {
    this.legionBoardStatLevels = legionBoardStatLevels ?? {
      StatType.attack: 0,
      StatType.mattack: 0,
      StatType.str: 0,
      StatType.dex: 0,
      StatType.int: 0,
      StatType.luk: 0,
      StatType.hp: 0,
      StatType.mp: 0,
      StatType.critDamage: 0,
      StatType.bossDamage: 0,
      StatType.ignoreDefense: 0,
      StatType.critRate: 0,
      StatType.buffDuration: 0,
      StatType.damageNormalMobs: 0,
      StatType.statusResistance: 0,
      StatType.expAdditional: 0,
    };
    this.placedCharacters = placedCharacters ?? [];
    this.legionCharacters = legionCharacters ?? _buildLegionMapping();
    calculateMaximumBoardCoverage();
  }

  LegionModule copyWith({
    List<int>? placedCharacters,
    Map<LegionBlock, int?>? legionCharacters,
    Map<StatType, int>? legionBoardStatLevels,
    LegionCharacter? Function(int?)? getLegionCharacterCallback,
    LegionBoardRank? Function()? getLegionBoardRankCallback,
  }) {
    return LegionModule(
      placedCharacters: placedCharacters ?? List<int>.of(this.placedCharacters),
      legionCharacters: legionCharacters ?? Map<LegionBlock, int?>.of(this.legionCharacters),
      legionBoardStatLevels: legionBoardStatLevels ?? Map<StatType, int>.of(this.legionBoardStatLevels),
      getLegionCharacterCallback: getLegionCharacterCallback ?? this.getLegionCharacterCallback,
      getLegionBoardRankCallback: getLegionBoardRankCallback ?? this.getLegionBoardRankCallback
    );
  }

  void registerCharacterCallback(LegionCharacter? Function(int?) function) {
    getLegionCharacterCallback = function;
  }

  
  void registerBoardCallback(LegionBoardRank? Function() function) {
    getLegionBoardRankCallback = function;
  }

  (StatType, num) _getLegionCharacterValue(LegionCharacter legionCharacter) {

    var legionBlock = legionCharacter.legionBlock;
    var indexValue = legionCharacter.characterLevelToIndex();
    if (indexValue != null) {
      return (legionBlock.legionEffect.$1, legionBlock.legionEffect.$2[indexValue]);
    }
    else {
      return (StatType.allStats, 0);
    }
  }

  Map<StatType, num> calculateModuleStats({CalculationSelector calculationSelector = CalculationSelector.all}) {
    Map<StatType, num> legionStats = {};

    if (calculationSelector == CalculationSelector.all && cacheValue != null) {
      return cacheValue!;
    }

    if ({CalculationSelector.all, CalculationSelector.board}.contains(calculationSelector)) {
      for (MapEntry<StatType, int> statEntry in legionBoardStatLevels.entries) {
        legionStats[statEntry.key] = LegionBoardRank.boardStatPerLevel[statEntry.key]! * statEntry.value;
      }
    }

    if ({CalculationSelector.all, CalculationSelector.characters}.contains(calculationSelector)) {
      for (MapEntry<LegionBlock, int?> legionCharacterEntry in legionCharacters.entries) {
        if (legionCharacterEntry.value == null) {
          continue;
        }

        var legionCharacter = getLegionCharacterCallback(legionCharacterEntry.value);
        if (legionCharacter == null) {
          continue;
        }

        var statValue = _getLegionCharacterValue(legionCharacter);

        switch(legionCharacterEntry.key.legionEffect.$1) {
          case StatType.ignoreDefense:
            legionStats[statValue.$1] = calculateIgnoreDefense((legionStats[statValue.$1] ?? 0), statValue.$2);
          default:
            legionStats[statValue.$1] = (legionStats[statValue.$1] ?? 0) + statValue.$2;
        }
      }
    }

    return legionStats;
  }

  num _getSingleBoardStatValue(StatType statType) {
    return LegionBoardRank.boardStatPerLevel[statType]! * (legionBoardStatLevels[statType] ?? 0);
  }

  void calculateMaximumBoardCoverage() {
    maximumBoardCoverage = 0;

    for (int legionCharacterHash in placedCharacters) {
      var legionCharacter = getLegionCharacterCallback(legionCharacterHash);
      maximumBoardCoverage += legionCharacter?.characterLevelToPieceSize() ?? 0;
    }
  }

  int get currentBoardCoverage {
    return legionBoardStatLevels.values.fold(0, (previous, current) => previous + current);
  }

  List<LegionCharacter> getPlacedCharacters() {
    List<LegionCharacter> returnValue = [];

    for (int legionCharacterHash in placedCharacters) {
      var legionCharacter = getLegionCharacterCallback(legionCharacterHash);
      if (legionCharacter != null) {
        returnValue.add(legionCharacter);
      }
    }

    return returnValue;
  }

  bool addLegionStatLevels(int levelsToAdd, StatType statType, {bool isOuterBoard = false}) {
    var legionBoardRank = getLegionBoardRankCallback();
    var currentCoverage = currentBoardCoverage;

    if (legionBoardRank == null || currentCoverage == maximumBoardCoverage) {
      return false;
    }

    var currentStatLevel = legionBoardStatLevels[statType]!;

    if (isOuterBoard) {
      if (legionBoardStatLevels[statType]! == legionBoardRank.outerRegionAmount) {
        return false;
      }

      levelsToAdd = min(maximumBoardCoverage - currentCoverage, levelsToAdd);
      levelsToAdd = min(legionBoardRank.outerRegionAmount - currentStatLevel, levelsToAdd);
    }
    else {
      if (legionBoardStatLevels[statType]! == legionBoardRank.innerRegionAmount) {
        return false;
      }

      levelsToAdd = min(maximumBoardCoverage - currentCoverage, levelsToAdd);
      levelsToAdd = min(legionBoardRank.innerRegionAmount - currentStatLevel, levelsToAdd);
    }

    
    legionBoardStatLevels[statType] = legionBoardStatLevels[statType]! + levelsToAdd;

    cacheValue = null;
    return true;
  }

  bool subtractLegionStatLevels(int levelsToSubtract, StatType statType, {bool isOuterBoard = false}) {
    var currentStatLevel = legionBoardStatLevels[statType]!;
    
    if (currentStatLevel == 0) {
      return false;
    }

    levelsToSubtract = min(currentStatLevel, levelsToSubtract);
    legionBoardStatLevels[statType] = legionBoardStatLevels[statType]! - levelsToSubtract;

    cacheValue = null;
    return true;
  }

  bool placeLegionCharacter(LegionCharacter? legionCharacter) {
    // Only place the same character once
    if (legionCharacter == null || placedCharacters.contains(legionCharacter.legionCharacterHash)) {
      return false;
    }
    // Only place characters up to the maximum allowed by the board rank
    var legionBoardRank = getLegionBoardRankCallback();
    if (legionBoardRank == null || legionBoardRank.legionMembers == placedCharacters.length) {
      return false;
    }

    placedCharacters.add(legionCharacter.legionCharacterHash);

    calculateMaximumBoardCoverage();

    var currentHighestLevel = getLegionCharacterCallback(legionCharacters[legionCharacter.legionBlock]);
    if (currentHighestLevel == null || currentHighestLevel.legionCharacterLevel < legionCharacter.legionCharacterLevel) {
      legionCharacters[legionCharacter.legionBlock] = legionCharacter.legionCharacterHash;
    }

    return true;
  }

  bool removeLegionCharacter(LegionCharacter? removingLegionCharacter) {
    if (removingLegionCharacter == null) {
      return false;
    }

    // Remove the hash from our tracked hashes
    placedCharacters.remove(removingLegionCharacter.legionCharacterHash);
    // Check that the character we are deleting is the highest level character for the legion block,
    // if it is then we find the next highest level for the legion block we just removed (if any)
    var activeLegionBlock = legionCharacters[removingLegionCharacter.legionBlock];
    if (activeLegionBlock == removingLegionCharacter.legionCharacterHash) {
      LegionCharacter? currentHighestLevel;
      for (int placedLegionHash in placedCharacters) {
        var newLegionCharacter = getLegionCharacterCallback(placedLegionHash);
        if (newLegionCharacter == null) {
          continue;
        }
        else if ((newLegionCharacter.legionBlock == removingLegionCharacter.legionBlock) && (newLegionCharacter.legionCharacterLevel >= (currentHighestLevel?.legionCharacterLevel ?? 0))) {
          currentHighestLevel = newLegionCharacter;
        }
      }

      legionCharacters[removingLegionCharacter.legionBlock] = currentHighestLevel?.legionCharacterHash;
    }

    calculateMaximumBoardCoverage();

    return true;
  }

  void getHoverStatTooltipText(StatType statType) {
    Widget? statDescription;
    Widget? currentLevelText;
    Widget? nextLevelText;
    
    String buildLevelString() {
      var statValue = _getSingleBoardStatValue(statType);
      return "~ ${statType.formattedName}: ${statType.isPositive ? '+' : ' -'}${statType.isPercentage ? doublePercentFormater.format(statValue) : statValue}";
    }

    int currentCoverage = legionBoardStatLevels[statType]!;

    currentLevelText = Text("Current Board Coverage ($currentCoverage Blocks):\n${buildLevelString()}");

    hoverTooltip = Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        statDescription ?? const SizedBox.shrink(),
        currentLevelText,
        nextLevelText ?? const SizedBox.shrink()
      ],
    );
  }

  static Map<LegionBlock, int?> _buildLegionMapping() {
    Map<LegionBlock, int?> legionBlocks = {};
    for (LegionBlock legionBlock in LegionBlock.values) {
      legionBlocks[legionBlock] = null;
    }

    return legionBlocks;
  }
}

class LegionCharacter {
  LegionBlock legionBlock;
  int legionCharacterLevel;
  int legionCharacterHash;

  LegionCharacter({
    required this.legionBlock,
    this.legionCharacterLevel = 0,
    this.legionCharacterHash = -1
  });

  LegionCharacter copyWith({
    LegionBlock? legionBlock,
    int? legionCharacterLevel,
    int? legionCharacterHash,
  }) {
    return LegionCharacter(
      legionBlock: legionBlock ?? this.legionBlock,
      legionCharacterLevel: legionCharacterLevel ?? this.legionCharacterLevel,
      legionCharacterHash: legionCharacterHash ?? this.legionCharacterHash,
    );
  }

  Widget createLegionCharacterContainer(BuildContext context) {
    return const SizedBox.shrink();
  }

  static int comparator(LegionCharacter a, LegionCharacter b) {
    if (a.legionCharacterLevel < b.legionCharacterLevel) {
      return 1;
    }
    else if (a.legionCharacterLevel < b.legionCharacterLevel) {
      return -1;
    }
    else {
      return 0;
    }
  }

  int? characterLevelToIndex() {
    if (legionBlock == LegionBlock.zero) {
      if (130 <= legionCharacterLevel && legionCharacterLevel <= 159) {
        return 0;
      }
      else if (160 <= legionCharacterLevel && legionCharacterLevel <= 179) {
        return 1;
      }
      else if (180 <= legionCharacterLevel && legionCharacterLevel <= 199) {
        return 2;
      }
      else if (200 <= legionCharacterLevel && legionCharacterLevel <= 249) {
        return 3;
      }
      else if (250 <= legionCharacterLevel) {
        return 4;
      }
      else {
        return null;
      }
    }
    else {
      if (60 <= legionCharacterLevel && legionCharacterLevel <= 99) {
        return 0;
      }
      else if (100 <= legionCharacterLevel && legionCharacterLevel <= 139) {
        return 1;
      }
      else if (140 <= legionCharacterLevel && legionCharacterLevel <= 199) {
        return 2;
      }
      else if (200 <= legionCharacterLevel && legionCharacterLevel <= 249) {
        return 3;
      }
      else if (250 <= legionCharacterLevel) {
        return 4;
      }
      else {
        return null;
      }
    }
  }

  int characterLevelToPieceSize() {
    var statIndex = characterLevelToIndex();
    if (statIndex == null) {
      return 0;
    }
    else {
      return statIndex + 1;
    }
  }

  String characterLevelToRank() {
    var rankIndex = characterLevelToIndex();
    if (rankIndex == null) {
      return LegionBlock.legionBlockRanks[0];
    }
    else {
      return LegionBlock.legionBlockRanks[rankIndex + 1];
    }
  }
}