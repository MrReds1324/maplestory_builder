import 'package:flutter/material.dart';
import 'package:maplestory_builder/constants/constants.dart';
import 'package:maplestory_builder/modules/utilities/utilities.dart';
import 'package:maplestory_builder/providers/ap_stats_provider.dart';
import 'package:maplestory_builder/providers/equips_provider.dart';
import 'package:maplestory_builder/providers/hyper_stats_provider.dart';
import 'dart:math';

import 'package:maplestory_builder/providers/trait_stats_provider.dart';

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

  // Weapon Multiplier will change depending on equipped weapon, default (no weapon) is 1.4 
  double weaponMultiplier = 1.4;

  Map<StatType, num> totalStats = getDefaultStatMap();

  // This essentially is ap stats, but also includes multipliers that would effect it such as MW
  Map<StatType, num> pureStats = {
    StatType.hp: 0,
    StatType.mp: 0,
    StatType.str: 0,
    StatType.dex: 0,
    StatType.int: 0,
    StatType.luk: 0,
  };
  
  
  APStatsProvider apStatsProvider;
  TraitStatsProvider traitStatsProvider;
  HyperStatsProvider hyperStatsProvider;
  EquipsProvider equipsProvider;

  CharacterProvider({
    this.characterLevel = 0,
    required this.apStatsProvider,
    required this.traitStatsProvider, 
    required this.hyperStatsProvider, 
    required this.equipsProvider, 
    bool doCalculation = true
  }){
    if (doCalculation) {
      calculateEverything();
    }
  }

  CharacterProvider copyWith({
    int? characterLevel,
    APStatsProvider? apStatsProvider,
    TraitStatsProvider? traitStatsProvider,
    HyperStatsProvider? hyperStatsProvider, 
    EquipsProvider? equipsProvider, 
    bool doCalculation = true
  }){
    return CharacterProvider(
      characterLevel: characterLevel ?? this.characterLevel,
      apStatsProvider: apStatsProvider ?? this.apStatsProvider.copyWith(),
      traitStatsProvider: traitStatsProvider ?? this.traitStatsProvider.copyWith(),
      hyperStatsProvider: hyperStatsProvider ?? this.hyperStatsProvider.copyWith(),
      equipsProvider: equipsProvider ?? this.equipsProvider.copyWith(),
      doCalculation: doCalculation,
    );
  }

  num getPureStat(StatType statType) {
    return pureStats[statType] ?? 0;
  }

  CharacterProvider update(APStatsProvider apStatsProvider, TraitStatsProvider traitStatsProvider, HyperStatsProvider hyperStatsProvider, EquipsProvider equipsProvider) {
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
    totalStats = getDefaultStatMap();
    var tempStats = getDefaultStatMap();

    void updateTempStats(Map<StatType, num> stats) {
      for(MapEntry<StatType, num> entry in stats.entries) {
        switch(entry.key) {
          case StatType.hpMp:
            tempStats[StatType.hp] = tempStats[StatType.hp]! + entry.value;
            tempStats[StatType.mp] = tempStats[StatType.mp]! + entry.value;
          case StatType.allStats:
            tempStats[StatType.str] = tempStats[StatType.str]! + entry.value;
            tempStats[StatType.dex] = tempStats[StatType.dex]! + entry.value;
            tempStats[StatType.int] = tempStats[StatType.int]! + entry.value;
            tempStats[StatType.luk] = tempStats[StatType.luk]! + entry.value;
          case StatType.attackMattack:
            tempStats[StatType.attack] = tempStats[StatType.attack]! + entry.value;
            tempStats[StatType.mattack] = tempStats[StatType.mattack]! + entry.value;
          case StatType.allStatsPercentage:
            tempStats[StatType.strPercentage] = tempStats[StatType.strPercentage]! + entry.value;
            tempStats[StatType.dexPercentage] = tempStats[StatType.dexPercentage]! + entry.value;
            tempStats[StatType.intPercentage] = tempStats[StatType.intPercentage]! + entry.value;
            tempStats[StatType.lukPercentage] = tempStats[StatType.lukPercentage]! + entry.value;
          case StatType.hpMpPercentage:
            tempStats[StatType.hpPercentage] = tempStats[StatType.hpPercentage]! + entry.value;
            tempStats[StatType.mpPercentage] = tempStats[StatType.mpPercentage]! + entry.value;
          case StatType.hp:
          case StatType.mp:
          case StatType.str:
          case StatType.dex:
          case StatType.int:
          case StatType.luk:
          case StatType.attack:
          case StatType.mattack:
          case StatType.defense:
            tempStats[entry.key] = tempStats[entry.key]! + entry.value;
          case StatType.ignoreDefense:
            totalStats[entry.key] = calculateIgnoreDefense(totalStats[entry.key]!, entry.value);
          case StatType.exp:
            // TODO: figure out exp too...
            totalStats[StatType.exp] = totalStats[StatType.exp]! + entry.value;
          default:
            totalStats[entry.key] = totalStats[entry.key]! + entry.value;
        }
      }
    }

    pureStats = apStatsProvider.calculateStats();

    updateTempStats(traitStatsProvider.calculateStats());

    for (Map<StatType, num> equipStats in equipsProvider.calculateStats()){
      updateTempStats(equipStats);
    }

    updateTempStats(hyperStatsProvider.calculateModuleStats());

    // Specific caps on stats from items
    totalStats[StatType.itemDropRate] = min(totalStats[StatType.itemDropRate]!, dropRateItemCap);
    totalStats[StatType.mesosObtained] = min(totalStats[StatType.mesosObtained]!, mesoObtainedItemCap);

    tempStats[StatType.hp] = tempStats[StatType.hp]! + (characterLevel * 50);
    tempStats[StatType.mp] = tempStats[StatType.mp]! + (characterLevel * 50);
    
    totalStats[StatType.hp] = (getPureStat(StatType.hp) + tempStats[StatType.hp]!) * (1 + totalStats[StatType.hpPercentage]!) + totalStats[StatType.finalHp]!;
    totalStats[StatType.mp] = (getPureStat(StatType.mp) + tempStats[StatType.mp]!) * (1 + totalStats[StatType.mpPercentage]!) + totalStats[StatType.finalMp]!;
    totalStats[StatType.str] = (getPureStat(StatType.str) + tempStats[StatType.str]!) * (1 + totalStats[StatType.strPercentage]!) + totalStats[StatType.finalStr]!;
    totalStats[StatType.dex] = (getPureStat(StatType.dex) + tempStats[StatType.dex]!) * (1 + totalStats[StatType.dexPercentage]!) + totalStats[StatType.finalDex]!;
    totalStats[StatType.int] = (getPureStat(StatType.int) + tempStats[StatType.int]!) * (1 + totalStats[StatType.intPercentage]!) + totalStats[StatType.finalInt]!;
    totalStats[StatType.luk] = (getPureStat(StatType.luk) + tempStats[StatType.luk]!) * (1 + totalStats[StatType.lukPercentage]!) + totalStats[StatType.finalLuk]!;

    totalStats[StatType.attack] = tempStats[StatType.attack]! * (1 + totalStats[StatType.attackPercentage]!) + totalStats[StatType.finalAttack]!;
    totalStats[StatType.mattack] = tempStats[StatType.mattack]! * (1 + totalStats[StatType.mattackPercentage]!) + totalStats[StatType.finalMAttack]!;
    totalStats[StatType.defense] = tempStats[StatType.defense]! * (1 + totalStats[StatType.defensePercentage]!);

    // Stats with a non-visual upper bound
    totalStats[StatType.jump] = min(totalStats[StatType.jump]!, jumpCap);
    totalStats[StatType.speed] = min(totalStats[StatType.speed]!, speedCap);
    totalStats[StatType.itemDropRate] = min(totalStats[StatType.itemDropRate]!, dropRateItemCap);
    totalStats[StatType.mesosObtained] = min(totalStats[StatType.mesosObtained]!, mesoObtainedItemCap);

    var statValue = ((4 * totalStats[StatType.dex]!) + totalStats[StatType.str]!);
    var upperRange = weaponMultiplier * statValue * (totalStats[StatType.attack]!) * (1 + totalStats[StatType.finalDamage]!);

    upperDamageRange =  upperRange * (1 + totalStats[StatType.damage]!);
    upperBossDamangeRange =  upperRange * (1 + totalStats[StatType.damage]! + totalStats[StatType.bossDamage]!);
  }

  static Map<StatType, num> getDefaultStatMap() {
    Map<StatType, num> defaultStats = {};

    for(StatType statType in StatType.values) {
      switch(statType) {
        case StatType.mastery:
          defaultStats[statType] = 0.5;
        case StatType.jump:
        case StatType.speed:
          defaultStats[statType] = 100;
        default:
          defaultStats[statType] = 0;
      }
    }

    return defaultStats;
  }
}