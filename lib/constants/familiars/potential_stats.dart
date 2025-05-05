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
  normal(
      formattedName: "Normal",
      short: "N",
      color:
          DEFAULT_COLOR), // Will filter this out in the UI, mainly here to make potentials sensible
  common(formattedName: "Common", short: "C", color: DEFAULT_COLOR),
  rare(formattedName: "Rare", short: "R", color: RARE_COLOR),
  epic(formattedName: "Epic", short: "E", color: EPIC_COLOR),
  unique(formattedName: "Unique", short: "U", color: UNIQUE_COLOR),
  legendary(formattedName: "Legendary", short: "L", color: LEGENDARY_COLOR);

  const FamiliarPotentialTier({
    required this.formattedName,
    required this.short,
    required this.color,
  });

  final String formattedName;
  final String short;
  final Color color;

  FamiliarPotentialTier getPreviousTier() {
    switch (this) {
      case FamiliarPotentialTier.legendary:
        return FamiliarPotentialTier.unique;
      case FamiliarPotentialTier.unique:
        return FamiliarPotentialTier.epic;
      case FamiliarPotentialTier.epic:
        return FamiliarPotentialTier.rare;
      case FamiliarPotentialTier.rare:
        return FamiliarPotentialTier.common;
      default:
        return FamiliarPotentialTier.normal;
    }
  }

  static List<FamiliarPotentialTier> filteredList = [
    FamiliarPotentialTier.common,
    FamiliarPotentialTier.rare,
    FamiliarPotentialTier.epic,
    FamiliarPotentialTier.unique,
    FamiliarPotentialTier.legendary
  ];
}

enum FamiliarPotential {
  normalStr(
      familiarPotentialTier: FamiliarPotentialTier.normal,
      statType: StatType.str,
      statValue: [1]),
  normalDex(
      familiarPotentialTier: FamiliarPotentialTier.normal,
      statType: StatType.dex,
      statValue: [1]),
  normalInt(
      familiarPotentialTier: FamiliarPotentialTier.normal,
      statType: StatType.int,
      statValue: [1]),
  normalLuk(
      familiarPotentialTier: FamiliarPotentialTier.normal,
      statType: StatType.luk,
      statValue: [1]),
  normalHp(
      familiarPotentialTier: FamiliarPotentialTier.normal,
      statType: StatType.hp,
      statValue: [5]),
  normalMp(
      familiarPotentialTier: FamiliarPotentialTier.normal,
      statType: StatType.mp,
      statValue: [5]),
  normalSpeed(
      familiarPotentialTier: FamiliarPotentialTier.normal,
      statType: StatType.speed,
      statValue: [1]),
  normalJump(
      familiarPotentialTier: FamiliarPotentialTier.normal,
      statType: StatType.jump,
      statValue: [1]),
  normalAttack(
      familiarPotentialTier: FamiliarPotentialTier.normal,
      statType: StatType.attack,
      statValue: [1]),
  normalMattack(
      familiarPotentialTier: FamiliarPotentialTier.normal,
      statType: StatType.mattack,
      statValue: [1]),
  normalDefense(
      familiarPotentialTier: FamiliarPotentialTier.normal,
      statType: StatType.defense,
      statValue: [5]),
  commonAllStats(
      familiarPotentialTier: FamiliarPotentialTier.common,
      statType: StatType.allStats,
      statValue: [1]),
  commonStr(
      familiarPotentialTier: FamiliarPotentialTier.common,
      statType: StatType.str,
      statValue: [1, 2]),
  commonDex(
      familiarPotentialTier: FamiliarPotentialTier.common,
      statType: StatType.dex,
      statValue: [1, 2]),
  commonInt(
      familiarPotentialTier: FamiliarPotentialTier.common,
      statType: StatType.int,
      statValue: [1, 2]),
  commonLuk(
      familiarPotentialTier: FamiliarPotentialTier.common,
      statType: StatType.luk,
      statValue: [1, 2]),
  commonHp(
      familiarPotentialTier: FamiliarPotentialTier.common,
      statType: StatType.hp,
      statValue: [5, 10]),
  commonMp(
      familiarPotentialTier: FamiliarPotentialTier.common,
      statType: StatType.mp,
      statValue: [5, 10]),
  commonDefense(
      familiarPotentialTier: FamiliarPotentialTier.common,
      statType: StatType.defense,
      statValue: [5, 10]),
  commonSpeed(
      familiarPotentialTier: FamiliarPotentialTier.common,
      statType: StatType.speed,
      statValue: [1, 2]),
  commonJump(
      familiarPotentialTier: FamiliarPotentialTier.common,
      statType: StatType.jump,
      statValue: [1, 2]),
  commonAttack(
      familiarPotentialTier: FamiliarPotentialTier.common,
      statType: StatType.attack,
      statValue: [1, 2]),
  commonMattack(
      familiarPotentialTier: FamiliarPotentialTier.common,
      statType: StatType.mattack,
      statValue: [1, 2]),
  commonIgnoreDefense(
      familiarPotentialTier: FamiliarPotentialTier.common,
      statType: StatType.ignoreDefense,
      statValue: [0.15]),
  commonAttackPercentage(
      familiarPotentialTier: FamiliarPotentialTier.common,
      statType: StatType.attackPercentage,
      statValue: [0.01]),
  commonMattackPercentage(
      familiarPotentialTier: FamiliarPotentialTier.common,
      statType: StatType.mattackPercentage,
      statValue: [0.01]),
  commonCritRate(
      familiarPotentialTier: FamiliarPotentialTier.common,
      statType: StatType.critRate,
      statValue: [0.01, 0.02, 0.03, 0.04]),
  commonDamage(
      familiarPotentialTier: FamiliarPotentialTier.common,
      statType: StatType.damage,
      statValue: [0.01]),
  commonIncreaseDefense(
      formattedName: "Increases Defense",
      familiarPotentialTier: FamiliarPotentialTier.common,
      statType: StatType.defense,
      statValue: [15]),
  commonStrPercentage(
      familiarPotentialTier: FamiliarPotentialTier.common,
      statType: StatType.strPercentage,
      statValue: [0.01]),
  commonDexPercentage(
      familiarPotentialTier: FamiliarPotentialTier.common,
      statType: StatType.dexPercentage,
      statValue: [0.01]),
  commonIntPercentage(
      familiarPotentialTier: FamiliarPotentialTier.common,
      statType: StatType.intPercentage,
      statValue: [0.01]),
  commonLukPercentage(
      familiarPotentialTier: FamiliarPotentialTier.common,
      statType: StatType.lukPercentage,
      statValue: [0.01]),
  commonHpPercentage(
      familiarPotentialTier: FamiliarPotentialTier.common,
      statType: StatType.hpPercentage,
      statValue: [0.01]),
  commonMpPercentage(
      familiarPotentialTier: FamiliarPotentialTier.common,
      statType: StatType.mpPercentage,
      statValue: [0.01]),
  commonDefensePercentage(
      familiarPotentialTier: FamiliarPotentialTier.common,
      statType: StatType.defensePercentage,
      statValue: [0.01]),
  commonHpRestore(
      formattedName: "Continually restores a small amount of HP",
      familiarPotentialTier: FamiliarPotentialTier.common,
      statType: StatType.healHPPercentage,
      statValue: [0.05]),
  commonMpRestore(
      formattedName: "Continually restores a small amount of MP",
      familiarPotentialTier: FamiliarPotentialTier.common,
      statType: StatType.healMPPercentage,
      statValue: [0.05]),
  commonIncreaseDrop(
      formattedName: "Increases Item Drop Rate by a small amount",
      familiarPotentialTier: FamiliarPotentialTier.common,
      statType: StatType.itemDropRate,
      statValue: [0.3]),
  commonIncreaseSpeedJump(
      formattedName: "Increases Speed and Jump Slightly",
      familiarPotentialTier: FamiliarPotentialTier.common,
      statType: StatType.speedJump,
      statValue: [6]),
  rareStr(
      familiarPotentialTier: FamiliarPotentialTier.rare,
      statType: StatType.str,
      statValue: [3, 4]),
  rareDex(
      familiarPotentialTier: FamiliarPotentialTier.rare,
      statType: StatType.dex,
      statValue: [3, 4]),
  rareInt(
      familiarPotentialTier: FamiliarPotentialTier.rare,
      statType: StatType.int,
      statValue: [3, 4]),
  rareLuk(
      familiarPotentialTier: FamiliarPotentialTier.rare,
      statType: StatType.luk,
      statValue: [3, 4]),
  rareHp(
      familiarPotentialTier: FamiliarPotentialTier.rare,
      statType: StatType.hp,
      statValue: [12, 15]),
  rareMp(
      familiarPotentialTier: FamiliarPotentialTier.rare,
      statType: StatType.mp,
      statValue: [12, 15]),
  rareDefense(
      familiarPotentialTier: FamiliarPotentialTier.rare,
      statType: StatType.defense,
      statValue: [12, 15]),
  rareSpeed(
      familiarPotentialTier: FamiliarPotentialTier.rare,
      statType: StatType.speed,
      statValue: [3, 4]),
  rareJump(
      familiarPotentialTier: FamiliarPotentialTier.rare,
      statType: StatType.jump,
      statValue: [3, 4]),
  rareAttack(
      familiarPotentialTier: FamiliarPotentialTier.rare,
      statType: StatType.attack,
      statValue: [3, 4]),
  rareMattack(
      familiarPotentialTier: FamiliarPotentialTier.rare,
      statType: StatType.mattack,
      statValue: [3, 4]),
  rareIgnoreDefense(
      familiarPotentialTier: FamiliarPotentialTier.rare,
      statType: StatType.ignoreDefense,
      statValue: [0.15]),
  rareAttackPercentage(
      familiarPotentialTier: FamiliarPotentialTier.rare,
      statType: StatType.attackPercentage,
      statValue: [0.02]),
  rareMattackPercentage(
      familiarPotentialTier: FamiliarPotentialTier.rare,
      statType: StatType.mattackPercentage,
      statValue: [0.02]),
  rareCritRate(
      familiarPotentialTier: FamiliarPotentialTier.rare,
      statType: StatType.critRate,
      statValue: [0.05, 0.06, 0.07, 0.08]),
  rareDamage(
      familiarPotentialTier: FamiliarPotentialTier.rare,
      statType: StatType.damage,
      statValue: [0.02]),
  rareIncreaseDefense(
      formattedName: "Increases Defense",
      familiarPotentialTier: FamiliarPotentialTier.rare,
      statType: StatType.defense,
      statValue: [20]),
  rareIncreaseDefenseSmall(
      formattedName: "Increases Defense by a small amount",
      familiarPotentialTier: FamiliarPotentialTier.rare,
      statType: StatType.defense,
      statValue: [20]),
  rareIncreaseDefenseSmallAllies(
      formattedName: "Increases the Defense of nearby allies by a small amount",
      familiarPotentialTier: FamiliarPotentialTier.rare,
      statType: StatType.defense,
      statValue: [20]),
  rareIncreaseDefenseSmallParty(
      formattedName: "Increases party members' Defense by a small amount",
      familiarPotentialTier: FamiliarPotentialTier.rare,
      statType: StatType.defense,
      statValue: [20]),
  rareAllStatsPercentage(
      familiarPotentialTier: FamiliarPotentialTier.rare,
      statType: StatType.allStatsPercentage,
      statValue: [0.01]),
  rareStrPercentage(
      familiarPotentialTier: FamiliarPotentialTier.rare,
      statType: StatType.strPercentage,
      statValue: [0.02]),
  rareDexPercentage(
      familiarPotentialTier: FamiliarPotentialTier.rare,
      statType: StatType.dexPercentage,
      statValue: [0.02]),
  rareIntPercentage(
      familiarPotentialTier: FamiliarPotentialTier.rare,
      statType: StatType.intPercentage,
      statValue: [0.02]),
  rareLukPercentage(
      familiarPotentialTier: FamiliarPotentialTier.rare,
      statType: StatType.lukPercentage,
      statValue: [0.02]),
  rareHpPercentage(
      familiarPotentialTier: FamiliarPotentialTier.rare,
      statType: StatType.hpPercentage,
      statValue: [0.02]),
  rareMpPercentage(
      familiarPotentialTier: FamiliarPotentialTier.rare,
      statType: StatType.mpPercentage,
      statValue: [0.02]),
  rareDefensePercentage(
      familiarPotentialTier: FamiliarPotentialTier.rare,
      statType: StatType.defensePercentage,
      statValue: [0.02]),
  rareHpMpRestore(
      formattedName: "Continually restores HP and MP",
      familiarPotentialTier: FamiliarPotentialTier.rare,
      statType: StatType.healHpMpPercentage,
      statValue: [0.05]),
  rareHpRestore(
      formattedName: "Continually restores HP",
      familiarPotentialTier: FamiliarPotentialTier.rare,
      statType: StatType.healHPPercentage,
      statValue: [0.1]),
  rareMpRestore(
      formattedName: "Continually restores MP",
      familiarPotentialTier: FamiliarPotentialTier.rare,
      statType: StatType.healMPPercentage,
      statValue: [0.1]),
  rareHpRestoreSmall(
      formattedName: "Continually restores a small amount of HP",
      familiarPotentialTier: FamiliarPotentialTier.rare,
      statType: StatType.healHPPercentage,
      statValue: [0.05]),
  rareMpRestoreSmall(
      formattedName: "Continually restores a small amount of MP",
      familiarPotentialTier: FamiliarPotentialTier.rare,
      statType: StatType.healMPPercentage,
      statValue: [0.05]),
  rareHpMpRestoreSmallAllies(
      formattedName:
          "Continually restores a small amount of HP and MP to nearby allies",
      familiarPotentialTier: FamiliarPotentialTier.rare,
      statType: StatType.healHpMpPercentage,
      statValue: [0.05]),
  rareHpRestoreSmallAllies(
      formattedName:
          "Continually restores a small amount of HP to nearby allies",
      familiarPotentialTier: FamiliarPotentialTier.rare,
      statType: StatType.healHPPercentage,
      statValue: [0.05]),
  rareMpRestoreSmallAllies(
      formattedName:
          "Continually restores a small amount of MP to nearby allies",
      familiarPotentialTier: FamiliarPotentialTier.rare,
      statType: StatType.healMPPercentage,
      statValue: [0.05]),
  rareHpMpRestoreSmallParty(
      formattedName:
          "Continually restores the party's HP & MP by a small amount",
      familiarPotentialTier: FamiliarPotentialTier.rare,
      statType: StatType.healHpMpPercentage,
      statValue: [0.05]),
  rareHpRestoreSmallParty(
      formattedName: "Continually restores the party's HP by a small amount",
      familiarPotentialTier: FamiliarPotentialTier.rare,
      statType: StatType.healHPPercentage,
      statValue: [0.05]),
  rareMpRestoreSmallParty(
      formattedName: "Continually restores the party's MP by a small amount",
      familiarPotentialTier: FamiliarPotentialTier.rare,
      statType: StatType.healMPPercentage,
      statValue: [0.05]),
  rareIncreaseMesoDropSmall(
      formattedName: "Increases Item and Meso Drop Rate by a small amount",
      familiarPotentialTier: FamiliarPotentialTier.rare,
      statType: StatType.itemDropRate,
      statValue: [0.2]),
  rareIncreaseDrop(
      formattedName: "Increases Item Drop Rate",
      familiarPotentialTier: FamiliarPotentialTier.rare,
      statType: StatType.itemDropRate,
      statValue: [0.5]),
  rareIncreaseDropSmall(
      formattedName: "Increases Item Drop Rate by a small amount",
      familiarPotentialTier: FamiliarPotentialTier.rare,
      statType: StatType.itemDropRate,
      statValue: [0.3]),
  rareIncreaseSpeedJump(
      formattedName: "Increases Speed and Jump",
      familiarPotentialTier: FamiliarPotentialTier.rare,
      statType: StatType.speedJump,
      statValue: [8]),
  rareIncreaseSpeedJumpSmall(
      formattedName: "Increases Speed and Jump Slightly",
      familiarPotentialTier: FamiliarPotentialTier.rare,
      statType: StatType.speedJump,
      statValue: [6]),
  rareIncreaseSpeedSmallAllies(
      formattedName: "Increases the Speed of nearby allies by a small amount",
      familiarPotentialTier: FamiliarPotentialTier.rare,
      statType: StatType.speed,
      statValue: [8]),
  rareIncreaseJumpSmallAllies(
      formattedName: "Increases the Jump of nearby allies by a small amount",
      familiarPotentialTier: FamiliarPotentialTier.rare,
      statType: StatType.jump,
      statValue: [8]),
  rareIncreaseSpeedSmallParty(
      formattedName: "Increases party members' Speed by a small amount",
      familiarPotentialTier: FamiliarPotentialTier.rare,
      statType: StatType.speed,
      statValue: [8]),
  rareIncreaseJumpSmallParty(
      formattedName: "Increases party members' Jump by a small amount",
      familiarPotentialTier: FamiliarPotentialTier.rare,
      statType: StatType.jump,
      statValue: [8]),
  epicStr(
      familiarPotentialTier: FamiliarPotentialTier.epic,
      statType: StatType.str,
      statValue: [5, 6]),
  epicDex(
      familiarPotentialTier: FamiliarPotentialTier.epic,
      statType: StatType.dex,
      statValue: [5, 6]),
  epicInt(
      familiarPotentialTier: FamiliarPotentialTier.epic,
      statType: StatType.int,
      statValue: [5, 6]),
  epicLuk(
      familiarPotentialTier: FamiliarPotentialTier.epic,
      statType: StatType.luk,
      statValue: [5, 6]),
  epicHp(
      familiarPotentialTier: FamiliarPotentialTier.epic,
      statType: StatType.hp,
      statValue: [18, 20]),
  epicMp(
      familiarPotentialTier: FamiliarPotentialTier.epic,
      statType: StatType.mp,
      statValue: [18, 20]),
  epicDefense(
      familiarPotentialTier: FamiliarPotentialTier.epic,
      statType: StatType.defense,
      statValue: [18, 20]),
  epicSpeed(
      familiarPotentialTier: FamiliarPotentialTier.epic,
      statType: StatType.speed,
      statValue: [5, 6]),
  epicJump(
      familiarPotentialTier: FamiliarPotentialTier.epic,
      statType: StatType.jump,
      statValue: [5, 6]),
  epicAttack(
      familiarPotentialTier: FamiliarPotentialTier.epic,
      statType: StatType.attack,
      statValue: [5, 6]),
  epicMattack(
      familiarPotentialTier: FamiliarPotentialTier.epic,
      statType: StatType.mattack,
      statValue: [5, 6]),
  epicIgnoreDefense(
      familiarPotentialTier: FamiliarPotentialTier.epic,
      statType: StatType.ignoreDefense,
      statValue: [0.2, 0.3]),
  epicAttackPercentage(
      familiarPotentialTier: FamiliarPotentialTier.epic,
      statType: StatType.attackPercentage,
      statValue: [0.03]),
  epicMattackPercentage(
      familiarPotentialTier: FamiliarPotentialTier.epic,
      statType: StatType.mattackPercentage,
      statValue: [0.03]),
  epicCritRate(
      familiarPotentialTier: FamiliarPotentialTier.epic,
      statType: StatType.critRate,
      statValue: [0.03]),
  epicDamage(
      familiarPotentialTier: FamiliarPotentialTier.epic,
      statType: StatType.damage,
      statValue: [0.03]),
  epicBossDamage(
      familiarPotentialTier: FamiliarPotentialTier.epic,
      statType: StatType.bossDamage,
      statValue: [0.2, 0.3]),
  epicIncreaseDefenselarge(
      formattedName: "Increases Defense by a large amount",
      familiarPotentialTier: FamiliarPotentialTier.epic,
      statType: StatType.defense,
      statValue: [40]),
  epicIncreaseDefense(
      formattedName: "Increases Defense",
      familiarPotentialTier: FamiliarPotentialTier.epic,
      statType: StatType.defense,
      statValue: [30]),
  epicIncreaseDefenseAllies(
      formattedName: "Increases the Defense of nearby allies",
      familiarPotentialTier: FamiliarPotentialTier.epic,
      statType: StatType.defense,
      statValue: [30]),
  epicIncreaseDefenseSmallAllies(
      formattedName: "Increases the Defense of nearby allies by a small amount",
      familiarPotentialTier: FamiliarPotentialTier.epic,
      statType: StatType.defense,
      statValue: [25]),
  epicIncreaseDefenseParty(
      formattedName: "Increases party members' Defense",
      familiarPotentialTier: FamiliarPotentialTier.epic,
      statType: StatType.defense,
      statValue: [30]),
  epicIncreaseDefenseSmallParty(
      formattedName: "Increases party members' Defense by a small amount",
      familiarPotentialTier: FamiliarPotentialTier.epic,
      statType: StatType.defense,
      statValue: [25]),
  epicAllStatsPercentage(
      familiarPotentialTier: FamiliarPotentialTier.epic,
      statType: StatType.allStatsPercentage,
      statValue: [0.02]),
  epicStrPercentage(
      familiarPotentialTier: FamiliarPotentialTier.epic,
      statType: StatType.strPercentage,
      statValue: [0.03]),
  epicDexPercentage(
      familiarPotentialTier: FamiliarPotentialTier.epic,
      statType: StatType.dexPercentage,
      statValue: [0.03]),
  epicIntPercentage(
      familiarPotentialTier: FamiliarPotentialTier.epic,
      statType: StatType.intPercentage,
      statValue: [0.03]),
  epicLukPercentage(
      familiarPotentialTier: FamiliarPotentialTier.epic,
      statType: StatType.lukPercentage,
      statValue: [0.03]),
  epicHpPercentage(
      familiarPotentialTier: FamiliarPotentialTier.epic,
      statType: StatType.hpPercentage,
      statValue: [0.03]),
  epicMpPercentage(
      familiarPotentialTier: FamiliarPotentialTier.epic,
      statType: StatType.mpPercentage,
      statValue: [0.03]),
  epicDefensePercentage(
      familiarPotentialTier: FamiliarPotentialTier.epic,
      statType: StatType.defensePercentage,
      statValue: [0.03]),
  epicHpRestoreLarge(
      formattedName: "Continually restores a large amount of HP",
      familiarPotentialTier: FamiliarPotentialTier.epic,
      statType: StatType.healHPPercentage,
      statValue: [0.15]),
  epicMpRestoreLarge(
      formattedName: "Continually restores a large amount of MP",
      familiarPotentialTier: FamiliarPotentialTier.epic,
      statType: StatType.healMPPercentage,
      statValue: [0.15]),
  epicHpMpRestore(
      formattedName: "Continually restores HP and MP",
      familiarPotentialTier: FamiliarPotentialTier.epic,
      statType: StatType.healHpMpPercentage,
      statValue: [0.07, 0.1]),
  epicHpRestore(
      formattedName: "Continually restores HP",
      familiarPotentialTier: FamiliarPotentialTier.epic,
      statType: StatType.healHPPercentage,
      statValue: [0.12]),
  epicMpRestore(
      formattedName: "Continually restores MP",
      familiarPotentialTier: FamiliarPotentialTier.epic,
      statType: StatType.healMPPercentage,
      statValue: [0.12]),
  epicHpMpRestoreAllies(
      formattedName: "Continually restores HP and MP to nearby allies",
      familiarPotentialTier: FamiliarPotentialTier.epic,
      statType: StatType.healHpMpPercentage,
      statValue: [0.1]),
  epicHpRestoreAllies(
      formattedName: "Continually restores HP to nearby allies",
      familiarPotentialTier: FamiliarPotentialTier.epic,
      statType: StatType.healHPPercentage,
      statValue: [0.1]),
  epicMpRestoreAllies(
      formattedName: "Continually restores MP to nearby allies",
      familiarPotentialTier: FamiliarPotentialTier.epic,
      statType: StatType.healMPPercentage,
      statValue: [0.1]),
  epicHpMpRestoreSmallAllies(
      formattedName:
          "Continually restores a small amount of HP and MP to nearby allies",
      familiarPotentialTier: FamiliarPotentialTier.epic,
      statType: StatType.healHpMpPercentage,
      statValue: [0.07]),
  epicHpRestoreSmallAllies(
      formattedName:
          "Continually restores a small amount of HP to nearby allies",
      familiarPotentialTier: FamiliarPotentialTier.epic,
      statType: StatType.healHPPercentage,
      statValue: [0.07]),
  epicMpRestoreSmallAllies(
      formattedName:
          "Continually restores a small amount of MP to nearby allies",
      familiarPotentialTier: FamiliarPotentialTier.epic,
      statType: StatType.healMPPercentage,
      statValue: [0.07]),
  epicHpMpRestoreParty(
      formattedName: "Continually restores the party's HP & MP",
      familiarPotentialTier: FamiliarPotentialTier.epic,
      statType: StatType.healHpMpPercentage,
      statValue: [0.1]),
  epicHpRestoreParty(
      formattedName: "Continually restores the party's HP",
      familiarPotentialTier: FamiliarPotentialTier.epic,
      statType: StatType.healHPPercentage,
      statValue: [0.1]),
  epicMpRestoreParty(
      formattedName: "Continually restores the party's MP",
      familiarPotentialTier: FamiliarPotentialTier.epic,
      statType: StatType.healMPPercentage,
      statValue: [0.1]),
  epicHpMpRestoreSmallParty(
      formattedName:
          "Continually restores the party's HP & MP by a small amount",
      familiarPotentialTier: FamiliarPotentialTier.epic,
      statType: StatType.healHpMpPercentage,
      statValue: [0.07]),
  epicHpRestoreSmallParty(
      formattedName: "Continually restores the party's HP by a small amount",
      familiarPotentialTier: FamiliarPotentialTier.epic,
      statType: StatType.healHPPercentage,
      statValue: [0.07]),
  epicMpRestoreSmallParty(
      formattedName: "Continually restores the party's MP by a small amount",
      familiarPotentialTier: FamiliarPotentialTier.epic,
      statType: StatType.healMPPercentage,
      statValue: [0.07]),
  epicHpRecovery(
      familiarPotentialTier: FamiliarPotentialTier.epic,
      statType: StatType.hpRecovery,
      statValue: [0.1]),
  epicIncreaseMesoDrop(
      formattedName: "Increases Item and Meso Drop Rate",
      familiarPotentialTier: FamiliarPotentialTier.epic,
      statType: StatType.itemDropRate,
      statValue: [0.4]),
  epicIncreaseMesoDropSmall(
      formattedName: "Increases Item and Meso Drop Rate by a small amount",
      familiarPotentialTier: FamiliarPotentialTier.epic,
      statType: StatType.itemDropRate,
      statValue: [0.25]),
  epicIncreaseDropLarge(
      formattedName: "Increases Item Drop Rate by a large amount",
      familiarPotentialTier: FamiliarPotentialTier.epic,
      statType: StatType.itemDropRate,
      statValue: [1]),
  epicIncreaseDrop(
      formattedName: "Increases Item Drop Rate",
      familiarPotentialTier: FamiliarPotentialTier.epic,
      statType: StatType.itemDropRate,
      statValue: [0.6]),
  epicIncreaseSpeedJumpLarge(
      formattedName: "Increases Speed and Jump by a large amount",
      familiarPotentialTier: FamiliarPotentialTier.epic,
      statType: StatType.speedJump,
      statValue: [10]),
  epicIncreaseSpeedJump(
      formattedName: "Increases Speed and Jump",
      familiarPotentialTier: FamiliarPotentialTier.epic,
      statType: StatType.speedJump,
      statValue: [9]),
  epicIncreaseSpeedAllies(
      formattedName: "Increases the Speed of nearby allies",
      familiarPotentialTier: FamiliarPotentialTier.epic,
      statType: StatType.speed,
      statValue: [10]),
  epicIncreaseSpeedSmallAllies(
      formattedName: "Increases the Speed of nearby allies by a small amount",
      familiarPotentialTier: FamiliarPotentialTier.epic,
      statType: StatType.speed,
      statValue: [9]),
  epicIncreaseJumpAllies(
      formattedName: "Increases the Jump of nearby allies",
      familiarPotentialTier: FamiliarPotentialTier.epic,
      statType: StatType.jump,
      statValue: [10]),
  epicIncreaseJumpSmallAllies(
      formattedName: "Increases the Jump of nearby allies by a small amount",
      familiarPotentialTier: FamiliarPotentialTier.epic,
      statType: StatType.jump,
      statValue: [9]),
  epicIncreaseSpeedParty(
      formattedName: "Increases party members' Speed",
      familiarPotentialTier: FamiliarPotentialTier.epic,
      statType: StatType.speed,
      statValue: [10]),
  epicIncreaseSpeedSmallParty(
      formattedName: "Increases party members' Speed by a small amount",
      familiarPotentialTier: FamiliarPotentialTier.epic,
      statType: StatType.speed,
      statValue: [9]),
  epicIncreaseJumpParty(
      formattedName: "Increases party members' Jump",
      familiarPotentialTier: FamiliarPotentialTier.epic,
      statType: StatType.jump,
      statValue: [10]),
  epicIncreaseJumpSmallParty(
      formattedName: "Increases party members' Jump by a small amount",
      familiarPotentialTier: FamiliarPotentialTier.epic,
      statType: StatType.jump,
      statValue: [9]),
  epicAutoStealChance(
      familiarPotentialTier: FamiliarPotentialTier.epic,
      statType: StatType.autoStealChance,
      statValue: [0.01, 0.02]),
  epicSkillLevels(
      familiarPotentialTier: FamiliarPotentialTier.epic,
      statType: StatType.skillLevel,
      statValue: [1, 2]),
  uniqueStr(
      familiarPotentialTier: FamiliarPotentialTier.unique,
      statType: StatType.str,
      statValue: [7, 8]),
  uniqueDex(
      familiarPotentialTier: FamiliarPotentialTier.unique,
      statType: StatType.dex,
      statValue: [7, 8]),
  uniqueInt(
      familiarPotentialTier: FamiliarPotentialTier.unique,
      statType: StatType.int,
      statValue: [7, 8]),
  uniqueLuk(
      familiarPotentialTier: FamiliarPotentialTier.unique,
      statType: StatType.luk,
      statValue: [7, 8]),
  uniqueHp(
      familiarPotentialTier: FamiliarPotentialTier.unique,
      statType: StatType.hp,
      statValue: [22, 25]),
  uniqueMp(
      familiarPotentialTier: FamiliarPotentialTier.unique,
      statType: StatType.mp,
      statValue: [22, 25]),
  uniqueDefense(
      familiarPotentialTier: FamiliarPotentialTier.unique,
      statType: StatType.defense,
      statValue: [22, 25]),
  uniqueSpeed(
      familiarPotentialTier: FamiliarPotentialTier.unique,
      statType: StatType.speed,
      statValue: [7, 8]),
  uniqueJump(
      familiarPotentialTier: FamiliarPotentialTier.unique,
      statType: StatType.jump,
      statValue: [7, 8]),
  uniqueAttack(
      familiarPotentialTier: FamiliarPotentialTier.unique,
      statType: StatType.attack,
      statValue: [7, 8]),
  uniqueMattack(
      familiarPotentialTier: FamiliarPotentialTier.unique,
      statType: StatType.mattack,
      statValue: [7, 8]),
  uniqueIgnoreDefense(
      familiarPotentialTier: FamiliarPotentialTier.unique,
      statType: StatType.ignoreDefense,
      statValue: [0.3, 0.35, 0.4]),
  uniqueAttackPercentage(
      familiarPotentialTier: FamiliarPotentialTier.unique,
      statType: StatType.attackPercentage,
      statValue: [0.05, 0.06]),
  uniqueMattackPercentage(
      familiarPotentialTier: FamiliarPotentialTier.unique,
      statType: StatType.mattackPercentage,
      statValue: [0.05, 0.06]),
  uniqueCritDamage(
      familiarPotentialTier: FamiliarPotentialTier.unique,
      statType: StatType.critDamage,
      statValue: [0.02, 0.03]),
  uniqueCritRate(
      familiarPotentialTier: FamiliarPotentialTier.unique,
      statType: StatType.critRate,
      statValue: [0.05, 0.06]),
  uniqueDamage(
      familiarPotentialTier: FamiliarPotentialTier.unique,
      statType: StatType.damage,
      statValue: [0.05, 0.06]),
  uniqueBossDamage(
      familiarPotentialTier: FamiliarPotentialTier.unique,
      statType: StatType.bossDamage,
      statValue: [0.3, 0.35, 0.4]),
  uniqueIncreaseDefenseLargeAllies(
      formattedName: "Increases the Defense of nearby allies by a large amount",
      familiarPotentialTier: FamiliarPotentialTier.unique,
      statType: StatType.defense,
      statValue: [40, 50]),
  uniqueIncreaseDefenseLargeParty(
      formattedName: "Increases party members' Defense by a large amount",
      familiarPotentialTier: FamiliarPotentialTier.unique,
      statType: StatType.defense,
      statValue: [40, 50]),
  uniqueIncreaseDefenseParty(
      formattedName: "Increases party members' Defense",
      familiarPotentialTier: FamiliarPotentialTier.unique,
      statType: StatType.defense,
      statValue: [40, 50]),
  uniqueAllStatsPercentage(
      familiarPotentialTier: FamiliarPotentialTier.unique,
      statType: StatType.allStatsPercentage,
      statValue: [0.02, 0.03, 0.04]),
  uniqueStrPercentage(
      familiarPotentialTier: FamiliarPotentialTier.unique,
      statType: StatType.strPercentage,
      statValue: [0.05, 0.06]),
  uniqueDexPercentage(
      familiarPotentialTier: FamiliarPotentialTier.unique,
      statType: StatType.dexPercentage,
      statValue: [0.05, 0.06]),
  uniqueIntPercentage(
      familiarPotentialTier: FamiliarPotentialTier.unique,
      statType: StatType.intPercentage,
      statValue: [0.05, 0.06]),
  uniqueLukPercentage(
      familiarPotentialTier: FamiliarPotentialTier.unique,
      statType: StatType.lukPercentage,
      statValue: [0.05, 0.06]),
  uniqueHpPercentage(
      familiarPotentialTier: FamiliarPotentialTier.unique,
      statType: StatType.hpPercentage,
      statValue: [0.05, 0.06]),
  uniqueMpPercentage(
      familiarPotentialTier: FamiliarPotentialTier.unique,
      statType: StatType.mpPercentage,
      statValue: [0.05, 0.06]),
  uniqueDefensePercentage(
      familiarPotentialTier: FamiliarPotentialTier.unique,
      statType: StatType.defensePercentage,
      statValue: [0.05, 0.06]),
  uniqueHpMpRestoreLarge(
      formattedName: "Continually restores a large amount HP and MP",
      familiarPotentialTier: FamiliarPotentialTier.unique,
      statType: StatType.healHpMpPercentage,
      statValue: [0.12, 0.15]),
  uniqueHpMpRestoreLargeAllies(
      formattedName:
          "Continually restores a large amount of HP and MP to nearby allies",
      familiarPotentialTier: FamiliarPotentialTier.unique,
      statType: StatType.healHpMpPercentage,
      statValue: [0.12, 0.15]),
  uniqueHpRestoreLargeAllies(
      formattedName:
          "Continually restores a large amount of HP to nearby allies",
      familiarPotentialTier: FamiliarPotentialTier.unique,
      statType: StatType.healHPPercentage,
      statValue: [0.12, 0.15]),
  uniqueMpRestoreLargeAllies(
      formattedName:
          "Continually restores a large amount of MP to nearby allies",
      familiarPotentialTier: FamiliarPotentialTier.unique,
      statType: StatType.healMPPercentage,
      statValue: [0.12, 0.15]),
  uniqueHpMpRestoreLargeParty(
      formattedName:
          "Continually restores a large amount of HP & MP to party members",
      familiarPotentialTier: FamiliarPotentialTier.unique,
      statType: StatType.healHpMpPercentage,
      statValue: [0.12, 0.15]),
  uniqueHpRestoreLargeParty(
      formattedName:
          "Continually restores a large amount of HP to party members",
      familiarPotentialTier: FamiliarPotentialTier.unique,
      statType: StatType.healHPPercentage,
      statValue: [0.12, 0.15]),
  uniqueMpRestoreLargeParty(
      formattedName:
          "Continually restores a large amount of MP to party members",
      familiarPotentialTier: FamiliarPotentialTier.unique,
      statType: StatType.healMPPercentage,
      statValue: [0.12, 0.15]),
  uniqueItemAquisition(
      familiarPotentialTier: FamiliarPotentialTier.unique,
      statType: StatType.itemDropRate,
      statValue: [0.1]),
  uniqueMesosObtained(
      familiarPotentialTier: FamiliarPotentialTier.unique,
      statType: StatType.mesosObtained,
      statValue: [0.1]),
  uniqueIncreasesAllStatsMap(
      formattedName:
          "Increases STR, INT, DEX, and LUK of players on the same map",
      familiarPotentialTier: FamiliarPotentialTier.unique,
      statType: StatType.allStats,
      statValue: [2]),
  uniqueIncreasesAllStatsParty(
      formattedName: "Increases your party's STR, INT, DEX, and LUK",
      familiarPotentialTier: FamiliarPotentialTier.unique,
      statType: StatType.allStats,
      statValue: [1, 3]),
  uniqueAbnormalStatusResistance(
      familiarPotentialTier: FamiliarPotentialTier.unique,
      statType: StatType.statusResistance,
      statValue: [5]),
  uniqueHpRecovery(
      familiarPotentialTier: FamiliarPotentialTier.unique,
      statType: StatType.hpRecovery,
      statValue: [0.15, 0.2]),
  uniqueIncreaseMesoDropLarge(
      formattedName: "Increases Item and Meso Drop Rate by a large amount",
      familiarPotentialTier: FamiliarPotentialTier.unique,
      statType: StatType.itemDropRate,
      statValue: [0.5, 0.6]),
  uniqueIncreaseSpeedJumpLargeAllies(
      formattedName: "Increases the Speed of nearby allies by a large amount",
      familiarPotentialTier: FamiliarPotentialTier.unique,
      statType: StatType.speedJump,
      statValue: [11, 12]),
  uniqueIncreaseSpeedJumpParty(
      formattedName: "Increases your party's Speed and Jump",
      familiarPotentialTier: FamiliarPotentialTier.unique,
      statType: StatType.speedJump,
      statValue: [11, 12]),
  uniqueIncreaseSpeedLargeAllies(
      formattedName: "Increases the Speed of nearby allies by a large amount",
      familiarPotentialTier: FamiliarPotentialTier.unique,
      statType: StatType.speed,
      statValue: [11, 12]),
  uniqueIncreaseJumpLargeAllies(
      formattedName: "Increases the Jump of nearby allies by a large amount",
      familiarPotentialTier: FamiliarPotentialTier.unique,
      statType: StatType.jump,
      statValue: [11, 12]),
  uniqueIncreaseSpeedParty(
      formattedName: "Increases party members' Speed",
      familiarPotentialTier: FamiliarPotentialTier.unique,
      statType: StatType.speed,
      statValue: [11, 12]),
  uniqueIncreaseJumpParty(
      formattedName: "Increases party members' Jump",
      familiarPotentialTier: FamiliarPotentialTier.unique,
      statType: StatType.jump,
      statValue: [11, 12]),
  uniqueAutoStealChance(
      familiarPotentialTier: FamiliarPotentialTier.unique,
      statType: StatType.autoStealChance,
      statValue: [0.03, 0.04, 0.05, 0.06, 0.07]),
  uniqueSkillLevels(
      familiarPotentialTier: FamiliarPotentialTier.unique,
      statType: StatType.skillLevel,
      statValue: [1, 2, 3]),
  legendaryIgnoreDefense(
      familiarPotentialTier: FamiliarPotentialTier.legendary,
      statType: StatType.ignoreDefense,
      statValue: [0.45, 0.5]),
  legendaryAttackPercentage(
      familiarPotentialTier: FamiliarPotentialTier.legendary,
      statType: StatType.attackPercentage,
      statValue: [0.09]),
  legendaryMattackPercentage(
      familiarPotentialTier: FamiliarPotentialTier.legendary,
      statType: StatType.mattackPercentage,
      statValue: [0.09]),
  legendaryCritDamage(
      familiarPotentialTier: FamiliarPotentialTier.legendary,
      statType: StatType.critDamage,
      statValue: [0.06]),
  legendaryCritRate(
      familiarPotentialTier: FamiliarPotentialTier.legendary,
      statType: StatType.critRate,
      statValue: [0.09]),
  legendaryDamage(
      familiarPotentialTier: FamiliarPotentialTier.legendary,
      statType: StatType.damage,
      statValue: [
        0.09,
      ]),
  legendaryBossDamage(
      familiarPotentialTier: FamiliarPotentialTier.legendary,
      statType: StatType.bossDamage,
      statValue: [0.4, 0.45, 0.5]),
  legendaryAllStatsPercentage(
      familiarPotentialTier: FamiliarPotentialTier.legendary,
      statType: StatType.allStatsPercentage,
      statValue: [0.05]),
  legendaryStrPercentage(
      familiarPotentialTier: FamiliarPotentialTier.legendary,
      statType: StatType.strPercentage,
      statValue: [0.09]),
  legendaryDexPercentage(
      familiarPotentialTier: FamiliarPotentialTier.legendary,
      statType: StatType.dexPercentage,
      statValue: [0.09]),
  legendaryIntPercentage(
      familiarPotentialTier: FamiliarPotentialTier.legendary,
      statType: StatType.intPercentage,
      statValue: [0.09]),
  legendaryLukPercentage(
      familiarPotentialTier: FamiliarPotentialTier.legendary,
      statType: StatType.lukPercentage,
      statValue: [0.09]),
  legendaryHpPercentage(
      familiarPotentialTier: FamiliarPotentialTier.legendary,
      statType: StatType.hpPercentage,
      statValue: [0.09]),
  legendaryMpPercentage(
      familiarPotentialTier: FamiliarPotentialTier.legendary,
      statType: StatType.mpPercentage,
      statValue: [0.09]),
  legendaryDefensePercentage(
      familiarPotentialTier: FamiliarPotentialTier.legendary,
      statType: StatType.defensePercentage,
      statValue: [0.09]),
  legendaryItemAquisition(
      familiarPotentialTier: FamiliarPotentialTier.legendary,
      statType: StatType.itemDropRate,
      statValue: [0.12]),
  legendaryMesosObtained(
      familiarPotentialTier: FamiliarPotentialTier.legendary,
      statType: StatType.mesosObtained,
      statValue: [0.12]),
  legendaryAbnormalStatusResistance(
      familiarPotentialTier: FamiliarPotentialTier.legendary,
      statType: StatType.statusResistance,
      statValue: [7]),
  legendaryAutoStealChance(
      familiarPotentialTier: FamiliarPotentialTier.legendary,
      statType: StatType.autoStealChance,
      statValue: [0.04, 0.06, 0.08]),
  legendarySkillLevels(
      familiarPotentialTier: FamiliarPotentialTier.legendary,
      statType: StatType.skillLevel,
      statValue: [3, 4]),
  ;

  const FamiliarPotential({
    required this.familiarPotentialTier,
    required this.statType,
    required this.statValue,
    this.formattedName,
  });

  final String? formattedName;
  final FamiliarPotentialTier familiarPotentialTier;
  final StatType statType;
  final List<num> statValue;
}
