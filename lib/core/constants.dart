// ignore_for_file: constant_identifier_names

import 'package:flutter/material.dart';

const double jumpCap = 1.23;
const double speedCap = 1.40;
// Maximum meso obtained is 300%, 100% from items and 100% from buffs (not including WAP)
const double mesoObtainedItemCap = 1.00;
const double mesoObtainedUseCap = 1.00;
const double mesoObtainedCap = 3.00;
// Maximum Drop Rate is 400%, 200% from items and 100% from buffs (not including WAP)
const double dropRateItemCap = 2.00;
const double dropRateuseCap = 1.00;
const double dropRateCap = 4.00;

enum EquipType {
  all,
  badge,
  belt,
  bottom,
  cape,
  earrings,
  emblem,
  eye,
  face,
  gloves,
  hat,
  heart,
  medal,
  overall,
  pendant,
  pocket,
  ring,
  secondary,
  shield,
  katara,
  shoes,
  shoulder,
  title,
  top,
  totem,
  weapon,
}

enum RangeType {
  damageRange,
  bossDamageRange,
  effectiveDamageRange,
  effectiveBossDamageRange,
}

enum StatType {
  arcaneForce,
  attack,
  attackSpeed,
  bossDamage,
  buffDuration,
  critDamage,
  critRate,
  damage,
  damageNormalMobs,
  defense,
  dex,
  exp,
  finalAttack,
  finalDamage,
  finalDex,
  finalHp,
  finalInt,
  finalLuk,
  finalMAttack,
  finalMp,
  finalStr,
  hp,
  ignoreDefense,
  ignoreElementalDefense,
  int,
  itemDropRate,
  jump,
  knockbackResistance,
  level,
  luk,
  mattack,
  mesosObtained,
  mp,
  sacredPower,
  speed,
  starForce,
  statusResistance,
  str,
  strPercentage,
  dexPercentage,
  intPercentage,
  lukPercentage,
  allStats,
  allStatsPercentage,
}

enum FlameType {
  str(formattedName: "STR"),
  dex(formattedName: "DEX"),
  int(formattedName: "INT"),
  luk(formattedName: "LUK"),
  strDex(formattedName: "STR & DEX"),
  strInt(formattedName: "STR & INT"),
  strLuk(formattedName: "STR & LUK"),
  dexInt(formattedName: "DEX & INT"),
  dexLuk(formattedName: "DEX & LUK"),
  intLuk(formattedName: "INT & LUK"),
  attack(formattedName: "Attack Power"),
  mattack(formattedName: "Magic Attack"),
  defense(formattedName: "Defense"),
  hp(formattedName: "HP"),
  mp(formattedName: "MP"),
  speed(formattedName: "Speed"),
  jump(formattedName: "Jump"),
  allStats(formattedName: "All Stats"),
  bossDamage(formattedName: "Boss Damage"),
  damage(formattedName: "Damage"),
  levelReduction(formattedName: "Level Reduction");

  const FlameType({
    required this.formattedName
  });

  final String formattedName;
}

enum FlameTier {
  tier1(formattedName: "1"),
  tier2(formattedName: "2"),
  tier3(formattedName: "3"),
  tier4(formattedName: "4"),
  tier5(formattedName: "5"),
  tier6(formattedName: "6"),
  tier7(formattedName: "7");

  const FlameTier({
    required this.formattedName
  });

  final String formattedName;
}

enum PotentialLevel {
  rare,
  epic,
  unique,
  legendary,
}

enum ClassType {
  all,
  warrior,
  magician,
  bowman,
  thief,
  pirate,
}

enum CharacterClass {
  none,
  adele,
  angelic_buster,
  aran,
  ark,
  battle_mage,
  beast_tamer,
  bishop,
  blaster,
  blaze_wizard,
  bowmaster,
  buccaneer,
  cadena,
  canoneer,
  corsair,
  dark_knight,
  dawn_warrior,
  demon_avenger,
  demon_slayer,
  dual_blade,
  evan,
  fire_poison_mage,
  hayato,
  hero,
  hoyoung,
  ice_lightning_mage,
  illium,
  kain,
  kaiser,
  kanna,
  khali,
  kinesis,
  lara,
  luminous,
  marksman,
  mechanic,
  mercedes,
  mihile,
  nightLord,
  night_walker,
  paladin,
  pathfinder,
  phantom,
  pirate,
  shade,
  shadower,
  thunder_breaker,
  wild_hunter,
  wind_archer,
  xenon,
  zero,
}

const statColor = Color.fromARGB(255, 105, 105, 105);
const apColor = Colors.green;
const equipEnhancedColor = Color.fromARGB(255, 102, 255, 255);
const equipFlameColor = Color.fromARGB(255, 204, 255, 0);
const equipStarColor = Color.fromARGB(255, 255, 204, 0);
const equipScrollColor = Color.fromARGB(255, 170, 170, 255);
const equipReductionColor = Color.fromARGB(255, 255, 0, 102);
const starColor = Color.fromARGB(255, 255, 212, 1);

const emptyStar = Icon(Icons.star_border, size: 16);
const filledStar = Icon(Icons.star, size: 16, color: starColor);

const List<EquipType> secondaryTypes = [EquipType.secondary, EquipType.shield, EquipType.katara];