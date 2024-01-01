import 'package:maplestory_builder/constants/constants.dart';

enum ConsumableCategory {
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
  advancedAttackPillI(
    formattedName: "Advanced Attack Pill I",
    description: "A pill made through Alchemy.",
    statValues: {StatType.attack: 2},
    consumableCategory: ConsumableCategory.alchemyPotion,
    duration: 1800,
  ),
  advancedAttackPillII(
    formattedName: "Advanced Attack Pill II",
    description: "A pill made through Alchemy.",
    statValues: {StatType.attack: 4},
    consumableCategory: ConsumableCategory.alchemyPotion,
    duration: 1800,
  ),
  advancedAttackPillIII(
    formattedName: "Advanced Attack Pill III",
    description: "A pill made through Alchemy.",
    statValues: {StatType.attack: 6},
    consumableCategory: ConsumableCategory.alchemyPotion,
    duration: 1800,
  ),
  advancedAttackPillIV(
    formattedName: "Advanced Attack Pill IV",
    description: "A pill made through Alchemy.",
    statValues: {StatType.attack: 8},
    consumableCategory: ConsumableCategory.alchemyPotion,
    duration: 1800,
  ),
  advancedAttackPillV(
    formattedName: "Advanced Attack Pill V",
    description: "A pill made through Alchemy.",
    statValues: {
      StatType.attack: 10,
    },
    consumableCategory: ConsumableCategory.alchemyPotion,
    duration: 1800,
  ),
  advancedAttackPotionI(
    formattedName: "Advanced Attack Potion I",
    description: "A potion made through Alchemy.",
    statValues: {
      StatType.attack: 2,
    },
    consumableCategory: ConsumableCategory.alchemyPotion,
    duration: 1800,
  ),
  advancedAttackPotionII(
    formattedName: "Advanced Attack Potion II",
    description: "A potion made through Alchemy.",
    statValues: {
      StatType.attack: 4,
    },
    consumableCategory: ConsumableCategory.alchemyPotion,
    duration: 1800,
  ),
  advancedAttackPotionIII(
    formattedName: "Advanced Attack Potion III",
    description: "A potion made through Alchemy.",
    statValues: {
      StatType.attack: 6,
    },
    consumableCategory: ConsumableCategory.alchemyPotion,
    duration: 1800,
  ),
  advancedAttackPotionIV(
    formattedName: "Advanced Attack Potion IV",
    description: "A potion made through Alchemy.",
    statValues: {
      StatType.attack: 8,
    },
    consumableCategory: ConsumableCategory.alchemyPotion,
    duration: 1800,
  ),
  advancedAttackPotionV(
    formattedName: "Advanced Attack Potion V",
    description: "A potion made through Alchemy.",
    statValues: {StatType.attack: 10},
    consumableCategory: ConsumableCategory.alchemyPotion,
    duration: 1800,
  ),
  advancedBlessingPotion(
    formattedName: "Advanced Blessing Potion",
    description:
        "A pungent alchemical concoction that increases STR, DEX, INT, LUK, and Speed by 30, and Jump by 23, for 2 hours. Alchemists are able to stomach two at a time, but they are too strong for anyone else to drink more than one.",
    statValues: {
      StatType.allStats: 30,
      StatType.speed: 30,
      StatType.jump: 23,
    },
    consumableCategory: ConsumableCategory.alchemyPotion,
    duration: 7200,
  ),
  advancedBossRushBoostPotion(
    formattedName: "Advanced Boss Rush Boost Potion",
    description:
        "Alchemy Masters and Renowned Masters can make this potion that increases your boss damage by 20% for 40 minutes.Caution:Normally, only 1 Potion can be used at a time, but Alchemists can use 2 if they are of different kinds.",
    statValues: {
      StatType.bossDamage: 0.2,
    },
    consumableCategory: ConsumableCategory.alchemyPotion,
    duration: 2400,
  ),
  advancedDefensePillI(
    formattedName: "Advanced Defense Pill I",
    description: "A pill made through Alchemy.",
    statValues: {StatType.defense: 50},
    consumableCategory: ConsumableCategory.alchemyPotion,
    duration: 1800,
  ),
  advancedDefensePillII(
    formattedName: "Advanced Defense Pill II",
    description: "A pill made through Alchemy.",
    statValues: {StatType.defense: 70},
    consumableCategory: ConsumableCategory.alchemyPotion,
    duration: 1800,
  ),
  advancedDefensePillIII(
    formattedName: "Advanced Defense Pill III",
    description: "A pill made through Alchemy.",
    statValues: {StatType.defense: 90},
    consumableCategory: ConsumableCategory.alchemyPotion,
    duration: 1800,
  ),
  advancedDefensePillIV(
    formattedName: "Advanced Defense Pill IV",
    description: "A pill made through Alchemy.",
    statValues: {StatType.defense: 110},
    consumableCategory: ConsumableCategory.alchemyPotion,
    duration: 1800,
  ),
  advancedDefensePillIX(
    formattedName: "Advanced Defense Pill IX",
    description: "A pill made through Alchemy.",
    statValues: {StatType.defense: 210},
    consumableCategory: ConsumableCategory.alchemyPotion,
    duration: 1800,
  ),
  advancedDefensePillV(
    formattedName: "Advanced Defense Pill V",
    description: "A pill made through Alchemy.",
    statValues: {StatType.defense: 130},
    consumableCategory: ConsumableCategory.alchemyPotion,
    duration: 1800,
  ),
  advancedDefensePillVI(
    formattedName: "Advanced Defense Pill VI",
    description: "A pill made through Alchemy.",
    statValues: {StatType.defense: 150},
    consumableCategory: ConsumableCategory.alchemyPotion,
    duration: 1800,
  ),
  advancedDefensePillVII(
    formattedName: "Advanced Defense Pill VII",
    description: "A pill made through Alchemy.",
    statValues: {StatType.defense: 170},
    consumableCategory: ConsumableCategory.alchemyPotion,
    duration: 18000,
  ),
  advancedDefensePillVIII(
    formattedName: "Advanced Defense Pill VIII",
    description: "A pill made through Alchemy.",
    statValues: {StatType.defense: 190},
    consumableCategory: ConsumableCategory.alchemyPotion,
    duration: 1800,
  ),
  advancedDefensePillX(
    formattedName: "Advanced Defense Pill X",
    description: "A pill made through Alchemy.",
    statValues: {StatType.defense: 230},
    consumableCategory: ConsumableCategory.alchemyPotion,
    duration: 1800,
  ),
  advancedDefensePotionI(
    formattedName: "Advanced Defense Potion I",
    description: "A potion made through Alchemy.",
    statValues: {StatType.defense: 50},
    consumableCategory: ConsumableCategory.alchemyPotion,
    duration: 1800,
  ),
  advancedDefensePotionII(
    formattedName: "Advanced Defense Potion II",
    description: "A potion made through Alchemy.",
    statValues: {StatType.defense: 70},
    consumableCategory: ConsumableCategory.alchemyPotion,
    duration: 1800,
  ),
  advancedDefensePotionIII(
    formattedName: "Advanced Defense Potion III",
    description: "A potion made through Alchemy.",
    statValues: {StatType.defense: 90},
    consumableCategory: ConsumableCategory.alchemyPotion,
    duration: 1800,
  ),
  advancedDefensePotionIV(
    formattedName: "Advanced Defense Potion IV",
    description: "A potion made through Alchemy.",
    statValues: {StatType.defense: 110},
    consumableCategory: ConsumableCategory.alchemyPotion,
    duration: 1800,
  ),
  advancedDefensePotionIX(
    formattedName: "Advanced Defense Potion IX",
    description: "A potion made through Alchemy.",
    statValues: {StatType.defense: 210},
    consumableCategory: ConsumableCategory.alchemyPotion,
    duration: 1800,
  ),
  advancedDefensePotionV(
    formattedName: "Advanced Defense Potion V",
    description: "A potion made through Alchemy.",
    statValues: {StatType.defense: 130},
    consumableCategory: ConsumableCategory.alchemyPotion,
    duration: 1800,
  ),
  advancedDefensePotionVI(
    formattedName: "Advanced Defense Potion VI",
    description: "A potion made through Alchemy.",
    statValues: {StatType.defense: 150},
    consumableCategory: ConsumableCategory.alchemyPotion,
    duration: 1800,
  ),
  advancedDefensePotionVII(
    formattedName: "Advanced Defense Potion VII",
    description: "A potion made through Alchemy.",
    statValues: {StatType.defense: 170},
    consumableCategory: ConsumableCategory.alchemyPotion,
    duration: 1800,
  ),
  advancedDefensePotionVIII(
    formattedName: "Advanced Defense Potion VIII",
    description: "A potion made through Alchemy.",
    statValues: {StatType.defense: 190},
    consumableCategory: ConsumableCategory.alchemyPotion,
    duration: 1800,
  ),
  advancedDefensePotionX(
    formattedName: "Advanced Defense Potion X",
    description: "A potion made through Alchemy.",
    statValues: {StatType.defense: 230},
    consumableCategory: ConsumableCategory.alchemyPotion,
    duration: 1800,
  ),
  advancedDexterityBoostPotion(
    formattedName: "Advanced Dexterity Boost Potion",
    description:
        "A pungent alchemical concoction that increases DEX by 60 for 2 hours. Alchemists are able to stomach two at a time, but they are too strong for anyone else to drink more than one.",
    statValues: {StatType.dex: 60},
    consumableCategory: ConsumableCategory.alchemyPotion,
    duration: 7200,
  ),
  advancedDexterityPillI(
    formattedName: "Advanced Dexterity Pill I",
    description: "A pill made through Alchemy.",
    statValues: {StatType.dex: 3},
    consumableCategory: ConsumableCategory.alchemyPotion,
    duration: 1800,
  ),
  advancedDexterityPillII(
    formattedName: "Advanced Dexterity Pill II",
    description: "A pill made through Alchemy.",
    statValues: {StatType.dex: 6},
    consumableCategory: ConsumableCategory.alchemyPotion,
    duration: 1800,
  ),
  advancedDexterityPillIII(
    formattedName: "Advanced Dexterity Pill III",
    description: "A pill made through Alchemy.",
    statValues: {StatType.dex: 9},
    consumableCategory: ConsumableCategory.alchemyPotion,
    duration: 1800,
  ),
  advancedDexterityPillIV(
    formattedName: "Advanced Dexterity Pill IV",
    description: "A pill made through Alchemy.",
    statValues: {StatType.dex: 12},
    consumableCategory: ConsumableCategory.alchemyPotion,
    duration: 1800,
  ),
  advancedDexterityPillIX(
    formattedName: "Advanced Dexterity Pill IX",
    description: "A pill made through Alchemy.",
    statValues: {StatType.dex: 27},
    consumableCategory: ConsumableCategory.alchemyPotion,
    duration: 1800,
  ),
  advancedDexterityPillV(
    formattedName: "Advanced Dexterity Pill V",
    description: "A pill made through Alchemy.",
    statValues: {StatType.dex: 15},
    consumableCategory: ConsumableCategory.alchemyPotion,
    duration: 1800,
  ),
  advancedDexterityPillVI(
    formattedName: "Advanced Dexterity Pill VI",
    description: "A pill made through Alchemy.",
    statValues: {StatType.dex: 18},
    consumableCategory: ConsumableCategory.alchemyPotion,
    duration: 1800,
  ),
  advancedDexterityPillVII(
    formattedName: "Advanced Dexterity Pill VII",
    description: "A pill made through Alchemy.",
    statValues: {StatType.dex: 21},
    consumableCategory: ConsumableCategory.alchemyPotion,
    duration: 1800,
  ),
  advancedDexterityPillVIII(
    formattedName: "Advanced Dexterity Pill VIII",
    description: "A pill made through Alchemy.",
    statValues: {StatType.dex: 24},
    consumableCategory: ConsumableCategory.alchemyPotion,
    duration: 1800,
  ),
  advancedDexterityPillX(
    formattedName: "Advanced Dexterity Pill X",
    description: "A pill made through Alchemy.",
    statValues: {StatType.dex: 30},
    consumableCategory: ConsumableCategory.alchemyPotion,
    duration: 1800,
  ),
  advancedDexterityPotionI(
    formattedName: "Advanced Dexterity Potion I",
    description: "A potion made through Alchemy.",
    statValues: {StatType.dex: 3},
    consumableCategory: ConsumableCategory.alchemyPotion,
    duration: 1800,
  ),
  advancedDexterityPotionII(
    formattedName: "Advanced Dexterity Potion II",
    description: "A potion made through Alchemy.",
    statValues: {StatType.dex: 6},
    consumableCategory: ConsumableCategory.alchemyPotion,
    duration: 1800,
  ),
  advancedDexterityPotionIII(
    formattedName: "Advanced Dexterity Potion III",
    description: "A potion made through Alchemy.",
    statValues: {StatType.dex: 9},
    consumableCategory: ConsumableCategory.alchemyPotion,
    duration: 1800,
  ),
  advancedDexterityPotionIV(
    formattedName: "Advanced Dexterity Potion IV",
    description: "A potion made through Alchemy.",
    statValues: {StatType.dex: 12},
    consumableCategory: ConsumableCategory.alchemyPotion,
    duration: 1800,
  ),
  advancedDexterityPotionIX(
    formattedName: "Advanced Dexterity Potion IX",
    description: "A potion made through Alchemy.",
    statValues: {StatType.dex: 27},
    consumableCategory: ConsumableCategory.alchemyPotion,
    duration: 1800,
  ),
  advancedDexterityPotionV(
    formattedName: "Advanced Dexterity Potion V",
    description: "A potion made through Alchemy.",
    statValues: {StatType.dex: 15},
    consumableCategory: ConsumableCategory.alchemyPotion,
    duration: 1800,
  ),
  advancedDexterityPotionVI(
    formattedName: "Advanced Dexterity Potion VI",
    description: "A potion made through Alchemy.",
    statValues: {StatType.dex: 18},
    consumableCategory: ConsumableCategory.alchemyPotion,
    duration: 1800,
  ),
  advancedDexterityPotionVII(
    formattedName: "Advanced Dexterity Potion VII",
    description: "A potion made through Alchemy.",
    statValues: {StatType.dex: 21},
    consumableCategory: ConsumableCategory.alchemyPotion,
    duration: 1800,
  ),
  advancedDexterityPotionVIII(
    formattedName: "Advanced Dexterity Potion VIII",
    description: "A potion made through Alchemy.",
    statValues: {StatType.dex: 24},
    consumableCategory: ConsumableCategory.alchemyPotion,
    duration: 1800,
  ),
  advancedDexterityPotionX(
    formattedName: "Advanced Dexterity Potion X",
    description: "A potion made through Alchemy.",
    statValues: {StatType.dex: 30},
    consumableCategory: ConsumableCategory.alchemyPotion,
    duration: 1800,
  ),
  advancedGreatBlessingPotion(
    formattedName: "Advanced Great Blessing Potion",
    description:
        "Alchemy Masters and Renowned Masters can make this potion that increases all stats by 10% for 40 minutes. Caution:Normally, only 1 Potion can be used at a time, but Alchemists can use 2 if they are of different kinds.",
    statValues: {StatType.allStatsPercentage: 0.1},
    consumableCategory: ConsumableCategory.alchemyPotion,
    duration: 2400,
  ),
  advancedGreatHeroBoostPotion(
    formattedName: "Advanced Great Hero Boost Potion",
    description:
        "Alchemy Masters and Renowned Masters can make this potion that increases your damage by 10% for 40 minutes.Caution:Normally, only 1 Potion can be used at a time, but Alchemists can use 2 if they are of different kinds.",
    statValues: {StatType.damage: 0.1},
    consumableCategory: ConsumableCategory.alchemyPotion,
    duration: 2400,
  ),
  advancedHealthBoostPotion(
    formattedName: "Advanced Health Boost Potion",
    description:
        "A pungent alchemical concoction that increases HP by 4000 for 2 hours. Alchemists are able to stomach two at a time, but they are too strong for anyone else to drink more than one.",
    statValues: {
      StatType.hp: 4000,
    },
    consumableCategory: ConsumableCategory.alchemyPotion,
    duration: 7200,
  ),
  advancedHeroPotion(
    formattedName: "Advanced Hero Potion",
    description:
        "A pungent alchemical concoction that increases Attack Power and Magic Attack by 12 for 2 hours. Can be used with other Attack Power potions. Alchemists are able to stomach two at a time, but they are too strong for anyone else to drink more than one.",
    statValues: {
      StatType.attackMattack: 12,
    },
    consumableCategory: ConsumableCategory.alchemyPotion,
    duration: 7200,
  ),
  advancedIntelligenceBoostPotion(
    formattedName: "Advanced Intelligence Boost Potion",
    description:
        "A pungent alchemical concoction that increases INT by 60 for 2 hours. Alchemists are able to stomach two at a time, but they are too strong for anyone else to drink more than one.",
    statValues: {
      StatType.int: 60,
    },
    consumableCategory: ConsumableCategory.alchemyPotion,
    duration: 7200,
  ),
  advancedIntelligencePillI(
    formattedName: "Advanced Intelligence Pill I",
    description: "A pill made through Alchemy.",
    statValues: {
      StatType.int: 3,
    },
    consumableCategory: ConsumableCategory.alchemyPotion,
    duration: 1800,
  ),
  advancedIntelligencePillII(
    formattedName: "Advanced Intelligence Pill II",
    description: "A pill made through Alchemy.",
    statValues: {
      StatType.int: 6,
    },
    consumableCategory: ConsumableCategory.alchemyPotion,
    duration: 1800,
  ),
  advancedIntelligencePillIII(
    formattedName: "Advanced Intelligence Pill III",
    description: "A pill made through Alchemy.",
    statValues: {
      StatType.int: 9,
    },
    consumableCategory: ConsumableCategory.alchemyPotion,
    duration: 1800,
  ),
  advancedIntelligencePillIV(
    formattedName: "Advanced Intelligence Pill IV",
    description: "A pill made through Alchemy.",
    statValues: {
      StatType.int: 12,
    },
    consumableCategory: ConsumableCategory.alchemyPotion,
    duration: 1800,
  ),
  advancedIntelligencePillIX(
    formattedName: "Advanced Intelligence Pill IX",
    description: "A pill made through Alchemy.",
    statValues: {
      StatType.int: 27,
    },
    consumableCategory: ConsumableCategory.alchemyPotion,
    duration: 1800,
  ),
  advancedIntelligencePillV(
    formattedName: "Advanced Intelligence Pill V",
    description: "A pill made through Alchemy.",
    statValues: {
      StatType.int: 15,
    },
    consumableCategory: ConsumableCategory.alchemyPotion,
    duration: 1800,
  ),
  advancedIntelligencePillVI(
    formattedName: "Advanced Intelligence Pill VI",
    description: "A pill made through Alchemy.",
    statValues: {StatType.int: 18},
    consumableCategory: ConsumableCategory.alchemyPotion,
    duration: 1800,
  ),
  advancedIntelligencePillVII(
    formattedName: "Advanced Intelligence Pill VII",
    description: "A pill made through Alchemy.",
    statValues: {StatType.int: 21},
    consumableCategory: ConsumableCategory.alchemyPotion,
    duration: 1800,
  ),
  advancedIntelligencePillVIII(
    formattedName: "Advanced Intelligence Pill VIII",
    description: "A pill made through Alchemy.",
    statValues: {StatType.int: 24},
    consumableCategory: ConsumableCategory.alchemyPotion,
    duration: 1800,
  ),
  advancedIntelligencePillX(
    formattedName: "Advanced Intelligence Pill X",
    description: "A pill made through Alchemy.",
    statValues: {StatType.int: 30},
    consumableCategory: ConsumableCategory.alchemyPotion,
    duration: 1800,
  ),
  advancedIntelligencePotionI(
    formattedName: "Advanced Intelligence Potion I",
    description: "A potion made through Alchemy.",
    statValues: {StatType.int: 3},
    consumableCategory: ConsumableCategory.alchemyPotion,
    duration: 1800,
  ),
  advancedIntelligencePotionII(
    formattedName: "Advanced Intelligence Potion II",
    description: "A potion made through Alchemy.",
    statValues: {StatType.int: 6},
    consumableCategory: ConsumableCategory.alchemyPotion,
    duration: 1800,
  ),
  advancedIntelligencePotionIII(
    formattedName: "Advanced Intelligence Potion III",
    description: "A potion made through Alchemy.",
    statValues: {StatType.int: 9},
    consumableCategory: ConsumableCategory.alchemyPotion,
    duration: 1800,
  ),
  advancedIntelligencePotionIV(
    formattedName: "Advanced Intelligence Potion IV",
    description: "A potion made through Alchemy.",
    statValues: {StatType.int: 12},
    consumableCategory: ConsumableCategory.alchemyPotion,
    duration: 1800,
  ),
  advancedIntelligencePotionIX(
    formattedName: "Advanced Intelligence Potion IX",
    description: "A potion made through Alchemy.",
    statValues: {StatType.int: 27},
    consumableCategory: ConsumableCategory.alchemyPotion,
    duration: 1800,
  ),
  advancedIntelligencePotionV(
    formattedName: "Advanced Intelligence Potion V",
    description: "A potion made through Alchemy.",
    statValues: {
      StatType.int: 15,
    },
    consumableCategory: ConsumableCategory.alchemyPotion,
    duration: 1800,
  ),
  advancedIntelligencePotionVI(
    formattedName: "Advanced Intelligence Potion VI",
    description: "A potion made through Alchemy.",
    statValues: {
      StatType.int: 18,
    },
    consumableCategory: ConsumableCategory.alchemyPotion,
    duration: 1800,
  ),
  advancedIntelligencePotionVII(
    formattedName: "Advanced Intelligence Potion VII",
    description: "A potion made through Alchemy.",
    statValues: {
      StatType.int: 21,
    },
    consumableCategory: ConsumableCategory.alchemyPotion,
    duration: 1800,
  ),
  advancedIntelligencePotionVIII(
    formattedName: "Advanced Intelligence Potion VIII",
    description: "A potion made through Alchemy.",
    statValues: {
      StatType.int: 24,
    },
    consumableCategory: ConsumableCategory.alchemyPotion,
    duration: 1800,
  ),
  advancedIntelligencePotionX(
    formattedName: "Advanced Intelligence Potion X",
    description: "A potion made through Alchemy.",
    statValues: {StatType.int: 30},
    consumableCategory: ConsumableCategory.alchemyPotion,
    duration: 1800,
  ),
  advancedLuckBoostPotion(
    formattedName: "Advanced Luck Boost Potion",
    description:
        "A pungent alchemical concoction that increases LUK by 60 for 2 hours. Alchemists are able to stomach two at a time, but they are too strong for anyone else to drink more than one.",
    statValues: {
      StatType.luk: 60,
    },
    consumableCategory: ConsumableCategory.alchemyPotion,
    duration: 7200,
  ),
  advancedLuckPillI(
    formattedName: "Advanced Luck Pill I",
    description: "A pill made through Alchemy.",
    statValues: {
      StatType.luk: 3,
    },
    consumableCategory: ConsumableCategory.alchemyPotion,
    duration: 1800,
  ),
  advancedLuckPillII(
    formattedName: "Advanced Luck Pill II",
    description: "A pill made through Alchemy.",
    statValues: {
      StatType.luk: 6,
    },
    consumableCategory: ConsumableCategory.alchemyPotion,
    duration: 1800,
  ),
  advancedLuckPillIII(
    formattedName: "Advanced Luck Pill III",
    description: "A pill made through Alchemy.",
    statValues: {
      StatType.luk: 9,
    },
    consumableCategory: ConsumableCategory.alchemyPotion,
    duration: 1800,
  ),
  advancedLuckPillIV(
    formattedName: "Advanced Luck Pill IV",
    description: "A pill made through Alchemy.",
    statValues: {
      StatType.luk: 12,
    },
    consumableCategory: ConsumableCategory.alchemyPotion,
    duration: 1800,
  ),
  advancedLuckPillIX(
    formattedName: "Advanced Luck Pill IX",
    description: "A pill made through Alchemy.",
    statValues: {
      StatType.luk: 27,
    },
    consumableCategory: ConsumableCategory.alchemyPotion,
    duration: 1800,
  ),
  advancedLuckPillV(
    formattedName: "Advanced Luck Pill V",
    description: "A pill made through Alchemy.",
    statValues: {
      StatType.luk: 15,
    },
    consumableCategory: ConsumableCategory.alchemyPotion,
    duration: 1800,
  ),
  advancedLuckPillVI(
    formattedName: "Advanced Luck Pill VI",
    description: "A pill made through Alchemy.",
    statValues: {
      StatType.luk: 18,
    },
    consumableCategory: ConsumableCategory.alchemyPotion,
    duration: 1800,
  ),
  advancedLuckPillVII(
    formattedName: "Advanced Luck Pill VII",
    description: "A pill made through Alchemy.",
    statValues: {
      StatType.luk: 21,
    },
    consumableCategory: ConsumableCategory.alchemyPotion,
    duration: 1800,
  ),
  advancedLuckPillVIII(
    formattedName: "Advanced Luck Pill VIII",
    description: "A pill made through Alchemy.",
    statValues: {
      StatType.luk: 24,
    },
    consumableCategory: ConsumableCategory.alchemyPotion,
    duration: 1800,
  ),
  advancedLuckPillX(
    formattedName: "Advanced Luck Pill X",
    description: "A pill made through Alchemy.",
    statValues: {
      StatType.luk: 30,
    },
    consumableCategory: ConsumableCategory.alchemyPotion,
    duration: 1800,
  ),
  advancedLuckPotionI(
    formattedName: "Advanced Luck Potion I",
    description: "A potion made through Alchemy.",
    statValues: {
      StatType.luk: 3,
    },
    consumableCategory: ConsumableCategory.alchemyPotion,
    duration: 1800,
  ),
  advancedLuckPotionII(
    formattedName: "Advanced Luck Potion II",
    description: "A potion made through Alchemy.",
    statValues: {
      StatType.luk: 6,
    },
    consumableCategory: ConsumableCategory.alchemyPotion,
    duration: 1800,
  ),
  advancedLuckPotionIII(
    formattedName: "Advanced Luck Potion III",
    description: "A potion made through Alchemy.",
    statValues: {StatType.luk: 9},
    consumableCategory: ConsumableCategory.alchemyPotion,
    duration: 1800,
  ),
  advancedLuckPotionIV(
    formattedName: "Advanced Luck Potion IV",
    description: "A potion made through Alchemy.",
    statValues: {StatType.luk: 12},
    consumableCategory: ConsumableCategory.alchemyPotion,
    duration: 1800,
  ),
  advancedLuckPotionIX(
    formattedName: "Advanced Luck Potion IX",
    description: "A potion made through Alchemy.",
    statValues: {StatType.luk: 27},
    consumableCategory: ConsumableCategory.alchemyPotion,
    duration: 1800,
  ),
  advancedLuckPotionV(
    formattedName: "Advanced Luck Potion V",
    description: "A potion made through Alchemy.",
    statValues: {StatType.luk: 15},
    consumableCategory: ConsumableCategory.alchemyPotion,
    duration: 1800,
  ),
  advancedLuckPotionVI(
    formattedName: "Advanced Luck Potion VI",
    description: "A potion made through Alchemy.",
    statValues: {StatType.luk: 18},
    consumableCategory: ConsumableCategory.alchemyPotion,
    duration: 1800,
  ),
  advancedLuckPotionVII(
    formattedName: "Advanced Luck Potion VII",
    description: "A potion made through Alchemy.",
    statValues: {
      StatType.luk: 21,
    },
    consumableCategory: ConsumableCategory.alchemyPotion,
    duration: 1800,
  ),
  advancedLuckPotionVIII(
    formattedName: "Advanced Luck Potion VIII",
    description: "A potion made through Alchemy.",
    statValues: {
      StatType.luk: 24,
    },
    consumableCategory: ConsumableCategory.alchemyPotion,
    duration: 1800,
  ),
  advancedLuckPotionX(
    formattedName: "Advanced Luck Potion X",
    description: "A potion made through Alchemy.",
    statValues: {
      StatType.luk: 30,
    },
    consumableCategory: ConsumableCategory.alchemyPotion,
    duration: 1800,
  ),
  advancedMagicPillI(
    formattedName: "Advanced Magic Pill I",
    description: "A pill made through Alchemy.",
    statValues: {
      StatType.mattack: 2,
    },
    consumableCategory: ConsumableCategory.alchemyPotion,
    duration: 1800,
  ),
  advancedMagicPillII(
    formattedName: "Advanced Magic Pill II",
    description: "A pill made through Alchemy.",
    statValues: {StatType.mattack: 4},
    consumableCategory: ConsumableCategory.alchemyPotion,
    duration: 1800,
  ),
  advancedMagicPillIII(
    formattedName: "Advanced Magic Pill III",
    description: "A pill made through Alchemy.",
    statValues: {
      StatType.mattack: 6,
    },
    consumableCategory: ConsumableCategory.alchemyPotion,
    duration: 1800,
  ),
  advancedMagicPillIV(
    formattedName: "Advanced Magic Pill IV",
    description: "A pill made through Alchemy.",
    statValues: {
      StatType.mattack: 8,
    },
    consumableCategory: ConsumableCategory.alchemyPotion,
    duration: 1800,
  ),
  advancedMagicPillV(
    formattedName: "Advanced Magic Pill V",
    description: "A pill made through Alchemy.",
    statValues: {
      StatType.mattack: 10,
    },
    consumableCategory: ConsumableCategory.alchemyPotion,
    duration: 1800,
  ),
  advancedMagicPotionI(
    formattedName: "Advanced Magic Potion I",
    description: "A potion made through Alchemy.",
    statValues: {
      StatType.mattack: 2,
    },
    consumableCategory: ConsumableCategory.alchemyPotion,
    duration: 1800,
  ),
  advancedMagicPotionII(
    formattedName: "Advanced Magic Potion II",
    description: "A potion made through Alchemy.",
    statValues: {
      StatType.mattack: 4,
    },
    consumableCategory: ConsumableCategory.alchemyPotion,
    duration: 1800,
  ),
  advancedMagicPotionIII(
    formattedName: "Advanced Magic Potion III",
    description: "A potion made through Alchemy.",
    statValues: {
      StatType.mattack: 6,
    },
    consumableCategory: ConsumableCategory.alchemyPotion,
    duration: 1800,
  ),
  advancedMagicPotionIV(
    formattedName: "Advanced Magic Potion IV",
    description: "A potion made through Alchemy.",
    statValues: {
      StatType.mattack: 8,
    },
    consumableCategory: ConsumableCategory.alchemyPotion,
    duration: 1800,
  ),
  advancedMagicPotionV(
    formattedName: "Advanced Magic Potion V",
    description: "A potion made through Alchemy.",
    statValues: {
      StatType.mattack: 10,
    },
    consumableCategory: ConsumableCategory.alchemyPotion,
    duration: 1800,
  ),
  advancedManaBoostPotion(
    formattedName: "Advanced Mana Boost Potion",
    description:
        "A pungent alchemical concoction that increases MP by 4000 for 2 hours. Alchemists are able to stomach two at a time, but they are too strong for anyone else to drink more than one.",
    statValues: {StatType.hp: 4000},
    consumableCategory: ConsumableCategory.alchemyPotion,
    duration: 7200,
  ),
  advancedPenetratingBoostPotion(
    formattedName: "Advanced Penetrating Boost Potion",
    description:
        "Alchemy Meisters can make this potion, which increases your Ignore Defense by 20% for 40 minutes.Caution:Normally, only 1 Potion can be used at a time, but Alchemists can use 2 if they are of different types.However, even Alchemists cannot use 2 of the same Potions at once, and Boss Rush's Boost Potions, Great Hero Boost Potions, and Great Blessing Potions cannot be used together. The cooldown is 50 minutes.",
    statValues: {
      StatType.ignoreDefense: 0.2,
    },
    consumableCategory: ConsumableCategory.alchemyPotion,
    duration: 2400,
  ),
  advancedStrengthBoostPotion(
    formattedName: "Advanced Strength Boost Potion",
    description:
        "A pungent alchemical concoction that increases STR by 60 for 2 hours. Alchemists are able to stomach two at a time, but they are too strong for anyone else to drink more than one.",
    statValues: {
      StatType.str: 60,
    },
    consumableCategory: ConsumableCategory.alchemyPotion,
    duration: 7200,
  ),
  advancedStrengthPillI(
    formattedName: "Advanced Strength Pill I",
    description: "A pill made through Alchemy.",
    statValues: {
      StatType.str: 3,
    },
    consumableCategory: ConsumableCategory.alchemyPotion,
    duration: 1800,
  ),
  advancedStrengthPillII(
    formattedName: "Advanced Strength Pill II",
    description: "A pill made through Alchemy.",
    statValues: {
      StatType.str: 6,
    },
    consumableCategory: ConsumableCategory.alchemyPotion,
    duration: 1800,
  ),
  advancedStrengthPillIII(
    formattedName: "Advanced Strength Pill III",
    description: "A pill made through Alchemy.",
    statValues: {
      StatType.str: 9,
    },
    consumableCategory: ConsumableCategory.alchemyPotion,
    duration: 1800,
  ),
  advancedStrengthPillIV(
    formattedName: "Advanced Strength Pill IV",
    description: "A pill made through Alchemy.",
    statValues: {
      StatType.str: 12,
    },
    consumableCategory: ConsumableCategory.alchemyPotion,
    duration: 1800,
  ),
  advancedStrengthPillIX(
    formattedName: "Advanced Strength Pill IX",
    description: "A pill made through Alchemy.",
    statValues: {
      StatType.str: 27,
    },
    consumableCategory: ConsumableCategory.alchemyPotion,
    duration: 1800,
  ),
  advancedStrengthPillV(
    formattedName: "Advanced Strength Pill V",
    description: "A pill made through Alchemy.",
    statValues: {StatType.str: 15},
    consumableCategory: ConsumableCategory.alchemyPotion,
    duration: 1800,
  ),
  advancedStrengthPillVI(
    formattedName: "Advanced Strength Pill VI",
    description: "A pill made through Alchemy.",
    statValues: {StatType.str: 18},
    consumableCategory: ConsumableCategory.alchemyPotion,
    duration: 1800,
  ),
  advancedStrengthPillVII(
    formattedName: "Advanced Strength Pill VII",
    description: "A pill made through Alchemy.",
    statValues: {StatType.str: 21},
    consumableCategory: ConsumableCategory.alchemyPotion,
    duration: 1800,
  ),
  advancedStrengthPillVIII(
    formattedName: "Advanced Strength Pill VIII",
    description: "A pill made through Alchemy.",
    statValues: {
      StatType.str: 24,
    },
    consumableCategory: ConsumableCategory.alchemyPotion,
    duration: 1800,
  ),
  advancedStrengthPillX(
    formattedName: "Advanced Strength Pill X",
    description: "A pill made through Alchemy.",
    statValues: {
      StatType.str: 30,
    },
    consumableCategory: ConsumableCategory.alchemyPotion,
    duration: 1800,
  ),
  advancedStrengthPotionI(
    formattedName: "Advanced Strength Potion I",
    description: "A potion made through Alchemy.",
    statValues: {
      StatType.str: 3,
    },
    consumableCategory: ConsumableCategory.alchemyPotion,
    duration: 1800,
  ),
  advancedStrengthPotionII(
    formattedName: "Advanced Strength Potion II",
    description: "A potion made through Alchemy.",
    statValues: {
      StatType.str: 6,
    },
    consumableCategory: ConsumableCategory.alchemyPotion,
    duration: 1800,
  ),
  advancedStrengthPotionIII(
    formattedName: "Advanced Strength Potion III",
    description: "A potion made through Alchemy.",
    statValues: {
      StatType.str: 9,
    },
    consumableCategory: ConsumableCategory.alchemyPotion,
    duration: 1800,
  ),
  advancedStrengthPotionIV(
    formattedName: "Advanced Strength Potion IV",
    description: "A potion made through Alchemy.",
    statValues: {
      StatType.str: 12,
    },
    consumableCategory: ConsumableCategory.alchemyPotion,
    duration: 1800,
  ),
  advancedStrengthPotionIX(
    formattedName: "Advanced Strength Potion IX",
    description: "A potion made through Alchemy.",
    statValues: {
      StatType.str: 27,
    },
    consumableCategory: ConsumableCategory.alchemyPotion,
    duration: 1800,
  ),
  advancedStrengthPotionV(
    formattedName: "Advanced Strength Potion V",
    description: "A potion made through Alchemy.",
    statValues: {
      StatType.str: 15,
    },
    consumableCategory: ConsumableCategory.alchemyPotion,
    duration: 1800,
  ),
  advancedStrengthPotionVI(
    formattedName: "Advanced Strength Potion VI",
    description: "A potion made through Alchemy.",
    statValues: {StatType.str: 18},
    consumableCategory: ConsumableCategory.alchemyPotion,
    duration: 1800,
  ),
  advancedStrengthPotionVII(
    formattedName: "Advanced Strength Potion VII",
    description: "A potion made through Alchemy.",
    statValues: {StatType.str: 21},
    consumableCategory: ConsumableCategory.alchemyPotion,
    duration: 1800,
  ),
  advancedStrengthPotionVIII(
    formattedName: "Advanced Strength Potion VIII",
    description: "A potion made through Alchemy.",
    statValues: {StatType.str: 24},
    consumableCategory: ConsumableCategory.alchemyPotion,
    duration: 1800,
  ),
  advancedStrengthPotionX(
    formattedName: "Advanced Strength Potion X",
    description: "A potion made through Alchemy.",
    statValues: {StatType.str: 30},
    consumableCategory: ConsumableCategory.alchemyPotion,
    duration: 1800,
  ),
  attackPillI(
    formattedName: "Attack Pill I",
    description: "A pill made through Alchemy.",
    statValues: {
      StatType.attack: 2,
    },
    consumableCategory: ConsumableCategory.alchemyPotion,
    duration: 900,
  ),
  attackPillII(
    formattedName: "Attack Pill II",
    description: "A pill made through Alchemy.",
    statValues: {
      StatType.attack: 4,
    },
    consumableCategory: ConsumableCategory.alchemyPotion,
    duration: 900,
  ),
  attackPillIII(
    formattedName: "Attack Pill III",
    description: "A pill made through Alchemy.",
    statValues: {
      StatType.attack: 6,
    },
    consumableCategory: ConsumableCategory.alchemyPotion,
    duration: 900,
  ),
  attackPillIV(
    formattedName: "Attack Pill IV",
    description: "A pill made through Alchemy.",
    statValues: {
      StatType.attack: 8,
    },
    consumableCategory: ConsumableCategory.alchemyPotion,
    duration: 900,
  ),
  attackPillV(
    formattedName: "Attack Pill V",
    description: "A pill made through Alchemy.",
    statValues: {
      StatType.attack: 10,
    },
    consumableCategory: ConsumableCategory.alchemyPotion,
    duration: 900,
  ),
  attackPotionI(
    formattedName: "Attack Potion I",
    description: "A potion made through Alchemy.",
    statValues: {
      StatType.attack: 2,
    },
    consumableCategory: ConsumableCategory.alchemyPotion,
    duration: 900,
  ),
  attackPotionII(
    formattedName: "Attack Potion II",
    description: "A potion made through Alchemy.",
    statValues: {
      StatType.attack: 4,
    },
    consumableCategory: ConsumableCategory.alchemyPotion,
    duration: 900,
  ),
  attackPotionIII(
    formattedName: "Attack Potion III",
    description: "A potion made through Alchemy.",
    statValues: {
      StatType.attack: 6,
    },
    consumableCategory: ConsumableCategory.alchemyPotion,
    duration: 900,
  ),
  attackPotionIV(
    formattedName: "Attack Potion IV",
    description: "A potion made through Alchemy.",
    statValues: {StatType.attack: 8},
    consumableCategory: ConsumableCategory.alchemyPotion,
    duration: 900,
  ),
  attackPotionV(
    formattedName: "Attack Potion V",
    description: "A potion made through Alchemy.",
    statValues: {StatType.attack: 10},
    consumableCategory: ConsumableCategory.alchemyPotion,
    duration: 900,
  ),
  blessingPotion(
    formattedName: "Blessing Potion",
    description:
        "A pungent alchemical concoction that increases STR, DEX, INT, LUK, Speed and Jump by 20 for 2 hours. Alchemists are able to stomach two at a time, but they are too strong for anyone else to drink more than one.",
    statValues: {
      StatType.allStats: 20,
      StatType.speedJump: 20,
    },
    consumableCategory: ConsumableCategory.alchemyPotion,
    duration: 7200,
  ),
  bossRushBoostPotion(
    formattedName: "Boss Rush Boost Potion",
    description:
        "Alchemy Masters and Renowned Masters can make this potion that increases your Boss damage by 10% for 40 minutes.Caution:Normally, only 1 Potion can be used at a time, but Alchemists can use 2 if they are of different types.",
    statValues: {
      StatType.bossDamage: 0.1,
    },
    consumableCategory: ConsumableCategory.alchemyPotion,
    duration: 2400,
  ),
  defensePillI(
    formattedName: "Defense Pill I",
    description: "A pill made through Alchemy.",
    statValues: {
      StatType.defense: 50,
    },
    consumableCategory: ConsumableCategory.alchemyPotion,
    duration: 900,
  ),
  defensePillII(
    formattedName: "Defense Pill II",
    description: "A pill made through Alchemy.",
    statValues: {
      StatType.defense: 70,
    },
    consumableCategory: ConsumableCategory.alchemyPotion,
    duration: 900,
  ),
  defensePillIII(
    formattedName: "Defense Pill III",
    description: "A pill made through Alchemy.",
    statValues: {
      StatType.defense: 90,
    },
    consumableCategory: ConsumableCategory.alchemyPotion,
    duration: 900,
  ),
  defensePillIV(
    formattedName: "Defense Pill IV",
    description: "A pill made through Alchemy.",
    statValues: {
      StatType.defense: 110,
    },
    consumableCategory: ConsumableCategory.alchemyPotion,
    duration: 900,
  ),
  defensePillIX(
    formattedName: "Defense Pill IX",
    description: "A pill made through Alchemy.",
    statValues: {StatType.defense: 210},
    consumableCategory: ConsumableCategory.alchemyPotion,
    duration: 900,
  ),
  defensePillV(
    formattedName: "Defense Pill V",
    description: "A pill made through Alchemy.",
    statValues: {
      StatType.defense: 130,
    },
    consumableCategory: ConsumableCategory.alchemyPotion,
    duration: 900,
  ),
  defensePillVI(
    formattedName: "Defense Pill VI",
    description: "A pill made through Alchemy.",
    statValues: {
      StatType.defense: 150,
    },
    consumableCategory: ConsumableCategory.alchemyPotion,
    duration: 900,
  ),
  defensePillVII(
    formattedName: "Defense Pill VII",
    description: "A pill made through Alchemy.",
    statValues: {
      StatType.defense: 170,
    },
    consumableCategory: ConsumableCategory.alchemyPotion,
    duration: 900,
  ),
  defensePillVIII(
    formattedName: "Defense Pill VIII",
    description: "A pill made through Alchemy.",
    statValues: {
      StatType.defense: 190,
    },
    consumableCategory: ConsumableCategory.alchemyPotion,
    duration: 900,
  ),
  defensePillX(
    formattedName: "Defense Pill X",
    description: "A pill made through Alchemy.",
    statValues: {
      StatType.defense: 230,
    },
    consumableCategory: ConsumableCategory.alchemyPotion,
    duration: 900,
  ),
  defensePotionI(
    formattedName: "Defense Potion I",
    description: "A potion made through Alchemy.",
    statValues: {
      StatType.defense: 50,
    },
    consumableCategory: ConsumableCategory.alchemyPotion,
    duration: 900,
  ),
  defensePotionII(
    formattedName: "Defense Potion II",
    description: "A potion made through Alchemy.",
    statValues: {
      StatType.defense: 70,
    },
    consumableCategory: ConsumableCategory.alchemyPotion,
    duration: 900,
  ),
  defensePotionIII(
    formattedName: "Defense Potion III",
    description: "A potion made through Alchemy.",
    statValues: {
      StatType.defense: 90,
    },
    consumableCategory: ConsumableCategory.alchemyPotion,
    duration: 900,
  ),
  defensePotionIV(
    formattedName: "Defense Potion IV",
    description: "A potion made through Alchemy.",
    statValues: {
      StatType.defense: 110,
    },
    consumableCategory: ConsumableCategory.alchemyPotion,
    duration: 900,
  ),
  defensePotionIX(
    formattedName: "Defense Potion IX",
    description: "A potion made through Alchemy.",
    statValues: {StatType.defense: 210},
    consumableCategory: ConsumableCategory.alchemyPotion,
    duration: 900,
  ),
  defensePotionV(
    formattedName: "Defense Potion V",
    description: "A potion made through Alchemy.",
    statValues: {StatType.defense: 130},
    consumableCategory: ConsumableCategory.alchemyPotion,
    duration: 900,
  ),
  defensePotionVI(
    formattedName: "Defense Potion VI",
    description: "A potion made through Alchemy.",
    statValues: {
      StatType.defense: 150,
    },
    consumableCategory: ConsumableCategory.alchemyPotion,
    duration: 900,
  ),
  defensePotionVII(
    formattedName: "Defense Potion VII",
    description: "A potion made through Alchemy.",
    statValues: {
      StatType.defense: 170,
    },
    consumableCategory: ConsumableCategory.alchemyPotion,
    duration: 900,
  ),
  defensePotionVIII(
    formattedName: "Defense Potion VIII",
    description: "A potion made through Alchemy.",
    statValues: {
      StatType.defense: 190,
    },
    consumableCategory: ConsumableCategory.alchemyPotion,
    duration: 900,
  ),
  defensePotionX(
    formattedName: "Defense Potion X",
    description: "A potion made through Alchemy.",
    statValues: {
      StatType.defense: 230,
    },
    consumableCategory: ConsumableCategory.alchemyPotion,
    duration: 900,
  ),
  dexterityBoostPotion(
    formattedName: "Dexterity Boost Potion",
    description:
        "A pungent alchemical concoction that increases DEX by 40 for 2 hours. Alchemists are able to stomach two at a time, but they are too strong for anyone else to drink more than one.",
    statValues: {
      StatType.dex: 40,
    },
    consumableCategory: ConsumableCategory.alchemyPotion,
    duration: 7200,
  ),
  dexterityPillI(
    formattedName: "Dexterity Pill I",
    description: "A pill made through Alchemy.",
    statValues: {
      StatType.dex: 3,
    },
    consumableCategory: ConsumableCategory.alchemyPotion,
    duration: 900,
  ),
  dexterityPillII(
    formattedName: "Dexterity Pill II",
    description: "A pill made through Alchemy.",
    statValues: {
      StatType.dex: 6,
    },
    consumableCategory: ConsumableCategory.alchemyPotion,
    duration: 900,
  ),
  dexterityPillIII(
    formattedName: "Dexterity Pill III",
    description: "A pill made through Alchemy.",
    statValues: {
      StatType.dex: 9,
    },
    consumableCategory: ConsumableCategory.alchemyPotion,
    duration: 900,
  ),
  dexterityPillIV(
    formattedName: "Dexterity Pill IV",
    description: "A pill made through Alchemy.",
    statValues: {
      StatType.dex: 12,
    },
    consumableCategory: ConsumableCategory.alchemyPotion,
    duration: 900,
  ),
  dexterityPillIX(
    formattedName: "Dexterity Pill IX",
    description: "A pill made through Alchemy.",
    statValues: {
      StatType.dex: 27,
    },
    consumableCategory: ConsumableCategory.alchemyPotion,
    duration: 900,
  ),
  dexterityPillV(
    formattedName: "Dexterity Pill V",
    description: "A pill made through Alchemy.",
    statValues: {
      StatType.dex: 15,
    },
    consumableCategory: ConsumableCategory.alchemyPotion,
    duration: 900,
  ),
  dexterityPillVI(
    formattedName: "Dexterity Pill VI",
    description: "A pill made through Alchemy.",
    statValues: {
      StatType.dex: 18,
    },
    consumableCategory: ConsumableCategory.alchemyPotion,
    duration: 900,
  ),
  dexterityPillVII(
    formattedName: "Dexterity Pill VII",
    description: "A pill made through Alchemy.",
    statValues: {
      StatType.dex: 21,
    },
    consumableCategory: ConsumableCategory.alchemyPotion,
    duration: 900,
  ),
  dexterityPillVIII(
    formattedName: "Dexterity Pill VIII",
    description: "A pill made through Alchemy.",
    statValues: {
      StatType.dex: 24,
    },
    consumableCategory: ConsumableCategory.alchemyPotion,
    duration: 900,
  ),
  dexterityPillX(
    formattedName: "Dexterity Pill X",
    description: "A pill made through Alchemy.",
    statValues: {
      StatType.dex: 30,
    },
    consumableCategory: ConsumableCategory.alchemyPotion,
    duration: 900,
  ),
  dexterityPotionI(
    formattedName: "Dexterity Potion I",
    description: "A potion made through Alchemy.",
    statValues: {
      StatType.dex: 3,
    },
    consumableCategory: ConsumableCategory.alchemyPotion,
    duration: 900,
  ),
  dexterityPotionII(
    formattedName: "Dexterity Potion II",
    description: "A potion made through Alchemy.",
    statValues: {
      StatType.dex: 6,
    },
    consumableCategory: ConsumableCategory.alchemyPotion,
    duration: 900,
  ),
  dexterityPotionIII(
    formattedName: "Dexterity Potion III",
    description: "A potion made through Alchemy.",
    statValues: {
      StatType.dex: 9,
    },
    consumableCategory: ConsumableCategory.alchemyPotion,
    duration: 900,
  ),
  dexterityPotionIV(
    formattedName: "Dexterity Potion IV",
    description: "A potion made through Alchemy.",
    statValues: {
      StatType.dex: 12,
    },
    consumableCategory: ConsumableCategory.alchemyPotion,
    duration: 900,
  ),
  dexterityPotionIX(
    formattedName: "Dexterity Potion IX",
    description: "A potion made through Alchemy.",
    statValues: {
      StatType.dex: 27,
    },
    consumableCategory: ConsumableCategory.alchemyPotion,
    duration: 900,
  ),
  dexterityPotionV(
    formattedName: "Dexterity Potion V",
    description: "A potion made through Alchemy.",
    statValues: {
      StatType.dex: 15,
    },
    consumableCategory: ConsumableCategory.alchemyPotion,
    duration: 900,
  ),
  dexterityPotionVI(
    formattedName: "Dexterity Potion VI",
    description: "A potion made through Alchemy.",
    statValues: {
      StatType.dex: 18,
    },
    consumableCategory: ConsumableCategory.alchemyPotion,
    duration: 900,
  ),
  dexterityPotionVII(
    formattedName: "Dexterity Potion VII",
    description: "A potion made through Alchemy.",
    statValues: {StatType.dex: 21},
    consumableCategory: ConsumableCategory.alchemyPotion,
    duration: 900,
  ),
  dexterityPotionVIII(
    formattedName: "Dexterity Potion VIII",
    description: "A potion made through Alchemy.",
    statValues: {
      StatType.dex: 24,
    },
    consumableCategory: ConsumableCategory.alchemyPotion,
    duration: 900,
  ),
  dexterityPotionX(
    formattedName: "Dexterity Potion X",
    description: "A potion made through Alchemy.",
    statValues: {
      StatType.dex: 30,
    },
    consumableCategory: ConsumableCategory.alchemyPotion,
    duration: 900,
  ),
  exceptionalBlessingPotion(
    formattedName: "Exceptional Blessing Potion",
    description:
        "A pungent alchemical concoction that increases STR, DEX, INT, and LUK by 50, and both Speed and Jump to maximum values, for 2 hours. Alchemists are able to stomach two at a time, but they are too strong for anyone else to drink more than one.",
    statValues: {StatType.allStats: 50, StatType.speedJump: 80},
    consumableCategory: ConsumableCategory.alchemyPotion,
    duration: 7200,
  ),
  exceptionalConcentrationPotion(
    formattedName: "Exceptional Concentration Potion",
    description:
        "A pungent alchemical concoction that increases Critical Rate by 10% for 2 hours. Alchemists are able to stomach two at a time, but they are too strong for anyone else to drink more than one.",
    statValues: {
      StatType.critRate: 0.1,
    },
    consumableCategory: ConsumableCategory.alchemyPotion,
    duration: 7200,
  ),
  exceptionalDexterityBoostPotion(
    formattedName: "Exceptional Dexterity Boost Potion",
    description:
        "A pungent alchemical concoction that increases DEX by 80 for 2 hours. Alchemists are able to stomach two at a time, but they are too strong for anyone else to drink more than one.",
    statValues: {StatType.dex: 80},
    consumableCategory: ConsumableCategory.alchemyPotion,
    duration: 7200,
  ),
  exceptionalFortitudePotion(
    formattedName: "Exceptional Fortitude Potion",
    description:
        "A pungent alchemical concoction that increases Max HP by 6000 for 2 hours. Alchemists are able to stomach two at a time, but they are too strong for anyone else to drink more than one.",
    statValues: {
      StatType.hp: 6000,
    },
    consumableCategory: ConsumableCategory.alchemyPotion,
    duration: 7200,
  ),
  ancientTreeSap(
    formattedName: "Ancient Tree Sap",
    description: "Sap of a thousands-of-years-old tree.",
    statValues: {
      StatType.mattack: 10,
    },
    consumableCategory: ConsumableCategory.food,
    duration: 300,
  ),
  babyDragonFood(
    formattedName: "Baby Dragon Food",
    description:
        "A delicious bowl of baby food for a baby dragon. Grants attack +7 for 20 minutes.Can be purchased at the General Store in Leafre.",
    statValues: {
      StatType.attack: 7,
    },
    consumableCategory: ConsumableCategory.food,
    duration: 1200,
  ),
  bananaGrahamPie(
    formattedName: "Banana Graham Pie",
    description: "This scrumptious pie is sure to lighten your spirits!",
    statValues: {StatType.mattack: 120, StatType.speedJump: 10},
    consumableCategory: ConsumableCategory.food,
    duration: 600,
  ),
  bodyPhysicsMedicine(
    formattedName: "Body & Physics Medicine",
    description:
        "A hot, soup-like medicine made out of snake tails. Drinking this will revitalize the body to the tune of Attack +8 for 15 minutes.",
    statValues: {
      StatType.attack: 8,
    },
    consumableCategory: ConsumableCategory.food,
    duration: 900,
  ),
  candiedApple(
    formattedName: "Candied Apple",
    description:
        "A small apple pierced with a stick and glazed with sugary candy.",
    statValues: {
      StatType.allStats: 7,
    },
    consumableCategory: ConsumableCategory.food,
    duration: 1800,
  ),
  cider(
    formattedName: "Cider",
    description: "Cool soda.",
    statValues: {
      StatType.attack: 20,
    },
    consumableCategory: ConsumableCategory.food,
    duration: 300,
  ),
  crystalizedPineappleChew(
    formattedName: "Crystalized Pineapple Chew",
    description: "A very sweet, home-made pineapple chew.",
    statValues: {
      StatType.attack: 20,
    },
    consumableCategory: ConsumableCategory.food,
    duration: 420,
  ),
  drakesBlood(
    formattedName: "Drake's Blood",
    description: "Drake's blood.",
    statValues: {
      StatType.attack: 8,
    },
    consumableCategory: ConsumableCategory.food,
    duration: 300,
  ),
  drakesMeat(
    formattedName: "Drake's Meat",
    description: "Yummy drake meat.",
    statValues: {StatType.defense: 100},
    consumableCategory: ConsumableCategory.food,
    duration: 300,
  ),
  fairysHoney(
    formattedName: "Fairy's Honey",
    description: "This honey is a fairy favorite.",
    statValues: {
      StatType.dex: 10,
    },
    consumableCategory: ConsumableCategory.food,
    duration: 300,
  ),
  geltChocolate(
    formattedName: "Gelt Chocolate",
    description:
        "A special piece of tasty chocolate given out at the Festival of Lights.",
    statValues: {
      StatType.attack: 120,
      StatType.defense: 30,
      StatType.speedJump: 10,
    },
    consumableCategory: ConsumableCategory.food,
    duration: 600,
  ),
  jigajuice(
    formattedName: "JigaJuice",
    description:
        "A futuristic power pack full of liquid fuel synthesized by T-1337. Drink at your own risk! Gives the user a sudden jolting surge of energy, so use it or lose it! [Gives +1000 Magic Attack for 5 seconds.]",
    statValues: {StatType.mattack: 1000},
    consumableCategory: ConsumableCategory.food,
    duration: 5,
  ),
  kuih(
    formattedName: "Kuih",
    description:
        "These sweet, bite-sized delights are a favorite pastry dish enjoyed during parties or while having tea.",
    statValues: {
      StatType.speed: 10,
    },
    consumableCategory: ConsumableCategory.food,
    duration: 1800,
  ),
  masteryMedicine(
    formattedName: "Mastery Medicine",
    description:
        "A hot, soup-like medicine that allegedly turns students into bona-fide Masters.",
    statValues: {
      StatType.mattack: 10,
    },
    consumableCategory: ConsumableCategory.food,
    duration: 900,
  ),
  mindHeartMedicine(
    formattedName: "Mind & Heart Medicine",
    description:
        "Herbal medicine made from bear paws. Brings clarity to the mind.",
    statValues: {StatType.dex: 10},
    consumableCategory: ConsumableCategory.food,
    duration: 900,
  ),
  naricainsDemonElixir(
    formattedName: "Naricain's Demon Elixir",
    description:
        "A fiery black liquid that gives the user the power of a thousand demons when consumed.",
    statValues: {StatType.attack: 140},
    consumableCategory: ConsumableCategory.food,
    duration: 480,
  ),
  onyxApple(
    formattedName: "Onyx Apple",
    description: "A rare, ripe apple imbued with power.",
    statValues: {
      StatType.attackMattack: 100,
      StatType.defense: 20,
    },
    consumableCategory: ConsumableCategory.food,
    duration: 600,
  ),
  ssiwsCheese(
    formattedName: "Ssiws Cheese",
    description:
        "Cheese from the alternate dimension of Versal. Looks funny but smells quite nice.",
    statValues: {StatType.mattack: 220},
    consumableCategory: ConsumableCategory.food,
    duration: 120,
  ),
  takoyakiJumbo(
    formattedName: "Takoyaki (jumbo)",
    description: "Two servings worth of Takoyaki.",
    statValues: {StatType.attack: 8},
    consumableCategory: ConsumableCategory.food,
    duration: 600,
  ),
  takoyakiOctopusBall(
    formattedName: "Takoyaki (Octopus Ball)",
    description: "A hot, tasty-looking Takoyaki.",
    statValues: {StatType.attack: 8},
    consumableCategory: ConsumableCategory.food,
    duration: 300,
  ),
  unripeOnyxApple(
    formattedName: "Unripe Onyx Apple",
    description: "A mysterious and unripe Onyx Apple.",
    statValues: {
      StatType.attack: 60,
      StatType.mattack: 70,
      StatType.defense: 10
    },
    consumableCategory: ConsumableCategory.food,
    duration: 60,
  ),
  yakisoba(
    formattedName: "Yakisoba",
    description:
        "A bowl of Yakisoba which includes vegetable, seafood, and noodles mixed with a delicious sauce.",
    statValues: {StatType.mattack: 10},
    consumableCategory: ConsumableCategory.food,
    duration: 300,
  ),
  yakisobax2(
    formattedName: "Yakisoba (x2)",
    description:
        "Double the serving of a normal bowl of Yakisoba which includes vegetable, seafood, and noodles mixed with a delicious sauce.",
    statValues: {StatType.mattack: 10},
    consumableCategory: ConsumableCategory.food,
    duration: 600,
  ),
  blueStarPotion(
    formattedName: "Blue Star Potion",
    description:
        "A legendary fairy potion, containing blue star fragments.Warning:Does not stack with other potions and Star Potions of different kind.Effects only work in the Root Abyss.",
    statValues: {
      StatType.ignoreDefense: 0.2,
    },
    consumableCategory: ConsumableCategory.potion,
    duration: 7200,
  ),
  dexterityPill(
    formattedName: "Dexterity Pill",
    description: "Enhances your skills as a sniper.",
    statValues: {
      StatType.dex: 10,
    },
    consumableCategory: ConsumableCategory.potion,
    duration: 600,
  ),
  dexterityPotion(
    formattedName: "Dexterity Potion",
    description: "Gives you a burst of speed.",
    statValues: {
      StatType.dex: 5,
    },
    consumableCategory: ConsumableCategory.potion,
    duration: 180,
  ),
  elixirofDarkness(
    formattedName: "Elixir of Darkness",
    description:
        "A mysterious concoction of herbs brewed deep within the mountains of El Nath.",
    statValues: {StatType.mattack: 200, StatType.defense: -25},
    consumableCategory: ConsumableCategory.potion,
    duration: 300,
  ),
  extremeBluePotion(
    formattedName: "Extreme Blue Potion",
    description: "A blue potion from Monster Park.",
    statValues: {
      StatType.mp: 2000,
      StatType.mattack: 30,
    },
    consumableCategory: ConsumableCategory.potion,
    duration: 1800,
  ),
  extremeGoldPotion(
    formattedName: "Extreme Gold Potion",
    description: "A gold potion from Monster Park.",
    statValues: {StatType.expAdditional: 0.1},
    consumableCategory: ConsumableCategory.potion,
    duration: 1800,
  ),
  extremeGreenPotion(
    formattedName: "Extreme Green Potion",
    description: "A green potion from Monster Park.",
    statValues: {StatType.attackSpeed: 1},
    consumableCategory: ConsumableCategory.potion,
    duration: 1800,
  ),
  extremeRedPotion(
    formattedName: "Extreme Red Potion",
    description: "A red potion from Monster Park.",
    statValues: {
      StatType.hp: 2000,
      StatType.attack: 30,
    },
    consumableCategory: ConsumableCategory.potion,
    duration: 1800,
  ),
  goldStarPotion(
    formattedName: "Gold Star Potion",
    description:
        "A legendary fairy potion, containing gold star fragments.Warning:Does not stack with other potions and Star Potions of different kind.Effects only work in the Root Abyss.",
    statValues: {
      StatType.attackMattack: 20,
    },
    consumableCategory: ConsumableCategory.potion,
    duration: 7200,
  ),
  golluxRubyDominancePotion(
    formattedName: "Gollux Ruby Dominance Potion",
    description:
        "A legendary fairy potion containing red star fragments.Does not stack with other potions.Effects only work against Gollux.",
    statValues: {
      StatType.bossDamage: 0.2,
    },
    consumableCategory: ConsumableCategory.potion,
    duration: 3600,
  ),
  golluxSapphirePiercingPotion(
    formattedName: "Gollux Sapphire Piercing Potion",
    description:
        "A legendary fairy potion containing blue star fragments.Does not stack with other potions.Effects only work against Gollux.",
    statValues: {
      StatType.ignoreDefense: 0.2,
    },
    consumableCategory: ConsumableCategory.potion,
    duration: 3600,
  ),
  magicPill(
    formattedName: "Magic Pill",
    description: "A pill of concentrated magic potion.",
    statValues: {
      StatType.mattack: 5,
    },
    consumableCategory: ConsumableCategory.potion,
    duration: 600,
  ),
  magicPotion(
    formattedName: "Magic Potion",
    description: "Increases magic attack.",
    statValues: {
      StatType.mattack: 5,
    },
    consumableCategory: ConsumableCategory.potion,
    duration: 180,
  ),
  painReliever(
    formattedName: "Pain Reliever",
    description: "A special pain reliever from Omega Sector.",
    statValues: {StatType.defense: 300},
    consumableCategory: ConsumableCategory.potion,
    duration: 1800,
  ),
  redStarPotion(
    formattedName: "Red Star Potion",
    description:
        "A legendary fairy potion, containing red star fragments.Warning:Does not stack with other potions and Star Potions of different kind.Effects only work in the Root Abyss.",
    statValues: {
      StatType.bossDamage: 0.2,
    },
    consumableCategory: ConsumableCategory.potion,
    duration: 7200,
  ),
  smallEXPAccumulationPotion(
    formattedName: "Small EXP Accumulation Potion",
    description:
        "A pungent alchemical concoction that increases EXP gains by 10% for 30 minutes. Alchemists are able to stomach two at a time, but they are too strong for anyone else to drink more than one.",
    statValues: {
      StatType.expAdditional: 0.1,
    },
    consumableCategory: ConsumableCategory.potion,
    duration: 1800,
  ),
  sniperPill(
    formattedName: "Sniper Pill",
    description: "Enhances your skills as a sniper.",
    statValues: {
      StatType.dex: 10,
    },
    consumableCategory: ConsumableCategory.potion,
    duration: 600,
  ),
  sniperPotion(
    formattedName: "Sniper Potion",
    description: "Makes you more dexterous for a time.",
    statValues: {
      StatType.dex: 5,
    },
    consumableCategory: ConsumableCategory.potion,
    duration: 300,
  ),
  sparklingBlueStarPotion(
    formattedName: "Sparkling Blue Star Potion",
    description:
        "A legendary fairy potion, containing sparkling blue star fragments.Warning:Does not stack with other potions and Star Potions of different kind.",
    statValues: {
      StatType.ignoreDefense: 0.2,
    },
    consumableCategory: ConsumableCategory.potion,
    duration: 7200,
  ),
  sparklingGoldStarPotion(
    formattedName: "Sparkling Gold Star Potion",
    description:
        "A legendary fairy potion, containing sparkling gold star fragments.Warning:Does not stack with other potions and Star Potions of different kind.",
    statValues: {StatType.attackMattack: 20},
    consumableCategory: ConsumableCategory.potion,
    duration: 7200,
  ),
  sparklingRedStarPotion(
    formattedName: "Sparkling Red Star Potion",
    description:
        "A legendary fairy potion, containing sparkling red star fragments.Warning:Does not stack with other potions and Star Potions of different kind.",
    statValues: {
      StatType.bossDamage: 0.2,
    },
    consumableCategory: ConsumableCategory.potion,
    duration: 7200,
  ),
  speedPill(
    formattedName: "Speed Pill",
    description: "A pill of concentrated speed potion.",
    statValues: {
      StatType.speed: 10,
    },
    consumableCategory: ConsumableCategory.potion,
    duration: 600,
  ),
  speedPotion(
    formattedName: "Speed Potion",
    description: "Increases speed.",
    statValues: {
      StatType.speed: 8,
    },
    consumableCategory: ConsumableCategory.potion,
    duration: 180,
  ),
  warriorElixir(
    formattedName: "Warrior Elixir",
    description: "A special elixir for Warriors.",
    statValues: {
      StatType.attack: 12,
    },
    consumableCategory: ConsumableCategory.potion,
    duration: 480,
  ),
  warriorPill(
    formattedName: "Warrior Pill",
    description: "A pill of concentrated warrior potion.",
    statValues: {StatType.attack: 5},
    consumableCategory: ConsumableCategory.potion,
    duration: 600,
  ),
  warriorPotion(
    formattedName: "Warrior Potion",
    description: "Increases attacking ability.",
    statValues: {StatType.attack: 5},
    consumableCategory: ConsumableCategory.potion,
    duration: 180,
  ),
  wizardElixir(
    formattedName: "Wizard Elixir",
    description: "A special elixir for Magicians.",
    statValues: {
      StatType.mattack: 20,
    },
    consumableCategory: ConsumableCategory.potion,
    duration: 480,
  ),
  wizardPotion(
    formattedName: "Wizard Potion",
    description: "Increases magic attack.",
    statValues: {StatType.mattack: 10},
    consumableCategory: ConsumableCategory.potion,
    duration: 180,
  );

  const ConsumableName({
    required this.formattedName,
    required this.description,
    required this.statValues,
    required this.consumableCategory,
    required this.duration,
  });

  final String formattedName;
  final String description;
  final Map<StatType, num> statValues;
  final ConsumableCategory consumableCategory;
  final int duration;
}
