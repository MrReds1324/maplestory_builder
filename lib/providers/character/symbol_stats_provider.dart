import 'package:flutter/material.dart';
import 'package:maplestory_builder/constants/character/classes.dart';
import 'package:maplestory_builder/constants/character/symbols_stats.dart';
import 'package:maplestory_builder/constants/constants.dart';
import 'package:maplestory_builder/modules/base.dart';
import 'dart:math';

import 'package:maplestory_builder/modules/utilities/utilities.dart';
import 'package:maplestory_builder/providers/character/character_provider.dart';

// ignore: constant_identifier_names
const int LEVEL_1 = 1;
// ignore: constant_identifier_names
const int LEVEL_OTHER = 2;

class SymbolStatsProvider with ChangeNotifier implements Copyable {

  CharacterProvider characterProvider;
  Map<ArcaneSymbol, int> arcaneSymbolLevels;
  Map<SacredSymbol, int> sacredSymbolLevels;
  Map<StatType, num>? cacheValue;

  Widget hoverTooltip = const SizedBox.shrink();

  SymbolStatsProvider({
    required this.characterProvider,
    Map<ArcaneSymbol, int>? arcaneSymbolLevels,
    Map<SacredSymbol, int>? sacredSymbolLevels,
  }) : 
    arcaneSymbolLevels = arcaneSymbolLevels ?? {
      ArcaneSymbol.vanishingJourney: 0,
      ArcaneSymbol.chuchuIsland: 0,
      ArcaneSymbol.lachelein: 0,
      ArcaneSymbol.arcana: 0,
      ArcaneSymbol.morass: 0,
      ArcaneSymbol.esfera: 0,
    },
    sacredSymbolLevels = sacredSymbolLevels ?? {
      SacredSymbol.cernium: 0,
      SacredSymbol.arcus: 0,
      SacredSymbol.odium: 0,
      SacredSymbol.shangrila: 0,
      SacredSymbol.arteria: 0,
      SacredSymbol.carcion: 0,
    }
    ;

  @override
  SymbolStatsProvider copyWith({
    CharacterProvider? characterProvider,
    Map<ArcaneSymbol, int>? arcaneSymbolLevels,
    Map<SacredSymbol, int>? sacredSymbolLevels,
  }) {
    return SymbolStatsProvider(
      characterProvider: characterProvider ?? this.characterProvider.copyWith(),
      arcaneSymbolLevels: arcaneSymbolLevels ?? Map<ArcaneSymbol, int>.of(this.arcaneSymbolLevels),
      sacredSymbolLevels: sacredSymbolLevels ?? Map<SacredSymbol, int>.of(this.sacredSymbolLevels),
    );
  }

  SymbolStatsProvider update(CharacterProvider characterProvider) {
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

  Map<int, Map<StatType, int>> _getSymbolStatValues({ArcaneSymbol? arcaneSymbol, SacredSymbol? sacredSymbol}) {
    Map<StatType, int> level1Stats = {};
    Map<StatType, int> levelOtherStats = {};

    Map<int, Map<StatType, int>> returnValue = {
      1: level1Stats,
      2: levelOtherStats,
    };

    Map<CharacterClass, Map<StatType, int>> level1Target;
    Map<CharacterClass, Map<StatType, int>> levelOtherTarget;

    if (arcaneSymbol != null) {
      level1Stats[StatType.arcaneForce] = ArcaneSymbol.level1ArcaneForce;
      levelOtherStats[StatType.arcaneForce] = ArcaneSymbol.levelOtherArcaneForce;

      level1Target = ArcaneSymbol.level1Stats;
      levelOtherTarget = ArcaneSymbol.levelOtherStats; 
    }
    else if (sacredSymbol != null) {
      level1Stats[StatType.sacredPower] = SacredSymbol.level1SacredPower;
      levelOtherStats[StatType.sacredPower] = SacredSymbol.levelOtherSacredPower;

      level1Target = SacredSymbol.level1Stats;
      levelOtherTarget = SacredSymbol.levelOtherStats; 
    }
    else {
      return returnValue;
    }

    switch(characterProvider.characterClass) {
      case CharacterClass.xenon:
      case CharacterClass.demonAvenger:
        level1Stats.addAll(level1Target[characterProvider.characterClass]!);
        levelOtherStats.addAll(levelOtherTarget[characterProvider.characterClass]!);
      default:
        // Figure out the main stat
        var mainStat = determinePrimaryStat(characterProvider.characterClass.calculationStats);
        StatType convertedStatType;
        switch(mainStat) {
          case StatType.str:
            convertedStatType = StatType.finalStr;
          case StatType.dex:
            convertedStatType = StatType.finalDex;
          case StatType.int:
            convertedStatType = StatType.finalInt;
          case StatType.luk:
            convertedStatType = StatType.finalLuk;
          default:
            throw Exception("Main Stat is not a valid Stat Type");                
        }

        level1Stats[convertedStatType] = level1Target[CharacterClass.beginner]![StatType.mainStat]!;
        levelOtherStats[convertedStatType] = levelOtherTarget[CharacterClass.beginner]![StatType.mainStat]!;
    }

    return returnValue;
  }

  Map<StatType, num> getAllStatValues() {
    Map<StatType, num> symbolStats = {};

      for (MapEntry<ArcaneSymbol, int> arcaneSymbolEntry in arcaneSymbolLevels.entries) {
        if (arcaneSymbolEntry.value == 0) {
          continue;
        }
        var levelValues = _getSymbolStatValues(arcaneSymbol: arcaneSymbolEntry.key);
        // Do all the Level 1 stats first
        for (MapEntry<StatType, int> statEntry in levelValues[LEVEL_1]!.entries) {
          symbolStats[statEntry.key] = (symbolStats[statEntry.key] ?? 0) + statEntry.value;
        }

        // Do all the level 2-20 stats next
        for (MapEntry<StatType, int> statEntry in levelValues[LEVEL_OTHER]!.entries) {
          symbolStats[statEntry.key] = (symbolStats[statEntry.key] ?? 0) + (statEntry.value * (arcaneSymbolEntry.value - 1));
        }
      }

      for (MapEntry<SacredSymbol, int> sacredSymbolEntry in sacredSymbolLevels.entries) {
        if (sacredSymbolEntry.value == 0) {
          continue;
        }
        var levelValues = _getSymbolStatValues(sacredSymbol: sacredSymbolEntry.key);

        // Do all the Level 1 stats first
        for (MapEntry<StatType, int> statEntry in levelValues[LEVEL_1]!.entries) {
          symbolStats[statEntry.key] = (symbolStats[statEntry.key] ?? 0) + statEntry.value;
        }

        // Do all the level 2-11 stats next
        for (MapEntry<StatType, int> statEntry in levelValues[LEVEL_OTHER]!.entries) {
          symbolStats[statEntry.key] = (symbolStats[statEntry.key] ?? 0) + (statEntry.value * (sacredSymbolEntry.value - 1));
        }
      }

      
      return symbolStats;
  }

  Map<StatType, num> getSingleSymbolStatValue({ArcaneSymbol? arcaneSymbol, SacredSymbol? sacredSymbol, int additionalLevels = 0}) {
    Map<StatType, num> symbolStats = {};

      if (arcaneSymbol != null) {
        if ((arcaneSymbolLevels[arcaneSymbol]! + additionalLevels) == 0) {
          return symbolStats;
        }
        var levelValues = _getSymbolStatValues(arcaneSymbol: arcaneSymbol);
        // Do all the Level 1 stats first
        for (MapEntry<StatType, int> statEntry in levelValues[LEVEL_1]!.entries) {
          symbolStats[statEntry.key] = (symbolStats[statEntry.key] ?? 0) + statEntry.value;
        }

        // Do all the level 2-20 stats next
        for (MapEntry<StatType, int> statEntry in levelValues[LEVEL_OTHER]!.entries) {
          symbolStats[statEntry.key] = (symbolStats[statEntry.key] ?? 0) + (statEntry.value * (arcaneSymbolLevels[arcaneSymbol]! + additionalLevels - 1));
        }
      }

      if (sacredSymbol != null) {
        if ((sacredSymbolLevels[sacredSymbol]! + additionalLevels) == 0) {
          return symbolStats;
        }
        var levelValues = _getSymbolStatValues(sacredSymbol: sacredSymbol);

        // Do all the Level 1 stats first
        for (MapEntry<StatType, int> statEntry in levelValues[LEVEL_1]!.entries) {
          symbolStats[statEntry.key] = (symbolStats[statEntry.key] ?? 0) + statEntry.value;
        }

        // Do all the level 2-11 stats next
        for (MapEntry<StatType, int> statEntry in levelValues[LEVEL_OTHER]!.entries) {
          symbolStats[statEntry.key] = (symbolStats[statEntry.key] ?? 0) + (statEntry.value * (sacredSymbolLevels[sacredSymbol]! + additionalLevels - 1));
        }
      }

      return symbolStats;
  }

  void addArcaneLevels(int levelAmount, ArcaneSymbol arcaneSymbol) {
    var currentArcaneLevel = arcaneSymbolLevels[arcaneSymbol]!;
    
    if (currentArcaneLevel == ArcaneSymbol.maxLevel) {
      return;
    }

    levelAmount = min(ArcaneSymbol.maxLevel - currentArcaneLevel, levelAmount);
    arcaneSymbolLevels[arcaneSymbol] = arcaneSymbolLevels[arcaneSymbol]! + levelAmount;

    cacheValue = null;
    notifyListeners();
  }

  void subtractArcaneLevels(int levelAmount, ArcaneSymbol arcaneSymbol) {
    var currentArcaneLevel = arcaneSymbolLevels[arcaneSymbol]!;
    
    if (currentArcaneLevel == 0) {
      return;
    }

    levelAmount = min(currentArcaneLevel, levelAmount);
    arcaneSymbolLevels[arcaneSymbol] = arcaneSymbolLevels[arcaneSymbol]! - levelAmount;

    cacheValue = null;
    notifyListeners();
  }

  void addSacredLevels(int levelAmount, SacredSymbol sacredSymbol) {
    var currentSacredLevel = sacredSymbolLevels[sacredSymbol]!;
    
    if (currentSacredLevel == SacredSymbol.maxLevel) {
      return;
    }

    levelAmount = min(SacredSymbol.maxLevel - currentSacredLevel, levelAmount);
    sacredSymbolLevels[sacredSymbol] = sacredSymbolLevels[sacredSymbol]! + levelAmount;

    cacheValue = null;
    notifyListeners();
  }

  void subtractSacredLevels(int levelAmount, SacredSymbol sacredSymbol) {
    var currentSacredLevel = sacredSymbolLevels[sacredSymbol]!;
    
    if (currentSacredLevel == 0) {
      return;
    }

    levelAmount = min(currentSacredLevel, levelAmount);
    sacredSymbolLevels[sacredSymbol] = sacredSymbolLevels[sacredSymbol]! - levelAmount;

    cacheValue = null;
    notifyListeners();
  }

  void getHoverTooltipText({ArcaneSymbol? arcaneSymbol, SacredSymbol? sacredSymbol}) {
    Widget? statDescription;
    Widget? currentLevelText;
    Widget? nextLevelText;
    
    String buildLevelString({int additionalLevels = 0}) {
      List<String> returnParts = [];
      var statValue = getSingleSymbolStatValue(arcaneSymbol: arcaneSymbol, sacredSymbol: sacredSymbol, additionalLevels: additionalLevels);
      for (MapEntry<StatType, num> symbolStatValue in statValue.entries) {
        returnParts.add("~ ${symbolStatValue.key.formattedName}: ${symbolStatValue.key.isPositive ? '+' : ' -'}${symbolStatValue.key.isPercentage ? doublePercentFormater.format(symbolStatValue.value) : symbolStatValue.value}");
      }

      return returnParts.join("\n");
    }

    int currentLevel;
    int maxLevel;
    if (arcaneSymbol != null) {
      maxLevel = ArcaneSymbol.maxLevel;
      currentLevel = arcaneSymbolLevels[arcaneSymbol]!;
    }
    else {
      maxLevel = SacredSymbol.maxLevel;
      currentLevel = sacredSymbolLevels[sacredSymbol]!;
    }

    currentLevelText = Text("Current Level ($currentLevel):\n${buildLevelString()}");

    if (currentLevel != maxLevel) {
      nextLevelText = Text("Next Level (${currentLevel + 1}):\n${buildLevelString(additionalLevels: 1)}");
    }

    hoverTooltip = Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        statDescription ?? const SizedBox.shrink(),
        currentLevelText,
        nextLevelText ?? const SizedBox.shrink()
      ],
    );
  }
}
