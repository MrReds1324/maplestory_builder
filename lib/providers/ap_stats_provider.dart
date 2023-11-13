import 'package:flutter/material.dart';
import 'package:maplestory_builder/constants/constants.dart';
import 'dart:math';

class APStatsProvider with ChangeNotifier{
  // All relavent to calculating ap stats and ap usage
  int totalAvailableAP = 14; // 14 + 5 * CharacterLevel
  int availableAP = 14;
  int assignedAP = 0;

  // Each ap into HP/MP increases by 15
  int apAssignedHP = 0;
  int apAssignedMP = 0;

  late Map<StatType, int> apStats;

  APStatsProvider({
    this.totalAvailableAP = 14,
    this.availableAP = 14,
    this.assignedAP = 0,
    this.apAssignedHP = 0,
    this.apAssignedMP = 0,
    Map<StatType, int>? apStats,
  }) {
    this.apStats = apStats ?? {
      StatType.hp: 395, // Demon Avenger is 395 + (90 * pointsHP)
      StatType.mp: 395,
      // Each ap into Stats increase by 1
      StatType.str: 4,
      StatType.dex: 4,
      StatType.int: 4,
      StatType.luk: 4,
    };
  }

  APStatsProvider copyWith({
    int? totalAvailableAP,
    int? availableAP,
    int? assignedAP,
    int? apAssignedHP,
    int? apAssignedMP,
    Map<StatType, int>? apStats,
  }) {
    return APStatsProvider(
      totalAvailableAP: totalAvailableAP ?? this.totalAvailableAP,
      availableAP: availableAP ?? this.availableAP,
      assignedAP: assignedAP ?? this.assignedAP,
      apAssignedHP: apAssignedHP ?? this.apAssignedHP,
      apAssignedMP: apAssignedMP ?? this.apAssignedMP,
      apStats: apStats ?? Map<StatType, int>.of(this.apStats),
    );
  }

  Map<StatType, int> calculateStats() {
    return apStats;
  }

  void setAvailableAPFromLevel(int characterLevel) {
    totalAvailableAP = 14 + characterLevel * 5;
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
        if (currentApAmount == 4) {
          return;
        }
        apAmount = min(currentApAmount - 4, apAmount);
        apStats[statType] = apStats[statType]! - apAmount;
    }
    availableAP += apAmount;
    assignedAP -= apAmount;
    notifyListeners();
  }
}
