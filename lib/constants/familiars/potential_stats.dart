// ignore_for_file: constant_identifier_names

import 'package:flutter/material.dart';
import 'package:maplestory_builder/constants/constants.dart';

enum PotentialCategory {
  none, // Used for equipment the player is unable to potential at all
  player, // Used for equipment the player is able to modify
  static, // Used for equipment that has static/unmodifiable potentials
}

typedef RangedPotentialType = List<num>;
typedef StaticPotentialType = num;

const List<EquipType> noPotentialCategory = <EquipType>[
  EquipType.medal,
];

enum FamiliarPotentialTier {
  normal(formattedName: "Normal", short: "N", color: statColor), // Will filter this out in the UI, mainly here to make potentials sensible
  common(formattedName: "Common", short: "C", color: statColor),
  rare(formattedName: "Rare", short: "R", color: rarePotentialColor),
  epic(formattedName: "Epic", short: "E", color: epicPotentialColor),
  unique(formattedName: "Unique", short: "U", color: uniquePotentialColor),
  legendary(formattedName: "Legendary", short: "L", color: legendaryPotentialColor);

  const FamiliarPotentialTier({
    required this.formattedName,
    required this.short,
    required this.color,
  });

  final String formattedName;
  final String short;
  final Color color;
}

enum FamiliarPotential {
  normalStr(
    familiarPotentialTier: FamiliarPotentialTier.normal,
    statType: StatType.str,
    statValue: [1]
  ),
  normalDex(
    familiarPotentialTier: FamiliarPotentialTier.normal,
    statType: StatType.dex,
    statValue: [1]
  ),
  normalInt(
    familiarPotentialTier: FamiliarPotentialTier.normal,
    statType: StatType.int,
    statValue: [1]
  ),
  normalLuk(
    familiarPotentialTier: FamiliarPotentialTier.normal,
    statType: StatType.luk,
    statValue: [1]
  ),
  normalHp(
    familiarPotentialTier: FamiliarPotentialTier.normal,
    statType: StatType.hp,
    statValue: [5]
  ),
  normalMp(
    familiarPotentialTier: FamiliarPotentialTier.normal,
    statType: StatType.mp,
    statValue: [5]
  ),
  normalSpeed(
    familiarPotentialTier: FamiliarPotentialTier.normal,
    statType: StatType.speed,
    statValue: [1]
  ),
  normalJump(
    familiarPotentialTier: FamiliarPotentialTier.normal,
    statType: StatType.jump,
    statValue: [1]
  ),
  normalAttack(
    familiarPotentialTier: FamiliarPotentialTier.normal,
    statType: StatType.attack,
    statValue: [1]
  ),
  normalMattack(
    familiarPotentialTier: FamiliarPotentialTier.normal,
    statType: StatType.mattack,
    statValue: [1]
  ),
  normalDefense(
    familiarPotentialTier: FamiliarPotentialTier.normal,
    statType: StatType.defense,
    statValue: [5]
  ),
  commonAllStats(
    familiarPotentialTier: FamiliarPotentialTier.common,
    statType: StatType.allStats,
    statValue: [1]
  ),
  commonStr(
    familiarPotentialTier: FamiliarPotentialTier.common,
    statType: StatType.str,
    statValue: [1, 2]
  ),
  commonDex(
    familiarPotentialTier: FamiliarPotentialTier.common,
    statType: StatType.dex,
    statValue: [1, 2]
  ),
  commonInt(
    familiarPotentialTier: FamiliarPotentialTier.common,
    statType: StatType.int,
    statValue: [1, 2]
  ),
  commonLuk(
    familiarPotentialTier: FamiliarPotentialTier.common,
    statType: StatType.luk,
    statValue: [1, 2]
  ),
  commonHp(
    familiarPotentialTier: FamiliarPotentialTier.common,
    statType: StatType.hp,
    statValue: [5, 10]
  ),
  commonMp(
    familiarPotentialTier: FamiliarPotentialTier.common,
    statType: StatType.mp,
    statValue: [5, 10]
  ),
  commonDefense(
    familiarPotentialTier: FamiliarPotentialTier.common,
    statType: StatType.defense,
    statValue: [5, 10]
  ),
  commonSpeed(
    familiarPotentialTier: FamiliarPotentialTier.common,
    statType: StatType.speed,
    statValue: [1, 2]
  ),
  commonJump(
    familiarPotentialTier: FamiliarPotentialTier.common,
    statType: StatType.jump,
    statValue: [1, 2]
  ),
  commonAttack(
    familiarPotentialTier: FamiliarPotentialTier.common,
    statType: StatType.attack,
    statValue: [1, 2]
  ),
  commonMattack(
    familiarPotentialTier: FamiliarPotentialTier.common,
    statType: StatType.mattack,
    statValue: [1, 2]
  ),
  commonIgnoreDefense(
    familiarPotentialTier: FamiliarPotentialTier.common,
    statType: StatType.ignoreDefense,
    statValue: [0.15]
  ),
  commonAttackPercentage(
    familiarPotentialTier: FamiliarPotentialTier.common,
    statType: StatType.attackPercentage,
    statValue: [0.01]
  ),
  commonMattackPercentage(
    familiarPotentialTier: FamiliarPotentialTier.common,
    statType: StatType.mattackPercentage,
    statValue: [0.01]
  ),
  commonCritRate(
    familiarPotentialTier: FamiliarPotentialTier.common,
    statType: StatType.critRate,
    statValue: [0.01, 0.02, 0.03, 0.04]
  ),
  commonDamage(
    familiarPotentialTier: FamiliarPotentialTier.common,
    statType: StatType.damage,
    statValue: [0.01]
  ),
  commonIncreaseDefense(
    familiarPotentialTier: FamiliarPotentialTier.common,
    statType: StatType.defense,
    statValue: [15]
  ),
  commonStrPercentage(
    familiarPotentialTier: FamiliarPotentialTier.common,
    statType: StatType.strPercentage,
    statValue: [0.01]
  ),
  commonDexPercentage(
    familiarPotentialTier: FamiliarPotentialTier.common,
    statType: StatType.dexPercentage,
    statValue: [0.01]
  ),
  commonIntPercentage(
    familiarPotentialTier: FamiliarPotentialTier.common,
    statType: StatType.intPercentage,
    statValue: [0.01]
  ),
  commonLukPercentage(
    familiarPotentialTier: FamiliarPotentialTier.common,
    statType: StatType.lukPercentage,
    statValue: [0.01]
  ),
  commonHpPercentage(
    familiarPotentialTier: FamiliarPotentialTier.common,
    statType: StatType.hpPercentage,
    statValue: [0.01]
  ),
  commonMpPercentage(
    familiarPotentialTier: FamiliarPotentialTier.common,
    statType: StatType.mpPercentage,
    statValue: [0.01]
  ),
  commonDefensePercentage(
    familiarPotentialTier: FamiliarPotentialTier.common,
    statType: StatType.defensePercentage,
    statValue: [0.01]
  ),
  commonHpRestore(
    formattedName: "Continually restores a small amount of HP",
    familiarPotentialTier: FamiliarPotentialTier.common,
    statType: StatType.healHPPercentage,
    statValue: [0.05]
  ),
  commonMpRestore(
    formattedName: "Continually restores a small amount of MP",
    familiarPotentialTier: FamiliarPotentialTier.common,
    statType: StatType.healMPPercentage,
    statValue: [0.05]
  ),
  commonIncreaseDrop(
    formattedName: "Increases Item Drop Rate by a small amount",
    familiarPotentialTier: FamiliarPotentialTier.common,
    statType: StatType.itemDropRate,
    statValue: [0.3]
  ),
  commonIncreaseSpeedJump(
    formattedName: "Increases Speed and Jump Slightly",
    familiarPotentialTier: FamiliarPotentialTier.common,
    statType: StatType.speedJump,
    statValue: [6]
  ),
  
  ;

  const FamiliarPotential({
    required this.familiarPotentialTier,
    required this.statType,
    required this.statValue,
    this.formattedName = "",
  });

  final String formattedName;
  final FamiliarPotentialTier familiarPotentialTier;
  final StatType statType;
  final List<num> statValue;
}

class FamiliarPotentialLine {
  final StatType statType;
  final bool isPrime;
  final FamiliarPotential familiarPotentialName;

  const FamiliarPotentialLine({
    required this.statType,
    required this.familiarPotentialName,
    this.isPrime = false,
  });
}