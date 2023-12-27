import 'dart:math';

import 'package:maplestory_builder/constants/constants.dart';
import 'package:maplestory_builder/modules/base.dart';
import 'package:maplestory_builder/modules/familiars/familiar.dart';
import 'package:maplestory_builder/modules/utilities/utilities.dart';

// ignore: non_constant_identifier_names
double MAX_FAMILIAR_BOSS_DAMAGE = 1.2;

class FamiliarModule implements Copyable {

  Map<int, int?> equippedFamiliars;
  Familiar? Function(int? equipHash) getFamiliarCallback;

  Map<StatType, num> moduleStats;

  FamiliarModule({
    Map<int, int?>? equippedFamiliars,
    required this.getFamiliarCallback,
    Map<StatType, num>? moduleStats,
  }) :
    equippedFamiliars = equippedFamiliars ?? {},
    moduleStats = moduleStats ?? {};

  @override
  FamiliarModule copyWith({
    Map<int, int?>? equippedFamiliars,
    Familiar? Function(int?)? getFamiliarCallback,
    Map<StatType, num>? moduleStats
  }) {
    return FamiliarModule(
      equippedFamiliars: equippedFamiliars ?? Map.from(this.equippedFamiliars),
      getFamiliarCallback: getFamiliarCallback ?? this.getFamiliarCallback,
      moduleStats: moduleStats ?? Map.of(this.moduleStats),
    );
  }

  void _updateStatFromFamiliar(Familiar? familiar) {
    if (familiar == null) {
      return;
    }
    else {
      for (MapEntry<StatType, num> familiarStat in familiar.calculateStats().entries) {
        switch(familiarStat.key) {
          case StatType.bossDamage:
            
            moduleStats[familiarStat.key] = min((moduleStats[familiarStat.key] ?? 0) + familiarStat.value, MAX_FAMILIAR_BOSS_DAMAGE);
          case StatType.ignoreDefense:
            moduleStats[familiarStat.key] = calculateIgnoreDefense((moduleStats[familiarStat.key] ?? 0), familiarStat.value);
          default:
            moduleStats[familiarStat.key] = (moduleStats[familiarStat.key] ?? 0) + familiarStat.value;
        }
      }
    }
  }

  void calculateModuleStats() {
    moduleStats = {};

    for (int? familiarHash in equippedFamiliars.values) {
      _updateStatFromFamiliar(getFamiliarCallback(familiarHash));
    }
  }


  void registerFamiliarCallback(Familiar? Function(int?) function) {
    getFamiliarCallback = function;
  }

  void equipFamiliar(Familiar? familiar, int familiarPosition) {
    equippedFamiliars[familiarPosition] = familiar?.familiarHash;

    calculateModuleStats();
  }

  void deleteFamiliar(Familiar deletingFamiliar) {
    equippedFamiliars.forEach((key, value) {
      if (value == deletingFamiliar.familiarHash) {
        equippedFamiliars[key] = null;
      }
    });
  }

  Familiar? getSelectedFamiliar(int familiarPosition) {
    return getFamiliarCallback(equippedFamiliars[familiarPosition]);
  }

  List<Map<StatType, num>> calculateStats() {
    List<Map<StatType, num>> familiarStats = <Map<StatType, num>>[];

    for (int? familiarHash in equippedFamiliars.values) {
      var mapValue = getFamiliarCallback(familiarHash)?.calculateStats();
      if (mapValue != null) {
        familiarStats.add(mapValue);
      }
    }

    return familiarStats;
  }
}