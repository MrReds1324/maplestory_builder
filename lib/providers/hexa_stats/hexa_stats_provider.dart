import 'package:flutter/material.dart';
import 'package:maplestory_builder/constants/constants.dart';
import 'package:maplestory_builder/modules/base.dart';
import 'package:maplestory_builder/modules/hexa_stats.dart/hexa_stat.dart';
import 'package:maplestory_builder/modules/hexa_stats.dart/hexa_stats_mod.dart';
import 'package:maplestory_builder/modules/utilities/utilities.dart';

class HexaStatsProvider with ChangeNotifier implements Copyable {
  // This is what we are going to use to set the equips hash value once it is saved here so that when 
  // rebuilding from json we can ensure the items stay "linked"
  int hexaStatId;
  late Map<int, HexaStat> allHexaStats;

  int activeHexaStatsSetNumber;
  late Map<int, HexaStatsModule> hexaStatsSets; 
  late HexaStatsModule activeHexaStatsSet;

  HexaStatsProvider({
    this.hexaStatId = 1,
    this.activeHexaStatsSetNumber = 1,
    Map<int, HexaStat>? allHexaStats,
    Map<int, HexaStatsModule>? hexaStatsSets,
    HexaStatsModule? activeHexaStatsSet,
  }) {
    this.allHexaStats = allHexaStats ?? {};

    this.hexaStatsSets = hexaStatsSets ?? {
      1: HexaStatsModule(getHexaStatCallback: getHexaStatsCallback),
      2: HexaStatsModule(getHexaStatCallback: getHexaStatsCallback),
      3: HexaStatsModule(getHexaStatCallback: getHexaStatsCallback),
      4: HexaStatsModule(getHexaStatCallback: getHexaStatsCallback),
      5: HexaStatsModule(getHexaStatCallback: getHexaStatsCallback),
    };
    this.activeHexaStatsSet = activeHexaStatsSet ?? this.hexaStatsSets[activeHexaStatsSetNumber]!;
  }

  @override
  HexaStatsProvider copyWith({
    int? hexaStatId,
    Map<int, HexaStat>? allHexaStats,
    int? activeHexaStatsSetNumber,
    Map<int, HexaStatsModule>? hexaStatsSets,
    HexaStatsModule? activeHexaStatsSet,
  }) {
    return HexaStatsProvider(
      hexaStatId: hexaStatId ?? this.hexaStatId,
      allHexaStats: allHexaStats ?? Map.of(this.allHexaStats),
      activeHexaStatsSetNumber: activeHexaStatsSetNumber ?? this.activeHexaStatsSetNumber,
      hexaStatsSets: hexaStatsSets ?? mapDeepCopy(this.hexaStatsSets),
      activeHexaStatsSet: activeHexaStatsSet ?? this.activeHexaStatsSet.copyWith()
    );
  }

  HexaStat? getHexaStatsCallback(int? hexaStatId) {
    return allHexaStats[hexaStatId];
  }

  Map<StatType, num> calculateStats() {
    return activeHexaStatsSet.calculateStats();
  }

  void equipHexaStat(HexaStat? hexaStat, int hexaStatPosition) {
    activeHexaStatsSet.equipHexaStat(hexaStat, hexaStatPosition);
    notifyListeners();
  }

  void saveEditingHexaStat(HexaStat? editingHexaStat) {
    // Nothing to actually save, return immediately
    if (editingHexaStat == null) {
      return;
    }
    
    // New familiar that cannot be equipped
    if (editingHexaStat.hexaStatId == -1) {
      editingHexaStat.hexaStatId = hexaStatId;
      editingHexaStat.hexaStatName = editingHexaStat.hexaStatName.isEmpty ? "Hexa Stat $hexaStatId" : editingHexaStat.hexaStatName;
      allHexaStats[editingHexaStat.hexaStatId] = editingHexaStat;
      hexaStatId++;
    }
    // Repalce the old version of the familiar with the new one if we updated one that already exists
    else {
      allHexaStats[editingHexaStat.hexaStatId] = editingHexaStat;
    }

    for (HexaStatsModule hexaStatsModule in hexaStatsSets.values) {
      hexaStatsModule.cacheValue = null;
    }

    notifyListeners();
  }

  void deleteHexaStat(HexaStat deletingHexaStat) {
    allHexaStats.remove(deletingHexaStat.hexaStatId);
    for (HexaStatsModule hexaStatsModule in hexaStatsSets.values) {
      hexaStatsModule.deleteHexaStat(deletingHexaStat);
    }
    notifyListeners();
  }


  void changeActiveSet(int hexaStatSetNumber) {
    activeHexaStatsSetNumber = hexaStatSetNumber;
    activeHexaStatsSet = hexaStatsSets[hexaStatSetNumber]!;

    notifyListeners();
  }
}
