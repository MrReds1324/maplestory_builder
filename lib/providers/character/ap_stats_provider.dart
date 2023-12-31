import 'package:flutter/material.dart';
import 'package:maplestory_builder/constants/constants.dart';
import 'package:maplestory_builder/modules/base.dart';
import 'dart:math';

import 'package:maplestory_builder/providers/character/character_provider.dart';

class APStatsProvider with ChangeNotifier implements Copyable {
  CharacterProvider characterProvider;
  // All relavent to calculating ap stats and ap usage
  int totalAvailableAP; // 14 + 5 * CharacterLevel
  int availableAP;
  int assignedAP;

  // Each ap into HP/MP increases by 15
  int apAssignedHP;
  int apAssignedMP;

  late Map<StatType, int> apStats;

  APStatsProvider({
    required this.characterProvider,
    this.totalAvailableAP = STARTING_AP_AMOUNT,
    this.availableAP = STARTING_AP_AMOUNT,
    this.assignedAP = 0,
    this.apAssignedHP = 0,
    this.apAssignedMP = 0,
    Map<StatType, int>? apStats,
  }) {
    this.apStats = apStats ?? {
      StatType.hp: 395, // Demon Avenger is 395 + (90 * pointsHP)
      StatType.mp: 213,
      // Each ap into Stats increase by 1
      StatType.str: MINIMUM_AP_AMOUNT,
      StatType.dex: MINIMUM_AP_AMOUNT,
      StatType.int: MINIMUM_AP_AMOUNT,
      StatType.luk: MINIMUM_AP_AMOUNT,
    };
  }

  @override
  APStatsProvider copyWith({
    CharacterProvider? characterProvider,
    int? totalAvailableAP,
    int? availableAP,
    int? assignedAP,
    int? apAssignedHP,
    int? apAssignedMP,
    Map<StatType, int>? apStats,
  }) {
    return APStatsProvider(
      characterProvider: characterProvider ?? this.characterProvider.copyWith(),
      totalAvailableAP: totalAvailableAP ?? this.totalAvailableAP,
      availableAP: availableAP ?? this.availableAP,
      assignedAP: assignedAP ?? this.assignedAP,
      apAssignedHP: apAssignedHP ?? this.apAssignedHP,
      apAssignedMP: apAssignedMP ?? this.apAssignedMP,
      apStats: apStats ?? Map<StatType, int>.of(this.apStats),
    );
  }

  APStatsProvider update(CharacterProvider characterProvider) {
    setAvailableAPFromLevel(characterProvider.characterLevel);
    notifyListeners();
    return this;
  }

  Map<StatType, int> calculateStats() {
    return apStats;
  }

  void setAvailableAPFromLevel(int characterLevel) {
    totalAvailableAP = STARTING_AP_AMOUNT + characterLevel * AP_PER_LEVEL;
    availableAP = totalAvailableAP - assignedAP;
  }

  void addApToStat(int apAmount, StatType statType) {
    apAmount = min(availableAP, apAmount);
    if (apAmount <= 0) {
      return;
    }
    availableAP -= apAmount;
    assignedAP += apAmount;
    switch (statType) {
      case StatType.hp:
        apAssignedHP += apAmount;
        apStats[StatType.hp] = 395 + (apAssignedHP * 15);
      case StatType.mp:
        apAssignedMP += apAmount;
        apStats[StatType.mp] = 395 + (apAssignedMP * 15);
      default:
        apStats[statType] = apStats[statType]! + apAmount;
    }
    notifyListeners();
  }

  void subtractApToStat(int apAmount, StatType statType) {
    apAmount = min(assignedAP, apAmount);

    switch (statType) {
      case StatType.hp:
        apAmount = min(apAssignedHP, apAmount);
        apAssignedHP -= apAmount;
        apStats[StatType.hp] = 395 + (apAssignedHP * 15);
      case StatType.mp:
        apAmount = min(apAssignedMP, apAmount);
        apAssignedMP -= apAmount;
        apStats[StatType.mp] = 395 + (apAssignedMP * 15);
      // Cannot go below 4 points in these stats
      default:
        var currentApAmount = apStats[statType]!;
        if (currentApAmount == MINIMUM_AP_AMOUNT) {
          return;
        }
        apAmount = min(currentApAmount - MINIMUM_AP_AMOUNT, apAmount);
        apStats[statType] = apStats[statType]! - apAmount;
    }
    availableAP += apAmount;
    assignedAP -= apAmount;
    notifyListeners();
  }
}
