import 'package:maplestory_builder/constants/character/classes.dart';
import 'package:maplestory_builder/constants/constants.dart';
import 'package:maplestory_builder/modules/base.dart';
import 'package:maplestory_builder/modules/hexa_stats.dart/hexa_stat.dart';
import 'package:maplestory_builder/modules/utilities/utilities.dart';

class HexaStatsModule implements Copyable {

  Map<int, int?> equippedHexaStat;
  HexaStat? Function(int? hexaStatId) getHexaStatCallback;

  Map<StatType, num>? cacheValue;

  HexaStatsModule({
    Map<int, int?>? equippedHexaStat,
    required this.getHexaStatCallback
  }) :
    equippedHexaStat = equippedHexaStat ?? {};

  @override
  HexaStatsModule copyWith({
    Map<int, int?>? equippedHexaStat,
    HexaStat? Function(int? hexaStatId)? getHexaStatCallback,
  }) {
    return HexaStatsModule(
      equippedHexaStat: equippedHexaStat ?? Map.from(this.equippedHexaStat),
      getHexaStatCallback: getHexaStatCallback ?? this.getHexaStatCallback,
    );
  }

  void registerHexaStatCallback(HexaStat? Function(int? hexaStatId) function) {
    getHexaStatCallback = function;
  }

  void equipHexaStat(HexaStat? hexaStat, int hexaStatPosition) {
    equippedHexaStat[hexaStatPosition] = hexaStat?.hexaStatId;

    cacheValue = null;
  }

  void deleteHexaStat(HexaStat deletingHexaStat) {
    equippedHexaStat.forEach((key, value) {
      if (value == deletingHexaStat.hexaStatId) {
        equippedHexaStat[key] = null;
      }
    });

    cacheValue = null;
  }

  HexaStat? getSelectedHexaStat(int hexaStatPosition) {
    return getHexaStatCallback(equippedHexaStat[hexaStatPosition]);
  }

  int? getHexaStatPosition(int hexaStatId) {
    for (MapEntry<int, int?> equippedHexaStat in equippedHexaStat.entries) {
      if (equippedHexaStat.value == hexaStatId) {
        return equippedHexaStat.key;
      }
    }
    return null;
  }

  Map<StatType, num> calculateStats(CharacterClass characterClass) {
    if (cacheValue != null) {
      return cacheValue!;
    }

    Map<StatType, num> hexaStats = {};

    void updateStatFromHexaStat(HexaStat? hexaStat) {
      if (hexaStat == null) {
        return;
      }
      else {
        for (MapEntry<StatType, num> hexaStatStats in hexaStat.calculateStats(characterClass).entries) {
          switch(hexaStatStats.key) {
            case StatType.ignoreDefense:
              hexaStats[hexaStatStats.key] = calculateIgnoreDefense((hexaStats[hexaStatStats.key] ?? 0), hexaStatStats.value);
            default:
              hexaStats[hexaStatStats.key] = (hexaStats[hexaStatStats.key] ?? 0) + hexaStatStats.value;
          }
        }
      }
    }

    for (int? hexaStatId in equippedHexaStat.values) {
      updateStatFromHexaStat(getHexaStatCallback(hexaStatId));
    }

    cacheValue = hexaStats;
    return hexaStats;
  }

  int? getHexaStatMainStatPosition(HexaStat compareHexaStat) {
    for (MapEntry<int, int?> equippedHexa in equippedHexaStat.entries) {
      if (equippedHexa.value != compareHexaStat.hexaStatId && getHexaStatCallback(equippedHexa.value)?.selectedStats[1] == compareHexaStat.selectedStats[1]) {
        return equippedHexa.key;
      }
    }

    return null;
  }
}