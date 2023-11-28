import 'dart:math';

import 'package:flutter/material.dart';
import 'package:maplestory_builder/constants/character/legion_stats.dart';
import 'package:maplestory_builder/constants/constants.dart';
import 'package:maplestory_builder/modules/utilities/utilities.dart';

class LegionModule {
  // Used to track the characters placed on the board
  List<int> placedCharacters;
  // Used to track the highest level character for each block
  Map<LegionBlock, int?> legionCharacters;
  LegionCharacter? Function(int? legionCharacterHash) getLegionCharacterCallback;
  LegionBoardRank? Function() getLegionBoardRankCallback;
  // This will be used to track the direct stats added via the board
  Map<StatType, int> legionBoardStatLevels;

  Map<StatType, num>? cacheValue;
  Widget hoverTooltip = const SizedBox.shrink();

  LegionModule({
    List<int>? placedCharacters,
    Map<LegionBlock, int?>? legionCharacters,
    Map<StatType, int>? legionBoardStatLevels,
    required this.getLegionCharacterCallback,
    required this.getLegionBoardRankCallback,
  }) :
    legionBoardStatLevels = legionBoardStatLevels ?? {
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
    },
    placedCharacters = placedCharacters ?? [],
    legionCharacters = legionCharacters ?? _buildLegionMapping();


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
    var indexValue = legionBlock.characterLevelToIndex(legionCharacter.legionCharacterLevel);
    if (indexValue != null) {
      return (legionBlock.legionEffect.$1, legionBlock.legionEffect.$2[indexValue]);
    }
    else {
      return (StatType.allStats, 0);
    }
  }

  Map<StatType, num> calculateModuleStats() {
    Map<StatType, num> legionStats = {};

    for (MapEntry<StatType, int> statEntry in legionBoardStatLevels.entries) {
      legionStats[statEntry.key] = LegionBoardRank.boardStatPerLevel[statEntry.key]! * statEntry.value;
    }

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

    return legionStats;
  }

  num _getSingleBoardStatValue(StatType statType) {
    return LegionBoardRank.boardStatPerLevel[statType]! * (legionBoardStatLevels[statType] ?? 0);
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

    if (legionBoardRank == null) {
      return false;
    }

    var currentStatLevel = legionBoardStatLevels[statType]!;

    if (isOuterBoard) {
      if (legionBoardStatLevels[statType]! == legionBoardRank.outerRegionAmount) {
        return false;
      }

      levelsToAdd = min(legionBoardRank.outerRegionAmount - currentStatLevel, levelsToAdd);
    }
    else {
      if (legionBoardStatLevels[statType]! == legionBoardRank.innerRegionAmount) {
        return false;
      }

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
    var activeLegionBlock = legionCharacters[removingLegionCharacter.legionBlock]!;
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
}