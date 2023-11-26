import 'package:flutter/material.dart';
import 'package:maplestory_builder/constants/character/legion_stats.dart';
import 'package:maplestory_builder/constants/character/symbols_stats.dart';
import 'package:maplestory_builder/constants/constants.dart';

import 'package:maplestory_builder/modules/utilities/utilities.dart';
import 'package:maplestory_builder/providers/character/character_provider.dart';

class LegionStatsProvider with ChangeNotifier{

  CharacterProvider characterProvider;
  Map<int, LegionCharacter> allLegionCharacters;
  Map<LegionBlock, int?> legionCharacters;
  // 0 is a reserved hash, for the character this whole program is about
  int legionCharacterHash = 1;

  Map<StatType, num>? cacheValue;
  Widget hoverTooltip = const SizedBox.shrink();

  LegionStatsProvider({
    required this.characterProvider,
    this.legionCharacterHash = 1,
    Map<int, LegionCharacter>? allLegionCharacters,
    Map<LegionBlock, int?>? legionCharacters,
  }) : 
    allLegionCharacters = allLegionCharacters ?? {
      0: LegionCharacter(
        legionBlock: characterProvider.characterClass.legionBlock,
        legionCharacterLevel: characterProvider.characterLevel,
        legionHash: 0,
      )
    },
    legionCharacters = legionCharacters ?? _buildLegionMapping(characterProvider.characterClass.legionBlock)
    ;

  LegionStatsProvider copyWith({
    CharacterProvider? characterProvider,
    Map<int, LegionCharacter>? allLegionCharacters,
    Map<LegionBlock, int>? legionCharacters,
    int? legionCharacterHash,
  }) {
    return LegionStatsProvider(
      characterProvider: characterProvider ?? this.characterProvider.copyWith(),
      allLegionCharacters: allLegionCharacters ?? this.allLegionCharacters, // TODO: deepcopy
      legionCharacters: legionCharacters ?? Map.of(this.legionCharacters),
      legionCharacterHash: legionCharacterHash ?? this.legionCharacterHash,
    );
  }

  LegionStatsProvider update(CharacterProvider characterProvider) {
    cacheValue = null;
    calculateStats();
    notifyListeners();
    return this;
  }

  Map<StatType, num> calculateStats() {
    if (cacheValue != null) {
      return cacheValue!;
    }
    else {
      cacheValue = getAllStatValues();
      return cacheValue!;
    }
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

  Map<StatType, num> getAllStatValues() {
    Map<StatType, num> legionStats = {};

      for (MapEntry<LegionBlock, int?> legionCharacterEntry in legionCharacters.entries) {
        if (legionCharacterEntry.value == null) {
          continue;
        }

        var legionCharacter = allLegionCharacters[legionCharacterEntry.value];
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


  void getHoverTooltipText({ArcaneSymbol? arcaneSymbol, SacredSymbol? sacredSymbol}) {
    Widget? statDescription;
    Widget? currentLevelText;
    Widget? nextLevelText;
    
    String buildLevelString({int additionalLevels = 0}) {
      List<String> returnParts = [];
      var statValue = null;
      for (MapEntry<StatType, num> symbolStatValue in statValue.entries) {
        returnParts.add("~ ${symbolStatValue.key.formattedName}: ${symbolStatValue.key.isPositive ? '+' : ' -'}${symbolStatValue.key.isPercentage ? doublePercentFormater.format(symbolStatValue.value) : symbolStatValue.value}");
      }

      return returnParts.join("\n");
    }

    int currentLevel = 1;

    currentLevelText = Text("Current Level ($currentLevel):\n${buildLevelString()}");

    hoverTooltip = Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        statDescription ?? const SizedBox.shrink(),
        currentLevelText,
        nextLevelText ?? const SizedBox.shrink()
      ],
    );
  }

  static Map<LegionBlock, int?> _buildLegionMapping(LegionBlock legionBlockToAdd) {
    Map<LegionBlock, int?> legionBlocks = {};
    for (LegionBlock legionBlock in LegionBlock.values) {
      if (legionBlock == legionBlockToAdd) {
        legionBlocks[legionBlockToAdd] = 0;
      }
      else {
        legionBlocks[legionBlock] = null;
      }
    }

    return legionBlocks;
  }
}

class LegionCharacter {
  LegionBlock legionBlock;
  int legionCharacterLevel;
  int legionHash;

  LegionCharacter({
    required this.legionBlock,
    required this.legionCharacterLevel,
    this.legionHash = -1
  });

  LegionCharacter copyWith({
    LegionBlock? legionBlock,
    int? legionCharacterLevel,
    int? legionHash,
  }) {
    return LegionCharacter(
      legionBlock: legionBlock ?? this.legionBlock,
      legionCharacterLevel: legionCharacterLevel ?? this.legionCharacterLevel,
      legionHash: legionHash ?? this.legionHash,
    );
  }
}
