import 'dart:math';

import 'package:flutter/material.dart';
import 'package:maplestory_builder/constants/character/classes.dart';
import 'package:maplestory_builder/constants/character/symbols_stats.dart';
import 'package:maplestory_builder/constants/constants.dart';
import 'package:maplestory_builder/modules/base.dart';
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
  Map<GrandSacredSymbol, int> grandSacredSymbolLevels;
  Map<StatType, num>? cacheValue;

  Widget hoverTooltip = const SizedBox.shrink();

  SymbolStatsProvider({
    required this.characterProvider,
    Map<ArcaneSymbol, int>? arcaneSymbolLevels,
    Map<SacredSymbol, int>? sacredSymbolLevels,
    Map<GrandSacredSymbol, int>? grandSacredSymbolLevels,
  })  : arcaneSymbolLevels = arcaneSymbolLevels ??
            {
              ArcaneSymbol.vanishingJourney: 0,
              ArcaneSymbol.chuchuIsland: 0,
              ArcaneSymbol.lachelein: 0,
              ArcaneSymbol.arcana: 0,
              ArcaneSymbol.morass: 0,
              ArcaneSymbol.esfera: 0,
            },
        sacredSymbolLevels = sacredSymbolLevels ??
            {
              SacredSymbol.cernium: 0,
              SacredSymbol.arcus: 0,
              SacredSymbol.odium: 0,
              SacredSymbol.shangrila: 0,
              SacredSymbol.arteria: 0,
              SacredSymbol.carcion: 0,
            },
        grandSacredSymbolLevels = grandSacredSymbolLevels ??
            {
              GrandSacredSymbol.tallahart: 0,
            };

  @override
  SymbolStatsProvider copyWith({
    CharacterProvider? characterProvider,
    Map<ArcaneSymbol, int>? arcaneSymbolLevels,
    Map<SacredSymbol, int>? sacredSymbolLevels,
    Map<GrandSacredSymbol, int>? grandSacredSymbolLevels,
  }) {
    return SymbolStatsProvider(
      characterProvider: characterProvider ?? this.characterProvider.copyWith(),
      arcaneSymbolLevels: arcaneSymbolLevels ??
          Map<ArcaneSymbol, int>.of(this.arcaneSymbolLevels),
      sacredSymbolLevels: sacredSymbolLevels ??
          Map<SacredSymbol, int>.of(this.sacredSymbolLevels),
      grandSacredSymbolLevels: grandSacredSymbolLevels ??
          Map<GrandSacredSymbol, int>.of(this.grandSacredSymbolLevels),
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
    } else {
      cacheValue = getAllStatValues();
      return cacheValue!;
    }
  }

  Map<int, Map<StatType, num>> _getSymbolStatValues<T extends Enum>(T symbol) {
    Map<StatType, int> level1Stats = {};
    Map<StatType, int> levelOtherStats = {};

    Map<int, Map<StatType, num>> returnValue = {
      1: level1Stats,
      2: levelOtherStats,
    };

    Map<CharacterClass, Map<StatType, int>> level1Target;
    Map<CharacterClass, Map<StatType, int>> levelOtherTarget;

    if (symbol is ArcaneSymbol) {
      level1Stats[StatType.arcaneForce] = ArcaneSymbol.LEVEL_1_ARCANE_FORCE;
      levelOtherStats[StatType.arcaneForce] =
          ArcaneSymbol.LEVEL_OTHER_ARCANE_FORCE;

      level1Target = ArcaneSymbol.LEVEL_1_STATS;
      levelOtherTarget = ArcaneSymbol.LEVEL_OTHER_STATS;
    } else if (symbol is SacredSymbol) {
      level1Stats[StatType.sacredPower] = SacredSymbol.LEVEL_1_SACRED_POWER;
      levelOtherStats[StatType.sacredPower] =
          SacredSymbol.LEVEL_OTHER_SACRED_POWER;

      level1Target = SacredSymbol.LEVEL_1_STATS;
      levelOtherTarget = SacredSymbol.LEVEL_OTHER_STATS;
    } else if (symbol is GrandSacredSymbol) {
      level1Stats[StatType.sacredPower] =
          GrandSacredSymbol.LEVEL_1_SACRED_POWER;
      levelOtherStats[StatType.sacredPower] =
          GrandSacredSymbol.LEVEL_OTHER_SACRED_POWER;

      returnValue[1] = GrandSacredSymbol.LEVEL_1_STATS;
      returnValue[2] = GrandSacredSymbol.LEVEL_OTHER_STATS;
      return returnValue;
    } else {
      return returnValue;
    }

    switch (characterProvider.characterClass) {
      case CharacterClass.xenon:
      case CharacterClass.demonAvenger:
        level1Stats.addAll(level1Target[characterProvider.characterClass]!);
        levelOtherStats
            .addAll(levelOtherTarget[characterProvider.characterClass]!);
      default:
        // Figure out the main stat
        var mainStat = determinePrimaryStat(
            characterProvider.characterClass.calculationStats);
        StatType convertedStatType;
        switch (mainStat) {
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

        level1Stats[convertedStatType] =
            level1Target[CharacterClass.beginner]![StatType.mainStat]!;
        levelOtherStats[convertedStatType] =
            levelOtherTarget[CharacterClass.beginner]![StatType.mainStat]!;
    }

    return returnValue;
  }

  Map<StatType, num> getAllStatValues() {
    Map<StatType, num> symbolStats = {};

    for (MapEntry<ArcaneSymbol, int> arcaneSymbolEntry
        in arcaneSymbolLevels.entries) {
      if (arcaneSymbolEntry.value == 0) {
        continue;
      }
      var levelValues = _getSymbolStatValues(arcaneSymbolEntry.key);
      // Do all the Level 1 stats first
      for (MapEntry<StatType, num> statEntry in levelValues[LEVEL_1]!.entries) {
        symbolStats[statEntry.key] =
            (symbolStats[statEntry.key] ?? 0) + statEntry.value;
      }

      // Do all the level 2-20 stats next
      for (MapEntry<StatType, num> statEntry
          in levelValues[LEVEL_OTHER]!.entries) {
        symbolStats[statEntry.key] = (symbolStats[statEntry.key] ?? 0) +
            (statEntry.value * (arcaneSymbolEntry.value - 1));
      }
    }

    for (MapEntry<SacredSymbol, int> sacredSymbolEntry
        in sacredSymbolLevels.entries) {
      if (sacredSymbolEntry.value == 0) {
        continue;
      }
      var levelValues = _getSymbolStatValues(sacredSymbolEntry.key);

      // Do all the Level 1 stats first
      for (MapEntry<StatType, num> statEntry in levelValues[LEVEL_1]!.entries) {
        symbolStats[statEntry.key] =
            (symbolStats[statEntry.key] ?? 0) + statEntry.value;
      }

      // Do all the level 2-11 stats next
      for (MapEntry<StatType, num> statEntry
          in levelValues[LEVEL_OTHER]!.entries) {
        symbolStats[statEntry.key] = (symbolStats[statEntry.key] ?? 0) +
            (statEntry.value * (sacredSymbolEntry.value - 1));
      }
    }

    for (MapEntry<GrandSacredSymbol, int> grandSacredSymbolEntry
        in grandSacredSymbolLevels.entries) {
      if (grandSacredSymbolEntry.value == 0) {
        continue;
      }
      var levelValues = _getSymbolStatValues(grandSacredSymbolEntry.key);

      // Do all the Level 1 stats first
      for (MapEntry<StatType, num> statEntry in levelValues[LEVEL_1]!.entries) {
        symbolStats[statEntry.key] =
            (symbolStats[statEntry.key] ?? 0) + statEntry.value;
      }

      // Do all the level 2-11 stats next
      for (MapEntry<StatType, num> statEntry
          in levelValues[LEVEL_OTHER]!.entries) {
        symbolStats[statEntry.key] = (symbolStats[statEntry.key] ?? 0) +
            (statEntry.value * (grandSacredSymbolEntry.value - 1));
      }
    }

    return symbolStats;
  }

  Map<StatType, num> getSingleSymbolStatValue<T extends Enum>(T symbol,
      {int additionalLevels = 0}) {
    Map<StatType, num> symbolStats = {};

    if (symbol is ArcaneSymbol) {
      if ((arcaneSymbolLevels[symbol]! + additionalLevels) == 0) {
        return symbolStats;
      }
      var levelValues = _getSymbolStatValues(symbol);
      // Do all the Level 1 stats first
      for (MapEntry<StatType, num> statEntry in levelValues[LEVEL_1]!.entries) {
        symbolStats[statEntry.key] =
            (symbolStats[statEntry.key] ?? 0) + statEntry.value;
      }

      // Do all the level 2-20 stats next
      for (MapEntry<StatType, num> statEntry
          in levelValues[LEVEL_OTHER]!.entries) {
        symbolStats[statEntry.key] = (symbolStats[statEntry.key] ?? 0) +
            (statEntry.value *
                (arcaneSymbolLevels[symbol]! + additionalLevels - 1));
      }
    } else if (symbol is SacredSymbol) {
      if ((sacredSymbolLevels[symbol]! + additionalLevels) == 0) {
        return symbolStats;
      }
      var levelValues = _getSymbolStatValues(symbol);

      // Do all the Level 1 stats first
      for (MapEntry<StatType, num> statEntry in levelValues[LEVEL_1]!.entries) {
        symbolStats[statEntry.key] =
            (symbolStats[statEntry.key] ?? 0) + statEntry.value;
      }

      // Do all the level 2-11 stats next
      for (MapEntry<StatType, num> statEntry
          in levelValues[LEVEL_OTHER]!.entries) {
        symbolStats[statEntry.key] = (symbolStats[statEntry.key] ?? 0) +
            (statEntry.value *
                (sacredSymbolLevels[symbol]! + additionalLevels - 1));
      }
    } else if (symbol is GrandSacredSymbol) {
      if ((grandSacredSymbolLevels[symbol]! + additionalLevels) == 0) {
        return symbolStats;
      }
      var levelValues = _getSymbolStatValues(symbol);

      // Do all the Level 1 stats first
      for (MapEntry<StatType, num> statEntry in levelValues[LEVEL_1]!.entries) {
        symbolStats[statEntry.key] =
            (symbolStats[statEntry.key] ?? 0) + statEntry.value;
      }

      // Do all the level 2-11 stats next
      for (MapEntry<StatType, num> statEntry
          in levelValues[LEVEL_OTHER]!.entries) {
        symbolStats[statEntry.key] = (symbolStats[statEntry.key] ?? 0) +
            (statEntry.value *
                (grandSacredSymbolLevels[symbol]! + additionalLevels - 1));
      }
    }

    return symbolStats;
  }

  void addSymbolLevels<T extends Enum>(int levelAmount, T symbol) {
    Map<Enum, int> targetMap = {};
    int maxLevel = 0;
    if (symbol is ArcaneSymbol) {
      targetMap = arcaneSymbolLevels;
      maxLevel = ArcaneSymbol.MAX_LEVEL;
    } else if (symbol is SacredSymbol) {
      targetMap = sacredSymbolLevels;
      maxLevel = SacredSymbol.MAX_LEVEL;
    } else if (symbol is GrandSacredSymbol) {
      targetMap = grandSacredSymbolLevels;
      maxLevel = GrandSacredSymbol.MAX_LEVEL;
    }

    var currentLevel = targetMap[symbol]!;

    if (currentLevel == maxLevel) {
      return;
    }

    levelAmount = min(maxLevel - currentLevel, levelAmount);
    targetMap[symbol] = targetMap[symbol]! + levelAmount;

    cacheValue = null;
    notifyListeners();
  }

  void subtractSymbolLevels<T extends Enum>(int levelAmount, T symbol) {
    Map<Enum, int> targetMap = {};
    if (symbol is ArcaneSymbol) {
      targetMap = arcaneSymbolLevels;
    } else if (symbol is SacredSymbol) {
      targetMap = sacredSymbolLevels;
    } else if (symbol is GrandSacredSymbol) {
      targetMap = grandSacredSymbolLevels;
    }

    var currentLevel = targetMap[symbol]!;

    if (currentLevel == 0) {
      return;
    }

    levelAmount = min(currentLevel, levelAmount);
    targetMap[symbol] = targetMap[symbol]! - levelAmount;

    cacheValue = null;
    notifyListeners();
  }

  void getHoverTooltipText<T extends Enum>(T symbol) {
    Widget? statDescription;
    Widget? currentLevelText;
    Widget? nextLevelText;

    String buildLevelString({int additionalLevels = 0}) {
      List<String> returnParts = [];
      var statValue =
          getSingleSymbolStatValue(symbol, additionalLevels: additionalLevels);
      for (MapEntry<StatType, num> symbolStatValue in statValue.entries) {
        returnParts.add(
            "~ ${symbolStatValue.key.formattedName}: ${symbolStatValue.key.isPositive ? '+' : ' -'}${symbolStatValue.key.isPercentage ? doublePercentFormater.format(symbolStatValue.value) : symbolStatValue.value}");
      }

      return returnParts.join("\n");
    }

    int currentLevel = 0;
    int maxLevel = 0;
    if (symbol is ArcaneSymbol) {
      maxLevel = ArcaneSymbol.MAX_LEVEL;
      currentLevel = arcaneSymbolLevels[symbol]!;
    } else if (symbol is SacredSymbol) {
      maxLevel = SacredSymbol.MAX_LEVEL;
      currentLevel = sacredSymbolLevels[symbol]!;
    } else if (symbol is GrandSacredSymbol) {
      maxLevel = GrandSacredSymbol.MAX_LEVEL;
      currentLevel = grandSacredSymbolLevels[symbol]!;
    }

    currentLevelText =
        Text("Current Level ($currentLevel):\n${buildLevelString()}");

    if (currentLevel != maxLevel) {
      nextLevelText = Text(
          "Next Level (${currentLevel + 1}):\n${buildLevelString(additionalLevels: 1)}");
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
