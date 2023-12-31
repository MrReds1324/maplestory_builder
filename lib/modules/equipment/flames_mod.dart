// ignore_for_file: non_constant_identifier_names

import 'package:maplestory_builder/constants/constants.dart';
import 'package:maplestory_builder/constants/equipment/flame_stats.dart';
import 'package:maplestory_builder/modules/base.dart';
import 'package:maplestory_builder/modules/equipment/equips.dart';
import 'package:maplestory_builder/modules/utilities/utilities.dart';

class FlameModule implements Copyable {
  Map<int, FlameLine> flames;

  Map<StatType, num> moduleStats;

  FlameModule({
    Map<int, FlameLine>? flames,
    Map<StatType, num>? moduleStats,
  }) : moduleStats = moduleStats ?? {},
      flames = flames ?? {
        1: FlameLine(),
        2: FlameLine(),
        3: FlameLine(),
        4: FlameLine(),
      };

  @override
  FlameModule copyWith({
    Map<int, FlameLine>? flames,
    Map<StatType, num>? moduleStats,
  }) {
    return FlameModule(
      flames: flames ?? mapDeepCopy(this.flames),
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
        moduleStats[StatType.hp] = (moduleStats[StatType.hp] ?? 0) + HP_MP_FLAME[flameLevelOffset][flameLine.flameTier!.index];
      case FlameName.mp:
        moduleStats[StatType.mp] = (moduleStats[StatType.mp] ?? 0) + HP_MP_FLAME[flameLevelOffset][flameLine.flameTier!.index];
      case FlameName.defense:
        moduleStats[StatType.defense] = (moduleStats[StatType.defense] ?? 0) + DEFENSE_FLAME[flameLevelOffset][flameLine.flameTier!.index];
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
    if (isUpdatingTier) {
      flames[flamePosition]!.flameTier = flameTier;
    }
    else {
      flames[flamePosition]!.flameName = flameName;
    }
    calculateModuleStats(targetEquip);
  }

  void calculateModuleStats(Equip targetEquip) {
    moduleStats = {};

    for (FlameLine flameLine in flames.values) {
      _calculateFlame(targetEquip, flameLine);
    }
  }

  FlameLine getFlameLine(int flamePosition) {
    return flames[flamePosition]!;
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