import 'package:flutter/material.dart';
import 'package:maplestory_builder/constants/character/classes.dart';
import 'package:maplestory_builder/constants/constants.dart';
import 'package:maplestory_builder/constants/hexa_stats/hexa_stats.dart';
import 'package:maplestory_builder/modules/base.dart';
import 'package:maplestory_builder/modules/utilities/utilities.dart';
import 'package:maplestory_builder/providers/character/character_provider.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:provider/provider.dart';

// ignore: constant_identifier_names
const int MAX_HEXA_STAT_LEVEL = 20;
// ignore: constant_identifier_names
const int MAX_SINGLE_HEXA_STAT_LEVEL = 10;

class HexaStat implements Copyable {
  
  Map<int, StatType?> selectedStats;
  Map<int, int> statLevels;
  String hexaStatName;
  int hexaStatId;

  Map<StatType, num>? cacheValue;

  HexaStat({
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
    Map<int, StatType?>? selectedStats,
    Map<int, int>? statLevels,
    String? hexaStatName,
    int? hexaStatId,
  }) {
    return HexaStat(
      selectedStats: selectedStats ?? Map.of(this.selectedStats),
      statLevels: statLevels ?? Map.of(this.statLevels),
      hexaStatName: hexaStatName ?? this.hexaStatName,
      hexaStatId: hexaStatId ?? this.hexaStatId
    );
  }

  Map<StatType, num> calculateStats(CharacterClass characterClass) {
    if (cacheValue != null) {
      return cacheValue!;
    }

    Map<StatType, num> hexaStatStats = {};

    for (MapEntry<int, StatType?> selectedStat in selectedStats.entries) {
      if (selectedStat.value != null) {
        var statToAdd = _calculateStatLine(selectedStat.key, selectedStat.value!, characterClass);
        hexaStatStats[statToAdd.$1] = statToAdd.$2;
      }
    }

    cacheValue = hexaStatStats;
    return hexaStatStats;
  }

  (StatType, num) _calculateStatLine(int statPosition, StatType statType, CharacterClass characterClass) {
    StatType convertedStatType;
    num statIncrement;

    switch(statType) {  
      case StatType.mainStat:
        switch(characterClass) {
          case CharacterClass.demonAvenger:
            convertedStatType = StatType.finalHp;
            statIncrement = HEXA_STAT_INCREMENTS[convertedStatType]!;
          case CharacterClass.xenon:
            convertedStatType = StatType.finalStrDexLuk;
            statIncrement = HEXA_STAT_INCREMENTS[convertedStatType]!;
          default:
            // Figure out the main stat
            var mainStat = determinePrimaryStat(characterClass.calculationStats);
            
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
            statIncrement = HEXA_STAT_INCREMENTS[statType]!;
        }
      case StatType.mainAttack:
        switch(characterClass.classType) {
          case ClassType.bowman:
          case ClassType.pirate:
          case ClassType.warrior:
          case ClassType.xenon:
            convertedStatType = StatType.attack;
          default:
            convertedStatType = StatType.mattack;
        }
        statIncrement = HEXA_STAT_INCREMENTS[statType]!;
      default:
        convertedStatType = statType;
        statIncrement = HEXA_STAT_INCREMENTS[convertedStatType]!;
    }
    
    return (convertedStatType, statIncrement * (statLevels[statPosition] ?? 0) * (statPosition == 1 ? 2 : 1));
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
              selectedStats[1]?.formattedName ?? "None",
              style: Theme.of(context).textTheme.bodyMedium
            ),
          ),
          Center(
            child: Icon(
              MdiIcons.hexagonSlice6,
              size: 100,
              color: selectedStats[1] != null ? Colors.lightBlueAccent : Colors.redAccent,
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
      (StatType?, num) valueToDisplay = hexaStatLine.value != null ? _calculateStatLine(hexaStatLine.key, hexaStatLine.value!, context.read<CharacterProvider>().characterClass) : (null, 0);

      childrenWidgets.add(
        Text(
          "${hexaStatLine.key == 1 ? 'Main' : 'Additional'} Stat (${valueToDisplay.$1?.formattedName ?? 'Nothing'} - lvl ${statLevels[hexaStatLine.key]}/10): +${valueToDisplay.$1?.isPercentage ?? false ? doublePercentFormater.format(valueToDisplay.$2) : valueToDisplay.$2}",
          style: Theme.of(context).textTheme.bodyMedium
        ),
      );
    }

    for (MapEntry<int, StatType?> hexaStatLine in selectedStats.entries) {
      addHexaStatLine(hexaStatLine);
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
