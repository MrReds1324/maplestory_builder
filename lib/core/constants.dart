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
  str,
  dex,
  int,
  luk,
  strDex,
  strInt,
  strLuk,
  dexInt,
  dexLuk,
  intLuk,
  attack,
  mattack,
  defense,
  hp,
  mp,
  speed,
  jump,
  allStats,
  bossDamage,
  damage,
  levelReduction,
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
const equipEnhancedColor = Color.fromARGB(255, 85, 201, 255);
const equipFlameColor = Colors.lightGreenAccent;
const equipScrollColor = Color.fromARGB(255, 241, 241, 48);
