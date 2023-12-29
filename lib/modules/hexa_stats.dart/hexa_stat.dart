import 'package:flutter/material.dart';
import 'package:maplestory_builder/constants/constants.dart';
import 'package:maplestory_builder/constants/hexa_stats/hexa_stats.dart';
import 'package:maplestory_builder/modules/base.dart';
import 'package:maplestory_builder/modules/utilities/utilities.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

// ignore: constant_identifier_names
const int MAX_HEXA_STAT_LEVEL = 20;
// ignore: constant_identifier_names
const int MAX_SINGLE_HEXA_STAT_LEVEL = 10;

class HexaStat implements Copyable {
  
  HexaStatType? hexaStatType;
  Map<int, StatType?> selectedStats;
  Map<int, int> statLevels;
  String hexaStatName;
  int hexaStatId;

  Map<StatType, num>? cacheValue;

  HexaStat({
    this.hexaStatType,
    Map<int, StatType?>? selectedStats,
    Map<int, int>? statLevels,
    this.hexaStatName = "",
    this.hexaStatId = -1
  }) : statLevels = statLevels ?? {
    1: 0,
    2: 0,
    3: 0,
  },
  selectedStats = selectedStats ?? {
    1: null,
    2: null,
    3: null,
  };

  int get totalStatLevel {
    return statLevels.values.fold(0, (previous, current) => previous + current);
  }

  @override
  HexaStat copyWith({
    HexaStatType? hexaStatType,
    Map<int, StatType?>? selectedStats,
    Map<int, int>? statLevels,
    String? hexaStatName,
    int? hexaStatId,
  }) {
    return HexaStat(
      hexaStatType: hexaStatType ?? this.hexaStatType,
      selectedStats: selectedStats ?? Map.of(this.selectedStats),
      statLevels: statLevels ?? Map.of(this.statLevels),
      hexaStatName: hexaStatName ?? this.hexaStatName,
      hexaStatId: hexaStatId ?? this.hexaStatId
    );
  }

  Map<StatType, num> calculateStats() {
    if (cacheValue != null) {
      return cacheValue!;
    }

    Map<StatType, num> hexaStatStats = {};

    for (MapEntry<int, StatType?> selectedStat in selectedStats.entries) {
      if (selectedStat.value != null) {
        hexaStatStats[selectedStat.value!] = _calculateStatLine(selectedStat.key, selectedStat.value!);
      }
    }

    cacheValue = hexaStatStats;
    return hexaStatStats;
  }

  num _calculateStatLine(int statPosition, StatType statType) {
    var statValue = (hexaStatType?.statIncrement[statType]! ?? 0) * (statLevels[statPosition] ?? 0);
    if (statPosition == 1) {
      return statValue * 2;
    }
    else {
      return statValue;
    } 
  }

  void updateHexaStatType(HexaStatType? newHexaStatType) {
    if (hexaStatType != newHexaStatType) {
      statLevels = {
        1: 0,
        2: 0,
        3: 0,
      };
      hexaStatType = newHexaStatType;
    }

    cacheValue = null;
  }

  bool updateStatSelection(int statPosition, StatType? statType) {
    if (statType == selectedStats[statPosition]) {
      return false;
    }

    selectedStats[statPosition] = statType;

    cacheValue = null;
    return true;
  }

  bool addHexaStatLevel(int statPosition) {
    if (statLevels[statPosition] == MAX_SINGLE_HEXA_STAT_LEVEL || totalStatLevel == MAX_HEXA_STAT_LEVEL) {
      return false;
    }

    statLevels[statPosition] = (statLevels[statPosition] ?? 0) + 1;

    cacheValue = null;
    return true;
  }

  bool subtractHexaStatLevel(int statPosition) {
    if (statLevels[statPosition] == 0) {
      return false;
    }

    statLevels[statPosition] = (statLevels[statPosition] ?? 1) - 1;

    cacheValue = null;
    return true;
  }

  Widget createHexaStatContainer(BuildContext context) {
    return Container(
      width: 300,
      padding: const EdgeInsets.all(2.5),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
            child: Text(
              hexaStatName, 
              style: Theme.of(context).textTheme.headlineSmall,
            ),
          ),
          Center(
            child: Text(
              hexaStatType?.formattedName ?? "None",
              style: Theme.of(context).textTheme.bodyMedium
            ),
          ),
          Center(
            child: Icon(
              MdiIcons.hexagonSlice6,
              size: 100,
              color: hexaStatType != null ? Colors.lightBlueAccent : Colors.redAccent,
            ),
          ),
          Center(
            child: _buildStatkWidget(context),
          ),
        ],
      ),
    );
  }

  Widget _buildStatkWidget(BuildContext context) {
    List<Widget> childrenWidgets = [];

    void addHexaStatLine(MapEntry<int, StatType?> hexaStatLine) {
      var valueToDisplay = hexaStatLine.value != null ? _calculateStatLine(hexaStatLine.key, hexaStatLine.value!) : 0;

      childrenWidgets.add(
        Text(
          "${hexaStatLine.key == 1 ? 'Primary' : 'Secondary'} (${hexaStatLine.value?.formattedName ?? 'Nothing'} - Level ${statLevels[hexaStatLine.key]}/10): +${hexaStatLine.value?.isPercentage ?? false ? doublePercentFormater.format(valueToDisplay) : valueToDisplay}",
          style: Theme.of(context).textTheme.bodyMedium
        ),
      );
    }

    if (hexaStatType != null) {
      for (MapEntry<int, StatType?> hexaStatLine in selectedStats.entries) {
        addHexaStatLine(hexaStatLine);
      }
    }

    return Container(
      padding: const EdgeInsets.only(top: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: childrenWidgets
      ),
    );
  }
}
