import 'dart:math';

import 'package:flutter/material.dart';
import 'package:maplestory_builder/constants/character/hyper_stats.dart';
import 'package:maplestory_builder/constants/constants.dart';
import 'package:maplestory_builder/modules/utilities/utilities.dart';

class HyperStatsProvider with ChangeNotifier {
  int totalAvailableHyperStats = 0;
  int totalAssignedHyperStats = 0;
  late Map<StatType, int> assignedHyperStats;
  Widget hoverTooltip = const SizedBox.shrink();

  int get availableHyperStats {
    return totalAvailableHyperStats - totalAssignedHyperStats;
  }

  HyperStatsProvider({
    this.totalAvailableHyperStats = 0,
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

  HyperStatsProvider copyWith({
    int? totalAvailableHyperStats,
    int? totalAssignedHyperStats,
    Map<StatType, int>? assignedHyperStats,
  }) {
    return HyperStatsProvider(
      totalAvailableHyperStats: totalAvailableHyperStats ?? this.totalAvailableHyperStats,
      totalAssignedHyperStats: totalAssignedHyperStats ?? this.totalAssignedHyperStats,
      assignedHyperStats: assignedHyperStats ?? Map<StatType, int>.of(this.assignedHyperStats),
    );
  }

  num getStatValue(StatType statType, {int additionalLevels = 0}) {
      return hyperStatsValues[statType]![assignedHyperStats[statType]! + additionalLevels];
    }

  Map<StatType, num> calculateModuleStats() {
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
      StatType.exp: getStatValue(StatType.exp),
      StatType.arcaneForce: getStatValue(StatType.arcaneForce),
    };
  }

  void setAvailableHyperStatsFromLevel(int characterLevel) {
    totalAvailableHyperStats = levelToTotalHyperStatPoints[characterLevel] ?? 0;
    notifyListeners();
  }

  void addHyperStats(int possibleLevelsToAdd, StatType statType) {
    var currentLevel = assignedHyperStats[statType]!;
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
      totalAssignedHyperStats += costToUpgrade;
      assignedHyperStats[statType] = assignedHyperStats[statType]! + possibleLevelsToAddByPoints;
      notifyListeners();
    }
  }

  void subtractHyperStats(int possibleLevelsToSubtract, StatType statType) {
    var currentLevel = assignedHyperStats[statType]!;

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

    totalAssignedHyperStats -= downgradeCost;
    assignedHyperStats[statType] = assignedHyperStats[statType]! - possibleLevelsToSubtract;
    notifyListeners();
    
  }

  void getHoverTooltipText(StatType statType) {
    Widget? currentLevelText;
    Widget? nextLevelText;
    
    var maxLevel = hyperStatsValues[statType]!.length - 1;
    var currentLevel = assignedHyperStats[statType]!;

    switch(statType) {
      default:
        currentLevelText = Text("Current Level (${assignedHyperStats[statType]}): ${statType.isPositive ? '+' : ' -'}${statType.isPercentage ? doublePercentFormater.format(getStatValue(statType)) : getStatValue(statType)} ${statType.formattedName}");
        if (currentLevel != maxLevel) {
          nextLevelText = Text("Next Level (${assignedHyperStats[statType]! + 1}): ${statType.isPositive ? '+' : ' -'}${statType.isPercentage ? doublePercentFormater.format(getStatValue(statType, additionalLevels: 1)) : getStatValue(statType, additionalLevels: 1)} ${statType.formattedName}");
        }
    }

    hoverTooltip = Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        currentLevelText ?? const SizedBox.shrink(),
        nextLevelText ?? const SizedBox.shrink()
      ],
    );
  }
}
