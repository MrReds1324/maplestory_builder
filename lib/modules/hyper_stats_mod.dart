import 'package:maplestory_builder/core/constants/hyper_stats.dart';

class HyperStatsModule {
  int totalAvailableHyperStats = 0;
  int availableHyperStats = 10; 
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
}