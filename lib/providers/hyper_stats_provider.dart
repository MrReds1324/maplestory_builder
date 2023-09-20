import 'package:flutter/material.dart';
import 'package:maplestory_builder/core/constants/hyper_stats.dart';

class HyperStatsProvider with ChangeNotifier {
  int totalAvailableHyperStats = 0;
  int availableHyperStats = 0;
  int assignedHyperStats = 0;

  int assignedHyperStatsStr = 0;
  int assignedHyperStatsDex = 0;
  int assignedHyperStatsInt = 0;
  int assignedHyperStatsLuk = 0;
  int assignedHyperStatsHP = 0;
  int assignedHyperStatsMP = 0;
  int assignedHyperStatsSpecialMana = 0;
  int assignedHpyerStatsCriticalRate = 0;
  int assignedHpyerStatsCriticalDamage = 0;
  int assignedHpyerStatsIgnoreDefense = 0;
  int assignedHpyerStatsDamage = 0;
  int assignedHpyerStatsBossDamage = 0;
  int assignedHpyerStatsNormalMonsterDamage = 0;
  int assignedHpyerStatsStatusResistance = 0;
  int assignedHyperStatsAttackMagicAttack = 0;
  int assignedHyperStatsBonusExp = 0;
  int assignedHyperStatsArcaneForce = 0;

  void setAvailableHyperStatsFromLevel(int characterLevel) {
    totalAvailableHyperStats = levelToTotalHyperStatPoints[characterLevel] ?? 0;
  }

  HyperStatsProvider({
    this.totalAvailableHyperStats = 0,
    this.availableHyperStats = 0,
    this.assignedHyperStats = 0,
    this.assignedHyperStatsStr = 0,
    this.assignedHyperStatsDex = 0,
    this.assignedHyperStatsInt = 0,
    this.assignedHyperStatsLuk = 0,
    this.assignedHyperStatsHP = 0,
    this.assignedHyperStatsMP = 0,
    this.assignedHyperStatsSpecialMana = 0,
    this.assignedHpyerStatsCriticalRate = 0,
    this.assignedHpyerStatsCriticalDamage = 0,
    this.assignedHpyerStatsIgnoreDefense = 0,
    this.assignedHpyerStatsDamage = 0,
    this.assignedHpyerStatsBossDamage = 0,
    this.assignedHpyerStatsNormalMonsterDamage = 0,
    this.assignedHpyerStatsStatusResistance = 0,
    this.assignedHyperStatsAttackMagicAttack = 0,
    this.assignedHyperStatsBonusExp = 0,
    this.assignedHyperStatsArcaneForce = 0,
  });

  HyperStatsProvider copyWith({
    int? totalAvailableHyperStats,
    int? availableHyperStats,
    int? assignedHyperStats,
    int? assignedHyperStatsStr,
    int? assignedHyperStatsDex,
    int? assignedHyperStatsInt,
    int? assignedHyperStatsLuk,
    int? assignedHyperStatsHP,
    int? assignedHyperStatsMP,
    int? assignedHyperStatsSpecialMana,
    int? assignedHpyerStatsCriticalRate,
    int? assignedHpyerStatsCriticalDamage,
    int? assignedHpyerStatsIgnoreDefense,
    int? assignedHpyerStatsDamage,
    int? assignedHpyerStatsBossDamage,
    int? assignedHpyerStatsNormalMonsterDamage,
    int? assignedHpyerStatsStatusResistance,
    int? assignedHyperStatsAttackMagicAttack,
    int? assignedHyperStatsBonusExp,
    int? assignedHyperStatsArcaneForce
  }) {
    return HyperStatsProvider(
      totalAvailableHyperStats: totalAvailableHyperStats ?? this.totalAvailableHyperStats,
      availableHyperStats: availableHyperStats ?? this.availableHyperStats,
      assignedHyperStats: assignedHyperStats ?? this.assignedHyperStats,
      assignedHyperStatsStr: assignedHyperStatsStr ?? this.assignedHyperStatsStr,
      assignedHyperStatsDex: assignedHyperStatsDex ?? this.assignedHyperStatsDex,
      assignedHyperStatsInt: assignedHyperStatsInt ?? this.assignedHyperStatsInt,
      assignedHyperStatsLuk: assignedHyperStatsLuk ?? this.assignedHyperStatsLuk,
      assignedHyperStatsHP: assignedHyperStatsHP ?? this.assignedHyperStatsHP,
      assignedHyperStatsMP: assignedHyperStatsMP ?? this.assignedHyperStatsMP,
      assignedHyperStatsSpecialMana: assignedHyperStatsSpecialMana ?? this.assignedHyperStatsSpecialMana,
      assignedHpyerStatsCriticalRate: assignedHpyerStatsCriticalRate ?? this.assignedHpyerStatsCriticalRate,
      assignedHpyerStatsCriticalDamage: assignedHpyerStatsCriticalDamage ?? this.assignedHpyerStatsCriticalDamage,
      assignedHpyerStatsIgnoreDefense: assignedHpyerStatsIgnoreDefense ?? this.assignedHpyerStatsIgnoreDefense,
      assignedHpyerStatsDamage: assignedHpyerStatsDamage ?? this.assignedHpyerStatsDamage,
      assignedHpyerStatsBossDamage: assignedHpyerStatsBossDamage ?? this.assignedHpyerStatsBossDamage,
      assignedHpyerStatsNormalMonsterDamage: assignedHpyerStatsNormalMonsterDamage ?? this.assignedHpyerStatsNormalMonsterDamage,
      assignedHpyerStatsStatusResistance: assignedHpyerStatsStatusResistance ?? this.assignedHpyerStatsStatusResistance,
      assignedHyperStatsAttackMagicAttack: assignedHyperStatsAttackMagicAttack ?? this.assignedHyperStatsAttackMagicAttack,
      assignedHyperStatsBonusExp: assignedHyperStatsBonusExp ?? this.assignedHyperStatsBonusExp,
      assignedHyperStatsArcaneForce: assignedHyperStatsArcaneForce ?? this.assignedHyperStatsArcaneForce
    );
  }
}
