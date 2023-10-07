// ignore_for_file: constant_identifier_names

import 'package:maplestory_builder/constants/constants.dart';

const List<EquipType> noPotentialCategory = <EquipType>[
  EquipType.medal,
];

const INDEX_0 = 0; // 0-10
const INDEX_11 = 1; // 11-20
const INDEX_21 = 2; // 21-30
const INDEX_31 = 3; // 31-40
const INDEX_41 = 4; // 41-50
const INDEX_51 = 5; // 51-60
const INDEX_61 = 6; // 61-70
const INDEX_71 = 7; // 71-80
const INDEX_81 = 8; // 81-90
const INDEX_91 = 9; // 91-100
const INDEX_101 = 10; // 101-110
const INDEX_111 = 11; // 111-150
const INDEX_151 = 12; // 151+

enum PotentialName {
  // ---------------------------------------------------------------------- //
  // Main Potentials
  // ---------------------------------------------------------------------- //
  // Rare Non Prime
  rareNonPrimeStat,
  rareNonPrimeAtt,
  rareNonPrimeDefense,
  rareNonPrimeHp,
  rareNonPrimeMp,
  // Rare Prime & Epic Non Prime
  rarePrimeStat,
  rarePrimeAtt,
  rarePrimeAllStat,
  rarePrimeDefense,
  rarePrimeHp,
  rarePrimeMp,
  rarePrimeStatPercentage,
  rarePrimeDefensePercentage,
  rarePrimeHpPercentage,
  rarePrimeMpPercentage,
  rarePrimeCriticalRate,
  // Epic Prime & Unique Non Prime
  epicPrimeStatPercentage,
  epicPrimeAttackPercentage,
  epicPrimeDamage,
  epicPrimeDefensePercentage,
  epicPrimeHpPercentage,
  epicPrimeMpPercentage,
  epicPrimeAllStatPercentage,
  epicPrimeCriticalRate,
  epicPrimeIgnoreDefense,
  // Unique Prime & Legendary Non Prime
  uniquePrimeStatPercentage,
  uniquePrimeAttackPercentage,
  uniquePrimeDamage,
  uniquePrimeCriticalRate,
  uniquePrimeDefensePercentage,
  uniquePrimeHpPercentage,
  uniquePrimeMpPercentage,
  uniquePrimeAllStatPercentage,
  uniquePrimeHpRecovery,
  uniquePrimeStat,
  uniquePrimeAtt,
  uniquePrimeBossDamage,
  uniquePrimeIgnoreDefense,
  uniquePrimeDecentMysticDoor,
  uniquePrimeDecentHyperBody,
  unqiuePrimeDecentSharpEyes,
  uniquePrimeDecentHaste,
  // Legendary Prime
  legendaryPrimeStat,
  legendaryPrimeAtt,
  legendaryPrimeStatPercentage,
  legendaryPrimeAttackPercentage,
  legendaryPrimeDamagePercentage,
  legendaryPrimeCriticalRatePercentage,
  legendaryPrimeHpPercentage,
  legendaryPrimeMpPercentage,
  legendaryPrimeAllStatPercentage,
  legendaryPrimeHpRecovery,
  legendaryPrimeSkillCooldown1,
  legendaryPrimeSkillCooldown2,
  legendaryPrimeCriticalDamage,
  legendaryPrimeMesosObtained,
  legendaryPrimeItemDropRate,
  legendaryPrimeBossDamage35,
  legendaryPrimeBossDamage40,
  legendaryPrimeIgnoreDefense35,
  legendaryPrimeIgnoreDefense40,
  legendaryPrimeDecentAdvancedBlessing,
  legendaryPrimeDecentSpeedInfusion,
  legendaryPrimeDecentCombatOrders,
  // ---------------------------------------------------------------------- //
  // Bonus Potentials
  // ---------------------------------------------------------------------- //
  // Rare Non Prime
  bonusRareNonPrimeStat,
  bonusRareNonPrimeAtt,
  bonusRareNonPrimeDefense,
  bonusRareNonPrimeHp,
  bonusRareNonPrimeMp,
  bonusRareNonPrimeSpeed,
  bonusRareNonPrimeJump,
  // Rare Prime & Epic Non Prime
  bonusRarePrimeStat,
  bonusRarePrimeAtt,
  bonusRarePrimeAllStat,
  bonusRarePrimeDefense,
  bonusRarePrimeHp,
  bonusRarePrimeMp,
  bonusRarePrimeStatPercentage,
  bonusRarePrimeHpPercentage,
  bonusRarePrimeMpPercentage,
  bonusRarePrimeDefensePercentage,
  bonusRarePrimeAttackPercentage,
  bonusRarePrimeDamage,
  bonusRarePrimeCriticalRate,
  bonusRarePrimeSpeed,
  bonusRarePrimeJump,
  // Epic Prime & Unique Non Prime
  bonusEpicPrimeStat,
  bonusEpicPrimeAtt,
  bonusEpicPrimeHp,
  bonusEpicPrimeMp,
  bonusEpicPrimeDefense,
  bonusEpicPrimeSpeed,
  bonusEpicPrimeJump,
  bonusEpicPrimeStatPercentage,
  bonusEpicPrimeDefensePercentage,
  bonusEpicPrimeAttackPercentage,
  bonusEpicPrimeDamage,
  bonusEpicPrimeCriticalRate,
  bonusEpicPrimeHpPercentage,
  bonusEpicPrimeMpPercentage,
  bonusEpicPrimeAllStatPercentage,
  bonusEpicPrimeIgnoreDefense,
  // Unique Prime & Legendary Non Prime
  bonusUniquePrimeStat,
  bonusUniquePrimeStatPerLevel,
  bonusUniquePrimeAtt,
  bonusUniquePrimeHp,
  bonusUniquePrimeMp,
  bonusUniquePrimeStatPercentage,
  bonusUniquePrimeAttackPercentage,
  bonusUniquePrimeDamage,
  bonusUniquePrimeCriticalRate,
  bonusUniquePrimeHpPercentage,
  bonusUniquePrimeMpPercentage,
  bonusUniquePrimeAllStatPercentage,
  bonusUniquePrimeHpRecovery,
  bonusUniquePrimeBossDamage,
  bonusUniquePrimeIgnoreDefense,
  // Legendary Prime
  bonusLegendaryPrimeStat,
  bonusLegendaryPrimeAtt,
  bonusLegendaryPrimeHp,
  bonusLegendaryPrimeMp,
  bonusLegendaryPrimeStatPercentage,
  bonusLegendaryPrimeAttackPercentage,
  bonusLegendaryPrimeDamage,
  bonusLegendaryPrimeCriticalRate,
  bonusLegendaryPrimeHpPercentage,
  bonusLegendaryPrimeMpPercentage,
  bonusLegendaryPrimeAllStatPercentage,
  bonusLegendaryPrimeStatPerLevel,
  bonusLegendaryPrimeHpRecovery,
  bonusLegendaryPrimeMesosObtained,
  bonusLegendaryPrimeItemDropRate,
  bonusLegendaryPrimeSkillCooldown1,
  bonusLegendaryPrimeCriticalDamageStatic,
  bonusLegendaryPrimeCriticalDamage,
  bonusLegendaryPrimeBossDamage,
  bonusLegendaryPrimeIgnoreDefense,
}

class BasePotentialLine {
  final StatType statType;
  final bool isPrime;
  final PotentialName potentialName;

  const BasePotentialLine({
    required this.statType,
    required this.potentialName,
    this.isPrime = false,
  });
}

// Defines a Potential Line with all the stats per level to choose from
class PotentialLineRange extends BasePotentialLine {

  const PotentialLineRange({
    required super.statType,
    required super.potentialName,
    super.isPrime = false,
  });
}

// Defines a Potential Line with only a single value to choose from
class PotentialLineStatic extends BasePotentialLine {

  const PotentialLineStatic({
    required super.statType,
    required super.potentialName,
    super.isPrime = false,
  });
}

// Defines a Potential Line with a skill
class PotentialLineSkill extends BasePotentialLine {

  const PotentialLineSkill({
    required super.statType,
    required super.potentialName,
    super.isPrime = false,
  });
}

//Main Potential
const List<num> rareNonPrimeStatAtt = [
  1, // 0-10
  1, // 11-20
  2, // 21-30
  2, // 31-40
  3, // 41-50
  4, // 51-60
  4, // 61-70
  5, // 71-80
  5, // 81-90
  6, // 91-100
  6, // 101-110
  6, // 111-150
  6, // 151+
];
const List<num> rareNonPrimeDefenseHpMp = [
  5, // 0-10
  10, // 11-20
  15, // 21-30
  20, // 31-40
  25, // 41-50
  30, // 51-60
  45, // 61-70
  40, // 71-80
  45, // 81-90
  50, // 91-100
  55, // 101-110
  60, // 111-150
  60, // 151+
];
const List<num> rarePrimeStatAtt = [
  2, // 0-10
  2, // 11-20
  4, // 21-30
  4, // 31-40
  6, // 41-50
  8, // 51-60
  8, // 61-70
  10, // 71-80
  10, // 81-90
  12, // 91-100
  12, // 101-110
  12, // 111-150
  13, // 151+
];
const List<num> rarePrimeAllStat = [
  1, // 0-10
  1, // 11-20
  2, // 21-30
  2, // 31-40
  3, // 41-50
  3, // 51-60
  4, // 61-70
  4, // 71-80
  5, // 81-90
  5, // 91-100
  5, // 101-110
  5, // 111-150
  6, // 151+
];
const List<num> rarePrimeDefenseHpMp = [
  10, // 0-10
  20, // 11-20
  30, // 21-30
  40, // 31-40
  50, // 41-50
  60, // 51-60
  70, // 61-70
  80, // 71-80
  90, // 81-90
  100, // 91-100
  110, // 101-110
  120, // 111-150
  125, // 151+
];
const List<num> rarePrimeStatDefenseHpMpPercentage = [
  0.01, // 0-10
  0.01, // 11-20
  0.01, // 21-30
  0.02, // 31-40
  0.02, // 41-50
  0.02, // 51-60
  0.02, // 61-70
  0.03, // 71-80
  0.03, // 81-90
  0.03, // 91-100
  0.03, // 101-110
  0.03, // 111-150
  0.04, // 151+
];
const num rarePrimeCriticalRate = 0.04; // 0+

const List<num> epicPrimeStatAttackDamageDefenseHpMpPercentage = [
  0.02, // 0-10
  0.02, // 11-20
  0.02, // 21-30
  0.04, // 31-40
  0.04, // 41-50
  0.04, // 51-60
  0.04, // 61-70
  0.06, // 71-80
  0.06, // 81-90
  0.06, // 91-100
  0.06, // 101-110
  0.06, // 111-150
  0.07, // 151+
];
const List<num> epicPrimeAllStatPercentage = [
  0.01, // 0-10
  0.01, // 11-20
  0.01, // 21-30
  0.02, // 31-40
  0.02, // 41-50
  0.02, // 51-60
  0.02, // 61-70
  0.03, // 71-80
  0.03, // 81-90
  0.03, // 91-100
  0.03, // 101-110
  0.03, // 111-150
  0.04, // 151+
];
const num epicPrimeCriticalRate = 0.08; // 50+
const num epicPrimeIgnoreDefense = 0.15; // 50+

const List<num> uniquePrimeStatAttackDamageCriticalRatePercentage = [
  0.03, // 0-10
  0.03, // 11-20
  0.03, // 21-30
  0.06, // 31-40
  0.06, // 41-50
  0.06, // 51-60
  0.06, // 61-70
  0.09, // 71-80
  0.09, // 81-90
  0.09, // 91-100
  0.09, // 101-110
  0.09, // 111-150
  0.10, // 151+
];
const List<num> uniquePrimeDefenseHpMpPercentage = [
  0.03, // 0-10
  0.03, // 11-20
  0.03, // 21-30
  0.06, // 31-40
  0.06, // 41-50
  0.06, // 51-60
  0.06, // 61-70
  0.09, // 71-80
  0.09, // 81-90
  0.09, // 91-100
  0.09, // 101-110
  0.09, // 111-150
  0.09, // 151+
];
const List<num> uniquePrimeAllStatPercentage = [
  0.02, // 0-10
  0.02, // 11-20
  0.02, // 21-30
  0.04, // 31-40
  0.04, // 41-50
  0.04, // 51-60
  0.04, // 61-70
  0.06, // 71-80
  0.06, // 81-90
  0.06, // 91-100
  0.06, // 101-110
  0.06, // 111-150
  0.07, // 151+
];
const List<num> uniquePrimeHpRecovery = [
  0.1, // 0-10
  0.1, // 11-20
  0.1, // 21-30
  0.2, // 31-40
  0.2, // 41-50
  0.2, // 51-60
  0.2, // 61-70
  0.3, // 71-80
  0.3, // 81-90
  0.3, // 91-100
  0.3, // 101-110
  0.3, // 111-150
  0.3, // 151+
];
const List<num> uniquePrimeStatAtt = [
  0, // 0-10
  0, // 11-20
  0, // 21-30
  32, // 31-40
  32, // 41-50
  32, // 51-60
  32, // 61-70
  32, // 71-80
  32, // 81-90
  32, // 91-100
  32, // 101-110
  32, // 111-150
  32, // 151+
];
const num uniquePrimeBossDamage = 0.3; // 100+
const num uniquePrimeIgnoreDefense = 0.3; // 100+

const List<num> legendaryPrimeStatAtt = uniquePrimeStatAtt;
const List<num> legendaryPrimeStatAttackDamageCriticalRatePercentage = [
  0.06, // 0-10
  0.06, // 11-20
  0.06, // 21-30
  0.09, // 31-40
  0.09, // 41-50
  0.09, // 51-60
  0.09, // 61-70
  0.12, // 71-80
  0.12, // 81-90
  0.12, // 91-100
  0.12, // 101-110
  0.12, // 111-150
  0.13, // 151+
];
const List<num> legendaryPrimeHpMpPercentage = [
  0.06, // 0-10
  0.06, // 11-20
  0.06, // 21-30
  0.09, // 31-40
  0.09, // 41-50
  0.09, // 51-60
  0.09, // 61-70
  0.12, // 71-80
  0.12, // 81-90
  0.12, // 91-100
  0.12, // 101-110
  0.12, // 111-150
  0.12, // 151+
];
const List<num> legendaryPrimeAllStatPercentage = [
  0.03, // 0-10
  0.03, // 11-20
  0.03, // 21-30
  0.06, // 31-40
  0.06, // 41-50
  0.06, // 51-60
  0.06, // 61-70
  0.09, // 71-80
  0.09, // 81-90
  0.09, // 91-100
  0.09, // 101-110
  0.09, // 111-150
  0.10, // 151+
];
const List<num> legendaryPrimeHpRecovery = uniquePrimeHpRecovery;
const num legendaryPrimeSkillCooldown1 = 1; // Requires 70+ equipment
const num legendaryPrimeSkillCooldown2 = 2; // Requires 120+ equipment
const List<num> legendaryPrimeCriticalDamage = [
  0, // 0-10
  0, // 11-20
  0, // 21-30
  0, // 31-40
  0, // 41-50
  0.05, // 51-60
  0.06, // 61-70
  0.06, // 71-80
  0.08, // 81-90
  0.08, // 91-100
  0.08, // 101-110
  0.08, // 111-150
  0.08, // 151+
];
const List<num> legendaryPrimeMesosObtainedItemDropRate = [
  0.1, // 0-10
  0.1, // 11-20
  0.1, // 21-30
  0.15, // 31-40
  0.15, // 41-50
  0.15, // 51-60
  0.15, // 61-70
  0.2, // 71-80
  0.2, // 81-90
  0.2, // 91-100
  0.2, // 101-110
  0.2, // 111-150
  0.2, // 151+
];
const num legendaryPrimeBossDamage35 = 0.35; // 100+
const num legendaryPrimeBossDamage40 = 0.4; // 100+
const num legendaryPrimeIgnoreDefense35 = 0.35; // 100+
const num legendaryPrimeIgnoreDefense40 = 0.4; // 100+

// Default that is shared between all equips
const Map<PotentialTier, List<BasePotentialLine>> defaultPotentials = {
  PotentialTier.rare: [
    // Prime
    PotentialLineRange(statType: StatType.strPercentage, isPrime: true, potentialName: PotentialName.rarePrimeStatPercentage),
    PotentialLineRange(statType: StatType.dexPercentage, isPrime: true, potentialName: PotentialName.rarePrimeStatPercentage),
    PotentialLineRange(statType: StatType.lukPercentage, isPrime: true, potentialName: PotentialName.rarePrimeStatPercentage),
    PotentialLineRange(statType: StatType.intPercentage, isPrime: true, potentialName: PotentialName.rarePrimeStatPercentage),
    PotentialLineRange(statType: StatType.hpPercentage, isPrime: true, potentialName: PotentialName.rarePrimeHpPercentage),
    PotentialLineRange(statType: StatType.mpPercentage, isPrime: true, potentialName: PotentialName.rarePrimeMpPercentage),
    PotentialLineRange(statType: StatType.defensePercentage, isPrime: true, potentialName: PotentialName.rarePrimeDefensePercentage),
    PotentialLineRange(statType: StatType.allStats, isPrime: true, potentialName: PotentialName.rarePrimeAllStat),
    PotentialLineRange(statType: StatType.str, isPrime: true, potentialName: PotentialName.rarePrimeStat),
    PotentialLineRange(statType: StatType.dex, isPrime: true, potentialName: PotentialName.rarePrimeStat),
    PotentialLineRange(statType: StatType.int, isPrime: true, potentialName: PotentialName.rarePrimeStat),
    PotentialLineRange(statType: StatType.luk, isPrime: true, potentialName: PotentialName.rarePrimeStat),
    PotentialLineRange(statType: StatType.hp, isPrime: true, potentialName: PotentialName.rarePrimeHp),
    PotentialLineRange(statType: StatType.mp, isPrime: true, potentialName: PotentialName.rarePrimeMp),
    PotentialLineRange(statType: StatType.defense, isPrime: true, potentialName: PotentialName.rarePrimeDefense),
    // Non-Prime
    PotentialLineRange(statType: StatType.str, potentialName: PotentialName.rareNonPrimeStat),
    PotentialLineRange(statType: StatType.dex, potentialName: PotentialName.rareNonPrimeStat),
    PotentialLineRange(statType: StatType.int, potentialName: PotentialName.rareNonPrimeStat),
    PotentialLineRange(statType: StatType.luk, potentialName: PotentialName.rareNonPrimeStat),
    PotentialLineRange(statType: StatType.hp, potentialName: PotentialName.rareNonPrimeHp),
    PotentialLineRange(statType: StatType.mp, potentialName: PotentialName.rareNonPrimeMp),
    PotentialLineRange(statType: StatType.defense, potentialName: PotentialName.rareNonPrimeDefense),
  ],
  PotentialTier.epic: [
    // Prime
    PotentialLineRange(statType: StatType.strPercentage, isPrime: true, potentialName: PotentialName.epicPrimeStatPercentage),
    PotentialLineRange(statType: StatType.dexPercentage, isPrime: true, potentialName: PotentialName.epicPrimeStatPercentage),
    PotentialLineRange(statType: StatType.lukPercentage, isPrime: true, potentialName: PotentialName.epicPrimeStatPercentage),
    PotentialLineRange(statType: StatType.intPercentage, isPrime: true, potentialName: PotentialName.epicPrimeStatPercentage),
    PotentialLineRange(statType: StatType.hpPercentage, isPrime: true, potentialName: PotentialName.epicPrimeHpPercentage),
    PotentialLineRange(statType: StatType.mpPercentage, isPrime: true, potentialName: PotentialName.epicPrimeMpPercentage),
    PotentialLineRange(statType: StatType.defensePercentage, isPrime: true, potentialName: PotentialName.epicPrimeDefensePercentage),
    PotentialLineRange(statType: StatType.allStatsPercentage, isPrime: true, potentialName: PotentialName.epicPrimeAllStatPercentage),
    // Non-Prime
    PotentialLineRange(statType: StatType.strPercentage, potentialName: PotentialName.rarePrimeStatPercentage),
    PotentialLineRange(statType: StatType.dexPercentage, potentialName: PotentialName.rarePrimeStatPercentage),
    PotentialLineRange(statType: StatType.lukPercentage, potentialName: PotentialName.rarePrimeStatPercentage),
    PotentialLineRange(statType: StatType.intPercentage, potentialName: PotentialName.rarePrimeStatPercentage),
    PotentialLineRange(statType: StatType.hpPercentage, potentialName: PotentialName.rarePrimeHpPercentage),
    PotentialLineRange(statType: StatType.mpPercentage, potentialName: PotentialName.rarePrimeMpPercentage),
    PotentialLineRange(statType: StatType.defensePercentage, potentialName: PotentialName.rarePrimeDefensePercentage),
    PotentialLineRange(statType: StatType.str, potentialName: PotentialName.rarePrimeStat),
    PotentialLineRange(statType: StatType.dex, potentialName: PotentialName.rarePrimeStat),
    PotentialLineRange(statType: StatType.int, potentialName: PotentialName.rarePrimeStat),
    PotentialLineRange(statType: StatType.luk, potentialName: PotentialName.rarePrimeStat),
    PotentialLineRange(statType: StatType.allStats, potentialName: PotentialName.rarePrimeAllStat),
    PotentialLineRange(statType: StatType.hp, potentialName: PotentialName.rarePrimeHp),
    PotentialLineRange(statType: StatType.mp, potentialName: PotentialName.rarePrimeMp),
    PotentialLineRange(statType: StatType.defense, potentialName: PotentialName.rarePrimeDefense),
  ],
  PotentialTier.unique: [
    // Prime
    PotentialLineRange(statType: StatType.allStatsPercentage, isPrime: true, potentialName: PotentialName.uniquePrimeAllStatPercentage),
    PotentialLineRange(statType: StatType.strPercentage, isPrime: true, potentialName: PotentialName.uniquePrimeStatPercentage),
    PotentialLineRange(statType: StatType.dexPercentage, isPrime: true, potentialName: PotentialName.uniquePrimeStatPercentage),
    PotentialLineRange(statType: StatType.lukPercentage, isPrime: true, potentialName: PotentialName.uniquePrimeStatPercentage),
    PotentialLineRange(statType: StatType.intPercentage, isPrime: true, potentialName: PotentialName.uniquePrimeStatPercentage),
    PotentialLineRange(statType: StatType.hpPercentage, isPrime: true, potentialName: PotentialName.uniquePrimeHpPercentage),
    PotentialLineRange(statType: StatType.mpPercentage, isPrime: true, potentialName: PotentialName.uniquePrimeMpPercentage),
    // Non-Prime
    PotentialLineRange(statType: StatType.strPercentage, potentialName: PotentialName.epicPrimeStatPercentage),
    PotentialLineRange(statType: StatType.dexPercentage, potentialName: PotentialName.epicPrimeStatPercentage),
    PotentialLineRange(statType: StatType.lukPercentage, potentialName: PotentialName.epicPrimeStatPercentage),
    PotentialLineRange(statType: StatType.intPercentage, potentialName: PotentialName.epicPrimeStatPercentage),
    PotentialLineRange(statType: StatType.hpPercentage, potentialName: PotentialName.epicPrimeHpPercentage),
    PotentialLineRange(statType: StatType.mpPercentage, potentialName: PotentialName.epicPrimeMpPercentage),
    PotentialLineRange(statType: StatType.defensePercentage, potentialName: PotentialName.epicPrimeDefensePercentage),
    PotentialLineRange(statType: StatType.allStatsPercentage, potentialName: PotentialName.epicPrimeAllStatPercentage),
  ],
  PotentialTier.legendary: [
    // Prime
    PotentialLineRange(statType: StatType.allStatsPercentage, isPrime: true, potentialName: PotentialName.legendaryPrimeAllStatPercentage),
    PotentialLineRange(statType: StatType.strPercentage, isPrime: true, potentialName: PotentialName.legendaryPrimeStatPercentage),
    PotentialLineRange(statType: StatType.dexPercentage, isPrime: true, potentialName: PotentialName.legendaryPrimeStatPercentage),
    PotentialLineRange(statType: StatType.lukPercentage, isPrime: true, potentialName: PotentialName.legendaryPrimeStatPercentage),
    PotentialLineRange(statType: StatType.intPercentage, isPrime: true, potentialName: PotentialName.legendaryPrimeStatPercentage),
    PotentialLineRange(statType: StatType.hpPercentage, isPrime: true, potentialName: PotentialName.legendaryPrimeHpPercentage),
    PotentialLineRange(statType: StatType.mpPercentage, isPrime: true, potentialName: PotentialName.legendaryPrimeMpPercentage),
    // Non-Prime
    PotentialLineRange(statType: StatType.allStatsPercentage, potentialName: PotentialName.uniquePrimeAllStatPercentage),
    PotentialLineRange(statType: StatType.strPercentage, potentialName: PotentialName.uniquePrimeStatPercentage),
    PotentialLineRange(statType: StatType.dexPercentage, potentialName: PotentialName.uniquePrimeStatPercentage),
    PotentialLineRange(statType: StatType.lukPercentage, potentialName: PotentialName.uniquePrimeStatPercentage),
    PotentialLineRange(statType: StatType.intPercentage, potentialName: PotentialName.uniquePrimeStatPercentage),
    PotentialLineRange(statType: StatType.hpPercentage, potentialName: PotentialName.uniquePrimeHpPercentage),
    PotentialLineRange(statType: StatType.mpPercentage, potentialName: PotentialName.uniquePrimeMpPercentage),
  ],
};

// Hat
const Map<PotentialTier, List<BasePotentialLine>> hatPotentials = {
  PotentialTier.unique: [
    // Prime
    PotentialLineRange(statType: StatType.hpRecovery, isPrime: true, potentialName: PotentialName.uniquePrimeHpRecovery),
    // TODO: StatType.skill - Decent Mystic Door - requires 70+
  ],
  PotentialTier.legendary: [
    // Prime
    PotentialLineStatic(statType: StatType.skillCooldown, isPrime: true, potentialName: PotentialName.legendaryPrimeSkillCooldown2),
    PotentialLineStatic(statType: StatType.skillCooldown, isPrime: true, potentialName: PotentialName.legendaryPrimeSkillCooldown1),
    PotentialLineRange(statType: StatType.hpRecovery, isPrime: true, potentialName: PotentialName.legendaryPrimeHpRecovery),
    // TODO: StatType.skill - Decent Advanced Blessing - requires 120+
    // Non-Prime
    PotentialLineRange(statType: StatType.hpRecovery, potentialName: PotentialName.uniquePrimeHpRecovery),
    // TODO: StatType.skill - Decent Mystic Door - requires 70+
  ],
};

//Top, Overall
const Map<PotentialTier, List<BasePotentialLine>> topAndOverallPotentials = {
  PotentialTier.unique: [
    // Prime
    PotentialLineRange(statType: StatType.hpRecovery, isPrime: true, potentialName: PotentialName.uniquePrimeHpRecovery),
  ],
  PotentialTier.legendary: [
    // Prime
    PotentialLineRange(statType: StatType.hpRecovery, isPrime: true, potentialName: PotentialName.legendaryPrimeHpRecovery),
    // Non-Prime
    PotentialLineRange(statType: StatType.hpRecovery, potentialName: PotentialName.uniquePrimeHpRecovery),
  ],
};

//Bottom
const Map<PotentialTier, List<BasePotentialLine>> bottomPotentials = {
  PotentialTier.unique: [
    // Prime
    PotentialLineRange(statType: StatType.hpRecovery, isPrime: true, potentialName: PotentialName.uniquePrimeHpRecovery),
    // TODO: StatType.skill - Decent Hyper Body - requires 70+
    
  ],
  PotentialTier.legendary: [
    // Prime
    PotentialLineRange(statType: StatType.hpRecovery, isPrime: true, potentialName: PotentialName.legendaryPrimeHpRecovery),
    // Non-Prime
    PotentialLineRange(statType: StatType.hpRecovery, potentialName: PotentialName.uniquePrimeHpRecovery),
    // TODO: StatType.skill - Decent Hyper Body - requires 70+
  ],
};

//Gloves
const Map<PotentialTier, List<BasePotentialLine>> glovesPotentials = {
  PotentialTier.unique: [
    // Prime
    PotentialLineRange(statType: StatType.hpRecovery, isPrime: true, potentialName: PotentialName.uniquePrimeHpRecovery),
    PotentialLineRange(statType: StatType.str, isPrime: true, potentialName: PotentialName.uniquePrimeStat),
    PotentialLineRange(statType: StatType.dex, isPrime: true, potentialName: PotentialName.uniquePrimeStat),
    PotentialLineRange(statType: StatType.int, isPrime: true, potentialName: PotentialName.uniquePrimeStat),
    PotentialLineRange(statType: StatType.luk, isPrime: true, potentialName: PotentialName.uniquePrimeStat),
    PotentialLineRange(statType: StatType.attack, isPrime: true, potentialName: PotentialName.uniquePrimeAtt),
    PotentialLineRange(statType: StatType.mattack, isPrime: true, potentialName: PotentialName.uniquePrimeAtt),
    // TODO: StatType.skill - Decent Sharp Eyes - requires 120+
  ],
  PotentialTier.legendary: [
    // Prime
    PotentialLineRange(statType: StatType.critDamage, isPrime: true, potentialName: PotentialName.legendaryPrimeCriticalDamage),
    PotentialLineRange(statType: StatType.hpRecovery, isPrime: true, potentialName: PotentialName.legendaryPrimeHpRecovery),
    // TODO: StatType.skill - Decent Speed Infusion - requires 120+
    // Non-Prime
    PotentialLineRange(statType: StatType.str, potentialName: PotentialName.uniquePrimeStat),
    PotentialLineRange(statType: StatType.dex, potentialName: PotentialName.uniquePrimeStat),
    PotentialLineRange(statType: StatType.int, potentialName: PotentialName.uniquePrimeStat),
    PotentialLineRange(statType: StatType.luk, potentialName: PotentialName.uniquePrimeStat),
    PotentialLineRange(statType: StatType.attack, potentialName: PotentialName.uniquePrimeAtt),
    PotentialLineRange(statType: StatType.mattack, potentialName: PotentialName.uniquePrimeAtt),
    PotentialLineRange(statType: StatType.hpRecovery, potentialName: PotentialName.uniquePrimeHpRecovery),
    // TODO: StatType.skill - Decent Sharp Eyes - requires 120+
  ],
};

//Shoes
const Map<PotentialTier, List<BasePotentialLine>> shoesPotentials = {
  PotentialTier.unique: [
    // Prime
    PotentialLineRange(statType: StatType.hpRecovery, isPrime: true, potentialName: PotentialName.uniquePrimeHpRecovery),
    // TODO: StatType.skill - Decent Haste - requires 70+
  ],
  PotentialTier.legendary: [
    // Prime
    PotentialLineRange(statType: StatType.hpRecovery, isPrime: true, potentialName: PotentialName.legendaryPrimeHpRecovery),
    // TODO: StatType.skill - Decent Combat Orders - requires 70+
    // Non-Prime
    PotentialLineRange(statType: StatType.hpRecovery, potentialName: PotentialName.uniquePrimeHpRecovery),
    // TODO: StatType.skill - Decent Haste - requires 70+
  ],
};

//Cape, Belt, Shoulder
const Map<PotentialTier, List<BasePotentialLine>> capeBeltShoulderPotentials = {
  PotentialTier.unique: [
    // Prime
    PotentialLineRange(statType: StatType.hpRecovery, isPrime: true, potentialName: PotentialName.uniquePrimeHpRecovery),
  ],
  PotentialTier.legendary: [
    // Prime
    PotentialLineRange(statType: StatType.hpRecovery, isPrime: true, potentialName: PotentialName.legendaryPrimeHpRecovery),
    // Non-Prime
    PotentialLineRange(statType: StatType.hpRecovery, potentialName: PotentialName.uniquePrimeHpRecovery),
  ],
};

//Face, Eye, Ring, Pendant, Earring
const Map<PotentialTier, List<BasePotentialLine>> faceEyeRingPendantEarringPotentials = {
  PotentialTier.unique: [
    // Prime
    PotentialLineRange(statType: StatType.hpRecovery, isPrime: true, potentialName: PotentialName.uniquePrimeHpRecovery),
  ],
  PotentialTier.legendary: [
    // Prime
    PotentialLineRange(statType: StatType.itemDropRate, isPrime: true, potentialName: PotentialName.legendaryPrimeItemDropRate),
    PotentialLineRange(statType: StatType.mesosObtained, isPrime: true, potentialName: PotentialName.legendaryPrimeMesosObtained),
    PotentialLineRange(statType: StatType.hpRecovery, isPrime: true, potentialName: PotentialName.legendaryPrimeHpRecovery),
    // Non-Prime
    PotentialLineRange(statType: StatType.hpRecovery, potentialName: PotentialName.uniquePrimeHpRecovery),
  ],
};

//Weapon, Secondary
const Map<PotentialTier, List<BasePotentialLine>> weaponSecondaryPotentials = {
  PotentialTier.rare: [
    // Prime
    PotentialLineStatic(statType: StatType.critRate, isPrime: true, potentialName: PotentialName.rarePrimeCriticalRate),
    PotentialLineRange(statType: StatType.attack, isPrime: true, potentialName: PotentialName.rarePrimeAtt),
    PotentialLineRange(statType: StatType.mattack, isPrime: true, potentialName: PotentialName.rarePrimeAtt),
    // Non Prime
    PotentialLineRange(statType: StatType.attack, potentialName: PotentialName.rareNonPrimeAtt),
    PotentialLineRange(statType: StatType.mattack, potentialName: PotentialName.rareNonPrimeAtt),
  ],
  PotentialTier.epic: [
    // Prime
    PotentialLineRange(statType: StatType.attackPercentage, isPrime: true, potentialName: PotentialName.epicPrimeAttackPercentage),
    PotentialLineRange(statType: StatType.mattackPercentage, isPrime: true, potentialName: PotentialName.epicPrimeAttackPercentage),
    PotentialLineStatic(statType: StatType.ignoreDefense, isPrime: true, potentialName: PotentialName.epicPrimeIgnoreDefense),
    PotentialLineRange(statType: StatType.damage, isPrime: true, potentialName: PotentialName.epicPrimeDamage),
    PotentialLineStatic(statType: StatType.critRate, isPrime: true, potentialName: PotentialName.epicPrimeCriticalRate),
    // Non Prime
    PotentialLineStatic(statType: StatType.critRate, potentialName: PotentialName.rarePrimeCriticalRate),
    PotentialLineRange(statType: StatType.attack, potentialName: PotentialName.rarePrimeAtt),
    PotentialLineRange(statType: StatType.mattack, potentialName: PotentialName.rarePrimeAtt),
  ],
  PotentialTier.unique: [
    // Prime
    PotentialLineRange(statType: StatType.attackPercentage, isPrime: true, potentialName: PotentialName.uniquePrimeAttackPercentage),
    PotentialLineRange(statType: StatType.mattackPercentage, isPrime: true, potentialName: PotentialName.uniquePrimeAttackPercentage),
    PotentialLineStatic(statType: StatType.bossDamage, isPrime: true, potentialName: PotentialName.uniquePrimeBossDamage),
    PotentialLineStatic(statType: StatType.ignoreDefense, isPrime: true, potentialName: PotentialName.uniquePrimeIgnoreDefense),
    PotentialLineRange(statType: StatType.damage, isPrime: true, potentialName: PotentialName.uniquePrimeDamage),
    PotentialLineRange(statType: StatType.critRate, isPrime: true, potentialName: PotentialName.uniquePrimeCriticalRate),
    // Non Prime
    PotentialLineRange(statType: StatType.attackPercentage, potentialName: PotentialName.epicPrimeAttackPercentage),
    PotentialLineRange(statType: StatType.mattackPercentage, potentialName: PotentialName.epicPrimeAttackPercentage),
    PotentialLineStatic(statType: StatType.ignoreDefense, potentialName: PotentialName.epicPrimeIgnoreDefense),
    PotentialLineRange(statType: StatType.damage, potentialName: PotentialName.epicPrimeDamage),
    PotentialLineStatic(statType: StatType.critRate, potentialName: PotentialName.epicPrimeCriticalRate),
  ],
  PotentialTier.legendary: [
    // Prime
    PotentialLineRange(statType: StatType.attackPercentage, isPrime: true, potentialName: PotentialName.legendaryPrimeAttackPercentage),
    PotentialLineRange(statType: StatType.mattackPercentage, isPrime: true, potentialName: PotentialName.legendaryPrimeAttackPercentage),
    PotentialLineStatic(statType: StatType.bossDamage, isPrime: true, potentialName: PotentialName.legendaryPrimeBossDamage40),
    PotentialLineStatic(statType: StatType.bossDamage, isPrime: true, potentialName: PotentialName.legendaryPrimeBossDamage35),
    PotentialLineStatic(statType: StatType.ignoreDefense, isPrime: true, potentialName: PotentialName.legendaryPrimeIgnoreDefense40),
    PotentialLineStatic(statType: StatType.ignoreDefense, isPrime: true, potentialName: PotentialName.legendaryPrimeIgnoreDefense35),
    PotentialLineRange(statType: StatType.damage, isPrime: true, potentialName: PotentialName.legendaryPrimeDamagePercentage),
    PotentialLineRange(statType: StatType.critRate, isPrime: true, potentialName: PotentialName.legendaryPrimeCriticalRatePercentage),
    PotentialLineRange(statType: StatType.attack, isPrime: true, potentialName: PotentialName.legendaryPrimeAtt),
    PotentialLineRange(statType: StatType.mattack, isPrime: true, potentialName: PotentialName.legendaryPrimeAtt),
    // Non Prime
    PotentialLineRange(statType: StatType.attackPercentage, potentialName: PotentialName.uniquePrimeAttackPercentage),
    PotentialLineRange(statType: StatType.mattackPercentage, potentialName: PotentialName.uniquePrimeAttackPercentage),
    PotentialLineStatic(statType: StatType.bossDamage, potentialName: PotentialName.uniquePrimeBossDamage),
    PotentialLineStatic(statType: StatType.ignoreDefense, potentialName: PotentialName.uniquePrimeIgnoreDefense),
    PotentialLineRange(statType: StatType.damage, potentialName: PotentialName.uniquePrimeDamage),
    PotentialLineRange(statType: StatType.critRate, potentialName: PotentialName.uniquePrimeCriticalRate),
  ],
};

//Emblem
const Map<PotentialTier, List<BasePotentialLine>> emblemPotentials = {
  PotentialTier.rare: [
    // Prime
    PotentialLineStatic(statType: StatType.critRate, isPrime: true, potentialName: PotentialName.rarePrimeCriticalRate),
    PotentialLineRange(statType: StatType.attack, isPrime: true, potentialName: PotentialName.rarePrimeAtt),
    PotentialLineRange(statType: StatType.mattack, isPrime: true, potentialName: PotentialName.rarePrimeAtt),
    // Non Prime
    PotentialLineRange(statType: StatType.attack, potentialName: PotentialName.rareNonPrimeAtt),
    PotentialLineRange(statType: StatType.mattack, potentialName: PotentialName.rareNonPrimeAtt),
  ],
  PotentialTier.epic: [
    // Prime
    PotentialLineRange(statType: StatType.attackPercentage, isPrime: true, potentialName: PotentialName.epicPrimeAttackPercentage),
    PotentialLineRange(statType: StatType.mattackPercentage, isPrime: true, potentialName: PotentialName.epicPrimeAttackPercentage),
    PotentialLineStatic(statType: StatType.ignoreDefense, isPrime: true, potentialName: PotentialName.epicPrimeIgnoreDefense),
    PotentialLineRange(statType: StatType.damage, isPrime: true, potentialName: PotentialName.epicPrimeDamage),
    PotentialLineStatic(statType: StatType.critRate, isPrime: true, potentialName: PotentialName.epicPrimeCriticalRate),
    // Non Prime
    PotentialLineStatic(statType: StatType.critRate, potentialName: PotentialName.rarePrimeCriticalRate),
    PotentialLineRange(statType: StatType.attack, potentialName: PotentialName.rarePrimeAtt),
    PotentialLineRange(statType: StatType.mattack, potentialName: PotentialName.rarePrimeAtt),
  ],
  PotentialTier.unique: [
    // Prime
    PotentialLineRange(statType: StatType.attackPercentage, isPrime: true, potentialName: PotentialName.uniquePrimeAttackPercentage),
    PotentialLineRange(statType: StatType.mattackPercentage, isPrime: true, potentialName: PotentialName.uniquePrimeAttackPercentage),
    PotentialLineStatic(statType: StatType.ignoreDefense, isPrime: true, potentialName: PotentialName.uniquePrimeIgnoreDefense),
    PotentialLineRange(statType: StatType.damage, isPrime: true, potentialName: PotentialName.uniquePrimeDamage),
    PotentialLineRange(statType: StatType.critRate, isPrime: true, potentialName: PotentialName.uniquePrimeCriticalRate),
    // Non Prime
    PotentialLineRange(statType: StatType.attackPercentage, potentialName: PotentialName.epicPrimeAttackPercentage),
    PotentialLineRange(statType: StatType.mattackPercentage, potentialName: PotentialName.epicPrimeAttackPercentage),
    PotentialLineStatic(statType: StatType.ignoreDefense, potentialName: PotentialName.epicPrimeIgnoreDefense),
    PotentialLineRange(statType: StatType.damage, potentialName: PotentialName.epicPrimeDamage),
    PotentialLineStatic(statType: StatType.critRate, potentialName: PotentialName.epicPrimeCriticalRate),
  ],
  PotentialTier.legendary: [
    // Prime
    PotentialLineRange(statType: StatType.attackPercentage, isPrime: true, potentialName: PotentialName.legendaryPrimeAttackPercentage),
    PotentialLineRange(statType: StatType.mattackPercentage, isPrime: true, potentialName: PotentialName.legendaryPrimeAttackPercentage),
    PotentialLineStatic(statType: StatType.ignoreDefense, isPrime: true, potentialName: PotentialName.legendaryPrimeIgnoreDefense40),
    PotentialLineStatic(statType: StatType.ignoreDefense, isPrime: true, potentialName: PotentialName.legendaryPrimeIgnoreDefense35),
    PotentialLineRange(statType: StatType.damage, isPrime: true, potentialName: PotentialName.legendaryPrimeDamagePercentage),
    PotentialLineRange(statType: StatType.critRate, isPrime: true, potentialName: PotentialName.legendaryPrimeCriticalRatePercentage),
    PotentialLineRange(statType: StatType.attack, isPrime: true, potentialName: PotentialName.legendaryPrimeAtt),
    PotentialLineRange(statType: StatType.mattack, isPrime: true, potentialName: PotentialName.legendaryPrimeAtt),
    // Non Prime
    PotentialLineRange(statType: StatType.attackPercentage, potentialName: PotentialName.uniquePrimeAttackPercentage),
    PotentialLineRange(statType: StatType.mattackPercentage, potentialName: PotentialName.uniquePrimeAttackPercentage),
    PotentialLineStatic(statType: StatType.ignoreDefense,potentialName: PotentialName.uniquePrimeIgnoreDefense),
    PotentialLineRange(statType: StatType.damage, potentialName: PotentialName.uniquePrimeDamage),
    PotentialLineRange(statType: StatType.critRate, potentialName: PotentialName.uniquePrimeCriticalRate),
  ],
};

//Heart, Badge
const Map<PotentialTier, List<BasePotentialLine>> heartAndBadgePotentials = {
  PotentialTier.unique: [
    // Prime
    PotentialLineRange(statType: StatType.hpRecovery, isPrime: true, potentialName: PotentialName.uniquePrimeHpRecovery),
  ],
  PotentialTier.legendary: [
    // Prime
    PotentialLineRange(statType: StatType.hpRecovery, isPrime: true, potentialName: PotentialName.legendaryPrimeHpRecovery),
    // Non-Prime
    PotentialLineRange(statType: StatType.hpRecovery, potentialName: PotentialName.uniquePrimeHpRecovery),
  ],
};


//Bonus Potential
const List<num> bonusRareNonPrimeStat = [
  1, // 0-10
  1, // 11-20
  2, // 21-30
  2, // 31-40
  3, // 41-50
  4, // 51-60
  4, // 61-70
  5, // 71-80
  5, // 81-90
  6, // 91-100
  6, // 101-110
  6, // 111-150
  6, // 151+
];
const List<num> bonusRareNonPrimeAtt = [
  1, // 0-10
  1, // 11-20
  1, // 21-30
  1, // 31-40
  1, // 41-50
  2, // 51-60
  2, // 61-70
  2, // 71-80
  2, // 81-90
  2, // 91-100
  3, // 101-110
  3, // 111-150
  3, // 151+
];
const List<num> bonusRareNonPrimeHpMpDefense = [
  5, // 0-10
  10, // 11-20
  15, // 21-30
  20, // 31-40
  25, // 41-50
  30, // 51-60
  35, // 61-70
  40, // 71-80
  45, // 81-90
  50, // 91-100
  55, // 101-110
  60, // 111-150
  60, // 151+
];
const List<num> bonusRareNonPrimeSpeedJump = [
  1, // 0-10
  1, // 11-20
  1, // 21-30
  2, // 31-40
  2, // 41-50
  2, // 51-60
  2, // 61-70
  3, // 71-80
  3, // 81-90
  3, // 91-100
  3, // 101-110
  4, // 111-150
  4, // 151+
];
const List<num> bonusRarePrimeStat = [
  2, // 0-10
  2, // 11-20
  4, // 21-30
  4, // 31-40
  6, // 41-50
  8, // 51-60
  8, // 61-70
  10, // 71-80
  10, // 81-90
  12, // 91-100
  12, // 101-110
  12, // 111-150
  13, // 151+
];
const List<num> bonusRarePrimeAtt = [
  1, // 0-10
  1, // 11-20
  2, // 21-30
  2, // 31-40
  4, // 41-50
  4, // 51-60
  6, // 61-70
  6, // 71-80
  8, // 81-90
  10, // 91-100
  10, // 101-110
  10, // 111-150
  11, // 151+
];
const List<num> bonusRarePrimeAllStat = [
  1, // 0-10
  1, // 11-20
  2, // 21-30
  2, // 31-40
  3, // 41-50
  3, // 51-60
  4, // 61-70
  4, // 71-80
  5, // 81-90
  5, // 91-100
  5, // 101-110
  5, // 111-150
  6, // 151+
];
const List<num> bonusRarePrimeDefenseHpMp = [
  10, // 0-10
  20, // 11-20
  30, // 21-30
  40, // 31-40
  50, // 41-50
  60, // 51-60
  70, // 61-70
  80, // 71-80
  90, // 81-90
  100, // 91-100
  110, // 101-110
  120, // 111-150
  125, // 151+
];
const List<num> bonusRarePrimeStatHpMpDefenseAttackDamageCriticalRatePercentage = [
  0.01, // 0-10
  0.01, // 11-20
  0.01, // 21-30
  0.02, // 31-40
  0.02, // 41-50
  0.02, // 51-60
  0.02, // 61-70
  0.03, // 71-80
  0.03, // 81-90
  0.03, // 91-100
  0.03, // 101-110
  0.03, // 111-150
  0.04, // 151+
];
const List<num> bonusRarePrimeSpeedJump = [
  2, // 0-10
  2, // 11-20
  3, // 21-30
  3, // 31-40
  3, // 41-50
  4, // 51-60
  4, // 61-70
  4, // 71-80
  5, // 81-90
  5, // 91-100
  5, // 101-110
  6, // 111-150
  6, // 151+
];


const List<num> bonusEpicPrimeStat = [
  4, // 0-10
  4, // 11-20
  6, // 21-30
  6, // 31-40
  8, // 41-50
  10, // 51-60
  10, // 61-70
  12, // 71-80
  12, // 81-90
  14, // 91-100
  14, // 101-110
  14, // 111-150
  15, // 151+
];
const List<num> bonusEpicPrimeAtt = [
  4, // 0-10
  4, // 11-20
  6, // 21-30
  6, // 31-40
  6, // 41-50
  8, // 51-60
  8, // 61-70
  8, // 71-80
  8, // 81-90
  11, // 91-100
  11, // 101-110
  11, // 111-150
  12, // 151+
];
const List<num> bonusEpicPrimeHpMp = [
  15, // 0-10
  30, // 11-20
  45, // 21-30
  60, // 31-40
  75, // 41-50
  90, // 51-60
  105, // 61-70
  120, // 71-80
  135, // 81-90
  150, // 91-100
  165, // 101-110
  180, // 111-150
  185, // 151+
];
const List<num> bonusEpicPrimeDefense = [
  15, // 0-10
  15, // 11-20
  20, // 21-30
  20, // 31-40
  20, // 41-50
  60, // 51-60
  60, // 61-70
  60, // 71-80
  60, // 81-90
  120, // 91-100
  120, // 101-110
  120, // 111-150
  150, // 151+
];
const List<num> bonusEpicPrimeSpeedJump = [
  4, // 0-10
  4, // 11-20
  4, // 21-30
  6, // 31-40
  6, // 41-50
  6, // 51-60
  6, // 61-70
  6, // 71-80
  6, // 81-90
  6, // 91-100
  6, // 101-110
  8, // 111-150
  8, // 151+
];
const List<num> bonusEpicPrimeStatDefenseAttackDamageCriticalRatePercentage = [
  0.01, // 0-10
  0.01, // 11-20
  0.02, // 21-30
  0.02, // 31-40
  0.02, // 41-50
  0.03, // 51-60
  0.03, // 61-70
  0.03, // 71-80
  0.03, // 81-90
  0.04, // 91-100
  0.04, // 101-110
  0.04, // 111-150
  0.05, // 151+
];
const List<num> bonusEpicPrimeHpMpPercentage = [
  0.01, // 0-10
  0.01, // 11-20
  0.02, // 21-30
  0.02, // 31-40
  0.02, // 41-50
  0.03, // 51-60
  0.03, // 61-70
  0.03, // 71-80
  0.03, // 81-90
  0.05, // 91-100
  0.05, // 101-110
  0.05, // 111-150
  0.06, // 151+
];
const List<num> bonusEpicPrimeAllStatPercentage = [
  0.01, // 0-10
  0.01, // 11-20
  0.01, // 21-30
  0.01, // 31-40
  0.01, // 41-50
  0.01, // 51-60
  0.01, // 61-70
  0.01, // 71-80
  0.01, // 81-90
  0.02, // 91-100
  0.02, // 101-110
  0.02, // 111-150
  0.03, // 151+
];
const num bonusEpicPrimeIgnoreDefense = 0.03;

const List<num> bonusUniquePrimeStat = [
  8, // 0-10
  8, // 11-20
  10, // 21-30
  10, // 31-40
  10, // 41-50
  12, // 51-60
  12, // 61-70
  14, // 71-80
  14, // 81-90
  16, // 91-100
  16, // 101-110
  16, // 111-150
  17, // 151+
];
const num bonusUniquePrimeStatPerLevel = 32;
const List<num> bonusUniquePrimeAtt = [
  6, // 0-10
  6, // 11-20
  8, // 21-30
  8, // 31-40
  8, // 41-50
  10, // 51-60
  10, // 61-70
  10, // 71-80
  10, // 81-90
  12, // 91-100
  12, // 101-110
  12, // 111-150
  13, // 151+
];
const List<num> bonusUniquePrimeHpMp = [
  20, // 0-10
  20, // 11-20
  45, // 21-30
  60, // 31-40
  75, // 41-50
  90, // 51-60
  105, // 61-70
  120, // 71-80
  135, // 81-90
  150, // 91-100
  165, // 101-110
  180, // 111-150
  185, // 151+
];
const List<num> bonusUniquePrimeStatAttackDamageCriticalRatePercentage = [
  0.02, // 0-10
  0.02, // 11-20
  0.03, // 21-30
  0.03, // 31-40
  0.03, // 41-50
  0.04, // 51-60
  0.04, // 61-70
  0.04, // 71-80
  0.04, // 81-90
  0.05, // 91-100
  0.05, // 101-110
  0.05, // 111-150
  0.10, // 151+
];
const List<num> bonusUniquePrimeHpMpPercentage = [
  0.02, // 0-10
  0.02, // 11-20
  0.03, // 21-30
  0.03, // 31-40
  0.03, // 41-50
  0.05, // 51-60
  0.05, // 61-70
  0.05, // 71-80
  0.05, // 81-90
  0.07, // 91-100
  0.07, // 101-110
  0.07, // 111-150
  0.08, // 151+
];
const List<num> bonusUniquePrimeAllStatPercentage = [
  0.01, // 0-10
  0.01, // 11-20
  0.02, // 21-30
  0.02, // 31-40
  0.02, // 41-50
  0.03, // 51-60
  0.03, // 61-70
  0.03, // 71-80
  0.03, // 81-90
  0.04, // 91-100
  0.04, // 101-110
  0.04, // 111-150
  0.05, // 151+
];
const List<num> bonusUniquePrimeHpRecovery = [
  0.05, // 0-10
  0.05, // 11-20
  0.1, // 21-30
  0.1, // 31-40
  0.1, // 41-50
  0.15, // 51-60
  0.15, // 61-70
  0.15, // 71-80
  0.15, // 81-90
  0.2, // 91-100
  0.2, // 101-110
  0.2, // 111-150
  0.2, // 151+
];
const num bonusUniquePrimeBossDamage = 0.12;
const num bonusUniquePrimeIgnoreDefense = 0.04;

const List<num> bonusLegendaryPrimeStat = [
  8, // 0-10
  8, // 11-20
  10, // 21-30
  10, // 31-40
  12, // 41-50
  14, // 51-60
  14, // 61-70
  16, // 71-80
  16, // 81-90
  18, // 91-100
  18, // 101-110
  18, // 111-150
  19, // 151+
];
const List<num> bonusLegendaryPrimeAtt = [
  8, // 0-10
  8, // 11-20
  10, // 21-30
  10, // 31-40
  10, // 41-50
  12, // 51-60
  12, // 61-70
  12, // 71-80
  12, // 81-90
  14, // 91-100
  14, // 101-110
  14, // 111-150
  15, // 151+
];
const List<num> bonusLegendaryPrimeHpMp = [
  25, // 0-10
  50, // 11-20
  75, // 21-30
  100, // 31-40
  125, // 41-50
  150, // 51-60
  175, // 61-70
  200, // 71-80
  225, // 81-90
  250, // 91-100
  275, // 101-110
  300, // 111-150
  310, // 151+
];
const List<num> bonusLegendaryPrimeStatAttackDamageCriticalRatePercentage = [
  0.03, // 0-10
  0.03, // 11-20
  0.04, // 21-30
  0.04, // 31-40
  0.04, // 41-50
  0.05, // 51-60
  0.05, // 61-70
  0.05, // 71-80
  0.05, // 81-90
  0.07, // 91-100
  0.07, // 101-110
  0.07, // 111-150
  0.08, // 151+
];
const List<num> bonusLegendaryPrimeHpMpPercentage = [
  0.1, // 0-10
  0.1, // 11-20
  0.1, // 21-30
  0.2, // 31-40
  0.2, // 41-50
  0.2, // 51-60
  0.2, // 61-70
  0.3, // 71-80
  0.3, // 81-90
  0.3, // 91-100
  0.3, // 101-110
  0.3, // 111-150
  0.3, // 151+
];
const List<num> bonusLegendaryPrimeAllStatPercentage = [
  0.02, // 0-10
  0.02, // 11-20
  0.03, // 21-30
  0.03, // 31-40
  0.03, // 41-50
  0.04, // 51-60
  0.04, // 61-70
  0.04, // 71-80
  0.04, // 81-90
  0.05, // 91-100
  0.05, // 101-110
  0.05, // 111-150
  0.06, // 151+
];
const num bonusLegendaryPrimeStatPerLevel = 32;
const List<num> bonusLegendaryPrimeHpRecovery = [
  0.1, // 0-10
  0.1, // 11-20
  0.15, // 21-30
  0.15, // 31-40
  0.15, // 41-50
  0.2, // 51-60
  0.2, // 61-70
  0.2, // 71-80
  0.2, // 81-90
  0.3, // 91-100
  0.3, // 101-110
  0.3, // 111-150
  0.3, // 151+
];
const List<num> bonusLegendaryPrimeMesosObtainedItemDropRate = [
  0.02, // 0-10
  0.02, // 11-20
  0.03, // 21-30
  0.03, // 31-40
  0.03, // 41-50
  0.04, // 51-60
  0.04, // 61-70
  0.04, // 71-80
  0.04, // 81-90
  0.05, // 91-100
  0.05, // 101-110
  0.05, // 111-150
  0.05, // 151+
];
const num bonusLegendaryPrimeSkillCooldown1 = 1;
const num bonusLegendaryPrimeCriticalDamageStatic = 0.01;
const List<num> bonusLegendaryPrimeCriticalDamage = [
  0.01, // 0-10
  0.01, // 11-20
  0.02, // 21-30
  0.02, // 31-40
  0.02, // 41-50
  0.02, // 51-60
  0.02, // 61-70
  0.02, // 71-80
  0.02, // 81-90
  0.03, // 91-100
  0.03, // 101-110
  0.03, // 111-150
  0.03, // 151+
];
const num bonusLegendaryPrimeBossDamage = 0.18;
const num bonusLegendaryPrimeIgnoreDefense = 0.05;

const Map<PotentialTier, List<BasePotentialLine>> bonusDefaultPotentials = {
  PotentialTier.rare: [
    // Prime
    PotentialLineRange(statType: StatType.strPercentage, isPrime: true, potentialName: PotentialName.bonusRarePrimeStatPercentage),
    PotentialLineRange(statType: StatType.dexPercentage, isPrime: true, potentialName: PotentialName.bonusRarePrimeStatPercentage),
    PotentialLineRange(statType: StatType.intPercentage, isPrime: true, potentialName: PotentialName.bonusRarePrimeStatPercentage),
    PotentialLineRange(statType: StatType.lukPercentage, isPrime: true, potentialName: PotentialName.bonusRarePrimeStatPercentage),
    PotentialLineRange(statType: StatType.allStats, isPrime: true, potentialName: PotentialName.bonusRarePrimeAllStat),
    PotentialLineRange(statType: StatType.hpPercentage, isPrime: true, potentialName: PotentialName.bonusRarePrimeHpPercentage),
    PotentialLineRange(statType: StatType.mpPercentage, isPrime: true, potentialName: PotentialName.bonusRarePrimeMpPercentage),
    PotentialLineRange(statType: StatType.defensePercentage, isPrime: true, potentialName: PotentialName.bonusRarePrimeDefensePercentage),
    PotentialLineRange(statType: StatType.str, isPrime: true, potentialName: PotentialName.bonusRarePrimeStat),
    PotentialLineRange(statType: StatType.dex, isPrime: true, potentialName: PotentialName.bonusRarePrimeStat),
    PotentialLineRange(statType: StatType.int, isPrime: true, potentialName: PotentialName.bonusRarePrimeStat),
    PotentialLineRange(statType: StatType.luk, isPrime: true, potentialName: PotentialName.bonusRarePrimeStat),
    PotentialLineRange(statType: StatType.attack, isPrime: true, potentialName: PotentialName.bonusRarePrimeAtt),
    PotentialLineRange(statType: StatType.mattack, isPrime: true, potentialName: PotentialName.bonusRarePrimeAtt),
    PotentialLineRange(statType: StatType.hp, isPrime: true, potentialName: PotentialName.bonusRarePrimeHp),
    PotentialLineRange(statType: StatType.mp, isPrime: true, potentialName: PotentialName.bonusRarePrimeMp),
    PotentialLineRange(statType: StatType.defense, isPrime: true, potentialName: PotentialName.bonusRarePrimeDefense),
    PotentialLineRange(statType: StatType.speed, isPrime: true, potentialName: PotentialName.bonusRarePrimeSpeed),
    PotentialLineRange(statType: StatType.jump, isPrime: true, potentialName: PotentialName.bonusRarePrimeJump),
    // Non-Prime
    PotentialLineRange(statType: StatType.str, potentialName: PotentialName.bonusRareNonPrimeStat),
    PotentialLineRange(statType: StatType.dex, potentialName: PotentialName.bonusRareNonPrimeStat),
    PotentialLineRange(statType: StatType.int, potentialName: PotentialName.bonusRareNonPrimeStat),
    PotentialLineRange(statType: StatType.luk, potentialName: PotentialName.bonusRareNonPrimeStat),
    PotentialLineRange(statType: StatType.attack, potentialName: PotentialName.bonusRareNonPrimeAtt),
    PotentialLineRange(statType: StatType.mattack, potentialName: PotentialName.bonusRareNonPrimeAtt),
    PotentialLineRange(statType: StatType.hp, potentialName: PotentialName.bonusRareNonPrimeHp),
    PotentialLineRange(statType: StatType.mp, potentialName: PotentialName.bonusRareNonPrimeMp),
    PotentialLineRange(statType: StatType.defense, potentialName: PotentialName.bonusRareNonPrimeDefense),
    PotentialLineRange(statType: StatType.speed, potentialName: PotentialName.bonusRareNonPrimeSpeed),
    PotentialLineRange(statType: StatType.jump, potentialName: PotentialName.bonusRareNonPrimeJump),
  ],
  PotentialTier.epic: [
    // Prime
    PotentialLineRange(statType: StatType.strPercentage, isPrime: true, potentialName: PotentialName.bonusEpicPrimeStatPercentage),
    PotentialLineRange(statType: StatType.dexPercentage, isPrime: true, potentialName: PotentialName.bonusEpicPrimeStatPercentage),
    PotentialLineRange(statType: StatType.intPercentage, isPrime: true, potentialName: PotentialName.bonusEpicPrimeStatPercentage),
    PotentialLineRange(statType: StatType.lukPercentage, isPrime: true, potentialName: PotentialName.bonusEpicPrimeStatPercentage),
    PotentialLineRange(statType: StatType.allStatsPercentage, isPrime: true, potentialName: PotentialName.bonusEpicPrimeAllStatPercentage),
    PotentialLineRange(statType: StatType.hpPercentage, isPrime: true, potentialName: PotentialName.bonusEpicPrimeHpPercentage),
    PotentialLineRange(statType: StatType.mpPercentage, isPrime: true, potentialName: PotentialName.bonusEpicPrimeMpPercentage),
    PotentialLineRange(statType: StatType.defensePercentage, isPrime: true, potentialName: PotentialName.bonusEpicPrimeDefensePercentage),
    PotentialLineRange(statType: StatType.str, isPrime: true, potentialName: PotentialName.bonusEpicPrimeStat),
    PotentialLineRange(statType: StatType.dex, isPrime: true, potentialName: PotentialName.bonusEpicPrimeStat),
    PotentialLineRange(statType: StatType.int, isPrime: true, potentialName: PotentialName.bonusEpicPrimeStat),
    PotentialLineRange(statType: StatType.luk, isPrime: true, potentialName: PotentialName.bonusEpicPrimeStat),
    PotentialLineRange(statType: StatType.attack, isPrime: true, potentialName: PotentialName.bonusEpicPrimeAtt),
    PotentialLineRange(statType: StatType.mattack, isPrime: true, potentialName: PotentialName.bonusEpicPrimeAtt),
    PotentialLineRange(statType: StatType.hp, isPrime: true, potentialName: PotentialName.bonusEpicPrimeHp),
    PotentialLineRange(statType: StatType.mp, isPrime: true, potentialName: PotentialName.bonusEpicPrimeMp),
    PotentialLineRange(statType: StatType.defense, isPrime: true, potentialName: PotentialName.bonusEpicPrimeDefense),
    PotentialLineRange(statType: StatType.speed, isPrime: true, potentialName: PotentialName.bonusEpicPrimeSpeed),
    PotentialLineRange(statType: StatType.jump, isPrime: true, potentialName: PotentialName.bonusEpicPrimeJump),
    // Non-Prime
    PotentialLineRange(statType: StatType.strPercentage, potentialName: PotentialName.bonusRarePrimeStatPercentage),
    PotentialLineRange(statType: StatType.dexPercentage, potentialName: PotentialName.bonusRarePrimeStatPercentage),
    PotentialLineRange(statType: StatType.intPercentage, potentialName: PotentialName.bonusRarePrimeStatPercentage),
    PotentialLineRange(statType: StatType.lukPercentage, potentialName: PotentialName.bonusRarePrimeStatPercentage),
    PotentialLineRange(statType: StatType.allStats, potentialName: PotentialName.bonusRarePrimeAllStat),
    PotentialLineRange(statType: StatType.hpPercentage, potentialName: PotentialName.bonusRarePrimeHpPercentage),
    PotentialLineRange(statType: StatType.mpPercentage, potentialName: PotentialName.bonusRarePrimeMpPercentage),
    PotentialLineRange(statType: StatType.defensePercentage, potentialName: PotentialName.bonusRarePrimeDefensePercentage),
    PotentialLineRange(statType: StatType.str, potentialName: PotentialName.bonusRarePrimeStat),
    PotentialLineRange(statType: StatType.dex, potentialName: PotentialName.bonusRarePrimeStat),
    PotentialLineRange(statType: StatType.int, potentialName: PotentialName.bonusRarePrimeStat),
    PotentialLineRange(statType: StatType.luk, potentialName: PotentialName.bonusRarePrimeStat),
    PotentialLineRange(statType: StatType.attack, potentialName: PotentialName.bonusRarePrimeAtt),
    PotentialLineRange(statType: StatType.mattack, potentialName: PotentialName.bonusRarePrimeAtt),
    PotentialLineRange(statType: StatType.hp, potentialName: PotentialName.bonusRarePrimeHp),
    PotentialLineRange(statType: StatType.mp, potentialName: PotentialName.bonusRarePrimeMp),
    PotentialLineRange(statType: StatType.defense, potentialName: PotentialName.bonusRarePrimeDefense),
    PotentialLineRange(statType: StatType.speed, potentialName: PotentialName.bonusRarePrimeSpeed),
    PotentialLineRange(statType: StatType.jump, potentialName: PotentialName.bonusRarePrimeJump),
  ],
  PotentialTier.unique: [
    // Prime
    PotentialLineRange(statType: StatType.strPercentage, isPrime: true, potentialName: PotentialName.bonusUniquePrimeStatPercentage),
    PotentialLineRange(statType: StatType.dexPercentage, isPrime: true, potentialName: PotentialName.bonusUniquePrimeStatPercentage),
    PotentialLineRange(statType: StatType.intPercentage, isPrime: true, potentialName: PotentialName.bonusUniquePrimeStatPercentage),
    PotentialLineRange(statType: StatType.lukPercentage, isPrime: true, potentialName: PotentialName.bonusUniquePrimeStatPercentage),
    PotentialLineRange(statType: StatType.allStatsPercentage, isPrime: true, potentialName: PotentialName.bonusUniquePrimeAllStatPercentage),
    PotentialLineRange(statType: StatType.hpPercentage, isPrime: true, potentialName: PotentialName.bonusUniquePrimeHpPercentage),
    PotentialLineRange(statType: StatType.mpPercentage, isPrime: true, potentialName: PotentialName.bonusUniquePrimeMpPercentage),
    PotentialLineStatic(statType: StatType.str, isPrime: true, potentialName: PotentialName.bonusUniquePrimeStatPerLevel),
    PotentialLineStatic(statType: StatType.dex, isPrime: true, potentialName: PotentialName.bonusUniquePrimeStatPerLevel),
    PotentialLineStatic(statType: StatType.int, isPrime: true, potentialName: PotentialName.bonusUniquePrimeStatPerLevel),
    PotentialLineStatic(statType: StatType.luk, isPrime: true, potentialName: PotentialName.bonusUniquePrimeStatPerLevel),
    PotentialLineRange(statType: StatType.str, isPrime: true, potentialName: PotentialName.bonusUniquePrimeStat),
    PotentialLineRange(statType: StatType.dex, isPrime: true, potentialName: PotentialName.bonusUniquePrimeStat),
    PotentialLineRange(statType: StatType.int, isPrime: true, potentialName: PotentialName.bonusUniquePrimeStat),
    PotentialLineRange(statType: StatType.luk, isPrime: true, potentialName: PotentialName.bonusUniquePrimeStat),
    PotentialLineRange(statType: StatType.attack, isPrime: true, potentialName: PotentialName.bonusUniquePrimeAtt),
    PotentialLineRange(statType: StatType.mattack, isPrime: true, potentialName: PotentialName.bonusUniquePrimeAtt),
    PotentialLineRange(statType: StatType.hp, isPrime: true, potentialName: PotentialName.bonusUniquePrimeHp),
    PotentialLineRange(statType: StatType.mp, isPrime: true, potentialName: PotentialName.bonusUniquePrimeMp),
    // Non-Prime
    PotentialLineRange(statType: StatType.strPercentage, potentialName: PotentialName.bonusEpicPrimeStatPercentage),
    PotentialLineRange(statType: StatType.dexPercentage, potentialName: PotentialName.bonusEpicPrimeStatPercentage),
    PotentialLineRange(statType: StatType.intPercentage, potentialName: PotentialName.bonusEpicPrimeStatPercentage),
    PotentialLineRange(statType: StatType.lukPercentage, potentialName: PotentialName.bonusEpicPrimeStatPercentage),
    PotentialLineRange(statType: StatType.allStatsPercentage, potentialName: PotentialName.bonusEpicPrimeAllStatPercentage),
    PotentialLineRange(statType: StatType.hpPercentage, potentialName: PotentialName.bonusEpicPrimeHpPercentage),
    PotentialLineRange(statType: StatType.mpPercentage, potentialName: PotentialName.bonusEpicPrimeMpPercentage),
    PotentialLineRange(statType: StatType.defensePercentage, potentialName: PotentialName.bonusEpicPrimeDefensePercentage),
    PotentialLineRange(statType: StatType.str, potentialName: PotentialName.bonusEpicPrimeStat),
    PotentialLineRange(statType: StatType.dex, potentialName: PotentialName.bonusEpicPrimeStat),
    PotentialLineRange(statType: StatType.int, potentialName: PotentialName.bonusEpicPrimeStat),
    PotentialLineRange(statType: StatType.luk, potentialName: PotentialName.bonusEpicPrimeStat),
    PotentialLineRange(statType: StatType.attack, potentialName: PotentialName.bonusEpicPrimeAtt),
    PotentialLineRange(statType: StatType.mattack, potentialName: PotentialName.bonusEpicPrimeAtt),
    PotentialLineRange(statType: StatType.hp, potentialName: PotentialName.bonusEpicPrimeHp),
    PotentialLineRange(statType: StatType.mp, potentialName: PotentialName.bonusEpicPrimeMp),
    PotentialLineRange(statType: StatType.defense, potentialName: PotentialName.bonusEpicPrimeDefense),
    PotentialLineRange(statType: StatType.speed, potentialName: PotentialName.bonusEpicPrimeSpeed),
    PotentialLineRange(statType: StatType.jump, potentialName: PotentialName.bonusEpicPrimeJump),
  ],
  PotentialTier.legendary: [
    // Prime
    PotentialLineRange(statType: StatType.strPercentage, isPrime: true, potentialName: PotentialName.bonusLegendaryPrimeStatPercentage),
    PotentialLineRange(statType: StatType.dexPercentage, isPrime: true, potentialName: PotentialName.bonusLegendaryPrimeStatPercentage),
    PotentialLineRange(statType: StatType.intPercentage, isPrime: true, potentialName: PotentialName.bonusLegendaryPrimeStatPercentage),
    PotentialLineRange(statType: StatType.lukPercentage, isPrime: true, potentialName: PotentialName.bonusLegendaryPrimeStatPercentage),
    PotentialLineRange(statType: StatType.allStatsPercentage, isPrime: true, potentialName: PotentialName.bonusLegendaryPrimeAllStatPercentage),
    PotentialLineRange(statType: StatType.hpPercentage, isPrime: true, potentialName: PotentialName.bonusLegendaryPrimeHpPercentage),
    PotentialLineRange(statType: StatType.mpPercentage, isPrime: true, potentialName: PotentialName.bonusLegendaryPrimeMpPercentage),
    PotentialLineStatic(statType: StatType.str, isPrime: true, potentialName: PotentialName.bonusLegendaryPrimeStatPerLevel),
    PotentialLineStatic(statType: StatType.dex, isPrime: true, potentialName: PotentialName.bonusLegendaryPrimeStatPerLevel),
    PotentialLineStatic(statType: StatType.int, isPrime: true, potentialName: PotentialName.bonusLegendaryPrimeStatPerLevel),
    PotentialLineStatic(statType: StatType.luk, isPrime: true, potentialName: PotentialName.bonusLegendaryPrimeStatPerLevel),
    PotentialLineRange(statType: StatType.str, isPrime: true, potentialName: PotentialName.bonusLegendaryPrimeStat),
    PotentialLineRange(statType: StatType.dex, isPrime: true, potentialName: PotentialName.bonusLegendaryPrimeStat),
    PotentialLineRange(statType: StatType.int, isPrime: true, potentialName: PotentialName.bonusLegendaryPrimeStat),
    PotentialLineRange(statType: StatType.luk, isPrime: true, potentialName: PotentialName.bonusLegendaryPrimeStat),
    PotentialLineRange(statType: StatType.attack, isPrime: true, potentialName: PotentialName.bonusLegendaryPrimeAtt),
    PotentialLineRange(statType: StatType.mattack, isPrime: true, potentialName: PotentialName.bonusLegendaryPrimeAtt),
    PotentialLineRange(statType: StatType.hp, isPrime: true, potentialName: PotentialName.bonusLegendaryPrimeHp),
    PotentialLineRange(statType: StatType.mp, isPrime: true, potentialName: PotentialName.bonusLegendaryPrimeMp),
    // Non-Prime
    PotentialLineRange(statType: StatType.strPercentage, potentialName: PotentialName.bonusUniquePrimeStatPercentage),
    PotentialLineRange(statType: StatType.dexPercentage, potentialName: PotentialName.bonusUniquePrimeStatPercentage),
    PotentialLineRange(statType: StatType.intPercentage, potentialName: PotentialName.bonusUniquePrimeStatPercentage),
    PotentialLineRange(statType: StatType.lukPercentage, potentialName: PotentialName.bonusUniquePrimeStatPercentage),
    PotentialLineRange(statType: StatType.allStatsPercentage, potentialName: PotentialName.bonusUniquePrimeAllStatPercentage),
    PotentialLineRange(statType: StatType.hpPercentage, potentialName: PotentialName.bonusUniquePrimeHpPercentage),
    PotentialLineRange(statType: StatType.mpPercentage, potentialName: PotentialName.bonusUniquePrimeMpPercentage),
    PotentialLineStatic(statType: StatType.str, potentialName: PotentialName.bonusUniquePrimeStatPerLevel),
    PotentialLineStatic(statType: StatType.dex, potentialName: PotentialName.bonusUniquePrimeStatPerLevel),
    PotentialLineStatic(statType: StatType.int, potentialName: PotentialName.bonusUniquePrimeStatPerLevel),
    PotentialLineStatic(statType: StatType.luk, potentialName: PotentialName.bonusUniquePrimeStatPerLevel),
    PotentialLineRange(statType: StatType.str, potentialName: PotentialName.bonusUniquePrimeStat),
    PotentialLineRange(statType: StatType.dex, potentialName: PotentialName.bonusUniquePrimeStat),
    PotentialLineRange(statType: StatType.int, potentialName: PotentialName.bonusUniquePrimeStat),
    PotentialLineRange(statType: StatType.luk, potentialName: PotentialName.bonusUniquePrimeStat),
    PotentialLineRange(statType: StatType.attack, potentialName: PotentialName.bonusUniquePrimeAtt),
    PotentialLineRange(statType: StatType.mattack, potentialName: PotentialName.bonusUniquePrimeAtt),
    PotentialLineRange(statType: StatType.hp, potentialName: PotentialName.bonusUniquePrimeHp),
    PotentialLineRange(statType: StatType.mp, potentialName: PotentialName.bonusUniquePrimeMp),
  ],
};

// Hat
const Map<PotentialTier, List<BasePotentialLine>> bonusHatPotentials = {
  PotentialTier.unique: [
    // Prime
    PotentialLineRange(statType: StatType.hpRecovery, isPrime: true, potentialName: PotentialName.bonusUniquePrimeHpRecovery),
  ],
  PotentialTier.legendary: [
    // Prime
    PotentialLineStatic(statType: StatType.critDamage, isPrime: true, potentialName: PotentialName.bonusLegendaryPrimeCriticalDamageStatic),
    PotentialLineStatic(statType: StatType.skillCooldown, isPrime: true, potentialName: PotentialName.bonusLegendaryPrimeSkillCooldown1),
    PotentialLineRange(statType: StatType.mesosObtained, isPrime: true, potentialName: PotentialName.bonusLegendaryPrimeMesosObtained),
    PotentialLineRange(statType: StatType.itemDropRate, isPrime: true, potentialName: PotentialName.bonusLegendaryPrimeItemDropRate),
    PotentialLineRange(statType: StatType.hpRecovery, isPrime: true, potentialName: PotentialName.legendaryPrimeHpRecovery),
    // Non-Prime
    PotentialLineRange(statType: StatType.hpRecovery, potentialName: PotentialName.bonusUniquePrimeHpRecovery),
  ],
};

//Top, Overall, Bottom, Shoes, Cape, Belt, Shoulder
const Map<PotentialTier, List<BasePotentialLine>> bonusTopOverallBottomShoesCapeBeltShoulderPotentials = {
  PotentialTier.unique: [
    // Prime
    PotentialLineRange(statType: StatType.hpRecovery, isPrime: true, potentialName: PotentialName.bonusUniquePrimeHpRecovery),
  ],
  PotentialTier.legendary: [
    // Prime
    PotentialLineStatic(statType: StatType.critDamage, isPrime: true, potentialName: PotentialName.bonusLegendaryPrimeCriticalDamageStatic),
    PotentialLineRange(statType: StatType.mesosObtained, isPrime: true, potentialName: PotentialName.bonusLegendaryPrimeMesosObtained),
    PotentialLineRange(statType: StatType.itemDropRate, isPrime: true, potentialName: PotentialName.bonusLegendaryPrimeItemDropRate),
    PotentialLineRange(statType: StatType.hpRecovery, isPrime: true, potentialName: PotentialName.legendaryPrimeHpRecovery),
    // Non-Prime
    PotentialLineRange(statType: StatType.hpRecovery, potentialName: PotentialName.bonusUniquePrimeHpRecovery),
  ],
};

//Gloves
const Map<PotentialTier, List<BasePotentialLine>> bonusGlovesPotentials = {
  PotentialTier.unique: [
    // Prime
    PotentialLineRange(statType: StatType.hpRecovery, isPrime: true, potentialName: PotentialName.bonusUniquePrimeHpRecovery),
  ],
  PotentialTier.legendary: [
    // Prime
    PotentialLineRange(statType: StatType.critDamage, isPrime: true, potentialName: PotentialName.bonusLegendaryPrimeCriticalDamage),
    PotentialLineStatic(statType: StatType.critDamage, isPrime: true, potentialName: PotentialName.bonusLegendaryPrimeCriticalDamageStatic),
    PotentialLineRange(statType: StatType.mesosObtained, isPrime: true, potentialName: PotentialName.bonusLegendaryPrimeMesosObtained),
    PotentialLineRange(statType: StatType.itemDropRate, isPrime: true, potentialName: PotentialName.bonusLegendaryPrimeItemDropRate),
    PotentialLineRange(statType: StatType.hpRecovery, isPrime: true, potentialName: PotentialName.legendaryPrimeHpRecovery),
    // Non-Prime
    PotentialLineRange(statType: StatType.hpRecovery, potentialName: PotentialName.bonusUniquePrimeHpRecovery),
  ],
};

//Face, Eye, Ring, Pendant, Earring
const Map<PotentialTier, List<BasePotentialLine>> bonusFaceEyeRingPendantEarringPotentials = {
  PotentialTier.unique: [
    // Prime
    PotentialLineRange(statType: StatType.hpRecovery, isPrime: true, potentialName: PotentialName.bonusUniquePrimeHpRecovery),
  ],
  PotentialTier.legendary: [
    // Prime
    PotentialLineStatic(statType: StatType.critDamage, isPrime: true, potentialName: PotentialName.bonusLegendaryPrimeCriticalDamageStatic),
    PotentialLineRange(statType: StatType.mesosObtained, isPrime: true, potentialName: PotentialName.bonusLegendaryPrimeMesosObtained),
    PotentialLineRange(statType: StatType.itemDropRate, isPrime: true, potentialName: PotentialName.bonusLegendaryPrimeItemDropRate),
    PotentialLineRange(statType: StatType.hpRecovery, isPrime: true, potentialName: PotentialName.legendaryPrimeHpRecovery),
    // Non-Prime
    PotentialLineRange(statType: StatType.hpRecovery, potentialName: PotentialName.bonusUniquePrimeHpRecovery),
  ],
};

//Weapon
const Map<PotentialTier, List<BasePotentialLine>> bonusWeaponPotentials = {
  PotentialTier.rare: [
    // Prime
    PotentialLineRange(statType: StatType.attackPercentage, isPrime: true, potentialName: PotentialName.bonusRarePrimeAttackPercentage),
    PotentialLineRange(statType: StatType.mattackPercentage, isPrime: true, potentialName: PotentialName.bonusRarePrimeAttackPercentage),
    PotentialLineRange(statType: StatType.critRate, isPrime: true, potentialName: PotentialName.bonusRarePrimeCriticalRate),
    PotentialLineRange(statType: StatType.damage, isPrime: true, potentialName: PotentialName.bonusRarePrimeDamage),
  ],
  PotentialTier.epic: [
    // Prime
    PotentialLineRange(statType: StatType.attackPercentage, isPrime: true, potentialName: PotentialName.bonusEpicPrimeAttackPercentage),
    PotentialLineRange(statType: StatType.mattackPercentage, isPrime: true, potentialName: PotentialName.bonusEpicPrimeAttackPercentage),
    PotentialLineRange(statType: StatType.critRate, isPrime: true, potentialName: PotentialName.bonusEpicPrimeCriticalRate),
    PotentialLineRange(statType: StatType.damage, isPrime: true, potentialName: PotentialName.bonusEpicPrimeDamage),
    PotentialLineStatic(statType: StatType.ignoreDefense, isPrime: true, potentialName: PotentialName.bonusEpicPrimeIgnoreDefense),
    // Non-Prime
    PotentialLineRange(statType: StatType.attackPercentage, potentialName: PotentialName.bonusRarePrimeAttackPercentage),
    PotentialLineRange(statType: StatType.mattackPercentage, potentialName: PotentialName.bonusRarePrimeAttackPercentage),
    PotentialLineRange(statType: StatType.critRate, potentialName: PotentialName.bonusRarePrimeCriticalRate),
    PotentialLineRange(statType: StatType.damage, potentialName: PotentialName.bonusRarePrimeDamage),
  ],
  PotentialTier.unique: [
    // Prime
    PotentialLineRange(statType: StatType.attackPercentage, isPrime: true, potentialName: PotentialName.bonusUniquePrimeAttackPercentage),
    PotentialLineRange(statType: StatType.mattackPercentage, isPrime: true, potentialName: PotentialName.bonusUniquePrimeAttackPercentage),
    PotentialLineRange(statType: StatType.critRate, isPrime: true, potentialName: PotentialName.bonusUniquePrimeCriticalRate),
    PotentialLineRange(statType: StatType.damage, isPrime: true, potentialName: PotentialName.bonusUniquePrimeDamage),
    PotentialLineStatic(statType: StatType.bossDamage, isPrime: true, potentialName: PotentialName.bonusUniquePrimeBossDamage),
    PotentialLineStatic(statType: StatType.ignoreDefense, isPrime: true, potentialName: PotentialName.bonusUniquePrimeIgnoreDefense),
    // None-Prime
    PotentialLineRange(statType: StatType.attackPercentage, potentialName: PotentialName.bonusEpicPrimeAttackPercentage),
    PotentialLineRange(statType: StatType.mattackPercentage, potentialName: PotentialName.bonusEpicPrimeAttackPercentage),
    PotentialLineRange(statType: StatType.critRate, potentialName: PotentialName.bonusEpicPrimeCriticalRate),
    PotentialLineRange(statType: StatType.damage, potentialName: PotentialName.bonusEpicPrimeDamage),
    PotentialLineStatic(statType: StatType.ignoreDefense, potentialName: PotentialName.bonusEpicPrimeIgnoreDefense),
  ],
  PotentialTier.legendary: [
    // Prime
    PotentialLineRange(statType: StatType.attackPercentage, isPrime: true, potentialName: PotentialName.bonusLegendaryPrimeAttackPercentage),
    PotentialLineRange(statType: StatType.mattackPercentage, isPrime: true, potentialName: PotentialName.bonusLegendaryPrimeAttackPercentage),
    PotentialLineRange(statType: StatType.critRate, isPrime: true, potentialName: PotentialName.bonusLegendaryPrimeCriticalRate),
    PotentialLineRange(statType: StatType.damage, isPrime: true, potentialName: PotentialName.bonusLegendaryPrimeDamage),
    PotentialLineStatic(statType: StatType.bossDamage, isPrime: true, potentialName: PotentialName.bonusLegendaryPrimeBossDamage),
    PotentialLineStatic(statType: StatType.ignoreDefense, isPrime: true, potentialName: PotentialName.bonusLegendaryPrimeIgnoreDefense),
    // Non-Prime
    PotentialLineRange(statType: StatType.attackPercentage, potentialName: PotentialName.bonusUniquePrimeAttackPercentage),
    PotentialLineRange(statType: StatType.mattackPercentage, potentialName: PotentialName.bonusUniquePrimeAttackPercentage),
    PotentialLineRange(statType: StatType.critRate, potentialName: PotentialName.bonusUniquePrimeCriticalRate),
    PotentialLineRange(statType: StatType.damage, potentialName: PotentialName.bonusUniquePrimeDamage),
    PotentialLineStatic(statType: StatType.bossDamage, potentialName: PotentialName.bonusUniquePrimeBossDamage),
    PotentialLineStatic(statType: StatType.ignoreDefense, potentialName: PotentialName.bonusUniquePrimeIgnoreDefense),
  ],
};

//Secondary
const Map<PotentialTier, List<BasePotentialLine>> bonusSecondaryPotentials = {
  PotentialTier.rare: [
    // Prime
    PotentialLineRange(statType: StatType.attackPercentage, isPrime: true, potentialName: PotentialName.bonusRarePrimeAttackPercentage),
    PotentialLineRange(statType: StatType.mattackPercentage, isPrime: true, potentialName: PotentialName.bonusRarePrimeAttackPercentage),
    PotentialLineRange(statType: StatType.critRate, isPrime: true, potentialName: PotentialName.bonusRarePrimeCriticalRate),
    PotentialLineRange(statType: StatType.damage, isPrime: true, potentialName: PotentialName.bonusRarePrimeDamage),
  ],
  PotentialTier.epic: [
    // Prime
    PotentialLineRange(statType: StatType.attackPercentage, isPrime: true, potentialName: PotentialName.bonusEpicPrimeAttackPercentage),
    PotentialLineRange(statType: StatType.mattackPercentage, isPrime: true, potentialName: PotentialName.bonusEpicPrimeAttackPercentage),
    PotentialLineRange(statType: StatType.critRate, isPrime: true, potentialName: PotentialName.bonusEpicPrimeCriticalRate),
    PotentialLineRange(statType: StatType.damage, isPrime: true, potentialName: PotentialName.bonusEpicPrimeDamage),
    PotentialLineStatic(statType: StatType.ignoreDefense, isPrime: true, potentialName: PotentialName.bonusEpicPrimeIgnoreDefense),
    // Non-Prime
    PotentialLineRange(statType: StatType.attackPercentage, potentialName: PotentialName.bonusRarePrimeAttackPercentage),
    PotentialLineRange(statType: StatType.mattackPercentage, potentialName: PotentialName.bonusRarePrimeAttackPercentage),
    PotentialLineRange(statType: StatType.critRate, potentialName: PotentialName.bonusRarePrimeCriticalRate),
    PotentialLineRange(statType: StatType.damage, potentialName: PotentialName.bonusRarePrimeDamage),
  ],
  PotentialTier.unique: [
    // Prime
    PotentialLineRange(statType: StatType.attackPercentage, isPrime: true, potentialName: PotentialName.bonusUniquePrimeAttackPercentage),
    PotentialLineRange(statType: StatType.mattackPercentage, isPrime: true, potentialName: PotentialName.bonusUniquePrimeAttackPercentage),
    PotentialLineRange(statType: StatType.critRate, isPrime: true, potentialName: PotentialName.bonusUniquePrimeCriticalRate),
    PotentialLineRange(statType: StatType.damage, isPrime: true, potentialName: PotentialName.bonusUniquePrimeDamage),
    PotentialLineStatic(statType: StatType.bossDamage, isPrime: true, potentialName: PotentialName.bonusUniquePrimeBossDamage),
    PotentialLineStatic(statType: StatType.ignoreDefense, isPrime: true, potentialName: PotentialName.bonusUniquePrimeIgnoreDefense),
    // None-Prime
    PotentialLineRange(statType: StatType.attackPercentage, potentialName: PotentialName.bonusEpicPrimeAttackPercentage),
    PotentialLineRange(statType: StatType.mattackPercentage, potentialName: PotentialName.bonusEpicPrimeAttackPercentage),
    PotentialLineRange(statType: StatType.critRate, potentialName: PotentialName.bonusEpicPrimeCriticalRate),
    PotentialLineRange(statType: StatType.damage, potentialName: PotentialName.bonusEpicPrimeDamage),
    PotentialLineStatic(statType: StatType.ignoreDefense, potentialName: PotentialName.bonusEpicPrimeIgnoreDefense),
  ],
  PotentialTier.legendary: [
    // Prime
    PotentialLineRange(statType: StatType.attackPercentage, isPrime: true, potentialName: PotentialName.bonusLegendaryPrimeAttackPercentage),
    PotentialLineRange(statType: StatType.mattackPercentage, isPrime: true, potentialName: PotentialName.bonusLegendaryPrimeAttackPercentage),
    PotentialLineRange(statType: StatType.critRate, isPrime: true, potentialName: PotentialName.bonusLegendaryPrimeCriticalRate),
    PotentialLineRange(statType: StatType.damage, isPrime: true, potentialName: PotentialName.bonusLegendaryPrimeDamage),
    PotentialLineStatic(statType: StatType.bossDamage, isPrime: true, potentialName:PotentialName. bonusLegendaryPrimeBossDamage),
    PotentialLineStatic(statType: StatType.ignoreDefense, isPrime: true, potentialName: PotentialName.bonusLegendaryPrimeIgnoreDefense),
    PotentialLineStatic(statType: StatType.critDamage, isPrime: true, potentialName: PotentialName.bonusLegendaryPrimeCriticalDamageStatic),
    // Non-Prime
    PotentialLineRange(statType: StatType.attackPercentage, potentialName: PotentialName.bonusUniquePrimeAttackPercentage),
    PotentialLineRange(statType: StatType.mattackPercentage, potentialName: PotentialName.bonusUniquePrimeAttackPercentage),
    PotentialLineRange(statType: StatType.critRate, potentialName: PotentialName.bonusUniquePrimeCriticalRate),
    PotentialLineRange(statType: StatType.damage, potentialName: PotentialName.bonusUniquePrimeDamage),
    PotentialLineStatic(statType: StatType.bossDamage, potentialName: PotentialName.bonusUniquePrimeBossDamage),
    PotentialLineStatic(statType: StatType.ignoreDefense, potentialName: PotentialName.bonusUniquePrimeIgnoreDefense),
  ],
};

//Emblem
const Map<PotentialTier, List<BasePotentialLine>> bonusEmblemPotentials = {
  PotentialTier.rare: [
    // Prime
    PotentialLineRange(statType: StatType.attackPercentage, isPrime: true, potentialName: PotentialName.bonusRarePrimeAttackPercentage),
    PotentialLineRange(statType: StatType.mattackPercentage, isPrime: true, potentialName: PotentialName.bonusRarePrimeAttackPercentage),
    PotentialLineRange(statType: StatType.critRate, isPrime: true, potentialName: PotentialName.bonusRarePrimeCriticalRate),
    PotentialLineRange(statType: StatType.damage, isPrime: true, potentialName: PotentialName.bonusRarePrimeDamage),
  ],
  PotentialTier.epic: [
    // Prime
    PotentialLineRange(statType: StatType.attackPercentage, isPrime: true, potentialName: PotentialName.bonusEpicPrimeAttackPercentage),
    PotentialLineRange(statType: StatType.mattackPercentage, isPrime: true, potentialName: PotentialName.bonusEpicPrimeAttackPercentage),
    PotentialLineRange(statType: StatType.critRate, isPrime: true, potentialName: PotentialName.bonusEpicPrimeCriticalRate),
    PotentialLineRange(statType: StatType.damage, isPrime: true, potentialName: PotentialName.bonusEpicPrimeDamage),
    PotentialLineStatic(statType: StatType.ignoreDefense, isPrime: true, potentialName: PotentialName.bonusEpicPrimeIgnoreDefense),
    // Non-Prime
    PotentialLineRange(statType: StatType.attackPercentage, potentialName: PotentialName.bonusRarePrimeAttackPercentage),
    PotentialLineRange(statType: StatType.mattackPercentage, potentialName: PotentialName.bonusRarePrimeAttackPercentage),
    PotentialLineRange(statType: StatType.critRate, potentialName: PotentialName.bonusRarePrimeCriticalRate),
    PotentialLineRange(statType: StatType.damage, potentialName: PotentialName.bonusRarePrimeDamage),
  ],
  PotentialTier.unique: [
    // Prime
    PotentialLineRange(statType: StatType.attackPercentage, isPrime: true, potentialName: PotentialName.bonusUniquePrimeAttackPercentage),
    PotentialLineRange(statType: StatType.mattackPercentage, isPrime: true, potentialName: PotentialName.bonusUniquePrimeAttackPercentage),
    PotentialLineRange(statType: StatType.critRate, isPrime: true, potentialName: PotentialName.bonusUniquePrimeCriticalRate),
    PotentialLineRange(statType: StatType.damage, isPrime: true, potentialName: PotentialName.bonusUniquePrimeDamage),
    PotentialLineStatic(statType: StatType.ignoreDefense, isPrime: true, potentialName: PotentialName.bonusUniquePrimeIgnoreDefense),
    // None-Prime
    PotentialLineRange(statType: StatType.attackPercentage, potentialName: PotentialName.bonusEpicPrimeAttackPercentage),
    PotentialLineRange(statType: StatType.mattackPercentage, potentialName: PotentialName.bonusEpicPrimeAttackPercentage),
    PotentialLineRange(statType: StatType.critRate, potentialName: PotentialName.bonusEpicPrimeCriticalRate),
    PotentialLineRange(statType: StatType.damage, potentialName: PotentialName.bonusEpicPrimeDamage),
    PotentialLineStatic(statType: StatType.ignoreDefense, potentialName: PotentialName.bonusEpicPrimeIgnoreDefense),
  ],
  PotentialTier.legendary: [
    // Prime
    PotentialLineRange(statType: StatType.attackPercentage, isPrime: true, potentialName: PotentialName.bonusLegendaryPrimeAttackPercentage),
    PotentialLineRange(statType: StatType.mattackPercentage, isPrime: true, potentialName: PotentialName.bonusLegendaryPrimeAttackPercentage),
    PotentialLineRange(statType: StatType.critRate, isPrime: true, potentialName: PotentialName.bonusLegendaryPrimeCriticalRate),
    PotentialLineRange(statType: StatType.damage, isPrime: true, potentialName: PotentialName.bonusLegendaryPrimeDamage),
    PotentialLineStatic(statType: StatType.ignoreDefense, isPrime: true, potentialName: PotentialName.bonusLegendaryPrimeIgnoreDefense),
    // Non-Prime
    PotentialLineRange(statType: StatType.attackPercentage, potentialName: PotentialName.bonusUniquePrimeAttackPercentage),
    PotentialLineRange(statType: StatType.mattackPercentage, potentialName: PotentialName.bonusUniquePrimeAttackPercentage),
    PotentialLineRange(statType: StatType.critRate, potentialName: PotentialName.bonusUniquePrimeCriticalRate),
    PotentialLineRange(statType: StatType.damage, potentialName: PotentialName.bonusUniquePrimeDamage),
    PotentialLineStatic(statType: StatType.ignoreDefense, potentialName: PotentialName.bonusUniquePrimeIgnoreDefense),
  ],
};

//Heart, Badge
const Map<PotentialTier, List<BasePotentialLine>> bonusHeartBadgePotentials = {
  PotentialTier.unique: [
    // Prime
    PotentialLineRange(statType: StatType.hpRecovery, isPrime: true, potentialName: PotentialName.bonusUniquePrimeHpRecovery),
  ],
  PotentialTier.legendary: [
    // Prime
    PotentialLineStatic(statType: StatType.critDamage, isPrime: true, potentialName: PotentialName.bonusLegendaryPrimeCriticalDamageStatic),
    PotentialLineRange(statType: StatType.mesosObtained, isPrime: true, potentialName: PotentialName.bonusLegendaryPrimeMesosObtained),
    PotentialLineRange(statType: StatType.itemDropRate, isPrime: true, potentialName: PotentialName.bonusLegendaryPrimeItemDropRate),
    PotentialLineRange(statType: StatType.hpRecovery, isPrime: true, potentialName: PotentialName.legendaryPrimeHpRecovery),
    // Non-Prime
    PotentialLineRange(statType: StatType.hpRecovery, potentialName: PotentialName.bonusUniquePrimeHpRecovery),
  ],
};

const Map<PotentialName, dynamic> allPotentialStats = {
  // ---------------------------------------------------------------------- //
  // Main Potentials
  // ---------------------------------------------------------------------- //
  // Rare Non Prime
  PotentialName.rareNonPrimeStat: rareNonPrimeStatAtt,
  PotentialName.rareNonPrimeAtt: rareNonPrimeStatAtt,
  PotentialName.rareNonPrimeDefense: rareNonPrimeDefenseHpMp,
  PotentialName.rareNonPrimeHp: rareNonPrimeDefenseHpMp,
  PotentialName.rareNonPrimeMp: rareNonPrimeDefenseHpMp,
  // Rare Prime & Epic Non Prime
  PotentialName.rarePrimeStat: rarePrimeStatAtt,
  PotentialName.rarePrimeAtt: rarePrimeStatAtt,
  PotentialName.rarePrimeAllStat: rarePrimeAllStat,
  PotentialName.rarePrimeDefense: rarePrimeDefenseHpMp,
  PotentialName.rarePrimeHp: rarePrimeDefenseHpMp,
  PotentialName.rarePrimeMp: rarePrimeDefenseHpMp,
  PotentialName.rarePrimeStatPercentage: rarePrimeStatDefenseHpMpPercentage,
  PotentialName.rarePrimeDefensePercentage: rarePrimeStatDefenseHpMpPercentage,
  PotentialName.rarePrimeHpPercentage: rarePrimeStatDefenseHpMpPercentage,
  PotentialName.rarePrimeMpPercentage: rarePrimeStatDefenseHpMpPercentage,
  PotentialName.rarePrimeCriticalRate: rarePrimeCriticalRate,
  // Epic Prime & Unique Non Prime
  PotentialName.epicPrimeStatPercentage: epicPrimeStatAttackDamageDefenseHpMpPercentage,
  PotentialName.epicPrimeAttackPercentage: epicPrimeStatAttackDamageDefenseHpMpPercentage,
  PotentialName.epicPrimeDamage: epicPrimeStatAttackDamageDefenseHpMpPercentage,
  PotentialName.epicPrimeDefensePercentage: epicPrimeStatAttackDamageDefenseHpMpPercentage,
  PotentialName.epicPrimeHpPercentage: epicPrimeStatAttackDamageDefenseHpMpPercentage,
  PotentialName.epicPrimeMpPercentage: epicPrimeStatAttackDamageDefenseHpMpPercentage,
  PotentialName.epicPrimeAllStatPercentage: epicPrimeAllStatPercentage,
  PotentialName.epicPrimeCriticalRate: epicPrimeCriticalRate,
  PotentialName.epicPrimeIgnoreDefense: epicPrimeIgnoreDefense,
  // Unique Prime & Legendary Non Prime
  PotentialName.uniquePrimeStatPercentage: uniquePrimeStatAttackDamageCriticalRatePercentage,
  PotentialName.uniquePrimeAttackPercentage: uniquePrimeStatAttackDamageCriticalRatePercentage,
  PotentialName.uniquePrimeDamage: uniquePrimeStatAttackDamageCriticalRatePercentage,
  PotentialName.uniquePrimeCriticalRate: uniquePrimeStatAttackDamageCriticalRatePercentage,
  PotentialName.uniquePrimeDefensePercentage: uniquePrimeDefenseHpMpPercentage,
  PotentialName.uniquePrimeHpPercentage: uniquePrimeDefenseHpMpPercentage,
  PotentialName.uniquePrimeMpPercentage: uniquePrimeDefenseHpMpPercentage,
  PotentialName.uniquePrimeAllStatPercentage: uniquePrimeAllStatPercentage,
  PotentialName.uniquePrimeHpRecovery: uniquePrimeHpRecovery,
  PotentialName.uniquePrimeStat: uniquePrimeStatAtt,
  PotentialName.uniquePrimeAtt: uniquePrimeStatAtt,
  PotentialName.uniquePrimeBossDamage: uniquePrimeBossDamage,
  PotentialName.uniquePrimeIgnoreDefense: uniquePrimeIgnoreDefense,
  // PotentialName.uniquePrimeDecentMysticDoor: ,
  // PotentialName.uniquePrimeDecentHyperBody: ,
  // PotentialName.unqiuePrimeDecentSharpEyes: ,
  // PotentialName.uniquePrimeDecentHaste: ,
  // Legendary Prime
  PotentialName.legendaryPrimeStat: legendaryPrimeStatAtt,
  PotentialName.legendaryPrimeAtt: legendaryPrimeStatAtt,
  PotentialName.legendaryPrimeStatPercentage: legendaryPrimeStatAttackDamageCriticalRatePercentage,
  PotentialName.legendaryPrimeAttackPercentage: legendaryPrimeStatAttackDamageCriticalRatePercentage,
  PotentialName.legendaryPrimeDamagePercentage: legendaryPrimeStatAttackDamageCriticalRatePercentage,
  PotentialName.legendaryPrimeCriticalRatePercentage: legendaryPrimeStatAttackDamageCriticalRatePercentage,
  PotentialName.legendaryPrimeHpPercentage: legendaryPrimeHpMpPercentage,
  PotentialName.legendaryPrimeMpPercentage: legendaryPrimeHpMpPercentage,
  PotentialName.legendaryPrimeAllStatPercentage: legendaryPrimeAllStatPercentage,
  PotentialName.legendaryPrimeHpRecovery: legendaryPrimeHpRecovery,
  PotentialName.legendaryPrimeSkillCooldown1: legendaryPrimeSkillCooldown1,
  PotentialName.legendaryPrimeSkillCooldown2: legendaryPrimeSkillCooldown2,
  PotentialName.legendaryPrimeCriticalDamage: legendaryPrimeCriticalDamage,
  PotentialName.legendaryPrimeMesosObtained: legendaryPrimeMesosObtainedItemDropRate,
  PotentialName.legendaryPrimeItemDropRate: legendaryPrimeMesosObtainedItemDropRate,
  PotentialName.legendaryPrimeBossDamage35: legendaryPrimeBossDamage35,
  PotentialName.legendaryPrimeBossDamage40: legendaryPrimeBossDamage40,
  PotentialName.legendaryPrimeIgnoreDefense35: legendaryPrimeIgnoreDefense35,
  PotentialName.legendaryPrimeIgnoreDefense40: legendaryPrimeIgnoreDefense40,
  // PotentialName.legendaryPrimeDecentAdvancedBlessing: ,
  // PotentialName.legendaryPrimeDecentSpeedInfusion: ,
  // PotentialName.legendaryPrimeDecentCombatOrders: ,
  // ---------------------------------------------------------------------- //
  // Bonus Potentials
  // ---------------------------------------------------------------------- //
  // Rare Non Prime
  PotentialName.bonusRareNonPrimeStat: bonusRareNonPrimeStat,
  PotentialName.bonusRareNonPrimeAtt: bonusRareNonPrimeAtt,
  PotentialName.bonusRareNonPrimeDefense: bonusRareNonPrimeHpMpDefense,
  PotentialName.bonusRareNonPrimeHp: bonusRareNonPrimeHpMpDefense,
  PotentialName.bonusRareNonPrimeMp: bonusRareNonPrimeHpMpDefense,
  PotentialName.bonusRareNonPrimeSpeed: bonusRareNonPrimeSpeedJump,
  PotentialName.bonusRareNonPrimeJump: bonusRareNonPrimeSpeedJump,
  // Rare Prime & Epic Non Prime
  PotentialName.bonusRarePrimeStat: bonusRarePrimeStat,
  PotentialName.bonusRarePrimeAtt: bonusRarePrimeAtt,
  PotentialName.bonusRarePrimeAllStat: bonusRarePrimeAllStat,
  PotentialName.bonusRarePrimeDefense: bonusRarePrimeDefenseHpMp,
  PotentialName.bonusRarePrimeHp: bonusRarePrimeDefenseHpMp,
  PotentialName.bonusRarePrimeMp: bonusRarePrimeDefenseHpMp,
  PotentialName.bonusRarePrimeStatPercentage: bonusRarePrimeStatHpMpDefenseAttackDamageCriticalRatePercentage,
  PotentialName.bonusRarePrimeHpPercentage: bonusRarePrimeStatHpMpDefenseAttackDamageCriticalRatePercentage,
  PotentialName.bonusRarePrimeMpPercentage: bonusRarePrimeStatHpMpDefenseAttackDamageCriticalRatePercentage,
  PotentialName.bonusRarePrimeDefensePercentage: bonusRarePrimeStatHpMpDefenseAttackDamageCriticalRatePercentage,
  PotentialName.bonusRarePrimeAttackPercentage: bonusRarePrimeStatHpMpDefenseAttackDamageCriticalRatePercentage,
  PotentialName.bonusRarePrimeDamage: bonusRarePrimeStatHpMpDefenseAttackDamageCriticalRatePercentage,
  PotentialName.bonusRarePrimeCriticalRate: bonusRarePrimeStatHpMpDefenseAttackDamageCriticalRatePercentage,
  PotentialName.bonusRarePrimeSpeed: bonusRarePrimeSpeedJump,
  PotentialName.bonusRarePrimeJump: bonusRarePrimeSpeedJump,
  // Epic Prime & Unique Non Prime
  PotentialName.bonusEpicPrimeStat: bonusEpicPrimeStat,
  PotentialName.bonusEpicPrimeAtt: bonusEpicPrimeAtt,
  PotentialName.bonusEpicPrimeHp: bonusEpicPrimeHpMp,
  PotentialName.bonusEpicPrimeMp: bonusEpicPrimeHpMp,
  PotentialName.bonusEpicPrimeDefense: bonusEpicPrimeDefense,
  PotentialName.bonusEpicPrimeSpeed: bonusEpicPrimeSpeedJump,
  PotentialName.bonusEpicPrimeJump: bonusEpicPrimeSpeedJump,
  PotentialName.bonusEpicPrimeStatPercentage: bonusEpicPrimeStatDefenseAttackDamageCriticalRatePercentage,
  PotentialName.bonusEpicPrimeDefensePercentage: bonusEpicPrimeStatDefenseAttackDamageCriticalRatePercentage,
  PotentialName.bonusEpicPrimeAttackPercentage: bonusEpicPrimeStatDefenseAttackDamageCriticalRatePercentage,
  PotentialName.bonusEpicPrimeDamage: bonusEpicPrimeStatDefenseAttackDamageCriticalRatePercentage,
  PotentialName.bonusEpicPrimeCriticalRate: bonusEpicPrimeStatDefenseAttackDamageCriticalRatePercentage,
  PotentialName.bonusEpicPrimeHpPercentage: bonusEpicPrimeHpMpPercentage,
  PotentialName.bonusEpicPrimeMpPercentage: bonusEpicPrimeHpMpPercentage,
  PotentialName.bonusEpicPrimeAllStatPercentage: bonusEpicPrimeAllStatPercentage,
  PotentialName.bonusEpicPrimeIgnoreDefense: bonusEpicPrimeIgnoreDefense,
  // Unique Prime & Legendary Non Prime
  PotentialName.bonusUniquePrimeStat: bonusUniquePrimeStat,
  PotentialName.bonusUniquePrimeStatPerLevel: bonusUniquePrimeStatPerLevel,
  PotentialName.bonusUniquePrimeAtt: bonusUniquePrimeAtt,
  PotentialName.bonusUniquePrimeHp: bonusUniquePrimeHpMp,
  PotentialName.bonusUniquePrimeMp: bonusUniquePrimeHpMp,
  PotentialName.bonusUniquePrimeStatPercentage: bonusUniquePrimeStatAttackDamageCriticalRatePercentage,
  PotentialName.bonusUniquePrimeAttackPercentage: bonusUniquePrimeStatAttackDamageCriticalRatePercentage,
  PotentialName.bonusUniquePrimeDamage: bonusUniquePrimeStatAttackDamageCriticalRatePercentage,
  PotentialName.bonusUniquePrimeCriticalRate: bonusUniquePrimeStatAttackDamageCriticalRatePercentage,
  PotentialName.bonusUniquePrimeHpPercentage: bonusUniquePrimeHpMpPercentage,
  PotentialName.bonusUniquePrimeMpPercentage: bonusUniquePrimeHpMpPercentage,
  PotentialName.bonusUniquePrimeAllStatPercentage: bonusUniquePrimeAllStatPercentage,
  PotentialName.bonusUniquePrimeHpRecovery: bonusUniquePrimeHpRecovery,
  PotentialName.bonusUniquePrimeBossDamage: bonusUniquePrimeBossDamage,
  PotentialName.bonusUniquePrimeIgnoreDefense: bonusUniquePrimeIgnoreDefense,
  // Legendary Prime
  PotentialName.bonusLegendaryPrimeStat: bonusLegendaryPrimeStat,
  PotentialName.bonusLegendaryPrimeAtt: bonusLegendaryPrimeAtt,
  PotentialName.bonusLegendaryPrimeHp: bonusLegendaryPrimeHpMp,
  PotentialName.bonusLegendaryPrimeMp: bonusLegendaryPrimeHpMp,
  PotentialName.bonusLegendaryPrimeStatPercentage: bonusLegendaryPrimeStatAttackDamageCriticalRatePercentage,
  PotentialName.bonusLegendaryPrimeAttackPercentage: bonusLegendaryPrimeStatAttackDamageCriticalRatePercentage,
  PotentialName.bonusLegendaryPrimeDamage: bonusLegendaryPrimeStatAttackDamageCriticalRatePercentage,
  PotentialName.bonusLegendaryPrimeCriticalRate: bonusLegendaryPrimeStatAttackDamageCriticalRatePercentage,
  PotentialName.bonusLegendaryPrimeHpPercentage: bonusLegendaryPrimeHpMpPercentage,
  PotentialName.bonusLegendaryPrimeMpPercentage: bonusLegendaryPrimeHpMpPercentage,
  PotentialName.bonusLegendaryPrimeAllStatPercentage: bonusLegendaryPrimeAllStatPercentage,
  PotentialName.bonusLegendaryPrimeStatPerLevel: bonusLegendaryPrimeStatPerLevel,
  PotentialName.bonusLegendaryPrimeHpRecovery: bonusLegendaryPrimeHpRecovery,
  PotentialName.bonusLegendaryPrimeMesosObtained: bonusLegendaryPrimeMesosObtainedItemDropRate,
  PotentialName.bonusLegendaryPrimeItemDropRate: bonusLegendaryPrimeMesosObtainedItemDropRate,
  PotentialName.bonusLegendaryPrimeSkillCooldown1: bonusLegendaryPrimeSkillCooldown1,
  PotentialName.bonusLegendaryPrimeCriticalDamageStatic: bonusLegendaryPrimeCriticalDamageStatic,
  PotentialName.bonusLegendaryPrimeCriticalDamage: bonusLegendaryPrimeCriticalDamage,
  PotentialName.bonusLegendaryPrimeBossDamage: bonusLegendaryPrimeBossDamage,
  PotentialName.bonusLegendaryPrimeIgnoreDefense: bonusLegendaryPrimeIgnoreDefense
};