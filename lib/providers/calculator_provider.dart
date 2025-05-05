import 'dart:math';

import 'package:flutter/material.dart';
import 'package:maplestory_builder/constants/character/classes.dart';
import 'package:maplestory_builder/constants/constants.dart';
import 'package:maplestory_builder/modules/base.dart';
import 'package:maplestory_builder/modules/utilities/utilities.dart';
import 'package:maplestory_builder/providers/character/ap_stats_provider.dart';
import 'package:maplestory_builder/providers/character/character_provider.dart';
import 'package:maplestory_builder/providers/character/hyper_stats_provider.dart';
import 'package:maplestory_builder/providers/character/inner_ability_provider.dart';
import 'package:maplestory_builder/providers/character/symbol_stats_provider.dart';
import 'package:maplestory_builder/providers/character/trait_stats_provider.dart';
import 'package:maplestory_builder/providers/consumables/consumables_provider.dart';
import 'package:maplestory_builder/providers/equipment/equips_provider.dart';
import 'package:maplestory_builder/providers/familiars/familiars_provider.dart';
import 'package:maplestory_builder/providers/hexa_stats/hexa_stats_provider.dart';
import 'package:maplestory_builder/providers/legion/legion_artifacts_provider.dart';
import 'package:maplestory_builder/providers/legion/legion_stats_provider.dart';

class CalculatorProvider with ChangeNotifier implements Copyable {
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

  // This is used to calculate the range as every class has different stats
  List<StatType> primaryStats = [];
  List<StatType> secondaryStats = [];

  CharacterProvider characterProvider;
  APStatsProvider apStatsProvider;
  InnerAbilityProvider innerAbilityProvider;
  TraitStatsProvider traitStatsProvider;
  HyperStatsProvider hyperStatsProvider;
  SymbolStatsProvider symbolStatsProvider;
  EquipsProvider equipsProvider;
  LegionStatsProvider legionStatsProvider;
  LegionArtifactProvider legionArtifactProvider;
  FamiliarsProvider familiarsProvider;
  HexaStatsProvider hexaStatsProvider;
  ConsumablesProvider consumablesProvider;

  CalculatorProvider(
      {required this.characterProvider,
      required this.apStatsProvider,
      required this.innerAbilityProvider,
      required this.traitStatsProvider,
      required this.hyperStatsProvider,
      required this.symbolStatsProvider,
      required this.equipsProvider,
      required this.legionStatsProvider,
      required this.legionArtifactProvider,
      required this.familiarsProvider,
      required this.hexaStatsProvider,
      required this.consumablesProvider,
      bool doCalculation = true}) {
    if (doCalculation) {
      calculateEverything();
    }
  }

  @override
  CalculatorProvider copyWith(
      {CharacterProvider? characterProvider,
      APStatsProvider? apStatsProvider,
      InnerAbilityProvider? innerAbilityProvider,
      TraitStatsProvider? traitStatsProvider,
      HyperStatsProvider? hyperStatsProvider,
      SymbolStatsProvider? symbolStatsProvider,
      EquipsProvider? equipsProvider,
      LegionStatsProvider? legionStatsProvider,
      LegionArtifactProvider? legionArtifactProvider,
      FamiliarsProvider? familiarsProvider,
      HexaStatsProvider? hexaStatsProvider,
      ConsumablesProvider? consumablesProvider,
      bool doCalculation = true}) {
    return CalculatorProvider(
      characterProvider: characterProvider ?? this.characterProvider.copyWith(),
      apStatsProvider: apStatsProvider ?? this.apStatsProvider.copyWith(),
      innerAbilityProvider:
          innerAbilityProvider ?? this.innerAbilityProvider.copyWith(),
      traitStatsProvider:
          traitStatsProvider ?? this.traitStatsProvider.copyWith(),
      hyperStatsProvider:
          hyperStatsProvider ?? this.hyperStatsProvider.copyWith(),
      symbolStatsProvider:
          symbolStatsProvider ?? this.symbolStatsProvider.copyWith(),
      equipsProvider: equipsProvider ?? this.equipsProvider.copyWith(),
      legionStatsProvider:
          legionStatsProvider ?? this.legionStatsProvider.copyWith(),
      legionArtifactProvider:
          legionArtifactProvider ?? this.legionArtifactProvider.copyWith(),
      familiarsProvider: familiarsProvider ?? this.familiarsProvider.copyWith(),
      hexaStatsProvider: hexaStatsProvider ?? this.hexaStatsProvider.copyWith(),
      consumablesProvider:
          consumablesProvider ?? this.consumablesProvider.copyWith(),
      doCalculation: doCalculation,
    );
  }

  num getPureStat(StatType statType) {
    return pureStats[statType] ?? 0;
  }

  CalculatorProvider update(
    CharacterProvider characterProvider,
    APStatsProvider apStatsProvider,
    InnerAbilityProvider innerAbilityProvider,
    TraitStatsProvider traitStatsProvider,
    HyperStatsProvider hyperStatsProvider,
    SymbolStatsProvider symbolStatsProvider,
    EquipsProvider equipsProvider,
    LegionStatsProvider legionStatsProvider,
    LegionArtifactProvider legionArtifactProvider,
    FamiliarsProvider familiarsProvider,
    HexaStatsProvider hexaStatsProvider,
    ConsumablesProvider consumablesProvider,
  ) {
    calculateEverything();
    notifyListeners();
    return this;
  }

  void calculateEverything({bool recalculateCache = false}) {
    totalStats = getDefaultStatMap();
    var tempStats = getDefaultStatMap();

    void updateTempStats(Map<StatType, num> stats) {
      for (MapEntry<StatType, num> entry in stats.entries) {
        switch (entry.key) {
          case StatType.hpMp:
            tempStats[StatType.hp] = tempStats[StatType.hp]! + entry.value;
            tempStats[StatType.mp] = tempStats[StatType.mp]! + entry.value;
          case StatType.allStats:
            tempStats[StatType.str] = tempStats[StatType.str]! + entry.value;
            tempStats[StatType.dex] = tempStats[StatType.dex]! + entry.value;
            tempStats[StatType.int] = tempStats[StatType.int]! + entry.value;
            tempStats[StatType.luk] = tempStats[StatType.luk]! + entry.value;
          case StatType.attackMattack:
            tempStats[StatType.attack] =
                tempStats[StatType.attack]! + entry.value;
            tempStats[StatType.mattack] =
                tempStats[StatType.mattack]! + entry.value;
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
          case StatType.speedJump:
            totalStats[StatType.jump] =
                totalStats[StatType.jump]! + entry.value;
            totalStats[StatType.speed] =
                totalStats[StatType.speed]! + entry.value;
          case StatType.allStatsPercentage:
            totalStats[StatType.strPercentage] =
                totalStats[StatType.strPercentage]! + entry.value;
            totalStats[StatType.dexPercentage] =
                totalStats[StatType.dexPercentage]! + entry.value;
            totalStats[StatType.intPercentage] =
                totalStats[StatType.intPercentage]! + entry.value;
            totalStats[StatType.lukPercentage] =
                totalStats[StatType.lukPercentage]! + entry.value;
          case StatType.hpMpPercentage:
            totalStats[StatType.hpPercentage] =
                totalStats[StatType.hpPercentage]! + entry.value;
            totalStats[StatType.mpPercentage] =
                totalStats[StatType.mpPercentage]! + entry.value;
          case StatType.finalStrDex:
            totalStats[StatType.finalStr] =
                totalStats[StatType.finalStr]! + entry.value;
            totalStats[StatType.finalDex] =
                totalStats[StatType.finalDex]! + entry.value;
          case StatType.finalStrInt:
            totalStats[StatType.finalStr] =
                totalStats[StatType.finalStr]! + entry.value;
            totalStats[StatType.finalInt] =
                totalStats[StatType.finalInt]! + entry.value;
          case StatType.finalStrLuk:
            totalStats[StatType.finalStr] =
                totalStats[StatType.finalStr]! + entry.value;
            totalStats[StatType.finalLuk] =
                totalStats[StatType.finalLuk]! + entry.value;
          case StatType.finalDexInt:
            totalStats[StatType.finalDex] =
                totalStats[StatType.finalDex]! + entry.value;
            totalStats[StatType.finalInt] =
                totalStats[StatType.finalInt]! + entry.value;
          case StatType.finalDexLuk:
            totalStats[StatType.finalDex] =
                totalStats[StatType.finalDex]! + entry.value;
            totalStats[StatType.finalLuk] =
                totalStats[StatType.finalLuk]! + entry.value;
          case StatType.finalIntLuk:
            totalStats[StatType.finalInt] =
                totalStats[StatType.finalInt]! + entry.value;
            totalStats[StatType.finalLuk] =
                totalStats[StatType.finalLuk]! + entry.value;
          case StatType.finalStrDexLuk:
            totalStats[StatType.finalStr] =
                totalStats[StatType.finalStr]! + entry.value;
            totalStats[StatType.finalDex] =
                totalStats[StatType.finalDex]! + entry.value;
            totalStats[StatType.finalLuk] =
                totalStats[StatType.finalLuk]! + entry.value;
          case StatType.expMultiplicative:
            totalStats[entry.key] = totalStats[entry.key]! * (1 + entry.value);
          case StatType.ignoreDefense:
            totalStats[entry.key] =
                calculateIgnoreDefense(totalStats[entry.key]!, entry.value);
          case StatType.exp:
            // TODO: figure out exp too...
            totalStats[StatType.exp] = totalStats[StatType.exp]! + entry.value;
          default:
            totalStats[entry.key] = totalStats[entry.key]! + entry.value;
        }
      }
    }

    pureStats = apStatsProvider.calculateStats();

    for (Map<StatType, num> equipStats in equipsProvider.calculateStats()) {
      updateTempStats(equipStats);
    }
    updateTempStats(symbolStatsProvider.calculateStats());

    // Specific caps on stats from items
    totalStats[StatType.itemDropRate] =
        min(totalStats[StatType.itemDropRate]!, DROP_RATE_ITEM_CAP);
    totalStats[StatType.mesosObtained] =
        min(totalStats[StatType.mesosObtained]!, MESOS_OBTAINED_ITEM_CAP);

    for (Map<StatType, num> familiarStats
        in familiarsProvider.calculateStats()) {
      updateTempStats(familiarStats);
    }

    updateTempStats(hyperStatsProvider.calculateStats());
    updateTempStats(innerAbilityProvider.calculateStats());
    updateTempStats(traitStatsProvider.calculateStats());
    updateTempStats(legionStatsProvider.calculateStats());
    updateTempStats(legionArtifactProvider.calculateStats());
    updateTempStats(hexaStatsProvider.calculateStats());

    updateTempStats(consumablesProvider.calculateStats());

    var calculatedCharacterLevel =
        max(characterProvider.characterLevel - 10, 0);
    tempStats[StatType.hp] =
        tempStats[StatType.hp]! + (calculatedCharacterLevel * 50);
    tempStats[StatType.mp] =
        tempStats[StatType.mp]! + (calculatedCharacterLevel * 50);

    totalStats[StatType.hp] =
        ((getPureStat(StatType.hp) + tempStats[StatType.hp]!) *
                (1 + totalStats[StatType.hpPercentage]!)) +
            totalStats[StatType.finalHp]!;
    totalStats[StatType.mp] =
        ((getPureStat(StatType.mp) + tempStats[StatType.mp]!) *
                (1 + totalStats[StatType.mpPercentage]!)) +
            totalStats[StatType.finalMp]!;
    totalStats[StatType.str] =
        ((getPureStat(StatType.str) + tempStats[StatType.str]!) *
                (1 + totalStats[StatType.strPercentage]!)) +
            totalStats[StatType.finalStr]!;
    totalStats[StatType.dex] =
        ((getPureStat(StatType.dex) + tempStats[StatType.dex]!) *
                (1 + totalStats[StatType.dexPercentage]!)) +
            totalStats[StatType.finalDex]!;
    totalStats[StatType.int] =
        ((getPureStat(StatType.int) + tempStats[StatType.int]!) *
                (1 + totalStats[StatType.intPercentage]!)) +
            totalStats[StatType.finalInt]!;
    totalStats[StatType.luk] =
        ((getPureStat(StatType.luk) + tempStats[StatType.luk]!) *
                (1 + totalStats[StatType.lukPercentage]!)) +
            totalStats[StatType.finalLuk]!;

    totalStats[StatType.attack] = (tempStats[StatType.attack]! *
            (1 + totalStats[StatType.attackPercentage]!)) +
        totalStats[StatType.finalAttack]!;
    totalStats[StatType.mattack] = (tempStats[StatType.mattack]! *
            (1 + totalStats[StatType.mattackPercentage]!)) +
        totalStats[StatType.finalMAttack]!;
    totalStats[StatType.defense] = tempStats[StatType.defense]! *
        (1 + totalStats[StatType.defensePercentage]!);

    // Stats with a non-visual upper bound
    totalStats[StatType.jump] = min(totalStats[StatType.jump]!, JUMP_CAP);
    totalStats[StatType.speed] = min(totalStats[StatType.speed]!, SPEED_CAP);
    totalStats[StatType.itemDropRate] =
        min(totalStats[StatType.itemDropRate]!, DROP_RATE_ITEM_CAP);
    totalStats[StatType.mesosObtained] =
        min(totalStats[StatType.mesosObtained]!, MESOS_OBTAINED_ITEM_CAP);

    primaryStats = determineAllPrimaryStat(
        characterProvider.characterClass.calculationStats);
    secondaryStats = determineAllSecondaryStat(
        characterProvider.characterClass.calculationStats);
    num statValue = 0;
    switch (characterProvider.characterClass) {
      case CharacterClass.demonAvenger:
        // {\displaystyle floor(PureHP/3.5)+0.8\times floor((TotalHP-PureHP)/3.5)+STR} Taken from https://strategywiki.org/wiki/MapleStory/Formulas#Final_Total_Stats
        statValue = (pureStats[StatType.hp]! / 3.5).floor() +
            (0.8 *
                ((totalStats[StatType.hp]! - pureStats[StatType.hp]!) / 3.5)
                    .floor()) +
            totalStats[StatType.str]!;
      case CharacterClass.xenon:
        num mainStatValue = 0;
        for (StatType mainStatType in primaryStats) {
          mainStatValue += totalStats[mainStatType]!;
        }

        statValue = (3.5 * mainStatValue);
      default:
        num mainStatValue = 0;
        num secondaryStatValue = 0;
        for (StatType mainStatType in primaryStats) {
          mainStatValue += totalStats[mainStatType]!;
        }

        for (StatType secondaryStatType in secondaryStats) {
          secondaryStatValue += totalStats[secondaryStatType]!;
        }

        statValue = (4 * mainStatValue) + secondaryStatValue;
    }
    var upperRange = weaponMultiplier *
        statValue *
        (totalStats[StatType.attack]! / 100) *
        (1 + totalStats[StatType.finalDamage]!);

    upperDamageRange = upperRange * (1 + totalStats[StatType.damage]!);
    upperBossDamangeRange = upperRange *
        (1 + totalStats[StatType.damage]! + totalStats[StatType.bossDamage]!);
  }

  static Map<StatType, num> getDefaultStatMap() {
    Map<StatType, num> defaultStats = {};

    for (StatType statType in StatType.values) {
      switch (statType) {
        case StatType.expMultiplicative:
          defaultStats[statType] = 1;
        case StatType.critRate:
          defaultStats[statType] = 0.05;
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
