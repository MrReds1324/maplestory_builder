import 'package:flutter/material.dart';
import 'package:maplestory_builder/constants/character/classes.dart';
import 'package:maplestory_builder/constants/character/symbols_stats.dart';
import 'package:maplestory_builder/constants/character/trait_stats.dart';
import 'package:maplestory_builder/constants/constants.dart';
import 'dart:math';

import 'package:maplestory_builder/modules/utilities/utilities.dart';
import 'package:maplestory_builder/providers/character_provider.dart';

class SymbolStatsProvider with ChangeNotifier{

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
      Map<StatType, num> symbolStats = {};

      for (MapEntry<ArcaneSymbol, int> arcaneSymbolEntry in arcaneSymbolLevels.entries) {
        if (arcaneSymbolEntry.value == 0) {
          continue;
        }
        var levelValues = _getSymbolStatValues(arcaneSymbol: arcaneSymbolEntry.key);
        // Do all the Level 1 stats first
        for (MapEntry<StatType, int> statEntry in levelValues[1]!.entries) {
          symbolStats[statEntry.key] = (symbolStats[statEntry.key] ?? 0) + statEntry.value;
        }

        // Do all the level 2-20 stats next
        for (MapEntry<StatType, int> statEntry in levelValues[2]!.entries) {
          symbolStats[statEntry.key] = (symbolStats[statEntry.key] ?? 0) + (statEntry.value * (arcaneSymbolEntry.value - 1));
        }
      }

      for (MapEntry<SacredSymbol, int> sacredSymbolEntry in sacredSymbolLevels.entries) {
        if (sacredSymbolEntry.value == 0) {
          continue;
        }
        var levelValues = _getSymbolStatValues(sacredSymbol: sacredSymbolEntry.key);

        // Do all the Level 1 stats first
        for (MapEntry<StatType, int> statEntry in levelValues[1]!.entries) {
          symbolStats[statEntry.key] = (symbolStats[statEntry.key] ?? 0) + statEntry.value;
        }

        // Do all the level 2-11 stats next
        for (MapEntry<StatType, int> statEntry in levelValues[2]!.entries) {
          symbolStats[statEntry.key] = (symbolStats[statEntry.key] ?? 0) + (statEntry.value * (sacredSymbolEntry.value - 1));
        }
      }

      cacheValue = symbolStats;
      return symbolStats;
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

        level1Stats[convertedStatType] = level1Target[CharacterClass.beginner]![StatType.allStats]!;
        levelOtherStats[convertedStatType] = levelOtherTarget[CharacterClass.beginner]![StatType.allStats]!;
    }

    return returnValue;
  }

  Map<StatType, num> getStatValues(TraitName traitName, {int additionalLevels = 0}) {
    Map<StatType, num> traitStats = {};

    for(MapEntry<StatType, (num, int)> traitStat in traitName.traitEffect.entries) {
      traitStats[traitStat.key] = traitStat.value.$1 * ((arcaneSymbolLevels[traitName]! + additionalLevels) / traitStat.value.$2).floor();
    }

    return traitStats;
  }

  void addArcaneLevels(int levelAmount, ArcaneSymbol arcaneSymbol) {
    var currentArcaneLevel = arcaneSymbolLevels[arcaneSymbol]!;
    
    if (currentArcaneLevel == 20) {
      return;
    }

    levelAmount = min(100 - currentArcaneLevel, levelAmount);
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
    
    if (currentSacredLevel == 11) {
      return;
    }

    levelAmount = min(100 - currentSacredLevel, levelAmount);
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

  void getHoverTooltipText(TraitName traitName) {
    // TODO: implement this
    Widget? statDescription;
    Widget? currentLevelText;
    Widget? nextLevelText;
    
    String buildLevelString({int additionalLevels = 0}) {
      List<String> returnParts = [];
      var statValue = getStatValues(traitName, additionalLevels: additionalLevels);
      for (MapEntry<StatType, num> traitValue in statValue.entries) {
        returnParts.add("~ ${traitValue.key.formattedName}: ${traitValue.key.isPositive ? '+' : ' -'}${traitValue.key.isPercentage ? doublePercentFormater.format(traitValue.value) : traitValue.value}");
      }

      return returnParts.join("\n");
    }

    var currentLevel = arcaneSymbolLevels[traitName]!;

    currentLevelText = Text("Current Level ($currentLevel):\n${buildLevelString()}");
    if (currentLevel != 100) {
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
