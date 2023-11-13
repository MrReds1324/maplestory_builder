import 'dart:math';

import 'package:flutter/material.dart';
import 'package:maplestory_builder/constants/character/hyper_stats.dart';
import 'package:maplestory_builder/constants/constants.dart';

class HyperStatsProvider with ChangeNotifier {
  int totalAvailableHyperStats = 0;
  int availableHyperStats = 0;
  int totalAssignedHyperStats = 0;

  late Map<StatType, int> assignedHyperStats;

  HyperStatsProvider({
    this.totalAvailableHyperStats = 0,
    this.availableHyperStats = 0,
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
      StatType.attack: 0, // This technically raises both attack and magic attack
      StatType.exp: 0,
      StatType.arcaneForce: 0,
    };
  }

  HyperStatsProvider copyWith({
    int? totalAvailableHyperStats,
    int? availableHyperStats,
    int? totalAssignedHyperStats,
    Map<StatType, int>? assignedHyperStats,
  }) {
    return HyperStatsProvider(
      totalAvailableHyperStats: totalAvailableHyperStats ?? this.totalAvailableHyperStats,
      availableHyperStats: availableHyperStats ?? this.availableHyperStats,
      totalAssignedHyperStats: totalAssignedHyperStats ?? this.totalAssignedHyperStats,
      assignedHyperStats: assignedHyperStats ?? Map<StatType, int>.of(this.assignedHyperStats),
    );
  }

  Map<StatType, num> calculateModuleStats() {
    return {
      StatType.finalStr: 0,
      StatType.finalDex: 0,
      StatType.finalInt: 0,
      StatType.finalLuk: 0,
      StatType.hpPercentage: 0,
      StatType.mpPercentage: 0,
      StatType.specialMana: 0,
      StatType.critRate: 0,
      StatType.critDamage: 0,
      StatType.ignoreDefense: 0,
      StatType.damage: 0,
      StatType.bossDamage: 0,
      StatType.damageNormalMobs: 0,
      StatType.statusResistance: 0,
      StatType.attack: 0,
      StatType.mattack: 0,
      StatType.exp: 0,
      StatType.arcaneForce: 0,
    };
  }

  void setAvailableHyperStatsFromLevel(int characterLevel) {
    totalAvailableHyperStats = levelToTotalHyperStatPoints[characterLevel] ?? 0;
  }

  void addHyperStats(int levelsToAdd, StatType statType) {
    var currentLevel = assignedHyperStats[statType]!;
    var maxLevel = hyperStatsValues[statType]!.length - 1;

    // Check that we are not at the max level yet
    if (currentLevel == maxLevel) {
      return;
    }

    // Start by calculating the minimum levels we could even add due to the level restrictions
    levelsToAdd = min(levelsToAdd, maxLevel - currentLevel);

    // Then figure out if we even have enough points for each level, reduce down to the smallest levels we can add if possible
    var costToUpgrade = 0;

    for (int i = 1; i <= levelsToAdd; i++) {
      var costOfLevel = hyperStatsLevelToPoints[currentLevel + i]!;
      if (costOfLevel <= (availableHyperStats - costToUpgrade)) {
        costToUpgrade += costOfLevel;
      }
      else {
        break;
      }
    }

    if (costToUpgrade == 0) {
      return;
    }
    else {
      
    }


  }

  void subtractHyperStats(int levelsToSubtract, StatType statType) {
    var currentLevel = assignedHyperStats[statType]!;

    // Check that we are not at the min level yet
    if (currentLevel == 0) {
      return;
    }
  }
}
