// ignore_for_file: non_constant_identifier_names

import 'package:maplestory_builder/constants/constants.dart';
import 'package:maplestory_builder/constants/equipment/flame_stats.dart';
import 'package:maplestory_builder/modules/equipment/equips.dart';

class FlameModule {
  FlameLine? flameLine1;
  FlameLine? flameLine2;
  FlameLine? flameLine3;
  FlameLine? flameLine4;

  Map<StatType, num> moduleStats;

  FlameModule({
    this.flameLine1,
    this.flameLine2,
    this.flameLine3,
    this.flameLine4,
    Map<StatType, num>? moduleStats,
  }) : moduleStats = moduleStats ?? {} {
    flameLine1 = flameLine1 ?? FlameLine();
    flameLine2 = flameLine2 ?? FlameLine();
    flameLine3 = flameLine3 ?? FlameLine();
    flameLine4 = flameLine4 ?? FlameLine();
  }

  FlameModule copyWith({
    FlameLine? flameLine1,
    FlameLine? flameLine2,
    FlameLine? flameLine3,
    FlameLine? flameLine4,
    Map<StatType, num>? moduleStats,
  }) {
    return FlameModule(
      flameLine1: flameLine1 ?? this.flameLine1?.copyWith(),
      flameLine2: flameLine2 ?? this.flameLine2?.copyWith(),
      flameLine3: flameLine3 ?? this.flameLine3?.copyWith(),
      flameLine4: flameLine4 ?? this.flameLine4?.copyWith(),
      moduleStats: moduleStats ?? this.moduleStats,
    );
  }

  num get(StatType statType) {
    return moduleStats[statType] ?? 0;
  }

  void _calculateFlame(Equip targetEquip, FlameLine? flameLine) {
    if (flameLine == null || flameLine.flameTier == null || flameLine.flameType == null) {
      return;
    }

    var flameLevelOffset = getFlameOffset(targetEquip.itemLevel);

    switch(flameLine.flameType) {
      case FlameType.str:
        moduleStats[StatType.str] = (moduleStats[StatType.str] ?? 0) + singleStatFlame[flameLevelOffset][flameLine.flameTier!.index];
      case FlameType.dex:
        moduleStats[StatType.dex] = (moduleStats[StatType.dex] ?? 0) + singleStatFlame[flameLevelOffset][flameLine.flameTier!.index];
      case FlameType.int:
        moduleStats[StatType.int] = (moduleStats[StatType.int] ?? 0) + singleStatFlame[flameLevelOffset][flameLine.flameTier!.index];
      case FlameType.luk:
        moduleStats[StatType.luk] = (moduleStats[StatType.luk] ?? 0) + singleStatFlame[flameLevelOffset][flameLine.flameTier!.index];
      case FlameType.strDex:
        var flameStat = doubleStatFlame[flameLevelOffset][flameLine.flameTier!.index];
        moduleStats[StatType.str] = (moduleStats[StatType.str] ?? 0) + flameStat;
        moduleStats[StatType.dex] = (moduleStats[StatType.dex] ?? 0) + flameStat;
      case FlameType.strInt:
        var flameStat = doubleStatFlame[flameLevelOffset][flameLine.flameTier!.index];
        moduleStats[StatType.str] = (moduleStats[StatType.str] ?? 0) + flameStat;
        moduleStats[StatType.int] = (moduleStats[StatType.int] ?? 0) + flameStat;
      case FlameType.strLuk:
        var flameStat = doubleStatFlame[flameLevelOffset][flameLine.flameTier!.index];
        moduleStats[StatType.str] = (moduleStats[StatType.str] ?? 0) + flameStat;
        moduleStats[StatType.luk] = (moduleStats[StatType.luk] ?? 0) + flameStat;
      case FlameType.dexInt:
        var flameStat = doubleStatFlame[flameLevelOffset][flameLine.flameTier!.index];
        moduleStats[StatType.dex] = (moduleStats[StatType.dex] ?? 0) + flameStat;
        moduleStats[StatType.int] = (moduleStats[StatType.int] ?? 0) + flameStat;
      case FlameType.dexLuk:
        var flameStat = doubleStatFlame[flameLevelOffset][flameLine.flameTier!.index];
        moduleStats[StatType.dex] = (moduleStats[StatType.dex] ?? 0) + flameStat;
        moduleStats[StatType.luk] = (moduleStats[StatType.luk] ?? 0) + flameStat;
      case FlameType.intLuk:
        var flameStat = doubleStatFlame[flameLevelOffset][flameLine.flameTier!.index];
        moduleStats[StatType.int] = (moduleStats[StatType.int] ?? 0) + flameStat;
        moduleStats[StatType.luk] = (moduleStats[StatType.luk] ?? 0) + flameStat;
      case FlameType.hp:
        moduleStats[StatType.hp] = (moduleStats[StatType.hp] ?? 0) + hpAndMpFlame[flameLevelOffset][flameLine.flameTier!.index];
      case FlameType.mp:
        moduleStats[StatType.mp] = (moduleStats[StatType.mp] ?? 0) + hpAndMpFlame[flameLevelOffset][flameLine.flameTier!.index];
      case FlameType.defense:
        moduleStats[StatType.defense] = (moduleStats[StatType.defense] ?? 0) + defenseFlame[flameLevelOffset][flameLine.flameTier!.index];
      case FlameType.attack:
        if (targetEquip.equipType == EquipType.weapon) {
          var tagetCalculation = targetEquip.get(StatType.attack);
          if (tagetCalculation == 0) {
            tagetCalculation = targetEquip.get(StatType.mattack);
          }

          if (targetEquip.isFlameAdvantaged) {
            moduleStats[StatType.attack] = (tagetCalculation * wepAttAdvantagedFlame[flameLevelOffset][flameLine.flameTier!.index]).ceil();
          }
          else {
            moduleStats[StatType.attack] = (tagetCalculation * wepAttFlame[flameLevelOffset][flameLine.flameTier!.index]).ceil();
          }
        }
        else {
          moduleStats[StatType.attack] = nonWepAttFlame[flameLine.flameTier!.index];
        }
      case FlameType.mattack:
        if (targetEquip.equipType == EquipType.weapon) {
          var tagetCalculation = targetEquip.get(StatType.mattack);
          if (tagetCalculation == 0) {
            tagetCalculation = targetEquip.get(StatType.attack);
          }

          if (targetEquip.isFlameAdvantaged) {
            moduleStats[StatType.mattack] = (tagetCalculation * wepAttAdvantagedFlame[flameLevelOffset][flameLine.flameTier!.index]).ceil();
          }
          else {
            moduleStats[StatType.mattack] = (tagetCalculation * wepAttFlame[flameLevelOffset][flameLine.flameTier!.index]).ceil();
          }
        }
        else {
          moduleStats[StatType.mattack] = nonWepAttFlame[flameLine.flameTier!.index];
        }
      case FlameType.speed:
        moduleStats[StatType.speed] = (moduleStats[StatType.speed] ?? 0) + speedAndJumpFlame[flameLine.flameTier!.index];
      case FlameType.jump:
        moduleStats[StatType.jump] = (moduleStats[StatType.jump] ?? 0) + speedAndJumpFlame[flameLine.flameTier!.index];
      case FlameType.allStats:
        moduleStats[StatType.allStatsPercentage] = allStatsPercentageFlame[flameLine.flameTier!.index];
      case FlameType.bossDamage:
        moduleStats[StatType.bossDamage] = bossDamageFlame[flameLine.flameTier!.index];
      case FlameType.damage:
        moduleStats[StatType.damage] = damageFlame[flameLine.flameTier!.index];
      case FlameType.levelReduction:
        moduleStats[StatType.level] = levelReductionFlame[flameLine.flameTier!.index];
      default:
        return;
    }
  }

  void updateFlame(Equip targetEquip, num flamePosition, {FlameType? flameType, FlameTier? flameTier, isUpdatingTier=false}) {
    moduleStats = {};
    
    if (isUpdatingTier) {
      if (flamePosition == 1) {
        flameLine1?.flameTier = flameTier;
      }
      else if (flamePosition == 2) {
        flameLine2?.flameTier = flameTier;
      }
      else if (flamePosition == 3) {
        flameLine3?.flameTier = flameTier;
      }
      else {
        flameLine4?.flameTier = flameTier;
      }
    }
    else {
      if (flamePosition == 1) {
        flameLine1?.flameType = flameType;
      }
      else if (flamePosition == 2) {
        flameLine2?.flameType = flameType;
      }
      else if (flamePosition == 3) {
        flameLine3?.flameType = flameType;
      }
      else {
        flameLine4?.flameType = flameType;
      }
    }
  }

  void calculateModuleStats(Equip targetEquip) {
    moduleStats = {};

    _calculateFlame(targetEquip, flameLine1);
    _calculateFlame(targetEquip, flameLine2);
    _calculateFlame(targetEquip, flameLine3);
    _calculateFlame(targetEquip, flameLine4);
  }
}



int getFlameOffset(num itemLevel) {
  return (itemLevel / 10).floor();
}

class FlameLine {
  FlameType? flameType;
  FlameTier? flameTier;

  FlameLine({
    this.flameType,
    this.flameTier,
  });

  FlameLine copyWith({
    FlameType? flameType,
    FlameTier? flameTier,
  }) {
    return FlameLine(
      flameType: flameType ?? this.flameType,
      flameTier: flameTier ?? this.flameTier,
    );
  }
}