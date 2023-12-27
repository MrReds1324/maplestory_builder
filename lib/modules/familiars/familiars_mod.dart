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

  Map<StatType, num>? cacheValue;

  FamiliarModule({
    Map<int, int?>? equippedFamiliars,
    required this.getFamiliarCallback
  }) :
    equippedFamiliars = equippedFamiliars ?? {};

  @override
  FamiliarModule copyWith({
    Map<int, int?>? equippedFamiliars,
    Familiar? Function(int?)? getFamiliarCallback,
  }) {
    return FamiliarModule(
      equippedFamiliars: equippedFamiliars ?? Map.from(this.equippedFamiliars),
      getFamiliarCallback: getFamiliarCallback ?? this.getFamiliarCallback,
    );
  }

  void registerFamiliarCallback(Familiar? Function(int?) function) {
    getFamiliarCallback = function;
  }

  void equipFamiliar(Familiar? familiar, int familiarPosition) {
    equippedFamiliars[familiarPosition] = familiar?.familiarHash;

    cacheValue = null;
  }

  void deleteFamiliar(Familiar deletingFamiliar) {
    equippedFamiliars.forEach((key, value) {
      if (value == deletingFamiliar.familiarHash) {
        equippedFamiliars[key] = null;
      }
    });

    cacheValue = null;
  }

  Familiar? getSelectedFamiliar(int familiarPosition) {
    return getFamiliarCallback(equippedFamiliars[familiarPosition]);
  }

  Map<StatType, num> calculateStats() {
    if (cacheValue != null) {
      return cacheValue!;
    }

    Map<StatType, num> familiarStats = {};

    void updateStatFromFamiliar(Familiar? familiar) {
      if (familiar == null) {
        return;
      }
      else {
        for (MapEntry<StatType, num> familiarStat in familiar.calculateStats().entries) {
          switch(familiarStat.key) {
            case StatType.bossDamage:
              
              familiarStats[familiarStat.key] = min((familiarStats[familiarStat.key] ?? 0) + familiarStat.value, MAX_FAMILIAR_BOSS_DAMAGE);
            case StatType.ignoreDefense:
              familiarStats[familiarStat.key] = calculateIgnoreDefense((familiarStats[familiarStat.key] ?? 0), familiarStat.value);
            default:
              familiarStats[familiarStat.key] = (familiarStats[familiarStat.key] ?? 0) + familiarStat.value;
          }
        }
      }
    }

    for (int? familiarHash in equippedFamiliars.values) {
      updateStatFromFamiliar(getFamiliarCallback(familiarHash));
    }

    cacheValue = familiarStats;
    return familiarStats;
  }
}