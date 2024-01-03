import 'package:maplestory_builder/constants/constants.dart';

enum BuffSlot {
  mesoCoupon,
  dropCoupon,
  serverExp,
  cashExpCoupon,
  expCoupon,
  bonusExpCoupon,
  alchemyPotion,
  strPill,
  strPotion,
  dexPill,
  dexPotion,
  intPill,
  intPotion,
  lukPill,
  lukPotion,
  attackPill,
  attackPotion,
  mattackPill,
  mattackPotion,
  defensePill,
  defensePotion,
  wealthAcquisitionPotion,
  expAccumulationPotion,
  starPotion,
  ;
}

enum ConsumableCategory {
  all(formattedName: "All"), // Only used for filtering
  allStatsBoost(formattedName: "All Stats Boost"),
  strBoost(formattedName: "STR Boost"),
  dexBoost(formattedName: "DEX Boost"),
  intBoost(formattedName: "INT Boost"),
  lukBoost(formattedName: "LUK Boost"),
  hpBoost(formattedName: "HP Boost"),
  mpBoost(formattedName: "MP Boost"),
  defenseBoost(formattedName: "DEF Boost"),
  attackBoost(formattedName: "Attack Power Boost"),
  mattackBoost(formattedName: "Magic Attack Boost"),
  sppedBoost(formattedName: "Speed Boost"),
  jumpBoost(formattedName: "Jump Boost"),
  attackSpeedBoost(formattedName: "Attack Speed Boost"),
  bossDamageBoost(formattedName: "Boss Damage Boost"),
  critRateBoost(formattedName: "Critical Rate Boost"),
  damageBoost(formattedName: "Damage Boost"),
  ignoreDefenseBoost(formattedName: "Ignore Enemy Defense Boost"),
  mesosObtainedBoost(formattedName: "Mesos Obtained Boost"),
  itemDropRateBoost(formattedName: "Item Drop Rate Boost"),
  expBoost(formattedName: "EXP Boost"),
  ;

  const ConsumableCategory({
    required this.formattedName,
  });

  final String formattedName;
}

enum ConsumableName {
  advancedBlessingPotion(
      formattedName: "Advanced Blessing Potion",
      description:
          "A pungent alchemical concoction that increases STR, DEX, INT, LUK, and Speed by 30, and Jump by 23, for 2 hours. Alchemists are able to stomach two at a time, but they are too strong for anyone else to drink more than one.",
      statValues: {
        StatType.allStats: 30,
        StatType.speed: 30,
        StatType.jump: 23
      },
      consumableCategories: [
        ConsumableCategory.allStatsBoost,
        ConsumableCategory.sppedBoost,
        ConsumableCategory.jumpBoost
      ],
      duration: 7200,
      buffSlots: {BuffSlot.alchemyPotion}),
  advancedGreatBlessingPotion(
      formattedName: "Advanced Great Blessing Potion",
      description:
          "Alchemy Masters and Renowned Masters can make this potion that increases all stats by 10% for 40 minutes. Caution:Normally, only 1 Potion can be used at a time, but Alchemists can use 2 if they are of different kinds.",
      statValues: {StatType.allStatsPercentage: 0.1},
      consumableCategories: [ConsumableCategory.allStatsBoost],
      duration: 2400,
      buffSlots: {BuffSlot.alchemyPotion}),
  blessingPotion(
      formattedName: "Blessing Potion",
      description:
          "A pungent alchemical concoction that increases STR, DEX, INT, LUK, Speed and Jump by 20 for 2 hours. Alchemists are able to stomach two at a time, but they are too strong for anyone else to drink more than one.",
      statValues: {
        StatType.allStats: 20,
        StatType.speed: 20,
        StatType.jump: 20
      },
      consumableCategories: [
        ConsumableCategory.allStatsBoost,
        ConsumableCategory.sppedBoost,
        ConsumableCategory.jumpBoost
      ],
      duration: 7200,
      buffSlots: {BuffSlot.alchemyPotion}),
  candiedApple(
      formattedName: "Candied Apple",
      description:
          "A small apple pierced with a stick and glazed with sugary candy.",
      statValues: {StatType.allStats: 7},
      consumableCategories: [ConsumableCategory.allStatsBoost],
      duration: 1800,
      buffSlots: {}),
  exceptionalBlessingPotion(
      formattedName: "Exceptional Blessing Potion",
      description:
          "A pungent alchemical concoction that increases STR, DEX, INT, and LUK by 50, and both Speed and Jump to maximum values, for 2 hours. Alchemists are able to stomach two at a time, but they are too strong for anyone else to drink more than one.",
      statValues: {
        StatType.allStats: 50,
        StatType.speed: 80,
        StatType.jump: 80
      },
      consumableCategories: [
        ConsumableCategory.allStatsBoost,
        ConsumableCategory.sppedBoost,
        ConsumableCategory.jumpBoost
      ],
      duration: 7200,
      buffSlots: {BuffSlot.alchemyPotion}),
  greatBlessingPotion(
      formattedName: "Great Blessing Potion",
      description:
          "Alchemy Masters and Renowned Masters can make this potion that increases all stats by 5% for 40 minutes. Caution:Normally, only 1 Potion can be used at a time, but Alchemists can use 2 if they are of different kinds.",
      statValues: {StatType.allStatsPercentage: 0.05},
      consumableCategories: [ConsumableCategory.allStatsBoost],
      duration: 2400,
      buffSlots: {}),
  legendaryBlessingPotion(
      formattedName: "Legendary Blessing Potion",
      description:
          "A pungent alchemical concoction that increases STR, DEX, INT, and LUK by 60, and both Speed and Jump to maximum values, for 2 hours. Alchemists are able to stomach two at a time, but they are too strong for anyone else to drink more than one.",
      statValues: {
        StatType.allStats: 60,
        StatType.speed: 80,
        StatType.jump: 80
      },
      consumableCategories: [
        ConsumableCategory.allStatsBoost,
        ConsumableCategory.sppedBoost,
        ConsumableCategory.jumpBoost
      ],
      duration: 7200,
      buffSlots: {BuffSlot.alchemyPotion}),
  superiorBlessingPotion(
      formattedName: "Superior Blessing Potion",
      description:
          "A pungent alchemical concoction that increases STR, DEX, INT, and LUK by 40, and both Speed and Jump to maximum values, for 2 hours. Alchemists are able to stomach two at a time, but they are too strong for anyone else to drink more than one.",
      statValues: {
        StatType.allStats: 40,
        StatType.speed: 80,
        StatType.jump: 80
      },
      consumableCategories: [
        ConsumableCategory.allStatsBoost,
        ConsumableCategory.sppedBoost,
        ConsumableCategory.jumpBoost
      ],
      duration: 7200,
      buffSlots: {BuffSlot.alchemyPotion}),
  advancedHealthBoostPotion(
      formattedName: "Advanced Health Boost Potion",
      description:
          "A pungent alchemical concoction that increases HP by 4000 for 2 hours. Alchemists are able to stomach two at a time, but they are too strong for anyone else to drink more than one.",
      statValues: {StatType.hp: 4000},
      consumableCategories: [ConsumableCategory.hpBoost],
      duration: 7200,
      buffSlots: {BuffSlot.alchemyPotion}),
  exceptionalFortitudePotion(
      formattedName: "Exceptional Fortitude Potion",
      description:
          "A pungent alchemical concoction that increases Max HP by 6000 for 2 hours. Alchemists are able to stomach two at a time, but they are too strong for anyone else to drink more than one.",
      statValues: {StatType.hp: 6000},
      consumableCategories: [ConsumableCategory.hpBoost],
      duration: 7200,
      buffSlots: {BuffSlot.alchemyPotion}),
  exceptionalInsightPotion(
      formattedName: "Exceptional Insight Potion",
      description:
          "A pungent alchemical concoction that increases Max MP by 6000 for 2 hours. Alchemists are able to stomach two at a time, but they are too strong for anyone else to drink more than one.",
      statValues: {StatType.mp: 6000},
      consumableCategories: [ConsumableCategory.hpBoost],
      duration: 7200,
      buffSlots: {BuffSlot.alchemyPotion}),
  extremeRedPotion(
      formattedName: "Extreme Red Potion",
      description: "A red potion from Monster Park.",
      statValues: {StatType.hp: 2000, StatType.attack: 30},
      consumableCategories: [
        ConsumableCategory.hpBoost,
        ConsumableCategory.attackBoost
      ],
      duration: 1800,
      buffSlots: {}),
  healthBoostPotion(
      formattedName: "Health Boost Potion",
      description:
          "A pungent alchemical concoction that increases HP by 2000 for 2 hours. Alchemists are able to stomach two at a time, but they are too strong for anyone else to drink more than one.",
      statValues: {StatType.hp: 2000},
      consumableCategories: [ConsumableCategory.hpBoost],
      duration: 7200,
      buffSlots: {BuffSlot.alchemyPotion}),
  legendaryFortitudePotion(
      formattedName: "Legendary Fortitude Potion",
      description:
          "A pungent alchemical concoction that increases Max HP by 7000 for 2 hours. Alchemists are able to stomach two at a time, but they are too strong for anyone else to drink more than one.",
      statValues: {StatType.hp: 7000},
      consumableCategories: [ConsumableCategory.hpBoost],
      duration: 7200,
      buffSlots: {BuffSlot.alchemyPotion}),
  legendaryInsightPotion(
      formattedName: "Legendary Insight Potion",
      description:
          "A pungent alchemical concoction that increases Max MP by 7000 for 2 hours. Alchemists are able to stomach two at a time, but they are too strong for anyone else to drink more than one.",
      statValues: {StatType.mp: 7000},
      consumableCategories: [ConsumableCategory.hpBoost],
      duration: 7200,
      buffSlots: {BuffSlot.alchemyPotion}),
  superiorFortitudePotion(
      formattedName: "Superior Fortitude Potion",
      description:
          "A pungent alchemical concoction that increases Max HP by 5000 for 2 hours. Alchemists are able to stomach two at a time, but they are too strong for anyone else to drink more than one.",
      statValues: {StatType.hp: 5000},
      consumableCategories: [ConsumableCategory.hpBoost],
      duration: 7200,
      buffSlots: {BuffSlot.alchemyPotion}),
  superiorInsightPotion(
      formattedName: "Superior Insight Potion",
      description:
          "A pungent alchemical concoction that increases Max MP by 5000 for 2 hours. Alchemists are able to stomach two at a time, but they are too strong for anyone else to drink more than one.",
      statValues: {StatType.mp: 5000},
      consumableCategories: [ConsumableCategory.hpBoost],
      duration: 7200,
      buffSlots: {BuffSlot.alchemyPotion}),
  advancedManaBoostPotion(
      formattedName: "Advanced Mana Boost Potion",
      description:
          "A pungent alchemical concoction that increases MP by 4000 for 2 hours. Alchemists are able to stomach two at a time, but they are too strong for anyone else to drink more than one.",
      statValues: {StatType.hp: 4000, StatType.mp: 4000},
      consumableCategories: [ConsumableCategory.mpBoost],
      duration: 7200,
      buffSlots: {BuffSlot.alchemyPotion}),
  extremeBluePotion(
      formattedName: "Extreme Blue Potion",
      description: "A blue potion from Monster Park.",
      statValues: {StatType.mp: 2000, StatType.mattack: 30},
      consumableCategories: [
        ConsumableCategory.mpBoost,
        ConsumableCategory.mattackBoost
      ],
      duration: 1800,
      buffSlots: {BuffSlot.alchemyPotion}),
  manaBoostPotion(
      formattedName: "Mana Boost Potion",
      description:
          "A pungent alchemical concoction that increases MP by 2000 for 2 hours. Alchemists are able to stomach two at a time, but they are too strong for anyone else to drink more than one.",
      statValues: {StatType.mp: 2000},
      consumableCategories: [ConsumableCategory.mpBoost],
      duration: 7200,
      buffSlots: {BuffSlot.alchemyPotion}),
  advancedStrengthBoostPotion(
      formattedName: "Advanced Strength Boost Potion",
      description:
          "A pungent alchemical concoction that increases STR by 60 for 2 hours. Alchemists are able to stomach two at a time, but they are too strong for anyone else to drink more than one.",
      statValues: {StatType.str: 60},
      consumableCategories: [ConsumableCategory.strBoost],
      duration: 7200,
      buffSlots: {BuffSlot.alchemyPotion}),
  advancedStrengthPillI(
      formattedName: "Advanced Strength Pill I",
      description: "A pill made through Alchemy.",
      statValues: {StatType.str: 3},
      consumableCategories: [ConsumableCategory.strBoost],
      duration: 1800,
      buffSlots: {BuffSlot.strPill}),
  advancedStrengthPillII(
      formattedName: "Advanced Strength Pill II",
      description: "A pill made through Alchemy.",
      statValues: {StatType.str: 6},
      consumableCategories: [ConsumableCategory.strBoost],
      duration: 1800,
      buffSlots: {BuffSlot.strPill}),
  advancedStrengthPillIII(
      formattedName: "Advanced Strength Pill III",
      description: "A pill made through Alchemy.",
      statValues: {StatType.str: 9},
      consumableCategories: [ConsumableCategory.strBoost],
      duration: 1800,
      buffSlots: {BuffSlot.strPill}),
  advancedStrengthPillIV(
      formattedName: "Advanced Strength Pill IV",
      description: "A pill made through Alchemy.",
      statValues: {StatType.str: 12},
      consumableCategories: [ConsumableCategory.strBoost],
      duration: 1800,
      buffSlots: {BuffSlot.strPill}),
  advancedStrengthPillIX(
      formattedName: "Advanced Strength Pill IX",
      description: "A pill made through Alchemy.",
      statValues: {StatType.str: 27},
      consumableCategories: [ConsumableCategory.strBoost],
      duration: 1800,
      buffSlots: {BuffSlot.strPill}),
  advancedStrengthPillV(
      formattedName: "Advanced Strength Pill V",
      description: "A pill made through Alchemy.",
      statValues: {StatType.str: 15},
      consumableCategories: [ConsumableCategory.strBoost],
      duration: 1800,
      buffSlots: {BuffSlot.strPill}),
  advancedStrengthPillVI(
      formattedName: "Advanced Strength Pill VI",
      description: "A pill made through Alchemy.",
      statValues: {StatType.str: 18},
      consumableCategories: [ConsumableCategory.strBoost],
      duration: 1800,
      buffSlots: {BuffSlot.strPill}),
  advancedStrengthPillVII(
      formattedName: "Advanced Strength Pill VII",
      description: "A pill made through Alchemy.",
      statValues: {StatType.str: 21},
      consumableCategories: [ConsumableCategory.strBoost],
      duration: 1800,
      buffSlots: {BuffSlot.strPill}),
  advancedStrengthPillVIII(
      formattedName: "Advanced Strength Pill VIII",
      description: "A pill made through Alchemy.",
      statValues: {StatType.str: 24},
      consumableCategories: [ConsumableCategory.strBoost],
      duration: 1800,
      buffSlots: {BuffSlot.strPill}),
  advancedStrengthPillX(
      formattedName: "Advanced Strength Pill X",
      description: "A pill made through Alchemy.",
      statValues: {StatType.str: 30},
      consumableCategories: [ConsumableCategory.strBoost],
      duration: 1800,
      buffSlots: {BuffSlot.strPill}),
  advancedStrengthPotionI(
      formattedName: "Advanced Strength Potion I",
      description: "A potion made through Alchemy.",
      statValues: {StatType.str: 3},
      consumableCategories: [ConsumableCategory.strBoost],
      duration: 1800,
      buffSlots: {BuffSlot.strPotion}),
  advancedStrengthPotionII(
      formattedName: "Advanced Strength Potion II",
      description: "A potion made through Alchemy.",
      statValues: {StatType.str: 6},
      consumableCategories: [ConsumableCategory.strBoost],
      duration: 1800,
      buffSlots: {BuffSlot.strPotion}),
  advancedStrengthPotionIII(
      formattedName: "Advanced Strength Potion III",
      description: "A potion made through Alchemy.",
      statValues: {StatType.str: 9},
      consumableCategories: [ConsumableCategory.strBoost],
      duration: 1800,
      buffSlots: {BuffSlot.strPotion}),
  advancedStrengthPotionIV(
      formattedName: "Advanced Strength Potion IV",
      description: "A potion made through Alchemy.",
      statValues: {StatType.str: 12},
      consumableCategories: [ConsumableCategory.strBoost],
      duration: 1800,
      buffSlots: {BuffSlot.strPotion}),
  advancedStrengthPotionIX(
      formattedName: "Advanced Strength Potion IX",
      description: "A potion made through Alchemy.",
      statValues: {StatType.str: 27},
      consumableCategories: [ConsumableCategory.strBoost],
      duration: 1800,
      buffSlots: {BuffSlot.strPotion}),
  advancedStrengthPotionV(
      formattedName: "Advanced Strength Potion V",
      description: "A potion made through Alchemy.",
      statValues: {StatType.str: 15},
      consumableCategories: [ConsumableCategory.strBoost],
      duration: 1800,
      buffSlots: {BuffSlot.strPotion}),
  advancedStrengthPotionVI(
      formattedName: "Advanced Strength Potion VI",
      description: "A potion made through Alchemy.",
      statValues: {StatType.str: 18},
      consumableCategories: [ConsumableCategory.strBoost],
      duration: 1800,
      buffSlots: {BuffSlot.strPotion}),
  advancedStrengthPotionVII(
      formattedName: "Advanced Strength Potion VII",
      description: "A potion made through Alchemy.",
      statValues: {StatType.str: 21},
      consumableCategories: [ConsumableCategory.strBoost],
      duration: 1800,
      buffSlots: {BuffSlot.strPotion}),
  advancedStrengthPotionVIII(
      formattedName: "Advanced Strength Potion VIII",
      description: "A potion made through Alchemy.",
      statValues: {StatType.str: 24},
      consumableCategories: [ConsumableCategory.strBoost],
      duration: 1800,
      buffSlots: {BuffSlot.strPotion}),
  advancedStrengthPotionX(
      formattedName: "Advanced Strength Potion X",
      description: "A potion made through Alchemy.",
      statValues: {StatType.str: 30},
      consumableCategories: [ConsumableCategory.strBoost],
      duration: 1800,
      buffSlots: {BuffSlot.strPotion}),
  exceptionalStrengthBoostPotion(
      formattedName: "Exceptional Strength Boost Potion",
      description:
          "A pungent alchemical concoction that increases STR by 80 for 2 hours. Alchemists are able to stomach two at a time, but they are too strong for anyone else to drink more than one.",
      statValues: {StatType.str: 80},
      consumableCategories: [ConsumableCategory.strBoost],
      duration: 7200,
      buffSlots: {BuffSlot.alchemyPotion}),
  strengthBoostPotion(
      formattedName: "Strength Boost Potion",
      description:
          "A pungent alchemical concoction that increases STR by 40 for 2 hours. Alchemists are able to stomach two at a time, but they are too strong for anyone else to drink more than one.",
      statValues: {StatType.str: 40},
      consumableCategories: [ConsumableCategory.strBoost],
      duration: 7200,
      buffSlots: {BuffSlot.alchemyPotion}),
  strengthPillI(
      formattedName: "Strength Pill I",
      description: "A pill made through Alchemy.",
      statValues: {StatType.str: 3},
      consumableCategories: [ConsumableCategory.strBoost],
      duration: 900,
      buffSlots: {BuffSlot.strPill}),
  strengthPillII(
      formattedName: "Strength Pill II",
      description: "A pill made through Alchemy.",
      statValues: {StatType.str: 6},
      consumableCategories: [ConsumableCategory.strBoost],
      duration: 900,
      buffSlots: {BuffSlot.strPill}),
  strengthPillIII(
      formattedName: "Strength Pill III",
      description: "A pill made through Alchemy.",
      statValues: {StatType.str: 9},
      consumableCategories: [ConsumableCategory.strBoost],
      duration: 900,
      buffSlots: {BuffSlot.strPill}),
  strengthPillIV(
      formattedName: "Strength Pill IV",
      description: "A pill made through Alchemy.",
      statValues: {StatType.str: 12},
      consumableCategories: [ConsumableCategory.strBoost],
      duration: 900,
      buffSlots: {BuffSlot.strPill}),
  strengthPillIX(
      formattedName: "Strength Pill IX",
      description: "A pill made through Alchemy.",
      statValues: {StatType.str: 27},
      consumableCategories: [ConsumableCategory.strBoost],
      duration: 900,
      buffSlots: {BuffSlot.strPill}),
  strengthPillV(
      formattedName: "Strength Pill V",
      description: "A pill made through Alchemy.",
      statValues: {StatType.str: 15},
      consumableCategories: [ConsumableCategory.strBoost],
      duration: 900,
      buffSlots: {BuffSlot.strPill}),
  strengthPillVI(
      formattedName: "Strength Pill VI",
      description: "A pill made through Alchemy.",
      statValues: {StatType.str: 18},
      consumableCategories: [ConsumableCategory.strBoost],
      duration: 900,
      buffSlots: {BuffSlot.strPill}),
  strengthPillVII(
      formattedName: "Strength Pill VII",
      description: "A pill made through Alchemy.",
      statValues: {StatType.str: 21},
      consumableCategories: [ConsumableCategory.strBoost],
      duration: 900,
      buffSlots: {BuffSlot.strPill}),
  strengthPillVIII(
      formattedName: "Strength Pill VIII",
      description: "A pill made through Alchemy.",
      statValues: {StatType.str: 24},
      consumableCategories: [ConsumableCategory.strBoost],
      duration: 900,
      buffSlots: {BuffSlot.strPill}),
  strengthPillX(
      formattedName: "Strength Pill X",
      description: "A pill made through Alchemy.",
      statValues: {StatType.str: 30},
      consumableCategories: [ConsumableCategory.strBoost],
      duration: 900,
      buffSlots: {BuffSlot.strPill}),
  strengthPotionI(
      formattedName: "Strength Potion I",
      description: "A potion made through Alchemy.",
      statValues: {StatType.str: 3},
      consumableCategories: [ConsumableCategory.strBoost],
      duration: 900,
      buffSlots: {BuffSlot.strPotion}),
  strengthPotionII(
      formattedName: "Strength Potion II",
      description: "A potion made through Alchemy.",
      statValues: {StatType.str: 6},
      consumableCategories: [ConsumableCategory.strBoost],
      duration: 900,
      buffSlots: {BuffSlot.strPotion}),
  strengthPotionIII(
      formattedName: "Strength Potion III",
      description: "A potion made through Alchemy.",
      statValues: {StatType.str: 9},
      consumableCategories: [ConsumableCategory.strBoost],
      duration: 900,
      buffSlots: {BuffSlot.strPotion}),
  strengthPotionIV(
      formattedName: "Strength Potion IV",
      description: "A potion made through Alchemy.",
      statValues: {StatType.str: 12},
      consumableCategories: [ConsumableCategory.strBoost],
      duration: 900,
      buffSlots: {BuffSlot.strPotion}),
  strengthPotionIX(
      formattedName: "Strength Potion IX",
      description: "A potion made through Alchemy.",
      statValues: {StatType.str: 27},
      consumableCategories: [ConsumableCategory.strBoost],
      duration: 900,
      buffSlots: {BuffSlot.strPotion}),
  strengthPotionV(
      formattedName: "Strength Potion V",
      description: "A potion made through Alchemy.",
      statValues: {StatType.str: 15},
      consumableCategories: [ConsumableCategory.strBoost],
      duration: 900,
      buffSlots: {BuffSlot.strPotion}),
  strengthPotionVI(
      formattedName: "Strength Potion VI",
      description: "A potion made through Alchemy.",
      statValues: {StatType.str: 18},
      consumableCategories: [ConsumableCategory.strBoost],
      duration: 900,
      buffSlots: {BuffSlot.strPotion}),
  strengthPotionVII(
      formattedName: "Strength Potion VII",
      description: "A potion made through Alchemy.",
      statValues: {StatType.str: 21},
      consumableCategories: [ConsumableCategory.strBoost],
      duration: 900,
      buffSlots: {BuffSlot.strPotion}),
  strengthPotionVIII(
      formattedName: "Strength Potion VIII",
      description: "A potion made through Alchemy.",
      statValues: {StatType.str: 24},
      consumableCategories: [ConsumableCategory.strBoost],
      duration: 900,
      buffSlots: {BuffSlot.strPotion}),
  strengthPotionX(
      formattedName: "Strength Potion X",
      description: "A potion made through Alchemy.",
      statValues: {StatType.str: 30},
      consumableCategories: [ConsumableCategory.strBoost],
      duration: 900,
      buffSlots: {BuffSlot.strPotion}),
  superiorStrengthBoostPotion(
      formattedName: "Superior Strength Boost Potion",
      description:
          "A pungent alchemical concoction that increases STR by 70 for 2 hours. Alchemists are able to stomach two at a time, but they are too strong for anyone else to drink more than one.",
      statValues: {StatType.str: 70},
      consumableCategories: [ConsumableCategory.strBoost],
      duration: 7200,
      buffSlots: {BuffSlot.alchemyPotion}),
  advancedLuckBoostPotion(
      formattedName: "Advanced Luck Boost Potion",
      description:
          "A pungent alchemical concoction that increases LUK by 60 for 2 hours. Alchemists are able to stomach two at a time, but they are too strong for anyone else to drink more than one.",
      statValues: {StatType.luk: 60},
      consumableCategories: [ConsumableCategory.lukBoost],
      duration: 7200,
      buffSlots: {BuffSlot.alchemyPotion}),
  advancedLuckPillI(
      formattedName: "Advanced Luck Pill I",
      description: "A pill made through Alchemy.",
      statValues: {StatType.luk: 3},
      consumableCategories: [ConsumableCategory.lukBoost],
      duration: 1800,
      buffSlots: {BuffSlot.lukPill}),
  advancedLuckPillII(
      formattedName: "Advanced Luck Pill II",
      description: "A pill made through Alchemy.",
      statValues: {StatType.luk: 6},
      consumableCategories: [ConsumableCategory.lukBoost],
      duration: 1800,
      buffSlots: {BuffSlot.lukPill}),
  advancedLuckPillIII(
      formattedName: "Advanced Luck Pill III",
      description: "A pill made through Alchemy.",
      statValues: {StatType.luk: 9},
      consumableCategories: [ConsumableCategory.lukBoost],
      duration: 1800,
      buffSlots: {BuffSlot.lukPill}),
  advancedLuckPillIV(
      formattedName: "Advanced Luck Pill IV",
      description: "A pill made through Alchemy.",
      statValues: {StatType.luk: 12},
      consumableCategories: [ConsumableCategory.lukBoost],
      duration: 1800,
      buffSlots: {BuffSlot.lukPill}),
  advancedLuckPillIX(
      formattedName: "Advanced Luck Pill IX",
      description: "A pill made through Alchemy.",
      statValues: {StatType.luk: 27},
      consumableCategories: [ConsumableCategory.lukBoost],
      duration: 1800,
      buffSlots: {BuffSlot.lukPill}),
  advancedLuckPillV(
      formattedName: "Advanced Luck Pill V",
      description: "A pill made through Alchemy.",
      statValues: {StatType.luk: 15},
      consumableCategories: [ConsumableCategory.lukBoost],
      duration: 1800,
      buffSlots: {BuffSlot.lukPill}),
  advancedLuckPillVI(
      formattedName: "Advanced Luck Pill VI",
      description: "A pill made through Alchemy.",
      statValues: {StatType.luk: 18},
      consumableCategories: [ConsumableCategory.lukBoost],
      duration: 1800,
      buffSlots: {BuffSlot.lukPill}),
  advancedLuckPillVII(
      formattedName: "Advanced Luck Pill VII",
      description: "A pill made through Alchemy.",
      statValues: {StatType.luk: 21},
      consumableCategories: [ConsumableCategory.lukBoost],
      duration: 1800,
      buffSlots: {BuffSlot.lukPill}),
  advancedLuckPillVIII(
      formattedName: "Advanced Luck Pill VIII",
      description: "A pill made through Alchemy.",
      statValues: {StatType.luk: 24},
      consumableCategories: [ConsumableCategory.lukBoost],
      duration: 1800,
      buffSlots: {BuffSlot.lukPill}),
  advancedLuckPillX(
      formattedName: "Advanced Luck Pill X",
      description: "A pill made through Alchemy.",
      statValues: {StatType.luk: 30},
      consumableCategories: [ConsumableCategory.lukBoost],
      duration: 1800,
      buffSlots: {BuffSlot.lukPill}),
  advancedLuckPotionI(
      formattedName: "Advanced Luck Potion I",
      description: "A potion made through Alchemy.",
      statValues: {StatType.luk: 3},
      consumableCategories: [ConsumableCategory.lukBoost],
      duration: 1800,
      buffSlots: {BuffSlot.lukPotion}),
  advancedLuckPotionII(
      formattedName: "Advanced Luck Potion II",
      description: "A potion made through Alchemy.",
      statValues: {StatType.luk: 6},
      consumableCategories: [ConsumableCategory.lukBoost],
      duration: 1800,
      buffSlots: {BuffSlot.lukPotion}),
  advancedLuckPotionIII(
      formattedName: "Advanced Luck Potion III",
      description: "A potion made through Alchemy.",
      statValues: {StatType.luk: 9},
      consumableCategories: [ConsumableCategory.lukBoost],
      duration: 1800,
      buffSlots: {BuffSlot.lukPotion}),
  advancedLuckPotionIV(
      formattedName: "Advanced Luck Potion IV",
      description: "A potion made through Alchemy.",
      statValues: {StatType.luk: 12},
      consumableCategories: [ConsumableCategory.lukBoost],
      duration: 1800,
      buffSlots: {BuffSlot.lukPotion}),
  advancedLuckPotionIX(
      formattedName: "Advanced Luck Potion IX",
      description: "A potion made through Alchemy.",
      statValues: {StatType.luk: 27},
      consumableCategories: [ConsumableCategory.lukBoost],
      duration: 1800,
      buffSlots: {BuffSlot.lukPotion}),
  advancedLuckPotionV(
      formattedName: "Advanced Luck Potion V",
      description: "A potion made through Alchemy.",
      statValues: {StatType.luk: 15},
      consumableCategories: [ConsumableCategory.lukBoost],
      duration: 1800,
      buffSlots: {BuffSlot.lukPotion}),
  advancedLuckPotionVI(
      formattedName: "Advanced Luck Potion VI",
      description: "A potion made through Alchemy.",
      statValues: {StatType.luk: 18},
      consumableCategories: [ConsumableCategory.lukBoost],
      duration: 1800,
      buffSlots: {BuffSlot.lukPotion}),
  advancedLuckPotionVII(
      formattedName: "Advanced Luck Potion VII",
      description: "A potion made through Alchemy.",
      statValues: {StatType.luk: 21},
      consumableCategories: [ConsumableCategory.lukBoost],
      duration: 1800,
      buffSlots: {BuffSlot.lukPotion}),
  advancedLuckPotionVIII(
      formattedName: "Advanced Luck Potion VIII",
      description: "A potion made through Alchemy.",
      statValues: {StatType.luk: 24},
      consumableCategories: [ConsumableCategory.lukBoost],
      duration: 1800,
      buffSlots: {BuffSlot.lukPotion}),
  advancedLuckPotionX(
      formattedName: "Advanced Luck Potion X",
      description: "A potion made through Alchemy.",
      statValues: {StatType.luk: 30},
      consumableCategories: [ConsumableCategory.lukBoost],
      duration: 1800,
      buffSlots: {BuffSlot.lukPotion}),
  exceptionalLuckBoostPotion(
      formattedName: "Exceptional Luck Boost Potion",
      description:
          "A pungent alchemical concoction that increases LUK by 80 for 2 hours. Alchemists are able to stomach two at a time, but they are too strong for anyone else to drink more than one.",
      statValues: {StatType.luk: 80},
      consumableCategories: [ConsumableCategory.lukBoost],
      duration: 7200,
      buffSlots: {BuffSlot.alchemyPotion}),
  luckBoostPotion(
      formattedName: "Luck Boost Potion",
      description:
          "A pungent alchemical concoction that increases LUK by 40 for 2 hours. Alchemists are able to stomach two at a time, but they are too strong for anyone else to drink more than one.",
      statValues: {StatType.luk: 40},
      consumableCategories: [ConsumableCategory.lukBoost],
      duration: 7200,
      buffSlots: {BuffSlot.alchemyPotion}),
  luckPillI(
      formattedName: "Luck Pill I",
      description: "A pill made through Alchemy.",
      statValues: {StatType.luk: 3},
      consumableCategories: [ConsumableCategory.lukBoost],
      duration: 900,
      buffSlots: {BuffSlot.lukPill}),
  luckPillII(
      formattedName: "Luck Pill II",
      description: "A pill made through Alchemy.",
      statValues: {StatType.luk: 6},
      consumableCategories: [ConsumableCategory.lukBoost],
      duration: 900,
      buffSlots: {BuffSlot.lukPill}),
  luckPillIII(
      formattedName: "Luck Pill III",
      description: "A pill made through Alchemy.",
      statValues: {StatType.luk: 9},
      consumableCategories: [ConsumableCategory.lukBoost],
      duration: 900,
      buffSlots: {BuffSlot.lukPill}),
  luckPillIV(
      formattedName: "Luck Pill IV",
      description: "A pill made through Alchemy.",
      statValues: {StatType.luk: 12},
      consumableCategories: [ConsumableCategory.lukBoost],
      duration: 900,
      buffSlots: {BuffSlot.lukPill}),
  luckPillIX(
      formattedName: "Luck Pill IX",
      description: "A pill made through Alchemy.",
      statValues: {StatType.dex: 27},
      consumableCategories: [ConsumableCategory.lukBoost],
      duration: 900,
      buffSlots: {BuffSlot.lukPill}),
  luckPillV(
      formattedName: "Luck Pill V",
      description: "A pill made through Alchemy.",
      statValues: {StatType.luk: 15},
      consumableCategories: [ConsumableCategory.lukBoost],
      duration: 900,
      buffSlots: {BuffSlot.lukPill}),
  luckPillVI(
      formattedName: "Luck Pill VI",
      description: "A pill made through Alchemy.",
      statValues: {StatType.luk: 18},
      consumableCategories: [ConsumableCategory.lukBoost],
      duration: 900,
      buffSlots: {BuffSlot.lukPill}),
  luckPillVII(
      formattedName: "Luck Pill VII",
      description: "A pill made through Alchemy.",
      statValues: {StatType.luk: 21},
      consumableCategories: [ConsumableCategory.lukBoost],
      duration: 900,
      buffSlots: {BuffSlot.lukPill}),
  luckPillVIII(
      formattedName: "Luck Pill VIII",
      description: "A pill made through Alchemy.",
      statValues: {StatType.luk: 24},
      consumableCategories: [ConsumableCategory.lukBoost],
      duration: 900,
      buffSlots: {BuffSlot.lukPill}),
  luckPillX(
      formattedName: "Luck Pill X",
      description: "A pill made through Alchemy.",
      statValues: {StatType.luk: 30},
      consumableCategories: [ConsumableCategory.lukBoost],
      duration: 900,
      buffSlots: {BuffSlot.lukPill}),
  luckPotionI(
      formattedName: "Luck Potion I",
      description: "A potion made through Alchemy.",
      statValues: {StatType.luk: 3},
      consumableCategories: [ConsumableCategory.lukBoost],
      duration: 900,
      buffSlots: {BuffSlot.lukPotion}),
  luckPotionII(
      formattedName: "Luck Potion II",
      description: "A potion made through Alchemy.",
      statValues: {StatType.luk: 6},
      consumableCategories: [ConsumableCategory.lukBoost],
      duration: 900,
      buffSlots: {BuffSlot.lukPotion}),
  luckPotionIII(
      formattedName: "Luck Potion III",
      description: "A potion made through Alchemy.",
      statValues: {StatType.luk: 9},
      consumableCategories: [ConsumableCategory.lukBoost],
      duration: 900,
      buffSlots: {BuffSlot.lukPotion}),
  luckPotionIV(
      formattedName: "Luck Potion IV",
      description: "A potion made through Alchemy.",
      statValues: {StatType.luk: 12},
      consumableCategories: [ConsumableCategory.lukBoost],
      duration: 900,
      buffSlots: {BuffSlot.lukPotion}),
  luckPotionIX(
      formattedName: "Luck Potion IX",
      description: "A potion made through Alchemy.",
      statValues: {StatType.luk: 27},
      consumableCategories: [ConsumableCategory.lukBoost],
      duration: 900,
      buffSlots: {BuffSlot.lukPotion}),
  luckPotionV(
      formattedName: "Luck Potion V",
      description: "A potion made through Alchemy.",
      statValues: {StatType.luk: 15},
      consumableCategories: [ConsumableCategory.lukBoost],
      duration: 900,
      buffSlots: {BuffSlot.lukPotion}),
  luckPotionVI(
      formattedName: "Luck Potion VI",
      description: "A potion made through Alchemy.",
      statValues: {StatType.luk: 18},
      consumableCategories: [ConsumableCategory.lukBoost],
      duration: 900,
      buffSlots: {BuffSlot.lukPotion}),
  luckPotionVII(
      formattedName: "Luck Potion VII",
      description: "A potion made through Alchemy.",
      statValues: {StatType.luk: 21},
      consumableCategories: [ConsumableCategory.lukBoost],
      duration: 900,
      buffSlots: {BuffSlot.lukPotion}),
  luckPotionVIII(
      formattedName: "Luck Potion VIII",
      description: "A potion made through Alchemy.",
      statValues: {StatType.luk: 24},
      consumableCategories: [ConsumableCategory.lukBoost],
      duration: 900,
      buffSlots: {BuffSlot.lukPotion}),
  luckPotionX(
      formattedName: "Luck Potion X",
      description: "A potion made through Alchemy.",
      statValues: {StatType.luk: 30},
      consumableCategories: [ConsumableCategory.lukBoost],
      duration: 900,
      buffSlots: {BuffSlot.lukPotion}),
  superiorLuckBoostPotion(
      formattedName: "Superior Luck Boost Potion",
      description:
          "A pungent alchemical concoction that increases LUK by 70 for 2 hours. Alchemists are able to stomach two at a time, but they are too strong for anyone else to drink more than one.",
      statValues: {StatType.luk: 70},
      consumableCategories: [ConsumableCategory.lukBoost],
      duration: 7200,
      buffSlots: {BuffSlot.alchemyPotion}),
  advancedIntelligenceBoostPotion(
      formattedName: "Advanced Intelligence Boost Potion",
      description:
          "A pungent alchemical concoction that increases INT by 60 for 2 hours. Alchemists are able to stomach two at a time, but they are too strong for anyone else to drink more than one.",
      statValues: {StatType.int: 60},
      consumableCategories: [ConsumableCategory.intBoost],
      duration: 7200,
      buffSlots: {BuffSlot.alchemyPotion}),
  advancedIntelligencePillI(
      formattedName: "Advanced Intelligence Pill I",
      description: "A pill made through Alchemy.",
      statValues: {StatType.int: 3},
      consumableCategories: [ConsumableCategory.intBoost],
      duration: 1800,
      buffSlots: {BuffSlot.intPill}),
  advancedIntelligencePillII(
      formattedName: "Advanced Intelligence Pill II",
      description: "A pill made through Alchemy.",
      statValues: {StatType.int: 6},
      consumableCategories: [ConsumableCategory.intBoost],
      duration: 1800,
      buffSlots: {BuffSlot.intPill}),
  advancedIntelligencePillIII(
      formattedName: "Advanced Intelligence Pill III",
      description: "A pill made through Alchemy.",
      statValues: {StatType.int: 9},
      consumableCategories: [ConsumableCategory.intBoost],
      duration: 1800,
      buffSlots: {BuffSlot.intPill}),
  advancedIntelligencePillIV(
      formattedName: "Advanced Intelligence Pill IV",
      description: "A pill made through Alchemy.",
      statValues: {StatType.int: 12},
      consumableCategories: [ConsumableCategory.intBoost],
      duration: 1800,
      buffSlots: {BuffSlot.intPill}),
  advancedIntelligencePillIX(
      formattedName: "Advanced Intelligence Pill IX",
      description: "A pill made through Alchemy.",
      statValues: {StatType.int: 27},
      consumableCategories: [ConsumableCategory.intBoost],
      duration: 1800,
      buffSlots: {BuffSlot.intPill}),
  advancedIntelligencePillV(
      formattedName: "Advanced Intelligence Pill V",
      description: "A pill made through Alchemy.",
      statValues: {StatType.int: 15},
      consumableCategories: [ConsumableCategory.intBoost],
      duration: 1800,
      buffSlots: {BuffSlot.intPill}),
  advancedIntelligencePillVI(
      formattedName: "Advanced Intelligence Pill VI",
      description: "A pill made through Alchemy.",
      statValues: {StatType.int: 18},
      consumableCategories: [ConsumableCategory.intBoost],
      duration: 1800,
      buffSlots: {BuffSlot.intPill}),
  advancedIntelligencePillVII(
      formattedName: "Advanced Intelligence Pill VII",
      description: "A pill made through Alchemy.",
      statValues: {StatType.int: 21},
      consumableCategories: [ConsumableCategory.intBoost],
      duration: 1800,
      buffSlots: {BuffSlot.intPill}),
  advancedIntelligencePillVIII(
      formattedName: "Advanced Intelligence Pill VIII",
      description: "A pill made through Alchemy.",
      statValues: {StatType.int: 24},
      consumableCategories: [ConsumableCategory.intBoost],
      duration: 1800,
      buffSlots: {BuffSlot.intPill}),
  advancedIntelligencePillX(
      formattedName: "Advanced Intelligence Pill X",
      description: "A pill made through Alchemy.",
      statValues: {StatType.int: 30},
      consumableCategories: [ConsumableCategory.intBoost],
      duration: 1800,
      buffSlots: {BuffSlot.intPill}),
  advancedIntelligencePotionI(
      formattedName: "Advanced Intelligence Potion I",
      description: "A potion made through Alchemy.",
      statValues: {StatType.int: 3},
      consumableCategories: [ConsumableCategory.intBoost],
      duration: 1800,
      buffSlots: {BuffSlot.intPotion}),
  advancedIntelligencePotionII(
      formattedName: "Advanced Intelligence Potion II",
      description: "A potion made through Alchemy.",
      statValues: {StatType.int: 6},
      consumableCategories: [ConsumableCategory.intBoost],
      duration: 1800,
      buffSlots: {BuffSlot.intPotion}),
  advancedIntelligencePotionIII(
      formattedName: "Advanced Intelligence Potion III",
      description: "A potion made through Alchemy.",
      statValues: {StatType.int: 9},
      consumableCategories: [ConsumableCategory.intBoost],
      duration: 1800,
      buffSlots: {BuffSlot.intPotion}),
  advancedIntelligencePotionIV(
      formattedName: "Advanced Intelligence Potion IV",
      description: "A potion made through Alchemy.",
      statValues: {StatType.int: 12},
      consumableCategories: [ConsumableCategory.intBoost],
      duration: 1800,
      buffSlots: {BuffSlot.intPotion}),
  advancedIntelligencePotionIX(
      formattedName: "Advanced Intelligence Potion IX",
      description: "A potion made through Alchemy.",
      statValues: {StatType.int: 27},
      consumableCategories: [ConsumableCategory.intBoost],
      duration: 1800,
      buffSlots: {BuffSlot.intPotion}),
  advancedIntelligencePotionV(
      formattedName: "Advanced Intelligence Potion V",
      description: "A potion made through Alchemy.",
      statValues: {StatType.int: 15},
      consumableCategories: [ConsumableCategory.intBoost],
      duration: 1800,
      buffSlots: {BuffSlot.intPotion}),
  advancedIntelligencePotionVI(
      formattedName: "Advanced Intelligence Potion VI",
      description: "A potion made through Alchemy.",
      statValues: {StatType.int: 18},
      consumableCategories: [ConsumableCategory.intBoost],
      duration: 1800,
      buffSlots: {BuffSlot.intPotion}),
  advancedIntelligencePotionVII(
      formattedName: "Advanced Intelligence Potion VII",
      description: "A potion made through Alchemy.",
      statValues: {StatType.int: 21},
      consumableCategories: [ConsumableCategory.intBoost],
      duration: 1800,
      buffSlots: {BuffSlot.intPotion}),
  advancedIntelligencePotionVIII(
      formattedName: "Advanced Intelligence Potion VIII",
      description: "A potion made through Alchemy.",
      statValues: {StatType.int: 24},
      consumableCategories: [ConsumableCategory.intBoost],
      duration: 1800,
      buffSlots: {BuffSlot.intPotion}),
  advancedIntelligencePotionX(
      formattedName: "Advanced Intelligence Potion X",
      description: "A potion made through Alchemy.",
      statValues: {StatType.int: 30},
      consumableCategories: [ConsumableCategory.intBoost],
      duration: 1800,
      buffSlots: {BuffSlot.intPotion}),
  exceptionalIntelligenceBoostPotion(
      formattedName: "Exceptional Intelligence Boost Potion",
      description:
          "A pungent alchemical concoction that increases INT by 80 for 2 hours. Alchemists are able to stomach two at a time, but they are too strong for anyone else to drink more than one.",
      statValues: {StatType.int: 80},
      consumableCategories: [ConsumableCategory.intBoost],
      duration: 7200,
      buffSlots: {BuffSlot.alchemyPotion}),
  intelligenceBoostPotion(
      formattedName: "Intelligence Boost Potion",
      description:
          "A pungent alchemical concoction that increases INT by 40 for 2 hours. Alchemists are able to stomach two at a time, but they are too strong for anyone else to drink more than one.",
      statValues: {StatType.int: 40},
      consumableCategories: [ConsumableCategory.intBoost],
      duration: 7200,
      buffSlots: {BuffSlot.alchemyPotion}),
  intelligencePillI(
      formattedName: "Intelligence Pill I",
      description: "A pill made through Alchemy.",
      statValues: {StatType.int: 3},
      consumableCategories: [ConsumableCategory.intBoost],
      duration: 900,
      buffSlots: {BuffSlot.intPill}),
  intelligencePillII(
      formattedName: "Intelligence Pill II",
      description: "A pill made through Alchemy.",
      statValues: {StatType.int: 6},
      consumableCategories: [ConsumableCategory.intBoost],
      duration: 900,
      buffSlots: {BuffSlot.intPill}),
  intelligencePillIII(
      formattedName: "Intelligence Pill III",
      description: "A pill made through Alchemy.",
      statValues: {StatType.int: 9},
      consumableCategories: [ConsumableCategory.intBoost],
      duration: 900,
      buffSlots: {BuffSlot.intPill}),
  intelligencePillIV(
      formattedName: "Intelligence Pill IV",
      description: "A pill made through Alchemy.",
      statValues: {StatType.int: 12},
      consumableCategories: [ConsumableCategory.intBoost],
      duration: 900,
      buffSlots: {BuffSlot.intPill}),
  intelligencePillIX(
      formattedName: "Intelligence Pill IX",
      description: "A pill made through Alchemy.",
      statValues: {StatType.int: 27},
      consumableCategories: [ConsumableCategory.intBoost],
      duration: 900,
      buffSlots: {BuffSlot.intPill}),
  intelligencePillV(
      formattedName: "Intelligence Pill V",
      description: "A pill made through Alchemy.",
      statValues: {StatType.int: 15},
      consumableCategories: [ConsumableCategory.intBoost],
      duration: 900,
      buffSlots: {BuffSlot.intPill}),
  intelligencePillVI(
      formattedName: "Intelligence Pill VI",
      description: "A pill made through Alchemy.",
      statValues: {StatType.int: 18},
      consumableCategories: [ConsumableCategory.intBoost],
      duration: 900,
      buffSlots: {BuffSlot.intPill}),
  intelligencePillVII(
      formattedName: "Intelligence Pill VII",
      description: "A pill made through Alchemy.",
      statValues: {StatType.int: 21},
      consumableCategories: [ConsumableCategory.intBoost],
      duration: 900,
      buffSlots: {BuffSlot.intPill}),
  intelligencePillVIII(
      formattedName: "Intelligence Pill VIII",
      description: "A pill made through Alchemy.",
      statValues: {StatType.int: 24},
      consumableCategories: [ConsumableCategory.intBoost],
      duration: 900,
      buffSlots: {BuffSlot.intPill}),
  intelligencePillX(
      formattedName: "Intelligence Pill X",
      description: "A pill made through Alchemy.",
      statValues: {StatType.int: 30},
      consumableCategories: [ConsumableCategory.intBoost],
      duration: 900,
      buffSlots: {BuffSlot.intPill}),
  intelligencePotionI(
      formattedName: "Intelligence Potion I",
      description: "A potion made through Alchemy.",
      statValues: {StatType.int: 3},
      consumableCategories: [ConsumableCategory.intBoost],
      duration: 900,
      buffSlots: {BuffSlot.intPotion}),
  intelligencePotionII(
      formattedName: "Intelligence Potion II",
      description: "A potion made through Alchemy.",
      statValues: {StatType.int: 6},
      consumableCategories: [ConsumableCategory.intBoost],
      duration: 900,
      buffSlots: {BuffSlot.intPotion}),
  intelligencePotionIII(
      formattedName: "Intelligence Potion III",
      description: "A potion made through Alchemy.",
      statValues: {StatType.int: 9},
      consumableCategories: [ConsumableCategory.intBoost],
      duration: 900,
      buffSlots: {BuffSlot.intPotion}),
  intelligencePotionIV(
      formattedName: "Intelligence Potion IV",
      description: "A potion made through Alchemy.",
      statValues: {StatType.int: 12},
      consumableCategories: [ConsumableCategory.intBoost],
      duration: 900,
      buffSlots: {BuffSlot.intPotion}),
  intelligencePotionIX(
      formattedName: "Intelligence Potion IX",
      description: "A potion made through Alchemy.",
      statValues: {StatType.int: 27},
      consumableCategories: [ConsumableCategory.intBoost],
      duration: 900,
      buffSlots: {BuffSlot.intPotion}),
  intelligencePotionV(
      formattedName: "Intelligence Potion V",
      description: "A potion made through Alchemy.",
      statValues: {StatType.int: 15},
      consumableCategories: [ConsumableCategory.intBoost],
      duration: 900,
      buffSlots: {BuffSlot.intPotion}),
  intelligencePotionVI(
      formattedName: "Intelligence Potion VI",
      description: "A potion made through Alchemy.",
      statValues: {StatType.int: 18},
      consumableCategories: [ConsumableCategory.intBoost],
      duration: 900,
      buffSlots: {BuffSlot.intPotion}),
  intelligencePotionVII(
      formattedName: "Intelligence Potion VII",
      description: "A potion made through Alchemy.",
      statValues: {StatType.int: 21},
      consumableCategories: [ConsumableCategory.intBoost],
      duration: 900,
      buffSlots: {BuffSlot.intPotion}),
  intelligencePotionVIII(
      formattedName: "Intelligence Potion VIII",
      description: "A potion made through Alchemy.",
      statValues: {StatType.int: 24},
      consumableCategories: [ConsumableCategory.intBoost],
      duration: 900,
      buffSlots: {BuffSlot.intPotion}),
  intelligencePotionX(
      formattedName: "Intelligence Potion X",
      description: "A potion made through Alchemy.",
      statValues: {StatType.int: 30},
      consumableCategories: [ConsumableCategory.intBoost],
      duration: 900,
      buffSlots: {BuffSlot.intPotion}),
  superiorIntelligenceBoostPotion(
      formattedName: "Superior Intelligence Boost Potion",
      description:
          "A pungent alchemical concoction that increases INT by 70 for 2 hours. Alchemists are able to stomach two at a time, but they are too strong for anyone else to drink more than one.",
      statValues: {StatType.int: 70},
      consumableCategories: [ConsumableCategory.intBoost],
      duration: 7200,
      buffSlots: {BuffSlot.alchemyPotion}),
  advancedDexterityBoostPotion(
      formattedName: "Advanced Dexterity Boost Potion",
      description:
          "A pungent alchemical concoction that increases DEX by 60 for 2 hours. Alchemists are able to stomach two at a time, but they are too strong for anyone else to drink more than one.",
      statValues: {StatType.dex: 60},
      consumableCategories: [ConsumableCategory.dexBoost],
      duration: 7200,
      buffSlots: {BuffSlot.alchemyPotion}),
  advancedDexterityPillI(
      formattedName: "Advanced Dexterity Pill I",
      description: "A pill made through Alchemy.",
      statValues: {StatType.dex: 3},
      consumableCategories: [ConsumableCategory.dexBoost],
      duration: 1800,
      buffSlots: {BuffSlot.dexPill}),
  advancedDexterityPillII(
      formattedName: "Advanced Dexterity Pill II",
      description: "A pill made through Alchemy.",
      statValues: {StatType.dex: 6},
      consumableCategories: [ConsumableCategory.dexBoost],
      duration: 1800,
      buffSlots: {BuffSlot.dexPill}),
  advancedDexterityPillIII(
      formattedName: "Advanced Dexterity Pill III",
      description: "A pill made through Alchemy.",
      statValues: {StatType.dex: 9},
      consumableCategories: [ConsumableCategory.dexBoost],
      duration: 1800,
      buffSlots: {BuffSlot.dexPill}),
  advancedDexterityPillIV(
      formattedName: "Advanced Dexterity Pill IV",
      description: "A pill made through Alchemy.",
      statValues: {StatType.dex: 12},
      consumableCategories: [ConsumableCategory.dexBoost],
      duration: 1800,
      buffSlots: {BuffSlot.dexPill}),
  advancedDexterityPillIX(
      formattedName: "Advanced Dexterity Pill IX",
      description: "A pill made through Alchemy.",
      statValues: {StatType.dex: 27},
      consumableCategories: [ConsumableCategory.dexBoost],
      duration: 1800,
      buffSlots: {BuffSlot.dexPill}),
  advancedDexterityPillV(
      formattedName: "Advanced Dexterity Pill V",
      description: "A pill made through Alchemy.",
      statValues: {StatType.dex: 15},
      consumableCategories: [ConsumableCategory.dexBoost],
      duration: 1800,
      buffSlots: {BuffSlot.dexPill}),
  advancedDexterityPillVI(
      formattedName: "Advanced Dexterity Pill VI",
      description: "A pill made through Alchemy.",
      statValues: {StatType.dex: 18},
      consumableCategories: [ConsumableCategory.dexBoost],
      duration: 1800,
      buffSlots: {BuffSlot.dexPill}),
  advancedDexterityPillVII(
      formattedName: "Advanced Dexterity Pill VII",
      description: "A pill made through Alchemy.",
      statValues: {StatType.dex: 21},
      consumableCategories: [ConsumableCategory.dexBoost],
      duration: 1800,
      buffSlots: {BuffSlot.dexPill}),
  advancedDexterityPillVIII(
      formattedName: "Advanced Dexterity Pill VIII",
      description: "A pill made through Alchemy.",
      statValues: {StatType.dex: 24},
      consumableCategories: [ConsumableCategory.dexBoost],
      duration: 1800,
      buffSlots: {BuffSlot.dexPill}),
  advancedDexterityPillX(
      formattedName: "Advanced Dexterity Pill X",
      description: "A pill made through Alchemy.",
      statValues: {StatType.dex: 30},
      consumableCategories: [ConsumableCategory.dexBoost],
      duration: 1800,
      buffSlots: {BuffSlot.dexPill}),
  advancedDexterityPotionI(
      formattedName: "Advanced Dexterity Potion I",
      description: "A potion made through Alchemy.",
      statValues: {StatType.dex: 3},
      consumableCategories: [ConsumableCategory.dexBoost],
      duration: 1800,
      buffSlots: {BuffSlot.dexPotion}),
  advancedDexterityPotionII(
      formattedName: "Advanced Dexterity Potion II",
      description: "A potion made through Alchemy.",
      statValues: {StatType.dex: 6},
      consumableCategories: [ConsumableCategory.dexBoost],
      duration: 1800,
      buffSlots: {BuffSlot.dexPotion}),
  advancedDexterityPotionIII(
      formattedName: "Advanced Dexterity Potion III",
      description: "A potion made through Alchemy.",
      statValues: {StatType.dex: 9},
      consumableCategories: [ConsumableCategory.dexBoost],
      duration: 1800,
      buffSlots: {BuffSlot.dexPotion}),
  advancedDexterityPotionIV(
      formattedName: "Advanced Dexterity Potion IV",
      description: "A potion made through Alchemy.",
      statValues: {StatType.dex: 12},
      consumableCategories: [ConsumableCategory.dexBoost],
      duration: 1800,
      buffSlots: {BuffSlot.dexPotion}),
  advancedDexterityPotionIX(
      formattedName: "Advanced Dexterity Potion IX",
      description: "A potion made through Alchemy.",
      statValues: {StatType.dex: 27},
      consumableCategories: [ConsumableCategory.dexBoost],
      duration: 1800,
      buffSlots: {BuffSlot.dexPotion}),
  advancedDexterityPotionV(
      formattedName: "Advanced Dexterity Potion V",
      description: "A potion made through Alchemy.",
      statValues: {StatType.dex: 15},
      consumableCategories: [ConsumableCategory.dexBoost],
      duration: 1800,
      buffSlots: {BuffSlot.dexPotion}),
  advancedDexterityPotionVI(
      formattedName: "Advanced Dexterity Potion VI",
      description: "A potion made through Alchemy.",
      statValues: {StatType.dex: 18},
      consumableCategories: [ConsumableCategory.dexBoost],
      duration: 1800,
      buffSlots: {BuffSlot.dexPotion}),
  advancedDexterityPotionVII(
      formattedName: "Advanced Dexterity Potion VII",
      description: "A potion made through Alchemy.",
      statValues: {StatType.dex: 21},
      consumableCategories: [ConsumableCategory.dexBoost],
      duration: 1800,
      buffSlots: {}),
  advancedDexterityPotionVIII(
      formattedName: "Advanced Dexterity Potion VIII",
      description: "A potion made through Alchemy.",
      statValues: {StatType.dex: 24},
      consumableCategories: [ConsumableCategory.dexBoost],
      duration: 1800,
      buffSlots: {BuffSlot.dexPotion}),
  advancedDexterityPotionX(
      formattedName: "Advanced Dexterity Potion X",
      description: "A potion made through Alchemy.",
      statValues: {StatType.dex: 30},
      consumableCategories: [ConsumableCategory.dexBoost],
      duration: 1800,
      buffSlots: {BuffSlot.dexPotion}),
  dexterityBoostPotion(
      formattedName: "Dexterity Boost Potion",
      description:
          "A pungent alchemical concoction that increases DEX by 40 for 2 hours. Alchemists are able to stomach two at a time, but they are too strong for anyone else to drink more than one.",
      statValues: {StatType.dex: 40},
      consumableCategories: [ConsumableCategory.dexBoost],
      duration: 7200,
      buffSlots: {BuffSlot.alchemyPotion}),
  dexterityPill(
      formattedName: "Dexterity Pill",
      description: "Enhances your skills as a sniper.",
      statValues: {StatType.dex: 10},
      consumableCategories: [
        ConsumableCategory.dexBoost
      ],
      duration: 600,
      buffSlots: {BuffSlot.dexPill}),
  dexterityPillI(
      formattedName: "Dexterity Pill I",
      description: "A pill made through Alchemy.",
      statValues: {StatType.dex: 3},
      consumableCategories: [ConsumableCategory.dexBoost],
      duration: 900,
      buffSlots: {BuffSlot.dexPill}),
  dexterityPillII(
      formattedName: "Dexterity Pill II",
      description: "A pill made through Alchemy.",
      statValues: {StatType.dex: 6},
      consumableCategories: [ConsumableCategory.dexBoost],
      duration: 900,
      buffSlots: {BuffSlot.dexPill}),
  dexterityPillIII(
      formattedName: "Dexterity Pill III",
      description: "A pill made through Alchemy.",
      statValues: {StatType.dex: 9},
      consumableCategories: [ConsumableCategory.dexBoost],
      duration: 900,
      buffSlots: {BuffSlot.dexPill}),
  dexterityPillIV(
      formattedName: "Dexterity Pill IV",
      description: "A pill made through Alchemy.",
      statValues: {StatType.dex: 12},
      consumableCategories: [ConsumableCategory.dexBoost],
      duration: 900,
      buffSlots: {BuffSlot.dexPill}),
  dexterityPillIX(
      formattedName: "Dexterity Pill IX",
      description: "A pill made through Alchemy.",
      statValues: {StatType.dex: 27},
      consumableCategories: [ConsumableCategory.dexBoost],
      duration: 900,
      buffSlots: {BuffSlot.dexPill}),
  dexterityPillV(
      formattedName: "Dexterity Pill V",
      description: "A pill made through Alchemy.",
      statValues: {StatType.dex: 15},
      consumableCategories: [ConsumableCategory.dexBoost],
      duration: 900,
      buffSlots: {BuffSlot.dexPill}),
  dexterityPillVI(
      formattedName: "Dexterity Pill VI",
      description: "A pill made through Alchemy.",
      statValues: {StatType.dex: 18},
      consumableCategories: [ConsumableCategory.dexBoost],
      duration: 900,
      buffSlots: {BuffSlot.dexPill}),
  dexterityPillVII(
      formattedName: "Dexterity Pill VII",
      description: "A pill made through Alchemy.",
      statValues: {StatType.dex: 21},
      consumableCategories: [ConsumableCategory.dexBoost],
      duration: 900,
      buffSlots: {BuffSlot.dexPill}),
  dexterityPillVIII(
      formattedName: "Dexterity Pill VIII",
      description: "A pill made through Alchemy.",
      statValues: {StatType.dex: 24},
      consumableCategories: [ConsumableCategory.dexBoost],
      duration: 900,
      buffSlots: {BuffSlot.dexPill}),
  dexterityPillX(
      formattedName: "Dexterity Pill X",
      description: "A pill made through Alchemy.",
      statValues: {StatType.dex: 30},
      consumableCategories: [ConsumableCategory.dexBoost],
      duration: 900,
      buffSlots: {BuffSlot.dexPill}),
  dexterityPotion(
      formattedName: "Dexterity Potion",
      description: "Gives you a burst of speed.",
      statValues: {StatType.dex: 5},
      consumableCategories: [
        ConsumableCategory.dexBoost,
        ConsumableCategory.dexBoost
      ],
      duration: 180,
      buffSlots: {BuffSlot.dexPotion}),
  dexterityPotionI(
      formattedName: "Dexterity Potion I",
      description: "A potion made through Alchemy.",
      statValues: {StatType.dex: 3},
      consumableCategories: [ConsumableCategory.dexBoost],
      duration: 900,
      buffSlots: {BuffSlot.dexPotion}),
  dexterityPotionII(
      formattedName: "Dexterity Potion II",
      description: "A potion made through Alchemy.",
      statValues: {StatType.dex: 6},
      consumableCategories: [ConsumableCategory.dexBoost],
      duration: 900,
      buffSlots: {BuffSlot.dexPotion}),
  dexterityPotionIII(
      formattedName: "Dexterity Potion III",
      description: "A potion made through Alchemy.",
      statValues: {StatType.dex: 9},
      consumableCategories: [ConsumableCategory.dexBoost],
      duration: 900,
      buffSlots: {BuffSlot.dexPotion}),
  dexterityPotionIV(
      formattedName: "Dexterity Potion IV",
      description: "A potion made through Alchemy.",
      statValues: {StatType.dex: 12},
      consumableCategories: [ConsumableCategory.dexBoost],
      duration: 900,
      buffSlots: {BuffSlot.dexPotion}),
  dexterityPotionIX(
      formattedName: "Dexterity Potion IX",
      description: "A potion made through Alchemy.",
      statValues: {StatType.dex: 27},
      consumableCategories: [ConsumableCategory.dexBoost],
      duration: 900,
      buffSlots: {BuffSlot.dexPotion}),
  dexterityPotionV(
      formattedName: "Dexterity Potion V",
      description: "A potion made through Alchemy.",
      statValues: {StatType.dex: 15},
      consumableCategories: [ConsumableCategory.dexBoost],
      duration: 900,
      buffSlots: {BuffSlot.dexPotion}),
  dexterityPotionVI(
      formattedName: "Dexterity Potion VI",
      description: "A potion made through Alchemy.",
      statValues: {StatType.dex: 18},
      consumableCategories: [ConsumableCategory.dexBoost],
      duration: 900,
      buffSlots: {BuffSlot.dexPotion}),
  dexterityPotionVII(
      formattedName: "Dexterity Potion VII",
      description: "A potion made through Alchemy.",
      statValues: {StatType.dex: 21},
      consumableCategories: [ConsumableCategory.dexBoost],
      duration: 900,
      buffSlots: {BuffSlot.dexPotion}),
  dexterityPotionVIII(
      formattedName: "Dexterity Potion VIII",
      description: "A potion made through Alchemy.",
      statValues: {StatType.dex: 24},
      consumableCategories: [ConsumableCategory.dexBoost],
      duration: 900,
      buffSlots: {BuffSlot.dexPotion}),
  dexterityPotionX(
      formattedName: "Dexterity Potion X",
      description: "A potion made through Alchemy.",
      statValues: {StatType.dex: 30},
      consumableCategories: [ConsumableCategory.dexBoost],
      duration: 900,
      buffSlots: {BuffSlot.dexPotion}),
  exceptionalDexterityBoostPotion(
      formattedName: "Exceptional Dexterity Boost Potion",
      description:
          "A pungent alchemical concoction that increases DEX by 80 for 2 hours. Alchemists are able to stomach two at a time, but they are too strong for anyone else to drink more than one.",
      statValues: {StatType.dex: 80},
      consumableCategories: [ConsumableCategory.dexBoost],
      duration: 7200,
      buffSlots: {BuffSlot.alchemyPotion}),
  fairysHoney(
      formattedName: "Fairy's Honey",
      description: "This honey is a fairy favorite.",
      statValues: {StatType.dex: 10},
      consumableCategories: [ConsumableCategory.dexBoost],
      duration: 300,
      buffSlots: {}),
  mindHeartMedicine(
      formattedName: "Mind & Heart Medicine",
      description:
          "Herbal medicine made from bear paws. Brings clarity to the mind.",
      statValues: {StatType.dex: 10},
      consumableCategories: [ConsumableCategory.dexBoost],
      duration: 900,
      buffSlots: {}),
  sniperPill(
      formattedName: "Sniper Pill",
      description: "Enhances your skills as a sniper.",
      statValues: {StatType.dex: 4, StatType.attack: 4},
      consumableCategories: [
        ConsumableCategory.dexBoost,
        ConsumableCategory.dexBoost,
        ConsumableCategory.attackBoost,
        ConsumableCategory.attackBoost
      ],
      duration: 600,
      buffSlots: {}),
  sniperPotion(
      formattedName: "Sniper Potion",
      description: "Makes you more dexterous for a time.",
      statValues: {StatType.dex: 2, StatType.attack: 2},
      consumableCategories: [
        ConsumableCategory.dexBoost,
        ConsumableCategory.dexBoost,
        ConsumableCategory.attackBoost,
        ConsumableCategory.attackBoost
      ],
      duration: 300,
      buffSlots: {}),
  superiorDexterityBoostPotion(
      formattedName: "Superior Dexterity Boost Potion",
      description:
          "A pungent alchemical concoction that increases DEX by 70 for 2 hours. Alchemists are able to stomach two at a time, but they are too strong for anyone else to drink more than one.",
      statValues: {StatType.dex: 70},
      consumableCategories: [ConsumableCategory.dexBoost],
      duration: 7200,
      buffSlots: {BuffSlot.alchemyPotion}),
  bananaGrahamPie(
      formattedName: "Banana Graham Pie",
      description: "This scrumptious pie is sure to lighten your spirits!",
      statValues: {
        StatType.mattack: 120,
        StatType.speed: 10,
        StatType.jump: 10
      },
      consumableCategories: [
        ConsumableCategory.sppedBoost,
        ConsumableCategory.jumpBoost,
        ConsumableCategory.mattackBoost
      ],
      duration: 600,
      buffSlots: {}),
  geltChocolate(
      formattedName: "Gelt Chocolate",
      description:
          "A special piece of tasty chocolate given out at the Festival of Lights.",
      statValues: {
        StatType.attack: 120,
        StatType.defense: 30,
        StatType.speed: 10,
        StatType.jump: 10
      },
      consumableCategories: [
        ConsumableCategory.sppedBoost,
        ConsumableCategory.jumpBoost,
        ConsumableCategory.defenseBoost,
        ConsumableCategory.attackBoost
      ],
      duration: 600,
      buffSlots: {}),
  kuih(
      formattedName: "Kuih",
      description:
          "These sweet, bite-sized delights are a favorite pastry dish enjoyed during parties or while having tea.",
      statValues: {StatType.speed: 10},
      consumableCategories: [ConsumableCategory.sppedBoost],
      duration: 1800,
      buffSlots: {}),
  speedPill(
      formattedName: "Speed Pill",
      description: "A pill of concentrated speed potion.",
      statValues: {StatType.speed: 10},
      consumableCategories: [
        ConsumableCategory.sppedBoost,
        ConsumableCategory.sppedBoost
      ],
      duration: 600,
      buffSlots: {}),
  speedPotion(
      formattedName: "Speed Potion",
      description: "Increases speed.",
      statValues: {StatType.speed: 8},
      consumableCategories: [
        ConsumableCategory.sppedBoost,
        ConsumableCategory.sppedBoost
      ],
      duration: 180,
      buffSlots: {}),
  extremeGreenPotion(
      formattedName: "Extreme Green Potion",
      description: "A green potion from Monster Park.",
      statValues: {StatType.attackSpeed: 1},
      consumableCategories: [ConsumableCategory.attackSpeedBoost],
      duration: 1800,
      buffSlots: {}),
  exceptionalConcentrationPotion(
      formattedName: "Exceptional Concentration Potion",
      description:
          "A pungent alchemical concoction that increases Critical Rate by 10% for 2 hours. Alchemists are able to stomach two at a time, but they are too strong for anyone else to drink more than one.",
      statValues: {StatType.critRate: 0.1},
      consumableCategories: [ConsumableCategory.critRateBoost],
      duration: 7200,
      buffSlots: {BuffSlot.alchemyPotion}),
  intermediateConcentrationPotion(
      formattedName: "Intermediate Concentration Potion",
      description:
          "A pungent alchemical concoction that increases Critical Rate by 3% for 2 hours. Alchemists are able to stomach two at a time, but they are too strong for anyone else to drink more than one.",
      statValues: {StatType.critRate: 0.03},
      consumableCategories: [ConsumableCategory.critRateBoost],
      duration: 7200,
      buffSlots: {BuffSlot.alchemyPotion}),
  superiorConcentrationPotion(
      formattedName: "Superior Concentration Potion",
      description:
          "A pungent alchemical concoction that increases Critical Rate by 5% for 2 hours. Alchemists are able to stomach two at a time, but they are too strong for anyone else to drink more than one.",
      statValues: {StatType.critRate: 0.05},
      consumableCategories: [ConsumableCategory.critRateBoost],
      duration: 7200,
      buffSlots: {BuffSlot.alchemyPotion}),
  advancedBossRushBoostPotion(
      formattedName: "Advanced Boss Rush Boost Potion",
      description:
          "Alchemy Masters and Renowned Masters can make this potion that increases your boss damage by 20% for 40 minutes.Caution:Normally, only 1 Potion can be used at a time, but Alchemists can use 2 if they are of different kinds.",
      statValues: {StatType.bossDamage: 0.2},
      consumableCategories: [ConsumableCategory.bossDamageBoost],
      duration: 2400,
      buffSlots: {}),
  bossRushBoostPotion(
      formattedName: "Boss Rush Boost Potion",
      description:
          "Alchemy Masters and Renowned Masters can make this potion that increases your Boss damage by 10% for 40 minutes.Caution:Normally, only 1 Potion can be used at a time, but Alchemists can use 2 if they are of different types.",
      statValues: {StatType.bossDamage: 0.1},
      consumableCategories: [ConsumableCategory.bossDamageBoost],
      duration: 2400,
      buffSlots: {}),
  golluxRubyDominancePotion(
      formattedName: "Gollux Ruby Dominance Potion",
      description:
          "A legendary fairy potion containing red star fragments.Does not stack with other potions.Effects only work against Gollux.",
      statValues: {StatType.bossDamage: 0.2},
      consumableCategories: [ConsumableCategory.bossDamageBoost],
      duration: 3600,
      buffSlots: {}),
  redStarPotion(
      formattedName: "Red Star Potion",
      description:
          "A legendary fairy potion, containing red star fragments.Warning:Does not stack with other potions and Star Potions of different kind.Effects only work in the Root Abyss.",
      statValues: {StatType.bossDamage: 0.2},
      consumableCategories: [ConsumableCategory.bossDamageBoost],
      duration: 7200,
      buffSlots: {BuffSlot.starPotion}),
  sparklingRedStarPotion(
      formattedName: "Sparkling Red Star Potion",
      description:
          "A legendary fairy potion, containing sparkling red star fragments.Warning:Does not stack with other potions and Star Potions of different kind.",
      statValues: {StatType.bossDamage: 0.2},
      consumableCategories: [ConsumableCategory.bossDamageBoost],
      duration: 7200,
      buffSlots: {BuffSlot.starPotion}),
  advancedGreatHeroBoostPotion(
      formattedName: "Advanced Great Hero Boost Potion",
      description:
          "Alchemy Masters and Renowned Masters can make this potion that increases your damage by 10% for 40 minutes.Caution:Normally, only 1 Potion can be used at a time, but Alchemists can use 2 if they are of different kinds.",
      statValues: {StatType.damage: 0.1},
      consumableCategories: [ConsumableCategory.damageBoost],
      duration: 2400,
      buffSlots: {}),
  greatHeroBoostPotion(
      formattedName: "Great Hero Boost Potion",
      description:
          "Alchemy Masters and Renowned Masters can make this potion that increases your damage by 5% for 40 minutes. Caution:Normally, only 1 Potion can be used at a time, but Alchemists can use 2 if they are of different types.",
      statValues: {StatType.damage: 0.05},
      consumableCategories: [ConsumableCategory.damageBoost],
      duration: 2400,
      buffSlots: {}),
  advancedDefensePillI(
      formattedName: "Advanced Defense Pill I",
      description: "A pill made through Alchemy.",
      statValues: {StatType.defense: 50},
      consumableCategories: [ConsumableCategory.defenseBoost],
      duration: 1800,
      buffSlots: {}),
  advancedDefensePillII(
      formattedName: "Advanced Defense Pill II",
      description: "A pill made through Alchemy.",
      statValues: {StatType.defense: 70},
      consumableCategories: [ConsumableCategory.defenseBoost],
      duration: 1800,
      buffSlots: {}),
  advancedDefensePillIII(
      formattedName: "Advanced Defense Pill III",
      description: "A pill made through Alchemy.",
      statValues: {StatType.defense: 90},
      consumableCategories: [ConsumableCategory.defenseBoost],
      duration: 1800,
      buffSlots: {}),
  advancedDefensePillIV(
      formattedName: "Advanced Defense Pill IV",
      description: "A pill made through Alchemy.",
      statValues: {StatType.defense: 110},
      consumableCategories: [ConsumableCategory.defenseBoost],
      duration: 1800,
      buffSlots: {}),
  advancedDefensePillIX(
      formattedName: "Advanced Defense Pill IX",
      description: "A pill made through Alchemy.",
      statValues: {StatType.defense: 210},
      consumableCategories: [ConsumableCategory.defenseBoost],
      duration: 1800,
      buffSlots: {}),
  advancedDefensePillV(
      formattedName: "Advanced Defense Pill V",
      description: "A pill made through Alchemy.",
      statValues: {StatType.defense: 130},
      consumableCategories: [ConsumableCategory.defenseBoost],
      duration: 1800,
      buffSlots: {}),
  advancedDefensePillVI(
      formattedName: "Advanced Defense Pill VI",
      description: "A pill made through Alchemy.",
      statValues: {StatType.defense: 150},
      consumableCategories: [ConsumableCategory.defenseBoost],
      duration: 1800,
      buffSlots: {}),
  advancedDefensePillVII(
      formattedName: "Advanced Defense Pill VII",
      description: "A pill made through Alchemy.",
      statValues: {StatType.defense: 170},
      consumableCategories: [ConsumableCategory.defenseBoost],
      duration: 18000,
      buffSlots: {}),
  advancedDefensePillVIII(
      formattedName: "Advanced Defense Pill VIII",
      description: "A pill made through Alchemy.",
      statValues: {StatType.defense: 190},
      consumableCategories: [ConsumableCategory.defenseBoost],
      duration: 1800,
      buffSlots: {}),
  advancedDefensePillX(
      formattedName: "Advanced Defense Pill X",
      description: "A pill made through Alchemy.",
      statValues: {StatType.defense: 230},
      consumableCategories: [ConsumableCategory.defenseBoost],
      duration: 1800,
      buffSlots: {}),
  advancedDefensePotionI(
      formattedName: "Advanced Defense Potion I",
      description: "A potion made through Alchemy.",
      statValues: {StatType.defense: 50},
      consumableCategories: [ConsumableCategory.defenseBoost],
      duration: 1800,
      buffSlots: {}),
  advancedDefensePotionII(
      formattedName: "Advanced Defense Potion II",
      description: "A potion made through Alchemy.",
      statValues: {StatType.defense: 70},
      consumableCategories: [ConsumableCategory.defenseBoost],
      duration: 1800,
      buffSlots: {}),
  advancedDefensePotionIII(
      formattedName: "Advanced Defense Potion III",
      description: "A potion made through Alchemy.",
      statValues: {StatType.defense: 90},
      consumableCategories: [ConsumableCategory.defenseBoost],
      duration: 1800,
      buffSlots: {}),
  advancedDefensePotionIV(
      formattedName: "Advanced Defense Potion IV",
      description: "A potion made through Alchemy.",
      statValues: {StatType.defense: 110},
      consumableCategories: [ConsumableCategory.defenseBoost],
      duration: 1800,
      buffSlots: {}),
  advancedDefensePotionIX(
      formattedName: "Advanced Defense Potion IX",
      description: "A potion made through Alchemy.",
      statValues: {StatType.defense: 210},
      consumableCategories: [ConsumableCategory.defenseBoost],
      duration: 1800,
      buffSlots: {}),
  advancedDefensePotionV(
      formattedName: "Advanced Defense Potion V",
      description: "A potion made through Alchemy.",
      statValues: {StatType.defense: 130},
      consumableCategories: [ConsumableCategory.defenseBoost],
      duration: 1800,
      buffSlots: {}),
  advancedDefensePotionVI(
      formattedName: "Advanced Defense Potion VI",
      description: "A potion made through Alchemy.",
      statValues: {StatType.defense: 150},
      consumableCategories: [ConsumableCategory.defenseBoost],
      duration: 1800,
      buffSlots: {}),
  advancedDefensePotionVII(
      formattedName: "Advanced Defense Potion VII",
      description: "A potion made through Alchemy.",
      statValues: {StatType.defense: 170},
      consumableCategories: [ConsumableCategory.defenseBoost],
      duration: 1800,
      buffSlots: {}),
  advancedDefensePotionVIII(
      formattedName: "Advanced Defense Potion VIII",
      description: "A potion made through Alchemy.",
      statValues: {StatType.defense: 190},
      consumableCategories: [ConsumableCategory.defenseBoost],
      duration: 1800,
      buffSlots: {}),
  advancedDefensePotionX(
      formattedName: "Advanced Defense Potion X",
      description: "A potion made through Alchemy.",
      statValues: {StatType.defense: 230},
      consumableCategories: [ConsumableCategory.defenseBoost],
      duration: 1800,
      buffSlots: {}),
  defensePillI(
      formattedName: "Defense Pill I",
      description: "A pill made through Alchemy.",
      statValues: {StatType.defense: 50},
      consumableCategories: [ConsumableCategory.defenseBoost],
      duration: 900,
      buffSlots: {}),
  defensePillII(
      formattedName: "Defense Pill II",
      description: "A pill made through Alchemy.",
      statValues: {StatType.defense: 70},
      consumableCategories: [ConsumableCategory.defenseBoost],
      duration: 900,
      buffSlots: {}),
  defensePillIII(
      formattedName: "Defense Pill III",
      description: "A pill made through Alchemy.",
      statValues: {StatType.defense: 90},
      consumableCategories: [ConsumableCategory.defenseBoost],
      duration: 900,
      buffSlots: {}),
  defensePillIV(
      formattedName: "Defense Pill IV",
      description: "A pill made through Alchemy.",
      statValues: {StatType.defense: 110},
      consumableCategories: [ConsumableCategory.defenseBoost],
      duration: 900,
      buffSlots: {}),
  defensePillIX(
      formattedName: "Defense Pill IX",
      description: "A pill made through Alchemy.",
      statValues: {StatType.defense: 210},
      consumableCategories: [ConsumableCategory.defenseBoost],
      duration: 900,
      buffSlots: {}),
  defensePillV(
      formattedName: "Defense Pill V",
      description: "A pill made through Alchemy.",
      statValues: {StatType.defense: 130},
      consumableCategories: [ConsumableCategory.defenseBoost],
      duration: 900,
      buffSlots: {}),
  defensePillVI(
      formattedName: "Defense Pill VI",
      description: "A pill made through Alchemy.",
      statValues: {StatType.defense: 150},
      consumableCategories: [ConsumableCategory.defenseBoost],
      duration: 900,
      buffSlots: {}),
  defensePillVII(
      formattedName: "Defense Pill VII",
      description: "A pill made through Alchemy.",
      statValues: {StatType.defense: 170},
      consumableCategories: [ConsumableCategory.defenseBoost],
      duration: 900,
      buffSlots: {}),
  defensePillVIII(
      formattedName: "Defense Pill VIII",
      description: "A pill made through Alchemy.",
      statValues: {StatType.defense: 190},
      consumableCategories: [ConsumableCategory.defenseBoost],
      duration: 900,
      buffSlots: {}),
  defensePillX(
      formattedName: "Defense Pill X",
      description: "A pill made through Alchemy.",
      statValues: {StatType.defense: 230},
      consumableCategories: [ConsumableCategory.defenseBoost],
      duration: 900,
      buffSlots: {}),
  defensePotionI(
      formattedName: "Defense Potion I",
      description: "A potion made through Alchemy.",
      statValues: {StatType.defense: 50},
      consumableCategories: [ConsumableCategory.defenseBoost],
      duration: 900,
      buffSlots: {}),
  defensePotionII(
      formattedName: "Defense Potion II",
      description: "A potion made through Alchemy.",
      statValues: {StatType.defense: 70},
      consumableCategories: [ConsumableCategory.defenseBoost],
      duration: 900,
      buffSlots: {}),
  defensePotionIII(
      formattedName: "Defense Potion III",
      description: "A potion made through Alchemy.",
      statValues: {StatType.defense: 90},
      consumableCategories: [ConsumableCategory.defenseBoost],
      duration: 900,
      buffSlots: {}),
  defensePotionIV(
      formattedName: "Defense Potion IV",
      description: "A potion made through Alchemy.",
      statValues: {StatType.defense: 110},
      consumableCategories: [ConsumableCategory.defenseBoost],
      duration: 900,
      buffSlots: {}),
  defensePotionIX(
      formattedName: "Defense Potion IX",
      description: "A potion made through Alchemy.",
      statValues: {StatType.defense: 210},
      consumableCategories: [ConsumableCategory.defenseBoost],
      duration: 900,
      buffSlots: {}),
  defensePotionV(
      formattedName: "Defense Potion V",
      description: "A potion made through Alchemy.",
      statValues: {StatType.defense: 130},
      consumableCategories: [ConsumableCategory.defenseBoost],
      duration: 900,
      buffSlots: {}),
  defensePotionVI(
      formattedName: "Defense Potion VI",
      description: "A potion made through Alchemy.",
      statValues: {StatType.defense: 150},
      consumableCategories: [ConsumableCategory.defenseBoost],
      duration: 900,
      buffSlots: {}),
  defensePotionVII(
      formattedName: "Defense Potion VII",
      description: "A potion made through Alchemy.",
      statValues: {StatType.defense: 170},
      consumableCategories: [ConsumableCategory.defenseBoost],
      duration: 900,
      buffSlots: {}),
  defensePotionVIII(
      formattedName: "Defense Potion VIII",
      description: "A potion made through Alchemy.",
      statValues: {StatType.defense: 190},
      consumableCategories: [ConsumableCategory.defenseBoost],
      duration: 900,
      buffSlots: {}),
  defensePotionX(
      formattedName: "Defense Potion X",
      description: "A potion made through Alchemy.",
      statValues: {StatType.defense: 230},
      consumableCategories: [ConsumableCategory.defenseBoost],
      duration: 900,
      buffSlots: {}),
  drakesMeat(
      formattedName: "Drake's Meat",
      description: "Yummy drake meat.",
      statValues: {StatType.defense: 100},
      consumableCategories: [ConsumableCategory.defenseBoost],
      duration: 300,
      buffSlots: {}),
  onyxApple(
      formattedName: "Onyx Apple",
      description: "A rare, ripe apple imbued with power.",
      statValues: {
        StatType.defense: 20,
        StatType.attack: 100,
        StatType.mattack: 100
      },
      consumableCategories: [
        ConsumableCategory.defenseBoost,
        ConsumableCategory.defenseBoost,
        ConsumableCategory.defenseBoost,
        ConsumableCategory.attackBoost,
        ConsumableCategory.attackBoost,
        ConsumableCategory.attackBoost,
        ConsumableCategory.mattackBoost,
        ConsumableCategory.mattackBoost,
        ConsumableCategory.mattackBoost
      ],
      duration: 600,
      buffSlots: {}),
  painReliever(
      formattedName: "Pain Reliever",
      description: "A special pain reliever from Omega Sector.",
      statValues: {StatType.defense: 300},
      consumableCategories: [ConsumableCategory.defenseBoost],
      duration: 1800,
      buffSlots: {}),
  unripeOnyxApple(
      formattedName: "Unripe Onyx Apple",
      description: "A mysterious and unripe Onyx Apple.",
      statValues: {
        StatType.attack: 60,
        StatType.mattack: 70,
        StatType.defense: 10
      },
      consumableCategories: [
        ConsumableCategory.defenseBoost,
        ConsumableCategory.mattackBoost,
        ConsumableCategory.attackBoost
      ],
      duration: 60,
      buffSlots: {}),
  wealthAcquisitionPotion(
      formattedName: "Wealth Acquisition Potion",
      description:
          "A pungent alchemical concoction that increases item and Meso drop rates by 20% for 2 hours. The Wealth Acquisition Potion is not limited by the item drop rate increase or max Meso acquisition increase. Alchemists are able to stomach two potions at a time, but they are too strong for anyone else to drink more than one.",
      statValues: {StatType.itemDropRate: 0.2, StatType.mesosObtained: 0.2},
      consumableCategories: [
        ConsumableCategory.mesosObtainedBoost,
        ConsumableCategory.itemDropRateBoost
      ],
      duration: 7200,
      buffSlots: {BuffSlot.alchemyPotion, BuffSlot.wealthAcquisitionPotion}),
  smallWealthAcquisitionPotion(
      formattedName: "Small Wealth Acquisition Potion",
      description:
          "A pungent alchemical concoction that increases item and Meso drop rates by 20% for 30 minutes. The Small Wealth Acquisition Potion is not limited by the item drop rate increase or max Meso acquisition increase. Alchemists are able to stomach two potions at a time, but they are too strong for anyone else to drink more than one.",
      statValues: {StatType.itemDropRate: 0.2, StatType.mesosObtained: 0.2},
      consumableCategories: [
        ConsumableCategory.mesosObtainedBoost,
        ConsumableCategory.itemDropRateBoost
      ],
      duration: 1800,
      buffSlots: {BuffSlot.alchemyPotion, BuffSlot.wealthAcquisitionPotion}),
  advancedPenetratingBoostPotion(
      formattedName: "Advanced Penetrating Boost Potion",
      description:
          "Alchemy Meisters can make this potion, which increases your Ignore Defense by 20% for 40 minutes.Caution:Normally, only 1 Potion can be used at a time, but Alchemists can use 2 if they are of different types.However, even Alchemists cannot use 2 of the same Potions at once, and Boss Rush's Boost Potions, Great Hero Boost Potions, and Great Blessing Potions cannot be used together. The cooldown is 50 minutes.",
      statValues: {StatType.ignoreDefense: 0.2},
      consumableCategories: [ConsumableCategory.ignoreDefenseBoost],
      duration: 2400,
      buffSlots: {}),
  blueStarPotion(
      formattedName: "Blue Star Potion",
      description:
          "A legendary fairy potion, containing blue star fragments.Warning:Does not stack with other potions and Star Potions of different kind.Effects only work in the Root Abyss.",
      statValues: {StatType.ignoreDefense: 0.2},
      consumableCategories: [ConsumableCategory.ignoreDefenseBoost],
      duration: 7200,
      buffSlots: {}),
  golluxSapphirePiercingPotion(
      formattedName: "Gollux Sapphire Piercing Potion",
      description:
          "A legendary fairy potion containing blue star fragments.Does not stack with other potions.Effects only work against Gollux.",
      statValues: {StatType.ignoreDefense: 0.2},
      consumableCategories: [ConsumableCategory.ignoreDefenseBoost],
      duration: 3600,
      buffSlots: {}),
  penetratingBoostPotion(
      formattedName: "Penetrating Boost Potion",
      description:
          "Alchemy Masters and Renowned Masters can make this potion that increases Ignore DEF Ratio by 10% for 40 minutes. Caution:Normally, only 1 Potion can be used at a time, but Alchemists can use 2 if they are of different kinds.",
      statValues: {StatType.ignoreDefense: 0.1},
      consumableCategories: [ConsumableCategory.ignoreDefenseBoost],
      duration: 2400,
      buffSlots: {}),
  sparklingBlueStarPotion(
      formattedName: "Sparkling Blue Star Potion",
      description:
          "A legendary fairy potion, containing sparkling blue star fragments.Warning:Does not stack with other potions and Star Potions of different kind.",
      statValues: {StatType.ignoreDefense: 0.2},
      consumableCategories: [ConsumableCategory.ignoreDefenseBoost],
      duration: 7200,
      buffSlots: {BuffSlot.starPotion}),
  x50BonusEXPCoupon(
      formattedName: "50% Bonus EXP Coupon",
      description:
          "Double-click to increase obtained EXP by 50% for 30 minutes.Stacks with other EXP buff effects. * Cannot be used together with Mu Gong-Certified Wellness Tonic, Alicia's Blessing, MVP Plus EXP boost effects, or Bonus EXP Coupon effects.",
      statValues: {StatType.expAdditional: 0.5},
      consumableCategories: [ConsumableCategory.expBoost],
      duration: 1800,
      buffSlots: {BuffSlot.bonusExpCoupon}),
  muGongCertifiedWellnessTonic(
      formattedName: "Mu Gong-Certified Wellness Tonic",
      description:
          "A special health tonic that can only be obtained by those who have achieved the 1st rank for their job in Mu Lung Dojo. Made under the sagacious supervision of Mu Gong. Increases EXP obtained by 1.5x when used.",
      statValues: {StatType.expAdditional: 0.5},
      consumableCategories: [ConsumableCategory.expBoost],
      duration: 1800,
      buffSlots: {BuffSlot.bonusExpCoupon}),
  aliciasBlessing(
      formattedName: "Alicia's Blessing",
      description:
          "A special item that can only be obtained by Tower of Oz rankers. Grants Alicia's Blessing, which increases EXP obtained by 50% for 30 minutes.",
      statValues: {StatType.expAdditional: 0.5},
      consumableCategories: [ConsumableCategory.expBoost],
      duration: 1800,
      buffSlots: {BuffSlot.bonusExpCoupon}),
  mvp50BonusEXPCoupon(
      formattedName: "MVP 50% Bonus EXP Coupon",
      description:
          "Double-click to increase obtained EXP by 50% for 30 minutes.Stacks with other EXP buff effects.  * Cannot be used together with Mu Gong-Certified Wellness Tonic, Alicia's Blessing, MVP Plus EXP boost effects, or Bonus EXP Coupon effects.",
      statValues: {StatType.expAdditional: 0.5},
      consumableCategories: [ConsumableCategory.expBoost],
      duration: 1800,
      buffSlots: {BuffSlot.bonusExpCoupon}),
  mvpPlusEXPAtmosphericEffect(
      formattedName: "MVP Plus EXP Atmospheric Effect",
      description:
          "Increases EXP gain rate by 50% for all characters on the map.Duration: 30 min",
      statValues: {StatType.expAdditional: 0.5},
      consumableCategories: [ConsumableCategory.expBoost],
      duration: 1800,
      buffSlots: {BuffSlot.bonusExpCoupon}),
  enjoyableWinter(
      formattedName: "Enjoyable Winter",
      description:
          "Greatly increases EXP gained from hunting monsters for 30 minutes.",
      statValues: {StatType.expAdditional: 0.5},
      consumableCategories: [ConsumableCategory.expBoost],
      duration: 1800,
      buffSlots: {BuffSlot.expCoupon}),
  expAccumulationPotion(
      formattedName: "EXP Accumulation Potion",
      description:
          "A pungent alchemical concoction that increases EXP gains by 10% for 2 hours. Alchemists are able to stomach two at a time, but they are too strong for anyone else to drink more than one.",
      statValues: {StatType.expAdditional: 0.1},
      consumableCategories: [ConsumableCategory.expBoost],
      duration: 7200,
      buffSlots: {BuffSlot.alchemyPotion, BuffSlot.expAccumulationPotion}),
  x15xEXPCoupon30min(
      formattedName: "1.5x EXP Coupon (30 min)",
      description:
          "Double-click to receive a 1.5x EXP buff for 30 minutes.The effect does not stack with similar event buffs.",
      statValues: {StatType.expMultiplicative: 0.5},
      consumableCategories: [
        ConsumableCategory.expBoost,
        ConsumableCategory.expBoost
      ],
      duration: 1800,
      buffSlots: {BuffSlot.expCoupon}),
  x15xEXPCoupon1Hour(
      formattedName: "1.5x EXP Coupon (1 Hour)",
      description:
          "Double-click to receive a 1.5x EXP buff for 1 hour.The effect does not stack with similar event buffs.",
      statValues: {StatType.expMultiplicative: 0.5},
      consumableCategories: [
        ConsumableCategory.expBoost,
        ConsumableCategory.expBoost
      ],
      duration: 0,
      buffSlots: {BuffSlot.expCoupon}),
  x2xEXPCoupon15min(
      formattedName: "2x EXP Coupon (15 min)",
      description:
          "Double-click to receive a 2x EXP buff for 15 minutes.The effect does not stack with similar event buffs.",
      statValues: {StatType.expMultiplicative: 1.0},
      consumableCategories: [
        ConsumableCategory.expBoost,
        ConsumableCategory.expBoost
      ],
      duration: 900,
      buffSlots: {BuffSlot.expCoupon}),
  x2xEXPCoupon30min(
      formattedName: "2x EXP Coupon (30 min)",
      description:
          "Double-click to receive a 2x EXP buff for 30 minutes.The effect does not stack with similar event buffs.",
      statValues: {StatType.expMultiplicative: 1.0},
      consumableCategories: [
        ConsumableCategory.expBoost,
        ConsumableCategory.expBoost
      ],
      duration: 1800,
      buffSlots: {BuffSlot.expCoupon}),
  x2xEXPCoupon1Hour(
      formattedName: "2x EXP Coupon (1 Hour)",
      description:
          "Double-click to receive a 2x EXP buff for 1 hour.The effect does not stack with similar event buffs.",
      statValues: {StatType.expMultiplicative: 1.0},
      consumableCategories: [
        ConsumableCategory.expBoost,
        ConsumableCategory.expBoost
      ],
      duration: 0,
      buffSlots: {BuffSlot.expCoupon}),
  legionsExpertiseLv1(
      formattedName: "Legion's Expertise Lv. 1",
      description:
          "You are benefiting from the combined wisdom of your Legion.Increases EXP by 100%Duration: 10 min",
      statValues: {StatType.expAdditional: 1.0},
      consumableCategories: [ConsumableCategory.expBoost],
      duration: 600,
      buffSlots: {BuffSlot.expCoupon}),
  legionsExpertiseLv2(
      formattedName: "Legion's Expertise Lv. 2",
      description:
          "You are benefiting from the combined wisdom of your Legion.Increases EXP by 100%Duration: 20 min",
      statValues: {StatType.expAdditional: 1.0},
      consumableCategories: [ConsumableCategory.expBoost],
      duration: 1200,
      buffSlots: {BuffSlot.expCoupon}),
  legionsExpertiseLv3(
      formattedName: "Legion's Expertise Lv. 3",
      description:
          "You are benefiting from the combined wisdom of your Legion.Increases EXP by 100%Duration: 30 min",
      statValues: {StatType.expAdditional: 1.0},
      consumableCategories: [ConsumableCategory.expBoost],
      duration: 1800,
      buffSlots: {BuffSlot.expCoupon}),
  muLungDojo2xEXPCoupon30min(
      formattedName: "Mu Lung Dojo 2x EXP Coupon (30 min)",
      description:
          "Double-click for a buff granting 2x EXP for 30 minutes.Effect does not stack with similar event buffs.",
      statValues: {StatType.expMultiplicative: 1.0},
      consumableCategories: [ConsumableCategory.expBoost],
      duration: 1800,
      buffSlots: {BuffSlot.expCoupon}),
  mvp2xEXPCoupon30min(
      formattedName: "MVP 2x EXP Coupon (30 min)",
      description:
          "Multiplies your EXP by 2 for 30 minutes.Effect does not stack with similar event buffs.",
      statValues: {StatType.expMultiplicative: 1.0},
      consumableCategories: [ConsumableCategory.expBoost],
      duration: 1800,
      buffSlots: {BuffSlot.expCoupon}),
  x3xEXPCoupon15min(
      formattedName: "3x EXP Coupon (15 min)",
      description:
          "Double-click to receive a 3x EXP buff for 15 minutes.The effect does not stack with similar event buffs.",
      statValues: {StatType.expMultiplicative: 2.0},
      consumableCategories: [
        ConsumableCategory.expBoost,
        ConsumableCategory.expBoost
      ],
      duration: 900,
      buffSlots: {BuffSlot.expCoupon}),
  x3xEXPCoupon30min(
      formattedName: "3x EXP Coupon (30 min)",
      description:
          "Double-click for a buff granting 3x EXP for 30 minutes.Effect does not stack with similar event buffs.",
      statValues: {StatType.expMultiplicative: 2.0},
      consumableCategories: [ConsumableCategory.expBoost],
      duration: 1800,
      buffSlots: {BuffSlot.expCoupon}),
  extremeGoldPotion(
      formattedName: "Extreme Gold Potion",
      description: "A gold potion from Monster Park.",
      statValues: {StatType.expAdditional: 0.1},
      consumableCategories: [ConsumableCategory.expBoost],
      duration: 1800,
      buffSlots: {BuffSlot.expCoupon}),
  basicLegionGrowthPotion(
      formattedName: "Basic Legion Growth Potion",
      description: "A growth potion, the fruits of your Legion's labor.",
      statValues: {StatType.expAdditional: 1.0},
      consumableCategories: [ConsumableCategory.expBoost],
      duration: 1800,
      buffSlots: {BuffSlot.expCoupon}),
  intermediateLegionGrowthPotion(
      formattedName: "Intermediate Legion Growth Potion",
      description: "A growth potion, the fruits of your Legion's labor.",
      statValues: {StatType.expAdditional: 1.0},
      consumableCategories: [ConsumableCategory.expBoost],
      duration: 1800,
      buffSlots: {BuffSlot.expCoupon}),
  advancedLegionGrowthPotion(
      formattedName: "Advanced Legion Growth Potion",
      description: "A growth potion, the fruits of your Legion's labor.",
      statValues: {StatType.expAdditional: 1.0},
      consumableCategories: [ConsumableCategory.expBoost],
      duration: 1800,
      buffSlots: {BuffSlot.expCoupon}),
  huntersLuck(
      formattedName: "Hunter's Luck",
      description:
          "Grants 2x EXP from hunting for 30 minutes.Effect does not stack with similar event buffs.",
      statValues: {StatType.expAdditional: 1.0},
      consumableCategories: [ConsumableCategory.expBoost],
      duration: 1800,
      buffSlots: {BuffSlot.expCoupon}),
  smallEXPAccumulationPotion(
      formattedName: "Small EXP Accumulation Potion",
      description:
          "A pungent alchemical concoction that increases EXP gains by 10% for 30 minutes. Alchemists are able to stomach two at a time, but they are too strong for anyone else to drink more than one.",
      statValues: {StatType.expAdditional: 0.1},
      consumableCategories: [ConsumableCategory.expBoost],
      duration: 1800,
      buffSlots: {BuffSlot.alchemyPotion, BuffSlot.expAccumulationPotion}),
  advancedAttackPillI(
      formattedName: "Advanced Attack Pill I",
      description: "A pill made through Alchemy.",
      statValues: {StatType.attack: 2},
      consumableCategories: [ConsumableCategory.attackBoost],
      duration: 1800,
      buffSlots: {}),
  advancedAttackPillII(
      formattedName: "Advanced Attack Pill II",
      description: "A pill made through Alchemy.",
      statValues: {StatType.attack: 4},
      consumableCategories: [ConsumableCategory.attackBoost],
      duration: 1800,
      buffSlots: {}),
  advancedAttackPillIII(
      formattedName: "Advanced Attack Pill III",
      description: "A pill made through Alchemy.",
      statValues: {StatType.attack: 6},
      consumableCategories: [ConsumableCategory.attackBoost],
      duration: 1800,
      buffSlots: {}),
  advancedAttackPillIV(
      formattedName: "Advanced Attack Pill IV",
      description: "A pill made through Alchemy.",
      statValues: {StatType.attack: 8},
      consumableCategories: [ConsumableCategory.attackBoost],
      duration: 1800,
      buffSlots: {}),
  advancedAttackPillV(
      formattedName: "Advanced Attack Pill V",
      description: "A pill made through Alchemy.",
      statValues: {StatType.attack: 10},
      consumableCategories: [ConsumableCategory.attackBoost],
      duration: 1800,
      buffSlots: {}),
  advancedAttackPotionI(
      formattedName: "Advanced Attack Potion I",
      description: "A potion made through Alchemy.",
      statValues: {StatType.attack: 2},
      consumableCategories: [ConsumableCategory.attackBoost],
      duration: 1800,
      buffSlots: {}),
  advancedAttackPotionII(
      formattedName: "Advanced Attack Potion II",
      description: "A potion made through Alchemy.",
      statValues: {StatType.attack: 4},
      consumableCategories: [ConsumableCategory.attackBoost],
      duration: 1800,
      buffSlots: {}),
  advancedAttackPotionIII(
      formattedName: "Advanced Attack Potion III",
      description: "A potion made through Alchemy.",
      statValues: {StatType.attack: 6},
      consumableCategories: [ConsumableCategory.attackBoost],
      duration: 1800,
      buffSlots: {}),
  advancedAttackPotionIV(
      formattedName: "Advanced Attack Potion IV",
      description: "A potion made through Alchemy.",
      statValues: {StatType.attack: 8},
      consumableCategories: [ConsumableCategory.attackBoost],
      duration: 1800,
      buffSlots: {}),
  advancedAttackPotionV(
      formattedName: "Advanced Attack Potion V",
      description: "A potion made through Alchemy.",
      statValues: {StatType.attack: 10},
      consumableCategories: [ConsumableCategory.attackBoost],
      duration: 1800,
      buffSlots: {}),
  advancedHeroPotion(
      formattedName: "Advanced Hero Potion",
      description:
          "A pungent alchemical concoction that increases Attack Power and Magic Attack by 12 for 2 hours. Can be used with other Attack Power potions. Alchemists are able to stomach two at a time, but they are too strong for anyone else to drink more than one.",
      statValues: {StatType.attack: 12, StatType.mattack: 12},
      consumableCategories: [
        ConsumableCategory.mattackBoost,
        ConsumableCategory.attackBoost
      ],
      duration: 7200,
      buffSlots: {BuffSlot.alchemyPotion}),
  attackPillI(
      formattedName: "Attack Pill I",
      description: "A pill made through Alchemy.",
      statValues: {StatType.attack: 2},
      consumableCategories: [ConsumableCategory.attackBoost],
      duration: 900,
      buffSlots: {}),
  attackPillII(
      formattedName: "Attack Pill II",
      description: "A pill made through Alchemy.",
      statValues: {StatType.attack: 4},
      consumableCategories: [ConsumableCategory.attackBoost],
      duration: 900,
      buffSlots: {}),
  attackPillIII(
      formattedName: "Attack Pill III",
      description: "A pill made through Alchemy.",
      statValues: {StatType.attack: 6},
      consumableCategories: [ConsumableCategory.attackBoost],
      duration: 900,
      buffSlots: {}),
  attackPillIV(
      formattedName: "Attack Pill IV",
      description: "A pill made through Alchemy.",
      statValues: {StatType.attack: 8},
      consumableCategories: [ConsumableCategory.attackBoost],
      duration: 900,
      buffSlots: {}),
  attackPillV(
      formattedName: "Attack Pill V",
      description: "A pill made through Alchemy.",
      statValues: {StatType.attack: 10},
      consumableCategories: [ConsumableCategory.attackBoost],
      duration: 900,
      buffSlots: {}),
  attackPotionI(
      formattedName: "Attack Potion I",
      description: "A potion made through Alchemy.",
      statValues: {StatType.attack: 2},
      consumableCategories: [ConsumableCategory.attackBoost],
      duration: 900,
      buffSlots: {}),
  attackPotionII(
      formattedName: "Attack Potion II",
      description: "A potion made through Alchemy.",
      statValues: {StatType.attack: 4},
      consumableCategories: [ConsumableCategory.attackBoost],
      duration: 900,
      buffSlots: {}),
  attackPotionIII(
      formattedName: "Attack Potion III",
      description: "A potion made through Alchemy.",
      statValues: {StatType.attack: 6},
      consumableCategories: [ConsumableCategory.attackBoost],
      duration: 900,
      buffSlots: {}),
  attackPotionIV(
      formattedName: "Attack Potion IV",
      description: "A potion made through Alchemy.",
      statValues: {StatType.attack: 8},
      consumableCategories: [ConsumableCategory.attackBoost],
      duration: 900,
      buffSlots: {}),
  attackPotionV(
      formattedName: "Attack Potion V",
      description: "A potion made through Alchemy.",
      statValues: {StatType.attack: 10},
      consumableCategories: [ConsumableCategory.attackBoost],
      duration: 900,
      buffSlots: {}),
  babyDragonFood(
      formattedName: "Baby Dragon Food",
      description:
          "A delicious bowl of baby food for a baby dragon. Grants attack +7 for 20 minutes.Can be purchased at the General Store in Leafre.",
      statValues: {StatType.attack: 7},
      consumableCategories: [ConsumableCategory.attackBoost],
      duration: 1200,
      buffSlots: {}),
  blessingfromWonkytheFairy(
      formattedName: "Blessing from Wonky the Fairy",
      description:
          "A blessing from Wonky the Fairy. Increases attack & magic attack.",
      statValues: {StatType.attack: 20, StatType.mattack: 30},
      consumableCategories: [
        ConsumableCategory.mattackBoost,
        ConsumableCategory.attackBoost
      ],
      duration: 1800,
      buffSlots: {}),
  bodyPhysicsMedicine(
      formattedName: "Body & Physics Medicine",
      description:
          "A hot, soup-like medicine made out of snake tails. Drinking this will revitalize the body to the tune of Attack +8 for 15 minutes.",
      statValues: {StatType.attack: 8},
      consumableCategories: [ConsumableCategory.attackBoost],
      duration: 900,
      buffSlots: {}),
  cider(
      formattedName: "Cider",
      description: "Cool soda.",
      statValues: {StatType.attack: 20},
      consumableCategories: [ConsumableCategory.attackBoost],
      duration: 300,
      buffSlots: {}),
  crystalizedPineappleChew(
      formattedName: "Crystalized Pineapple Chew",
      description: "A very sweet, home-made pineapple chew.",
      statValues: {StatType.attack: 20},
      consumableCategories: [ConsumableCategory.attackBoost],
      duration: 420,
      buffSlots: {}),
  drakesBlood(
      formattedName: "Drake's Blood",
      description: "Drake's blood.",
      statValues: {StatType.attack: 8},
      consumableCategories: [ConsumableCategory.attackBoost],
      duration: 300,
      buffSlots: {}),
  exceptionalHeroPotion(
      formattedName: "Exceptional Hero Potion",
      description:
          "A pungent alchemical concoction that increases Attack Power and Magic Attack by 24 for 2 hours. Can be used with other Attack Power potions. Alchemists are able to stomach two at a time, but they are too strong for anyone else to drink more than one.",
      statValues: {StatType.attack: 24, StatType.mattack: 24},
      consumableCategories: [
        ConsumableCategory.mattackBoost,
        ConsumableCategory.attackBoost
      ],
      duration: 7200,
      buffSlots: {BuffSlot.alchemyPotion}),
  goldStarPotion(
      formattedName: "Gold Star Potion",
      description:
          "A legendary fairy potion, containing gold star fragments.Warning:Does not stack with other potions and Star Potions of different kind.Effects only work in the Root Abyss.",
      statValues: {StatType.attack: 20, StatType.mattack: 20},
      consumableCategories: [
        ConsumableCategory.mattackBoost,
        ConsumableCategory.attackBoost
      ],
      duration: 7200,
      buffSlots: {}),
  heroPotion(
      formattedName: "Hero Potion",
      description:
          "A pungent alchemical concoction that increases Attack Power and Magic Attack by 6 for 2 hours. Can be used with other Attack Power potions. Alchemists are able to stomach two at a time, but they are too strong for anyone else to drink more than one.",
      statValues: {StatType.attack: 6, StatType.mattack: 6},
      consumableCategories: [
        ConsumableCategory.mattackBoost,
        ConsumableCategory.attackBoost
      ],
      duration: 7200,
      buffSlots: {BuffSlot.alchemyPotion}),
  legendaryHeroPotion(
      formattedName: "Legendary Hero Potion",
      description:
          "A pungent alchemical concoction that increases Attack Power and Magic Attack by 30 for 2 hours. Can be used with other Attack Power potions. Alchemists are able to stomach two at a time, but they are too strong for anyone else to drink more than one.",
      statValues: {StatType.attack: 30, StatType.mattack: 30},
      consumableCategories: [
        ConsumableCategory.mattackBoost,
        ConsumableCategory.attackBoost
      ],
      duration: 7200,
      buffSlots: {BuffSlot.alchemyPotion}),
  naricainsDemonElixir(
      formattedName: "Naricain's Demon Elixir",
      description:
          "A fiery black liquid that gives the user the power of a thousand demons when consumed.",
      statValues: {StatType.attack: 140},
      consumableCategories: [ConsumableCategory.attackBoost],
      duration: 480,
      buffSlots: {}),
  sparklingGoldStarPotion(
      formattedName: "Sparkling Gold Star Potion",
      description:
          "A legendary fairy potion, containing sparkling gold star fragments.Warning:Does not stack with other potions and Star Potions of different kind.",
      statValues: {StatType.attack: 20, StatType.mattack: 20},
      consumableCategories: [
        ConsumableCategory.mattackBoost,
        ConsumableCategory.attackBoost
      ],
      duration: 7200,
      buffSlots: {BuffSlot.starPotion}),
  superiorHeroPotion(
      formattedName: "Superior Hero Potion",
      description:
          "A pungent alchemical concoction that increases Attack Power and Magic Attack by 18 for 2 hours. Can be used with other Attack Power potions. Alchemists are able to stomach two at a time, but they are too strong for anyone else to drink more than one.",
      statValues: {StatType.attack: 18, StatType.mattack: 18},
      consumableCategories: [
        ConsumableCategory.mattackBoost,
        ConsumableCategory.attackBoost
      ],
      duration: 7200,
      buffSlots: {BuffSlot.alchemyPotion}),
  takoyakijumbo(
      formattedName: "Takoyaki (jumbo)",
      description: "Two servings worth of Takoyaki.",
      statValues: {StatType.attack: 8},
      consumableCategories: [ConsumableCategory.attackBoost],
      duration: 600,
      buffSlots: {}),
  takoyakiOctopusBall(
      formattedName: "Takoyaki (Octopus Ball)",
      description: "A hot, tasty-looking Takoyaki.",
      statValues: {StatType.attack: 8},
      consumableCategories: [ConsumableCategory.attackBoost],
      duration: 300,
      buffSlots: {}),
  warriorElixir(
      formattedName: "Warrior Elixir",
      description: "A special elixir for Warriors.",
      statValues: {StatType.attack: 12},
      consumableCategories: [ConsumableCategory.attackBoost],
      duration: 480,
      buffSlots: {}),
  warriorPill(
      formattedName: "Warrior Pill",
      description: "A pill of concentrated warrior potion.",
      statValues: {StatType.attack: 5},
      consumableCategories: [
        ConsumableCategory.attackBoost,
        ConsumableCategory.attackBoost
      ],
      duration: 600,
      buffSlots: {}),
  warriorPotion(
      formattedName: "Warrior Potion",
      description: "Increases attacking ability.",
      statValues: {StatType.attack: 5},
      consumableCategories: [
        ConsumableCategory.attackBoost,
        ConsumableCategory.attackBoost
      ],
      duration: 180,
      buffSlots: {}),
  advancedMagicPillI(
      formattedName: "Advanced Magic Pill I",
      description: "A pill made through Alchemy.",
      statValues: {StatType.mattack: 2},
      consumableCategories: [ConsumableCategory.mattackBoost],
      duration: 1800,
      buffSlots: {}),
  advancedMagicPillII(
      formattedName: "Advanced Magic Pill II",
      description: "A pill made through Alchemy.",
      statValues: {StatType.mattack: 4},
      consumableCategories: [ConsumableCategory.mattackBoost],
      duration: 1800,
      buffSlots: {}),
  advancedMagicPillIII(
      formattedName: "Advanced Magic Pill III",
      description: "A pill made through Alchemy.",
      statValues: {StatType.mattack: 6},
      consumableCategories: [ConsumableCategory.mattackBoost],
      duration: 1800,
      buffSlots: {}),
  advancedMagicPillIV(
      formattedName: "Advanced Magic Pill IV",
      description: "A pill made through Alchemy.",
      statValues: {StatType.mattack: 8},
      consumableCategories: [ConsumableCategory.mattackBoost],
      duration: 1800,
      buffSlots: {}),
  advancedMagicPillV(
      formattedName: "Advanced Magic Pill V",
      description: "A pill made through Alchemy.",
      statValues: {StatType.mattack: 10},
      consumableCategories: [ConsumableCategory.mattackBoost],
      duration: 1800,
      buffSlots: {}),
  advancedMagicPotionI(
      formattedName: "Advanced Magic Potion I",
      description: "A potion made through Alchemy.",
      statValues: {StatType.mattack: 2},
      consumableCategories: [ConsumableCategory.mattackBoost],
      duration: 1800,
      buffSlots: {}),
  advancedMagicPotionII(
      formattedName: "Advanced Magic Potion II",
      description: "A potion made through Alchemy.",
      statValues: {StatType.mattack: 4},
      consumableCategories: [ConsumableCategory.mattackBoost],
      duration: 1800,
      buffSlots: {}),
  advancedMagicPotionIII(
      formattedName: "Advanced Magic Potion III",
      description: "A potion made through Alchemy.",
      statValues: {StatType.mattack: 6},
      consumableCategories: [ConsumableCategory.mattackBoost],
      duration: 1800,
      buffSlots: {}),
  advancedMagicPotionIV(
      formattedName: "Advanced Magic Potion IV",
      description: "A potion made through Alchemy.",
      statValues: {StatType.mattack: 8},
      consumableCategories: [ConsumableCategory.mattackBoost],
      duration: 1800,
      buffSlots: {}),
  advancedMagicPotionV(
      formattedName: "Advanced Magic Potion V",
      description: "A potion made through Alchemy.",
      statValues: {StatType.mattack: 10},
      consumableCategories: [ConsumableCategory.mattackBoost],
      duration: 1800,
      buffSlots: {}),
  ancientTreeSap(
      formattedName: "Ancient Tree Sap",
      description: "Sap of a thousands-of-years-old tree.",
      statValues: {StatType.mattack: 10},
      consumableCategories: [ConsumableCategory.mattackBoost],
      duration: 300,
      buffSlots: {}),
  elixirofDarkness(
      formattedName: "Elixir of Darkness",
      description:
          "A mysterious concoction of herbs brewed deep within the mountains of El Nath.",
      statValues: {StatType.mattack: 200, StatType.defense: -25},
      consumableCategories: [ConsumableCategory.mattackBoost],
      duration: 300,
      buffSlots: {}),
  jigajuice(
      formattedName: "JigaJuice",
      description:
          "A futuristic power pack full of liquid fuel synthesized by T-1337. Drink at your own risk! Gives the user a sudden jolting surge of energy, so use it or lose it! [Gives +1000 Magic Attack for 5 seconds.]",
      statValues: {StatType.mattack: 1000},
      consumableCategories: [ConsumableCategory.mattackBoost],
      duration: 5,
      buffSlots: {}),
  magicPill(
      formattedName: "Magic Pill",
      description: "A pill of concentrated magic potion.",
      statValues: {StatType.mattack: 5},
      consumableCategories: [
        ConsumableCategory.mattackBoost,
        ConsumableCategory.mattackBoost
      ],
      duration: 600,
      buffSlots: {}),
  magicPillI(
      formattedName: "Magic Pill I",
      description: "A pill made through Alchemy.",
      statValues: {StatType.mattack: 2},
      consumableCategories: [ConsumableCategory.mattackBoost],
      duration: 900,
      buffSlots: {}),
  magicPillII(
      formattedName: "Magic Pill II",
      description: "A pill made through Alchemy.",
      statValues: {StatType.mattack: 4},
      consumableCategories: [ConsumableCategory.mattackBoost],
      duration: 900,
      buffSlots: {}),
  magicPillIII(
      formattedName: "Magic Pill III",
      description: "A pill made through Alchemy.",
      statValues: {StatType.mattack: 6},
      consumableCategories: [ConsumableCategory.mattackBoost],
      duration: 900,
      buffSlots: {}),
  magicPillIV(
      formattedName: "Magic Pill IV",
      description: "A pill made through Alchemy.",
      statValues: {StatType.mattack: 8},
      consumableCategories: [ConsumableCategory.mattackBoost],
      duration: 900,
      buffSlots: {}),
  magicPillV(
      formattedName: "Magic Pill V",
      description: "A pill made through Alchemy.",
      statValues: {StatType.mattack: 10},
      consumableCategories: [ConsumableCategory.mattackBoost],
      duration: 900,
      buffSlots: {}),
  magicPotion(
      formattedName: "Magic Potion",
      description: "Increases magic attack.",
      statValues: {StatType.mattack: 5},
      consumableCategories: [
        ConsumableCategory.mattackBoost,
        ConsumableCategory.mattackBoost
      ],
      duration: 180,
      buffSlots: {}),
  magicPotionI(
      formattedName: "Magic Potion I",
      description: "A potion made through Alchemy.",
      statValues: {StatType.mattack: 2},
      consumableCategories: [ConsumableCategory.mattackBoost],
      duration: 900,
      buffSlots: {}),
  magicPotionII(
      formattedName: "Magic Potion II",
      description: "A potion made through Alchemy.",
      statValues: {StatType.mattack: 4},
      consumableCategories: [ConsumableCategory.mattackBoost],
      duration: 900,
      buffSlots: {}),
  magicPotionIII(
      formattedName: "Magic Potion III",
      description: "A potion made through Alchemy.",
      statValues: {StatType.mattack: 6},
      consumableCategories: [ConsumableCategory.mattackBoost],
      duration: 900,
      buffSlots: {}),
  magicPotionIV(
      formattedName: "Magic Potion IV",
      description: "A potion made through Alchemy.",
      statValues: {StatType.mattack: 8},
      consumableCategories: [ConsumableCategory.mattackBoost],
      duration: 900,
      buffSlots: {}),
  magicPotionV(
      formattedName: "Magic Potion V",
      description: "A potion made through Alchemy.",
      statValues: {StatType.mattack: 10},
      consumableCategories: [ConsumableCategory.mattackBoost],
      duration: 900,
      buffSlots: {}),
  masteryMedicine(
      formattedName: "Mastery Medicine",
      description:
          "A hot, soup-like medicine that allegedly turns students into bona-fide Masters.",
      statValues: {StatType.mattack: 10},
      consumableCategories: [ConsumableCategory.mattackBoost],
      duration: 900,
      buffSlots: {}),
  ssiwsCheese(
      formattedName: "Ssiws Cheese",
      description:
          "Cheese from the alternate dimension of Versal. Looks funny but smells quite nice.",
      statValues: {StatType.mattack: 220},
      consumableCategories: [ConsumableCategory.mattackBoost],
      duration: 120,
      buffSlots: {}),
  wizardElixir(
      formattedName: "Wizard Elixir",
      description: "A special elixir for Magicians.",
      statValues: {StatType.mattack: 20},
      consumableCategories: [ConsumableCategory.mattackBoost],
      duration: 480,
      buffSlots: {}),
  wizardPotion(
      formattedName: "Wizard Potion",
      description: "Increases magic attack.",
      statValues: {StatType.mattack: 10},
      consumableCategories: [
        ConsumableCategory.mattackBoost,
        ConsumableCategory.mattackBoost
      ],
      duration: 18,
      buffSlots: {}),
  yakisoba(
      formattedName: "Yakisoba",
      description:
          "A bowl of Yakisoba which includes vegetable, seafood, and noodles mixed with a delicious sauce.",
      statValues: {StatType.mattack: 10},
      consumableCategories: [ConsumableCategory.mattackBoost],
      duration: 300,
      buffSlots: {}),
  yakisobax2(
      formattedName: "Yakisoba (x2)",
      description:
          "Double the serving of a normal bowl of Yakisoba which includes vegetable, seafood, and noodles mixed with a delicious sauce.",
      statValues: {StatType.mattack: 10},
      consumableCategories: [ConsumableCategory.mattackBoost],
      duration: 600,
      buffSlots: {});

  const ConsumableName(
      {required this.formattedName,
      required this.description,
      required this.statValues,
      required this.consumableCategories,
      required this.duration,
      required this.buffSlots});

  final String formattedName;
  final String description;
  final Map<StatType, num> statValues;
  final List<ConsumableCategory> consumableCategories;
  final int duration;
  final Set<BuffSlot> buffSlots;
}
