import 'package:flutter/material.dart';
import 'package:maplestory_builder/core/constants.dart';
import 'package:maplestory_builder/providers/ap_stats_provider.dart';
import 'package:maplestory_builder/providers/equips_provider.dart';
import 'package:maplestory_builder/providers/hyper_stats_provider.dart';
import 'dart:math';

class CharacterProvider with ChangeNotifier {
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
  double upperDamageRange = 0;
  double upperBossDamangeRange = 0;
  // Include things not normally shown in the damage range, ied, iedr, crit damage (crit rate)
  double upperEffectiveDamageRange = 0;
  double upperEffectiveBossDamangeRange = 0;
  double totalHpRecovery = 0;
  int totalSkillCooldown = 0;
  double totalSkillCooldownPercentage = 0;
  double totalHp = 0;
  double totalMp = 0;
  double totalStr = 0;
  double totalDex = 0;
  double totalInt = 0;
  double totalLuk = 0;
  double totalDamage = 0;
  double totalDamageNormalMobs = 0;
  double totalBossDamage = 0;
  double totalFinalDamage = 0;
  double totalMastery = 0.8;
  double totalBuffDuration = 0;
  double totalIgnoreDefense = 0;
  double totalElementalIgnoreDefense = 0;
  double totalItemDropRate = 0;
  double totalMesosObtained = 0;
  double totalCritRate = 0;
  double totalCritDamage = 0;
  int totalAttackSpeed = 0;
  double totalAttack = 0;
  double totalMAttack = 0;
  int totalStatusResistance = 0;
  double totalKnockbackResistance = 0;
  double totalDefense = 0;
  int totalStarForce = 0;
  int totalSpeed = 100;
  int totalJump = 100;
  int totalArcaneForce = 0;
  int totalSacredPower = 0;
  // Weapon Multiplier will change depending on equipped weapon, default (no weapon) is 1.4 
  double weaponMultiplier = 1.4;

  // This essentially is ap stats, but also includes multipliers that would effect it such as MW
  num pureHp = 0;
  num pureMP = 0;
  num pureStr = 0;
  num pureDex = 0;
  num pureInt = 0;
  num pureLuk = 0;
  num attack = 0;
  num mattack = 0;

  // Track flat stats that will be added later
  num flatHp = 0;
  num flatMP = 0;
  num flatStr = 0;
  num flatDex = 0;
  num flatInt = 0;
  num flatLuk = 0;
  num flatAttack = 0;
  num flatMAttack = 0;

  // Track the total percentage for stats
  double strPercentage = 0;
  double dexPercentage = 0;
  double intPercentage = 0;
  double lukPercentage = 0;
  double hpPercentage = 0;
  double mpPercentage = 0;
  double defensePercentage = 0;
  double attackPercentage = 0;
  double mattackPercentage = 0;
  
  HyperStatsProvider hyperStatsProvider;
  APStatsProvider apStatsProvider;
  EquipsProvider equipsProvider;

  CharacterProvider({required this.apStatsProvider, required this.hyperStatsProvider, required this.equipsProvider, bool doCalculation = true}){
    if (doCalculation) {
      calculateEverything();
    }
  }

  CharacterProvider copyWith({APStatsProvider? apStatsProvider, HyperStatsProvider? hyperStatsProvider, EquipsProvider? equipsProvider, bool doCalculation = true}){
    return CharacterProvider(
      apStatsProvider: apStatsProvider ?? this.apStatsProvider.copyWith(),
      hyperStatsProvider: hyperStatsProvider ?? this.hyperStatsProvider.copyWith(),
      equipsProvider: equipsProvider ?? this.equipsProvider.copyWith(),
      doCalculation: doCalculation,
    );
  }

  CharacterProvider update(APStatsProvider apStatsProvider, HyperStatsProvider hyperStatsProvider, EquipsProvider equipsProvider) {
    calculateEverything();
    notifyListeners();
    return this;
  }

  void updateCharacterLevel(int selectedLevel) {
    apStatsProvider.setAvailableAPFromLevel(selectedLevel);
    hyperStatsProvider.setAvailableHyperStatsFromLevel(selectedLevel);
    characterLevel = selectedLevel;
    notifyListeners();
  }

  void calculateEverything({bool recalculateCache = false}){
    totalHpRecovery = 0;
    totalStr = 0;
    totalDex = 0;
    totalInt = 0;
    totalLuk = 0;
    totalHp = 0;
    totalMp = 0;
    totalDamage = 0;
    totalDamageNormalMobs = 0;
    totalBossDamage = 0;
    totalFinalDamage = 0;
    totalMastery = 0.8;
    totalBuffDuration = 0;
    totalIgnoreDefense = 0;
    totalElementalIgnoreDefense = 0;
    totalItemDropRate = 0;
    totalMesosObtained = 0;
    totalCritRate = 0;
    totalCritDamage = 0;
    totalAttackSpeed = 0;
    totalAttack = 0;
    totalMAttack = 0;
    totalStatusResistance = 0;
    totalKnockbackResistance = 0;
    totalDefense = 0;
    totalStarForce = 0;
    totalSpeed = 100;
    totalJump = 100;
    totalArcaneForce = 0;
    totalSacredPower = 0;
    flatHp = 0;
    flatMP = 0;
    flatStr = 0;
    flatDex = 0;
    flatInt = 0;
    flatLuk = 0;
    flatAttack = 0;
    flatMAttack = 0;
    strPercentage = 0;
    dexPercentage = 0;
    intPercentage = 0;
    lukPercentage = 0;
    hpPercentage = 0;
    mpPercentage = 0;
    defensePercentage = 0;
    attackPercentage = 0;
    mattackPercentage = 0;
    totalMesosObtained = 0;
    totalItemDropRate = 0;
    totalSkillCooldown = 0;
    totalSkillCooldownPercentage = 0;

    num tempStr = 0;
    num tempDex = 0;
    num tempInt = 0;
    num tempLuk = 0;
    num tempHp = 0;
    num tempMp = 0;
    num tempDefense = 0;
    num tempAttack = 0;
    num tempMattack = 0;
    num tempIgnoreDefense = 0;
    

    void updateTempStats(Map<StatType, num> stats) {
      for(MapEntry<StatType, num> entry in stats.entries) {
        switch(entry.key) {
          case StatType.hp:
            tempHp += entry.value;
          case StatType.mp:
            tempMp += entry.value;
          case StatType.str:
            tempStr += entry.value;
          case StatType.dex:
            tempDex += entry.value;
          case StatType.int:
            tempInt += entry.value;
          case StatType.luk:
            tempLuk += entry.value;
          case StatType.allStats:
            tempStr += entry.value;
            tempDex += entry.value;
            tempInt += entry.value;
            tempLuk += entry.value;
          case StatType.attack:
            tempAttack += entry.value;
          case StatType.mattack:
            tempMattack += entry.value;
          case StatType.starForce:
            totalStarForce += entry.value.toInt();
          case StatType.defense:
            tempDefense += entry.value;
          case StatType.ignoreDefense:
            tempIgnoreDefense = entry.value;
          case StatType.speed:
            totalSpeed += entry.value.toInt();
          case StatType.jump:
            totalJump += entry.value.toInt();
          case StatType.bossDamage:
            totalBossDamage += entry.value;
          case StatType.ignoreElementalDefense:
            totalBossDamage += entry.value;
          case StatType.damage:
            totalDamage += entry.value;
          case StatType.damageNormalMobs:
            totalDamageNormalMobs += entry.value;
          case StatType.finalDamage:
            totalFinalDamage *= entry.value;
          case StatType.finalHp:
            flatHp += entry.value;
          case StatType.finalMp:
            flatMP += entry.value;
          case StatType.finalStr:
            flatStr += entry.value;
          case StatType.finalDex:
            flatDex += entry.value;
          case StatType.finalInt:
            flatInt += entry.value;
          case StatType.finalLuk:
            flatLuk += entry.value;
          case StatType.finalAttack:
            flatAttack += entry.value;
          case StatType.finalMAttack:
            flatMAttack += entry.value;
          case StatType.attackSpeed:
            totalAttackSpeed += entry.value.toInt();
          case StatType.strPercentage:
            strPercentage += entry.value;
          case StatType.dexPercentage:
            dexPercentage += entry.value;
          case StatType.intPercentage:
            intPercentage += entry.value;
          case StatType.lukPercentage:
            lukPercentage += entry.value;
          case StatType.allStatsPercentage:
            strPercentage += entry.value;
            dexPercentage += entry.value;
            intPercentage += entry.value;
            lukPercentage += entry.value;
          case StatType.hpPercentage:
            hpPercentage += entry.value;
          case StatType.mpPercentage:
            mpPercentage += entry.value;
          case StatType.attackPercentage:
            attackPercentage += entry.value;
          case StatType.mattackPercentage:
            mattackPercentage += entry.value;
          case StatType.defensePercentage:
            defensePercentage += entry.value;
          case StatType.mesosObtained:
            totalMesosObtained += entry.value;
          case StatType.itemDropRate:
            totalItemDropRate += entry.value;
          case StatType.critDamage:
            totalCritDamage += entry.value;
          case StatType.critRate:
            totalCritRate += entry.value;
          case StatType.hpRecovery:
            totalHpRecovery += entry.value;
          case StatType.skillCooldown:
            totalSkillCooldown += entry.value.toInt();
          case StatType.skillCooldownPercentage:
            totalSkillCooldownPercentage += entry.value;
          default:
            throw Exception("Unhandled StatType for returned Stats: ${entry.key}");
        }
      }
    }

    updatePureStats(apStatsProvider.calculateStats());

    for (Map<StatType, num> equipStats in equipsProvider.calculateStats(recalculateCache: recalculateCache)){
      updateTempStats(equipStats);
    }
    // Specific caps on stats from items
    totalItemDropRate = min(totalItemDropRate, dropRateItemCap);
    totalMesosObtained = min(totalMesosObtained, mesoObtainedItemCap);
    
    totalHp = (pureHp + tempHp) * (1 + hpPercentage) + flatHp;
    totalMp = (pureMP + tempMp) * (1 + mpPercentage) + flatMP;
    totalStr = (pureStr + tempStr) * (1 + strPercentage) + flatStr;
    totalDex = (pureDex + tempDex) * (1 + dexPercentage) + flatDex;
    totalInt = (pureInt + tempInt) * (1 + intPercentage) + flatInt;
    totalLuk = (pureLuk + tempLuk) * (1 + lukPercentage) + flatLuk;
    totalAttack = (attack + tempAttack) * (1 + attackPercentage) + flatAttack;
    totalMAttack = (mattack + tempMattack) * (1 + mattackPercentage) + flatMAttack;
    totalDefense = tempDefense.toDouble();
    totalIgnoreDefense = tempIgnoreDefense.toDouble();

    // Stats with a non-visual upper bound
    totalJump = min(totalJump, jumpCap);
    totalSpeed = min(totalSpeed, speedCap);
    totalItemDropRate = min(totalItemDropRate, dropRateCap);
    totalMesosObtained = min(totalMesosObtained, mesoObtainedCap);

    var statValue = ((4 * totalDex) + totalStr);
    var upperRange = weaponMultiplier * statValue * (totalAttack) * (1 + totalFinalDamage);
    upperDamageRange =  upperRange * (1 + totalDamage);
    upperBossDamangeRange =  upperRange * (1 + totalDamage + totalBossDamage);
  }

  void updatePureStats(Map<StatType, num> apStats) {
    for(MapEntry<StatType, num> entry in apStats.entries) {
      switch(entry.key) {
        case StatType.hp:
          pureHp = entry.value;
        case StatType.mp:
          pureMP = entry.value;
        case StatType.str:
          pureStr = entry.value;
        case StatType.dex:
          pureDex = entry.value;
        case StatType.int:
          pureInt = entry.value;
        case StatType.luk:
          pureLuk = entry.value;
        default:
          throw Exception("Unhandled StatType for BaseStats: ${entry.key}");
      }
    }
  }
}