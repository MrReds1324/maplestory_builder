// ignore_for_file: constant_identifier_names
import 'package:flutter/material.dart';
import 'package:maplestory_builder/modules/utilities/utilities.dart';

const int JUMP_CAP = 123;
const int SPEED_CAP = 140;
// Maximum meso obtained is 300%, 100% from items and 100% from buffs (not including WAP)
const double MESOS_OBTAINED_ITEM_CAP = 1.00;
const double MESOS_OBTAINED_USE_CAP = 1.00;
const double MESOS_OBTAINED_CAP = 3.00;
// Maximum Drop Rate is 400%, 200% from items and 100% from buffs (not including WAP)
const double DROP_RATE_ITEM_CAP = 2.00;
const double DROP_RATE_USE_CAP = 1.00;
const double DROP_RATE_CAP = 4.00;

enum EquipType {
  all(
      formattedName:
          "All"), // # Only Used for filtering the equip selection, should not be used anywhere else
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

  const EquipType({required this.formattedName});

  final String formattedName;
}

const List<EquipType> SECONDARY_TYPES = [
  EquipType.secondary,
  EquipType.shield,
  EquipType.katara
];
const List<EquipType> ACCESSORY_TYPES = [
  EquipType.earrings,
  EquipType.eye,
  EquipType.face,
  EquipType.pendant,
  EquipType.belt,
  EquipType.medal,
  EquipType.ring,
  EquipType.shoulder,
  EquipType.pocket,
  EquipType.ozRing
];

enum RangeType {
  damageRange(
      formattedName: "Damage Range",
      description:
          "Your actual damage range, accountig for both Damage and Final Damage. For Wand, Staff, Shining Rod, Fan, Psy-Limiter, or Lucent Guantlet weapons, this is calculated using Magic Attack. For all other weapons, your damage is calculated using Attack Power."),
  bossDamageRange(
      formattedName: "Boss Damage Range",
      description:
          "Your actual damage range against bosses, accountig for Damage, Boss Damage, and Final Damage. For Wand, Staff, Shining Rod, Fan, Psy-Limiter, or Lucent Guantlet weapons, this is calculated using Magic Attack. For all other weapons, your damage is calculated using Attack Power."),
  effectiveDamageRange(
      formattedName: "Effective Damage Range",
      description:
          "Your actual damage range, accountig for Damage, Final Damage, Critical Damage, and Critcal Rate. For Wand, Staff, Shining Rod, Fan, Psy-Limiter, or Lucent Guantlet weapons, this is calculated using Magic Attack. For all other weapons, your damage is calculated using Attack Power."),
  effectiveBossDamageRange(
      formattedName: "Effective Boss Damage Range",
      description:
          "Your actual damage range against bosses, accountig for Damage, Boss Damage, Final Damage, Critical Damage, Critical Rate, Ignore Defense, and Ignore Elemental Resistance. For Wand, Staff, Shining Rod, Fan, Psy-Limiter, or Lucent Guantlet weapons, this is calculated using Magic Attack. For all other weapons, your damage is calculated using Attack Power.");

  const RangeType({
    required this.formattedName,
    required this.description,
  });

  final String formattedName;
  final String description;
}

enum StatType {
  arcaneForce(
      formattedName: "Arcane Force",
      description:
          "In Arcane River areas, if you have less Arcane Force than the monsters do, you'll deal less damage to them. When you have more Arcane Force than a monster, you can attack through that monster's shield. Can be increased by obtaining and enhancing Arcane Symbols, and Hyper Stats."),
  attack(
      formattedName: "Attack Power",
      description:
          "Displays the current character's Attack Power. The final value is determined by the Attack Power sum and Attack Power % increase multiplication. However Pipsqueak Luminous (Equilibrium) from Monster Life and the Attack Power increase per level stat from Inner Ability are excluded from the multiplication."),
  attackMattack(formattedName: "Attack Power & Magic Attack"),
  attackSpeed(
      formattedName: "Attack Speed",
      description:
          "Displays the current character's Attack Speed. Attack Speed +1 is the slowest while +8 is the soft limit and +10 is the hard limit. It increases with the equipped weapon's Attack Speed, skills, consumables, and Inner Ability. However Magician jobs are not affected by the weapon's Attack Speed, innately starting with +4."),
  bossDamage(
      formattedName: "Boss Damage",
      description:
          "The higher your Boss Damage, the greater your damage against Boss monsters. This value does not affect normal Damage. Determined by the total combined Damage of your skills and equipment. Values that only apply to specific skills are not included in this calculation.",
      isPercentage: true),
  buffDuration(
      formattedName: "Buff Duration",
      description:
          "The higher the Buff Duration, the longer buffs will last. Does not apply to certain skills. Determined bt the total combined Buff Duration value of all your skills and equipment. Values that only apply to the duration of specific skills are not included in this calculation.",
      isPercentage: true),
  critDamage(
      formattedName: "Critical Damage",
      description:
          "The higher your Critical Damage, the more damage your Critical attacks inflict. This value is added to your base Critical Damage multiplier of 20-50%. This value does not affect normal Damage. You can increase this value with skills or items.",
      isPercentage: true),
  critRate(
      formattedName: "Critical Rate",
      description:
          "Your chance of performing a Critical Attack. You can enhance this value with skills or items.",
      isPercentage: true),
  damage(
      formattedName: "Damage",
      description:
          "The Damage multiplier used to calculate your Damage Range. Determined by the total combined Damage of your skills and equipment. Values that only apply to specific skills are not included in this calculation.",
      isPercentage: true),
  heal(formattedName: "Heal"),
  healHP(formattedName: "Heal HP"),
  healMP(formattedName: "Heal MP"),
  healDamagePercentage(formattedName: "Heal % of Damage", isPercentage: true),
  healHPPercentage(formattedName: "Heal % of HP", isPercentage: true),
  healMPPercentage(formattedName: "Heal % of MP", isPercentage: true),
  healHpMpPercentage(formattedName: "Heal % of HP/MP", isPercentage: true),
  damageNormalMobs(
      formattedName: "Damage to Normal Monsters", isPercentage: true),
  defense(
      formattedName: "Defense",
      description:
          "The higher your Defense, the less damage you take from enemies. Some enemy attacks can pierce through Defense. Determined by adding the total combined defense of your equipment to your base Defense."),
  dex(
      formattedName: "DEX",
      description:
          "DEX increases the attack strength of Bowmen and some Pirates"),
  exp(formattedName: "EXP", isPercentage: true),
  expAdditional(formattedName: "EXP +", isPercentage: true),
  expMultiplicative(formattedName: "EXP X", isPercentage: true),
  finalAttack(formattedName: "Flat Attack Power"),
  finalDamage(
      formattedName: "Final Damage",
      description:
          "The damage multiplier that increases your total Damage Range. Determined by multiplying the Final Damage of all your skills.",
      isPercentage: true),
  finalDex(formattedName: "Flat DEX"),
  finalHp(formattedName: "Flat HP"),
  finalInt(formattedName: "Flat INT"),
  finalLuk(formattedName: "Flat LUK"),
  finalMAttack(formattedName: "Flat Magic Attack"),
  finalMp(formattedName: "Flat MP"),
  finalStr(formattedName: "Flat STR"),
  finalStrDex(formattedName: "Flat STR & DEX"),
  finalStrInt(formattedName: "Flat STR & INT"),
  finalStrLuk(formattedName: "Flat STR & LUK"),
  finalDexInt(formattedName: "Flat DEX & INT"),
  finalDexLuk(formattedName: "Flat DEX & LUK"),
  finalIntLuk(formattedName: "Flat INT & LUK"),
  finalStrDexLuk(formattedName: "Flat STR & DEX & LUK"),
  hp(
      formattedName: "HP",
      description:
          "HP increases the attack strength of Demon Avenger. Max HP cap is 500,000."),
  hpMp(formattedName: "HP & MP"),
  ignoreDefense(
      formattedName: "Ignore Defense",
      description:
          "The higher your Ignore Enemy Defense value the better your attacks penetrate enemy defenses. Determined by multiplying the Ignore Defense values of all your skills and equipment. Values that only apply to specific skills are not included in this calculation. Applies up to 100%.",
      isPercentage: true),
  ignoreElementalDefense(
      formattedName: "Ignore Elemental Defense", isPercentage: true),
  int(
      formattedName: "INT",
      description: "INT increases the attack strength of Magicians"),
  itemDropRate(
      formattedName: "Item Drop Rate",
      description:
          "The higher the Item Drop Rate, the more likely that items will drop from defeated monsters. All values are summed to determin the final value. Item Drop Rates can increase, in total, up to 400%. Consumable Items, with the exception of the Wealth Acquisition Potion, can only increase the value by up to 100%. Item potential can increase the value by up to 200%. Does not apply to certain items. Effects that only apply to specific items is not included in the calculation.",
      isPercentage: true),
  jump(
      formattedName: "Jump",
      description:
          "How you can jump. Can be increased to a max of 123%. Skills and equipment can be used to increase or decrease your Jump."),
  knockbackResistance(
      formattedName: "Knockback Resistance",
      description:
          "Your chance to resist being pushed back by monster attacks. You can increase this value with skills."),
  level(formattedName: "Level"),
  luk(
      formattedName: "LUK",
      description: "LUK increases the attack strength of Thieves"),
  mattack(
      formattedName: "Magic Attack",
      description:
          "Displays the current character's Magic Attack. The final value is determined by the Magic Attack sum and the Magic Attack % increase multiplication. However Pipsqueak Luminous (Equilibrium) from Monster Life and the Magic Attack increase per level stat from Inner Ability are excluded from the multiplication."),
  mesosObtained(
      formattedName: "Mesos Obtained",
      description:
          "The higher the Mesos Obtained, the more Mesos monsters drop when defeated. The final value is determined by multiplying the basic obtainable Mesos by any Wealth Acquisition Potion value and Reboot passive value, then by additionally multiplying the sum of the remaining values. Additive values can combine to increase the value by up to 300%. Consumable items, with the exception of the Wealth Acquisition Potion, can only increase the value by up to 100%. Item potential can increase the value by up to 100%.",
      isPercentage: true),
  mp(
      formattedName: "MP",
      description: "Required for many skills. Max MP cap is 500,000."),
  specialMana(
      formattedName: "Special Mana",
      description:
          "Zero - Time Force\nDemon Slayer - Demon Fury\nKinesis - Psychic Points\nKanna - Mana"),
  sacredPower(
      formattedName: "Sacred Power",
      description:
          "In Grandis areas, if you have less Sacred Power than the monsters do, you'll deal less damage to them. When you have more Sacred Power than a monster, you can attack through that monster's shield. Can be increased by obtaining and enhancing Sacred Symbols."),
  speed(
      formattedName: "Speed",
      description:
          "Your movement speed. Can be increased to a max of 140% normally. Skills and equipment can boost this even further. Can be increased to 190% while riding a mount."),
  speedJump(formattedName: "Speed & Jump"),
  starForce(
      formattedName: "Star Force",
      description:
          "In Star Force areas, if you have less Star Force than the monsters do, you'll deal less damage to them. When you have more Star Force than a monster, you can attack through that monster's shield. Can be increased by equipping items with Star Force enhancement. Doubled for Overall equipment."),
  statusResistance(
      formattedName: "Status Resistance",
      description:
          "Your Abnormal Status Resistance determines the amout of Abnormal Statuses affect you. Higher values result in shorter durations. You can increase this value with skills or items."),
  str(
      formattedName: "STR",
      description:
          "STR increases the attack strength of Warriors and some Pirates"),
  strPercentage(formattedName: "STR", isPercentage: true),
  dexPercentage(formattedName: "DEX", isPercentage: true),
  intPercentage(formattedName: "INT", isPercentage: true),
  lukPercentage(formattedName: "LUK", isPercentage: true),
  hpPercentage(formattedName: "HP", isPercentage: true),
  mpPercentage(formattedName: "MP", isPercentage: true),
  hpMpPercentage(formattedName: "HP & MP", isPercentage: true),
  defensePercentage(formattedName: "DEF", isPercentage: true),
  allStats(formattedName: "All Stats"),
  allStatsPercentage(formattedName: "All Stats", isPercentage: true),
  attackPercentage(formattedName: "ATT", isPercentage: true),
  mattackPercentage(formattedName: "MATT", isPercentage: true),
  attackMattackPercentage(formattedName: "ATT & MATT", isPercentage: true),
  hpRecovery(
      formattedName: "Skills and Potion HP Recovery", isPercentage: true),
  skill(formattedName: "Skill"),
  skillLevel(formattedName: "Skill Level"),
  allSkillLevel(formattedName: "All Skill Levels"),
  skillCooldown(formattedName: "Skill Cooldown", isPositive: false),
  skillCooldownPercentage(formattedName: "Skill Cooldown", isPercentage: true),
  skipCooldownChance(formattedName: "Skip Cooldown Chance", isPercentage: true),
  attackSkillTargetIncrease(formattedName: "Attack Skill Target Increase"),
  summonDuration(formattedName: "Summon Duration", isPercentage: true),
  mastery(formattedName: "Mastery", isPercentage: true),
  finalAttackSkillDamage(
      formattedName: "Final Attack-Type Skill Damage", isPercentage: true),
  autoStealChance(formattedName: "Chance to Auto Steal", isPercentage: true),
  mainStat(
      formattedName:
          "Main Stat"), // This will be replaced, mainly for ease of use in things like hexa matrix and skills
  mainAttack(formattedName: "Main Attack"), // Same as main stat
  procChance(formattedName: "Chance", isPercentage: true),
  duration(formattedName: "Duration"),
  ;

  const StatType({
    required this.formattedName,
    this.description = "",
    this.isPercentage = false,
    this.isPositive = true,
  });

  final String formattedName;
  final String description;
  final bool isPercentage;
  final bool isPositive;

  String toStringWithValue(num value) {
    return "$formattedName ${isPositive ? '+' : ' -'}${isPercentage ? doubleRoundPercentFormater.format(value) : value}";
  }

  Widget buildRowDisplayWithValue(BuildContext context, num value, double width,
      {BoxConstraints? constraints, bool includeSpacer = false}) {
    return SizedBox(
        width: width,
        child: Row(children: [
          Container(
            constraints: constraints,
            child: Text(
              formattedName,
              style: Theme.of(context).textTheme.bodyMedium,
            ),
          ),
          includeSpacer ? const Spacer() : const SizedBox.shrink(),
          Text(
              "${includeSpacer ? '' : ' '}${isPositive ? '+' : ' -'}${isPercentage ? doubleRoundPercentFormater.format(value) : value}",
              style: Theme.of(context).textTheme.bodyMedium)
        ]));
  }
}

enum StatCategory {
  primary,
  secondary;
}

// Taken from https://strategywiki.org/wiki/MapleStory/Formulas#Weapon_Multiplier
// TODO - implement weapon multiplier

const Color DEFAULT_COLOR = Color.fromARGB(255, 105, 105, 105);
const Color AP_COLOR = Colors.green;
const Color MISSING_COLOR = Color.fromARGB(255, 150, 150, 150);

const Color EQUIP_ENHANCED_COLOR = Color.fromARGB(255, 102, 255, 255);
const Color EQUIP_FLAME_COLOR = Color.fromARGB(255, 204, 255, 0);
const Color EQUIP_STAR_COLOR = Color.fromARGB(255, 255, 204, 0);
const Color EQUIP_SCROLL_COLOR = Color.fromARGB(255, 170, 170, 255);
const Color EQUIP_REDUCTION_COLOR = Color.fromARGB(255, 255, 0, 102);
const Color EQUIP_UNIQUE_COLOR = Colors.deepOrangeAccent;

const Color STAR_COLOR = Color.fromARGB(255, 255, 212, 1);
const Color RARE_COLOR = Color.fromARGB(255, 102, 255, 255);
const Color EPIC_COLOR = Color.fromARGB(255, 173, 109, 236);
const Color UNIQUE_COLOR = Color.fromARGB(255, 255, 231, 16);
const Color LEGENDARY_COLOR = Color.fromARGB(255, 119, 238, 0);

const Icon EMPTY_STAR = Icon(Icons.star_border, size: 16);
const Icon FILLED_STAR = Icon(Icons.star, size: 16, color: STAR_COLOR);

// Taken from https://grandislibrary.com/content/attack-speed
const int ATTACK_SPEED_SLOWER_1 = 1;
const int ATTACK_SPEED_SLOW_2 = 2;
const int ATTACK_SPEED_SLOW_3 = 3;
const int ATTACK_SPEED_AVERAGE_4 = 4;
const int ATTACK_SPEED_FAST_5 = 5;
const int ATTACK_SPEED_FAST_6 = 6;
const int ATTACK_SPEED_FASTER_7 = 7;

const int MAX_CHARACTER_LEVEL = 300;
const int MINIMUM_CHARACTER_LEVEL = 1;

const int MINIMUM_AP_AMOUNT = 4;
const int AP_PER_LEVEL = 5;
const int STARTING_AP_AMOUNT = 14;
