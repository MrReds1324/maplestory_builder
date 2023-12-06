import 'dart:math';

import 'package:flutter/material.dart';
import 'package:maplestory_builder/constants/character/hyper_stats.dart';
import 'package:maplestory_builder/constants/constants.dart';
import 'package:maplestory_builder/modules/base.dart';
import 'package:maplestory_builder/modules/utilities/utilities.dart';
import 'package:maplestory_builder/providers/character/character_provider.dart';

class HyperStatsProvider with ChangeNotifier implements Copyable {
  CharacterProvider characterProvider;
  int totalAvailableHyperStats = 0;
  int activeSetNumber = 1;
  late Map<int, HyperStatContainer> hyperStatsSets; 
  late HyperStatContainer activeHyperStat;

  Widget hoverTooltip = const SizedBox.shrink();

  int get availableHyperStats {
    return totalAvailableHyperStats - activeHyperStat.totalAssignedHyperStats;
  }

  HyperStatsProvider({
    required this.characterProvider,
    this.totalAvailableHyperStats = 0,
    this.activeSetNumber = 1,
    HyperStatContainer? activeHyperStat,
    Map<int, HyperStatContainer>? hyperStatsSets,
  }) {
    this.hyperStatsSets = hyperStatsSets ?? {
      1: HyperStatContainer(),
      2: HyperStatContainer(),
      3: HyperStatContainer(),
      4: HyperStatContainer(),
      5: HyperStatContainer(),
    };
    this.activeHyperStat = activeHyperStat ?? this.hyperStatsSets[activeSetNumber]!;
  }

  @override
  HyperStatsProvider copyWith({
    CharacterProvider? characterProvider,
    int? totalAvailableHyperStats,
    int? activeSetNumber,
    HyperStatContainer? activeHyperStat,
    Map<int, HyperStatContainer>? hyperStatsSets,
  }) {
    return HyperStatsProvider(
      characterProvider: characterProvider ?? this.characterProvider.copyWith(),
      totalAvailableHyperStats: totalAvailableHyperStats ?? this.totalAvailableHyperStats,
      activeSetNumber: activeSetNumber ?? this.activeSetNumber,
      activeHyperStat: activeHyperStat ?? this.activeHyperStat.copyWith(),
      hyperStatsSets: hyperStatsSets ?? mapDeepCopy(this.hyperStatsSets),
    );
  }

  HyperStatsProvider update(CharacterProvider characterProvider) {
    setAvailableHyperStatsFromLevel(characterProvider.characterLevel);
    notifyListeners();
    return this;
  }

  num getStatValue(StatType statType, {int additionalLevels = 0}) {
      switch(statType) {
        case StatType.specialMana:
          var divisor = 1; // TODO - update this to divide by 10 when kinesis class
          return hyperStatsValues[statType]![activeHyperStat.assignedHyperStats[statType]! + additionalLevels] ~/ divisor;
        default:
          return hyperStatsValues[statType]![activeHyperStat.assignedHyperStats[statType]! + additionalLevels];
      }
    }

  Map<StatType, num> calculateStats() {
    return {
      StatType.finalStr: getStatValue(StatType.str),
      StatType.finalDex: getStatValue(StatType.dex),
      StatType.finalInt: getStatValue(StatType.int),
      StatType.finalLuk: getStatValue(StatType.luk),
      StatType.hpPercentage: getStatValue(StatType.hp),
      StatType.mpPercentage: getStatValue(StatType.mp),
      StatType.specialMana: getStatValue(StatType.specialMana),
      StatType.critRate: getStatValue(StatType.critRate),
      StatType.critDamage: getStatValue(StatType.critDamage),
      StatType.ignoreDefense: getStatValue(StatType.ignoreDefense),
      StatType.damage: getStatValue(StatType.damage),
      StatType.bossDamage: getStatValue(StatType.bossDamage),
      StatType.damageNormalMobs: getStatValue(StatType.damageNormalMobs),
      StatType.statusResistance: getStatValue(StatType.statusResistance),
      StatType.attackMattack: getStatValue(StatType.attackMattack),
      StatType.expAdditional: getStatValue(StatType.exp),
      StatType.arcaneForce: getStatValue(StatType.arcaneForce),
    };
  }

  void setAvailableHyperStatsFromLevel(int characterLevel) {
    totalAvailableHyperStats = levelToTotalHyperStatPoints[characterLevel] ?? 0;
    notifyListeners();
  }

  void addHyperStats(int possibleLevelsToAdd, StatType statType) {
    var currentLevel = activeHyperStat.assignedHyperStats[statType]!;
    var maxLevel = hyperStatsValues[statType]!.length - 1;

    // Check that we are not at the max level yet
    if (currentLevel == maxLevel) {
      return;
    }

    // Start by calculating the minimum levels we could even add due to the level restrictions
    possibleLevelsToAdd = min(possibleLevelsToAdd, maxLevel - currentLevel);

    // Then figure out if we even have enough points for each level, reduce down to the smallest levels we can add if possible
    var costToUpgrade = 0;
    var possibleLevelsToAddByPoints = 0;

    for (possibleLevelsToAddByPoints; possibleLevelsToAddByPoints < possibleLevelsToAdd; possibleLevelsToAddByPoints++) {
      var costOfLevel = hyperStatsLevelToPoints[currentLevel + possibleLevelsToAddByPoints + 1]!;
      if (costOfLevel <= (availableHyperStats - costToUpgrade)) {
        costToUpgrade += costOfLevel;
      }
      else {
        break;
      }
    }

    if (possibleLevelsToAddByPoints == 0) {
      return;
    }
    else {
      activeHyperStat.totalAssignedHyperStats += costToUpgrade;
      activeHyperStat.assignedHyperStats[statType] = activeHyperStat.assignedHyperStats[statType]! + possibleLevelsToAddByPoints;
      notifyListeners();
    }
  }

  void subtractHyperStats(int possibleLevelsToSubtract, StatType statType) {
    var currentLevel = activeHyperStat.assignedHyperStats[statType]!;

    // Check that we are not at the min level yet
    if (currentLevel == 0) {
      return;
    }

    // Start by calculating the minimum levels we could even subtract due to the level restrictions
    possibleLevelsToSubtract = min(possibleLevelsToSubtract, currentLevel);

    // Refund all the points used to upgrade a stat
    var downgradeCost = 0;

    for (int i = 0; i < possibleLevelsToSubtract; i++) {
      var costOfLevel = hyperStatsLevelToPoints[currentLevel - i]!;
      downgradeCost += costOfLevel;
    }

    activeHyperStat.totalAssignedHyperStats -= downgradeCost;
    activeHyperStat.assignedHyperStats[statType] = activeHyperStat.assignedHyperStats[statType]! - possibleLevelsToSubtract;
    notifyListeners();
    
  }

  void changeActiveSet(int hyperStatPosition) {
    activeSetNumber = hyperStatPosition;
    activeHyperStat = hyperStatsSets[hyperStatPosition]!;

    notifyListeners();
  }

  void getHoverTooltipText(StatType statType) {
    const Set<StatType> overrides = {StatType.hp, StatType.mp};
    Widget? statDescription;
    Widget? currentLevelText;
    Widget? nextLevelText;
    
    var maxLevel = hyperStatsValues[statType]!.length - 1;
    var currentLevel = activeHyperStat.assignedHyperStats[statType]!;

    switch(statType) {
      case StatType.specialMana:
        statDescription = const Text("Zero - Time Force: +10\nDemon Slayer - Demon Fury: +10\nKinesis - Psychic Points: +1\nKanna - Mana: +10\n");
        currentLevelText = Text("Current Level ($currentLevel):\n~ ${statType.formattedName}: ${statType.isPositive ? '+' : ' -'}${statType.isPercentage ? doublePercentFormater.format(getStatValue(statType)) : getStatValue(statType)}");
        if (currentLevel != maxLevel) {
          nextLevelText = Text("Next Level (${currentLevel + 1}):\n~ ${statType.formattedName}:  ${statType.isPositive ? '+' : ' -'}${statType.isPercentage ? doublePercentFormater.format(getStatValue(statType, additionalLevels: 1)) : getStatValue(statType, additionalLevels: 1)}");
        }
      default:
        currentLevelText = Text("Current Level ($currentLevel):\n~ ${statType.formattedName}:  ${statType.isPositive ? '+' : ' -'}${statType.isPercentage || overrides.contains(statType) ? doublePercentFormater.format(getStatValue(statType)) : getStatValue(statType)}");
        if (currentLevel != maxLevel) {
          nextLevelText = Text("Next Level (${currentLevel + 1}):\n~ ${statType.formattedName}:  ${statType.isPositive ? '+' : ' -'}${statType.isPercentage || overrides.contains(statType) ? doublePercentFormater.format(getStatValue(statType, additionalLevels: 1)) : getStatValue(statType, additionalLevels: 1)}");
        }
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


class HyperStatContainer implements Copyable {
  int totalAssignedHyperStats = 0;
  late Map<StatType, int> assignedHyperStats;

  HyperStatContainer({
    this.totalAssignedHyperStats = 0,
    Map<StatType, int>? assignedHyperStats,
  }) {
  this.assignedHyperStats = assignedHyperStats ?? {
      StatType.str: 0,
      StatType.dex: 0,
      StatType.int: 0,
      StatType.luk: 0,
      StatType.hp: 0,
      StatType.mp: 0,
      StatType.specialMana: 0,
      StatType.critRate: 0,
      StatType.critDamage: 0,
      StatType.ignoreDefense: 0,
      StatType.damage: 0,
      StatType.bossDamage: 0,
      StatType.damageNormalMobs: 0,
      StatType.statusResistance: 0,
      StatType.attackMattack: 0,
      StatType.exp: 0,
      StatType.arcaneForce: 0,
    };
  }

  @override
  HyperStatContainer copyWith({
    int? totalAssignedHyperStats,
    Map<StatType, int>? assignedHyperStats,
  }) {
    return HyperStatContainer(
      totalAssignedHyperStats: totalAssignedHyperStats ?? this.totalAssignedHyperStats,
      assignedHyperStats: assignedHyperStats ?? Map.of(this.assignedHyperStats)
    );
  }
}