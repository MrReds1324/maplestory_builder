import 'package:flutter/material.dart';
import 'package:maplestory_builder/core/items/equips.dart';
import 'package:maplestory_builder/core/constants.dart';
import 'package:maplestory_builder/modules/ap_stats_mod.dart';

import 'package:maplestory_builder/modules/hyper_stats_mod.dart';

class CharacterModel with ChangeNotifier {
  String characterName = '';
  int characterLevel = 0;

  // Lower Critical Damage %: 20 + CriticalDamage%
  // Upper Critical Damage %: 50 + CriticalDamage%

  // Damage Range Calculation is as follows
  // TotalStat = ((apStat * AP%) + Stat) * Stat% + FinalStat
  // StatValue = TotalPrimaryStat * 4 + TotalSecondaryStat
  // StatValue if DemonAvenger = floor(APHP/3.5) + (0.8 * floor(TotalHP - APHP)/3.5)) + TotalStr
  // TotalAtt = Attack * Attack% + FinalAttack
  // UpperDamageRange = (WeaponMultiplier * StatValue * TotalATT/100) * (1 + Damage%) * (1 + FinalDamage%), rounded down
  // LowerDamageRange = UpperDamangeRange * Mastery%, rounded down
  double upperDamageRange = 100000000000000;
  double upperBossDamangeRange = 100000000000000;
  double upperEffectiveDamageRange = 100000000000000;
  double upperEffectiveBossDamangeRange = 100000000000000;
  double totalHp = 999999;
  double totalMp = 1000;
  double totalStr = 4;
  double totalDex = 4;
  double totalInt = 4;
  double totalLuk = 4;
  double totalDamage = 0.10;
  double totalBossDmanage = 0.20;
  double totalFinalDamage = 0.30;
  double totalMastery = 0.8;
  double totalBuffDuration = 0.1;
  double totalIgnoreDefense = 0.9632;
  double totalElementalIgnoreDefense = 0.05;
  double totalItemDropRate = 0.5;
  double totalMesosObtained = 0.5;
  double totalCritRate = 1.23;
  double totalCritDamage = 1.53;
  int totalAttackSpeed = 10;
  double totalAttack = 6000.99;
  double totalMAttack = 500;
  int totalStatusResistance = 78;
  double totalKnockbackResistance = 1.00;
  double totalDefense = 60000;
  int totalStarForce = 600;
  double totalSpeed = 1.4;
  int totalArcaneForce = 100;
  double totalJump = 1.4;
  int totalSacredPower = 500;
  

  HyperStatsModule hyperStatsModule = HyperStatsModule();
  APStatsModule apStatsModule = APStatsModule();

  void updateCharacterLevel(int selectedLevel) {
    apStatsModule.setAvailableAPFromLevel(selectedLevel);
    hyperStatsModule.setAvailableHyperStatsFromLevel(selectedLevel);
    characterLevel = selectedLevel;
    notifyListeners();
  }

  List<Equip> unequippedEquips = <Equip>[];

  void addApToStat(int apAmount, StatType statType) {
    apStatsModule.addApToStat(apAmount, statType);
    notifyListeners();
  }

  void subtractApToStat(int apAmount, StatType statType) {
    apStatsModule.subtractApToStat(apAmount, statType);
    notifyListeners();
  }

}