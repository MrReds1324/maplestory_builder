// ignore_for_file: non_constant_identifier_names

import 'package:maplestory_builder/constants/constants.dart';
import 'package:maplestory_builder/constants/equipment/flame_stats.dart';
import 'package:maplestory_builder/modules/base.dart';
import 'package:maplestory_builder/modules/equipment/equips.dart';

class FlameModule implements Copyable {
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

  @override
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
    if (flameLine == null || flameLine.flameTier == null || flameLine.flameName == null) {
      return;
    }

    var flameLevelOffset = getFlameOffset(targetEquip.equipName.itemLevel);

    switch(flameLine.flameName) {
      case FlameName.str:
        moduleStats[StatType.str] = (moduleStats[StatType.str] ?? 0) + flameLine.flameName!.statValue[flameLevelOffset][flameLine.flameTier!.index];
      case FlameName.dex:
        moduleStats[StatType.dex] = (moduleStats[StatType.dex] ?? 0) + flameLine.flameName!.statValue[flameLevelOffset][flameLine.flameTier!.index];
      case FlameName.int:
        moduleStats[StatType.int] = (moduleStats[StatType.int] ?? 0) + flameLine.flameName!.statValue[flameLevelOffset][flameLine.flameTier!.index];
      case FlameName.luk:
        moduleStats[StatType.luk] = (moduleStats[StatType.luk] ?? 0) + flameLine.flameName!.statValue[flameLevelOffset][flameLine.flameTier!.index];
      case FlameName.strDex:
        var flameStat = flameLine.flameName!.statValue[flameLevelOffset][flameLine.flameTier!.index];
        moduleStats[StatType.str] = (moduleStats[StatType.str] ?? 0) + flameStat;
        moduleStats[StatType.dex] = (moduleStats[StatType.dex] ?? 0) + flameStat;
      case FlameName.strInt:
        var flameStat = flameLine.flameName!.statValue[flameLevelOffset][flameLine.flameTier!.index];
        moduleStats[StatType.str] = (moduleStats[StatType.str] ?? 0) + flameStat;
        moduleStats[StatType.int] = (moduleStats[StatType.int] ?? 0) + flameStat;
      case FlameName.strLuk:
        var flameStat = flameLine.flameName!.statValue[flameLevelOffset][flameLine.flameTier!.index];
        moduleStats[StatType.str] = (moduleStats[StatType.str] ?? 0) + flameStat;
        moduleStats[StatType.luk] = (moduleStats[StatType.luk] ?? 0) + flameStat;
      case FlameName.dexInt:
        var flameStat = flameLine.flameName!.statValue[flameLevelOffset][flameLine.flameTier!.index];
        moduleStats[StatType.dex] = (moduleStats[StatType.dex] ?? 0) + flameStat;
        moduleStats[StatType.int] = (moduleStats[StatType.int] ?? 0) + flameStat;
      case FlameName.dexLuk:
        var flameStat = flameLine.flameName!.statValue[flameLevelOffset][flameLine.flameTier!.index];
        moduleStats[StatType.dex] = (moduleStats[StatType.dex] ?? 0) + flameStat;
        moduleStats[StatType.luk] = (moduleStats[StatType.luk] ?? 0) + flameStat;
      case FlameName.intLuk:
        var flameStat = flameLine.flameName!.statValue[flameLevelOffset][flameLine.flameTier!.index];
        moduleStats[StatType.int] = (moduleStats[StatType.int] ?? 0) + flameStat;
        moduleStats[StatType.luk] = (moduleStats[StatType.luk] ?? 0) + flameStat;
      case FlameName.hp:
        moduleStats[StatType.hp] = (moduleStats[StatType.hp] ?? 0) + hpAndMpFlame[flameLevelOffset][flameLine.flameTier!.index];
      case FlameName.mp:
        moduleStats[StatType.mp] = (moduleStats[StatType.mp] ?? 0) + hpAndMpFlame[flameLevelOffset][flameLine.flameTier!.index];
      case FlameName.defense:
        moduleStats[StatType.defense] = (moduleStats[StatType.defense] ?? 0) + defenseFlame[flameLevelOffset][flameLine.flameTier!.index];
      case FlameName.attack:
        moduleStats[StatType.attack] = flameLine.flameName!.statValue[flameLine.flameTier!.index];
      case FlameName.mattack:
        moduleStats[StatType.mattack] = flameLine.flameName!.statValue[flameLine.flameTier!.index];
      case FlameName.wepAttackFlameAdvantaged:
      case FlameName.wepAttackFlameNonAdvantaged:
        var tagetCalculation = targetEquip.get(StatType.attack);
        if (tagetCalculation == 0) {
          tagetCalculation = targetEquip.get(StatType.mattack);
        }

        moduleStats[StatType.attack] = (tagetCalculation * flameLine.flameName!.statValue[flameLevelOffset][flameLine.flameTier!.index]).ceil();
      case FlameName.wepMattackFlameAdvantaged:
      case FlameName.wepMattackFlameNonAdvantaged:
        var tagetCalculation = targetEquip.get(StatType.mattack);
        if (tagetCalculation == 0) {
          tagetCalculation = targetEquip.get(StatType.attack);
        }

        moduleStats[StatType.mattack] = (tagetCalculation * flameLine.flameName!.statValue[flameLevelOffset][flameLine.flameTier!.index]).ceil();
      case FlameName.speed:
        moduleStats[StatType.speed] = (moduleStats[StatType.speed] ?? 0) + flameLine.flameName!.statValue[flameLine.flameTier!.index];
      case FlameName.jump:
        moduleStats[StatType.jump] = (moduleStats[StatType.jump] ?? 0) + flameLine.flameName!.statValue[flameLine.flameTier!.index];
      case FlameName.allStats:
        moduleStats[StatType.allStatsPercentage] = flameLine.flameName!.statValue[flameLine.flameTier!.index];
      case FlameName.bossDamage:
        moduleStats[StatType.bossDamage] = flameLine.flameName!.statValue[flameLine.flameTier!.index];
      case FlameName.damage:
        moduleStats[StatType.damage] = flameLine.flameName!.statValue[flameLine.flameTier!.index];
      case FlameName.levelReduction:
        moduleStats[StatType.level] = flameLine.flameName!.statValue[flameLine.flameTier!.index];
      default:
        return;
    }
  }

  void updateFlame(Equip targetEquip, num flamePosition, {FlameName? flameName, FlameTier? flameTier, isUpdatingTier=false}) {
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
        flameLine1?.flameName = flameName;
      }
      else if (flamePosition == 2) {
        flameLine2?.flameName = flameName;
      }
      else if (flamePosition == 3) {
        flameLine3?.flameName = flameName;
      }
      else {
        flameLine4?.flameName = flameName;
      }
    }
    calculateModuleStats(targetEquip);
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

class FlameLine implements Copyable {
  FlameName? flameName;
  FlameTier? flameTier;

  FlameLine({
    this.flameName,
    this.flameTier,
  });

  @override
  FlameLine copyWith({
    FlameName? flameName,
    FlameTier? flameTier,
  }) {
    return FlameLine(
      flameName: flameName ?? this.flameName,
      flameTier: flameTier ?? this.flameTier,
    );
  }
}