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
  all(formattedName: "All"),
  badge(formattedName: "Badge"),
  belt(formattedName: "Belt"),
  bottom(formattedName: "Bottom"),
  cape(formattedName: "Cape"),
  earrings(formattedName: "Earrings"),
  emblem(formattedName: "Emblem"),
  eye(formattedName: "Eye"),
  face(formattedName: "Face"),
  gloves(formattedName: "Gloves"),
  hat(formattedName: "Hat"),
  heart(formattedName: "Heart"),
  medal(formattedName: "Medal"),
  overall(formattedName: "Overall"),
  pendant(formattedName: "Pendant"),
  pocket(formattedName: "Pocket"),
  ring(formattedName: "Ring"),
  secondary(formattedName: "Secondary"),
  shield(formattedName: "Shield"),
  katara(formattedName: "Katara"),
  shoes(formattedName: "Shoes"),
  shoulder(formattedName: "Shoulder"),
  title(formattedName: "Title"),
  top(formattedName: "Top"),
  totem(formattedName: "Totem"),
  weapon(formattedName: "Weapon"),
  pet(formattedName: "Pet"),
  ozRing(formattedName: "Oz Ring"),
  petEquip(formattedName: "Pet Equip");

  const EquipType({
    required this.formattedName
  });

  final String formattedName;
}

const List<EquipType> secondaryTypes = [
  EquipType.secondary, EquipType.shield, EquipType.katara
];
const List<EquipType> accessoryTypes = [
  EquipType.earrings, EquipType.eye, EquipType.face, EquipType.pendant, EquipType.belt, EquipType.medal,
  EquipType.ring, EquipType.shoulder, EquipType.pocket, EquipType.ozRing
];

enum RangeType {
  damageRange(formattedName: "Damage Range", description: "Your actual damage range, accountig for both Damage and Final Damage. For Wand, Staff, Shining Rod, Fan, Psy-Limiter, or Lucent Guantlet weapons, this is calculated using Magic Attack. For all other weapons, your damage is calculated using Attack Power."),
  bossDamageRange(formattedName: "Boss Damage Range", description: "Your actual damage range against bosses, accountig for Damage, Boss Damage, and Final Damage. For Wand, Staff, Shining Rod, Fan, Psy-Limiter, or Lucent Guantlet weapons, this is calculated using Magic Attack. For all other weapons, your damage is calculated using Attack Power."),
  effectiveDamageRange(formattedName: "Effective Damage Range", description: "Your actual damage range, accountig for Damage, Final Damage, Critical Damage, and Critcal Rate. For Wand, Staff, Shining Rod, Fan, Psy-Limiter, or Lucent Guantlet weapons, this is calculated using Magic Attack. For all other weapons, your damage is calculated using Attack Power."),
  effectiveBossDamageRange(formattedName: "Effective Boss Damage Range", description: "Your actual damage range against bosses, accountig for Damage, Boss Damage, Final Damage, Critical Damage, Critical Rate, Ignore Defense, and Ignore Elemental Resistance. For Wand, Staff, Shining Rod, Fan, Psy-Limiter, or Lucent Guantlet weapons, this is calculated using Magic Attack. For all other weapons, your damage is calculated using Attack Power.");

  const RangeType({
    required this.formattedName,
    required this.description,
  });

  final String formattedName;
  final String description;
}

enum StatType {
  arcaneForce(formattedName: "Arcane Force", description: "In Arcane River areas, if you have less Arcane Force than the monsters do, you'll deal less damage to them. When you have more Arcane Force than a monster, you can attack through that monster's shield. Can be increased by obtaining and enhancing Arcane Symbols, and Hyper Stats."),
  attack(formattedName: "Attack Power", description: "Displays the current character's Attack Power. The final value is determined by the Attack Power sum and Attack Power % increase multiplication. However Pipsqueak Luminous (Equilibrium) from Monster Life and the Attack Power increase per level stat from Inner Ability are excluded from the multiplication."),
  attackSpeed(formattedName: "Attack Speed", description: "Displays the current character's Attack Speed. Attack Speed +1 is the slowest while +8 is the soft limit and +10 is the hard limit. It increases with the equipped weapon's Attack Speed, skills, consumables, and Inner Ability. However Magician jobs are not affected by the weapon's Attack Speed, innately starting with +4."),
  bossDamage(formattedName: "Boss Damage", description: "The higher your Boss Damage, the greater your damage against Boss monsters. This value does not affect normal Damage. Determined by the total combined Damage of your skills and equipment. Values that only apply to specific skills are not included in this calculation."),
  buffDuration(formattedName: "Buff Duration", description: "The higher the Buff Duration, the longer buffs will last. Does not apply to certain skills. Determined bt the total combined Buff Duration value of all your skills and equipment. Values that only apply to the duration of specific skills are not included in this calculation."),
  critDamage(formattedName: "Critical Damage", description: "The higher your Critical Damage, the more damage your Critical attacks inflict. This value is added to your base Critical Damage multiplier of 20-50%. This value does not affect normal Damage. You can increase this value with skills or items."),
  critRate(formattedName: "Critical Rate", description: "Your chance of performing a Critical Attack. You can enhance this value with skills or items."),
  damage(formattedName: "Damage", description: "The Damage multiplier used to calculate your Damage Range. Determined by the total combined Damage of your skills and equipment. Values that only apply to specific skills are not included in this calculation."),
  damageNormalMobs(formattedName: "Damage to Normal Monsters", description: ""),
  defense(formattedName: "Defense", description: "The higher your Defense, the less damage you take from enemies. Some enemy attacks can pierce through Defense. Determined by adding the total combined defense of your equipment to your base Defense."),
  dex(formattedName: "DEX", description: "DEX increases the attack strength of Bowmen and some Pirates"),
  exp(formattedName: "EXP", description: ""),
  finalAttack(formattedName: "Flat Attack Power", description: ""),
  finalDamage(formattedName: "Final Damage", description: "The damage multiplier that increases your total Damage Range. Determined by multiplying the Final Damage of all your skills."),
  finalDex(formattedName: "Flat DEX", description: ""),
  finalHp(formattedName: "Flat HP", description: ""),
  finalInt(formattedName: "Flat INT", description: ""),
  finalLuk(formattedName: "Flat LUK", description: ""),
  finalMAttack(formattedName: "Flat Magic Attack", description: ""),
  finalMp(formattedName: "Flat MP", description: ""),
  finalStr(formattedName: "Flat STR", description: ""),
  hp(formattedName: "HP", description: "HP increases the attack strength of Demon Avenger. Max HP cap is 500,000."),
  ignoreDefense(formattedName: "Ignore Defense", description: "The higher your Ignore Enemy Defense value the better your attacks penetrate enemy defenses. Determined by multiplying the Ignore Defense values of all your skills and equipment. Values that only apply to specific skills are not included in this calculation. Applies up to 100%."),
  ignoreElementalDefense(formattedName: "Ignore Elemental Defense", description: ""),
  int(formattedName: "INT", description: "INT increases the attack strength of Magicians"),
  itemDropRate(formattedName: "Item Drop Rate", description: "The higher the Item Drop Rate, the more likely that items will drop from defeated monsters. All values are summed to determin the final value. Item Drop Rates can increase, in total, up to 400%. Consumable Items, with the exception of the Wealth Acquisition Potion, can only increase the value by up to 100%. Item potential can increase the value by up to 200%. Does not apply to certain items. Effects that only apply to specific items is not included in the calculation."),
  jump(formattedName: "Jump", description: "How you can jump. Can be increased to a max of 123%. Skills and equipment can be used to increase or decrease your Jump."),
  knockbackResistance(formattedName: "Knockback Resistance", description: "Your chance to resist being pushed back by monster attacks. You can increase this value with skills."),
  level(formattedName: "Level", description: ""),
  luk(formattedName: "LUK", description: "LUK increases the attack strength of Thieves"),
  mattack(formattedName: "Magic Attack", description: "Displays the current character's Magic Attack. The final value is determined by the Magic Attack sum and the Magic Attack % increase multiplication. However Pipsqueak Luminous (Equilibrium) from Monster Life and the Magic Attack increase per level stat from Inner Ability are excluded from the multiplication."),
  mesosObtained(formattedName: "Mesos Obtained", description: "The higher the Mesos Obtained, the more Mesos monsters drop when defeated. The final value is determined by multiplying the basic obtainable Mesos by any Wealth Acquisition Potion value and Reboot passive value, then by additionally multiplying the sum of the remaining values. Additive values can combine to increase the value by up to 300%. Consumable items, with the exception of the Wealth Acquisition Potion, can only increase the value by up to 100%. Item potential can increase the value by up to 100%."),
  mp(formattedName: "MP", description: "Required for many skills. Max MP cap is 500,000."),
  sacredPower(formattedName: "Sacred Power", description: "In Grandis areas, if you have less Sacred Power than the monsters do, you'll deal less damage to them. When you have more Sacred Power than a monster, you can attack through that monster's shield. Can be increased by obtaining and enhancing Sacred Symbols."),
  speed(formattedName: "Speed", description: "Your movement speed. Can be increased to a max of 140% normally. Skills and equipment can boost this even further. Can be increased to 190% while riding a mount."),
  starForce(formattedName: "Star Force", description: "In Star Force areas, if you have less Star Force than the monsters do, you'll deal less damage to them. When you have more Star Force than a monster, you can attack through that monster's shield. Can be increased by equipping items with Star Force enhancement. Doubled for Overall equipment."),
  statusResistance(formattedName: "Status Resistance", description: "Your Abnormal Status Resistance determines the amout of Abnormal Statuses affect you. Higher values result in shorter durations. You can increase this value with skills or items."),
  str(formattedName: "STR", description: "STR increases the attack strength of Warriors and some Pirates"),
  strPercentage(formattedName: "STR", description: ""),
  dexPercentage(formattedName: "DEX", description: ""),
  intPercentage(formattedName: "INT", description: ""),
  lukPercentage(formattedName: "LUK", description: ""),
  allStats(formattedName: "All Stats", description: ""),
  allStatsPercentage(formattedName: "All Stats", description: "");

  const StatType({
    required this.formattedName,
    required this.description,
  });

  final String formattedName;
  final String description;
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

enum PotentialTier {
  rare(formattedName: "Rare", short: "R"),
  epic(formattedName: "Epic", short: "E"),
  unique(formattedName: "Unique", short: "U"),
  legendary(formattedName: "Legendary", short: "L");

  const PotentialTier({
    required this.formattedName,
    required this.short
  });

  final String formattedName;
  final String short;
}

enum ClassType {
  all(formattedName: "All"),
  warrior(formattedName: "Warrior"),
  magician(formattedName: "Magician"),
  bowman(formattedName: "Bowman"),
  thief(formattedName: "Thief"),
  pirate(formattedName: "Pirate");

  const ClassType({
    required this.formattedName
  });

  final String formattedName;
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