// ignore_for_file: constant_identifier_names

import 'package:maplestory_builder/core/constants.dart';

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


//Main Potential
const List<num> rareNonPrimeStat = [
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

const List<num> rarePrimeEpicNonPrimeStat = [
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
const List<num> rarePrimeEpicNonPrimeDefenseHpMp = [
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
const List<num> rarePrimeEpicNonPrimeStatDefenseHpMpPercentage = [
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
const List<num> rarePrimeEpicNonPrimeAllStat = [
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

// Hat
const Map<PotentialTier, List<PotentialLine>> hatPotentials = {
  PotentialTier.rare: [
    // Prime
    PotentialLine(statType: StatType.strPercentage, isPrime: true, statValue: rarePrimeEpicNonPrimeStatDefenseHpMpPercentage),
    PotentialLine(statType: StatType.dexPercentage, isPrime: true, statValue: rarePrimeEpicNonPrimeStatDefenseHpMpPercentage),
    PotentialLine(statType: StatType.lukPercentage, isPrime: true, statValue: rarePrimeEpicNonPrimeStatDefenseHpMpPercentage),
    PotentialLine(statType: StatType.intPercentage, isPrime: true, statValue: rarePrimeEpicNonPrimeStatDefenseHpMpPercentage),
    PotentialLine(statType: StatType.hpPercentage, isPrime: true, statValue: rarePrimeEpicNonPrimeStatDefenseHpMpPercentage),
    PotentialLine(statType: StatType.mpPercentage, isPrime: true, statValue: rarePrimeEpicNonPrimeStatDefenseHpMpPercentage),
    PotentialLine(statType: StatType.defensePercentage, isPrime: true, statValue: rarePrimeEpicNonPrimeStatDefenseHpMpPercentage),
    PotentialLine(statType: StatType.allStats, isPrime: true, statValue: rarePrimeEpicNonPrimeAllStat),
    PotentialLine(statType: StatType.str, isPrime: true, statValue: rarePrimeEpicNonPrimeStat),
    PotentialLine(statType: StatType.dex, isPrime: true, statValue: rarePrimeEpicNonPrimeStat),
    PotentialLine(statType: StatType.int, isPrime: true, statValue: rarePrimeEpicNonPrimeStat),
    PotentialLine(statType: StatType.luk, isPrime: true, statValue: rarePrimeEpicNonPrimeStat),
    PotentialLine(statType: StatType.hp, isPrime: true, statValue: rarePrimeEpicNonPrimeDefenseHpMp),
    PotentialLine(statType: StatType.mp, isPrime: true, statValue: rarePrimeEpicNonPrimeDefenseHpMp),
    PotentialLine(statType: StatType.defense, isPrime: true, statValue: rarePrimeEpicNonPrimeDefenseHpMp),
    // Non-Prime
    PotentialLine(statType: StatType.str, statValue: rareNonPrimeStat),
    PotentialLine(statType: StatType.dex, statValue: rareNonPrimeStat),
    PotentialLine(statType: StatType.int, statValue: rareNonPrimeStat),
    PotentialLine(statType: StatType.luk, statValue: rareNonPrimeStat),
    PotentialLine(statType: StatType.hp, statValue: rareNonPrimeDefenseHpMp),
    PotentialLine(statType: StatType.mp, statValue: rareNonPrimeDefenseHpMp),
    PotentialLine(statType: StatType.defense, statValue: rareNonPrimeDefenseHpMp),
  ],
  // PotentialTier.epic: [
  //   StatType.str, StatType.dex, StatType.int, StatType.luk, StatType.hp, StatType.mp, StatType.defense, 
  //   StatType.strPercentage, StatType.dexPercentage, StatType.lukPercentage, StatType.intPercentage, StatType.hpPercentage, 
  //   StatType.mpPercentage, StatType.defensePercentage, StatType.allStats, StatType.allStatsPercentage,
  // ],
  // PotentialTier.unique: [
  //   StatType.strPercentage, StatType.dexPercentage, StatType.lukPercentage, StatType.intPercentage, StatType.hpPercentage, 
  //   StatType.mpPercentage, StatType.defensePercentage, StatType.allStatsPercentage, StatType.hpRecovery, StatType.skill,
  // ],
  // PotentialTier.legendary: [
  //   StatType.strPercentage, StatType.dexPercentage, StatType.lukPercentage, StatType.intPercentage, StatType.hpPercentage, 
  //   StatType.mpPercentage, StatType.defensePercentage, StatType.allStatsPercentage, StatType.hpRecovery, StatType.skill, StatType.skillCooldown
  // ],
};

//Top, Overall
const Map<PotentialTier, List<StatType>> topAndOverallPotentials = {
  PotentialTier.rare: [],
  PotentialTier.epic: [],
  PotentialTier.unique: [],
  PotentialTier.legendary: [],
};

//Bottom
const Map<PotentialTier, List<StatType>> bottomPotentials = {
  PotentialTier.rare: [],
  PotentialTier.epic: [],
  PotentialTier.unique: [],
  PotentialTier.legendary: [],
};

//Gloves
const Map<PotentialTier, List<StatType>> glovesPotentials = {
  PotentialTier.rare: [],
  PotentialTier.epic: [],
  PotentialTier.unique: [],
  PotentialTier.legendary: [],
};

//Shoes
const Map<PotentialTier, List<StatType>> shoesPotentials = {
  PotentialTier.rare: [],
  PotentialTier.epic: [],
  PotentialTier.unique: [],
  PotentialTier.legendary: [],
};

//Cape, Belt, Shoulder
const Map<PotentialTier, List<StatType>> capeBeltShoulderPotentials = {
  PotentialTier.rare: [],
  PotentialTier.epic: [],
  PotentialTier.unique: [],
  PotentialTier.legendary: [],
};

//Face, Eye, Ring, Pendant, Earring
const Map<PotentialTier, List<StatType>> faceEyeRingPendantEarringPotentials = {
  PotentialTier.rare: [],
  PotentialTier.epic: [],
  PotentialTier.unique: [],
  PotentialTier.legendary: [],
};

//Weapon
const Map<PotentialTier, List<StatType>> weaponPotentials = {
  PotentialTier.rare: [],
  PotentialTier.epic: [],
  PotentialTier.unique: [],
  PotentialTier.legendary: [],
};

//Secondary
const Map<PotentialTier, List<StatType>> secondaryPotentials = {
  PotentialTier.rare: [],
  PotentialTier.epic: [],
  PotentialTier.unique: [],
  PotentialTier.legendary: [],
};

//Emblem
const Map<PotentialTier, List<StatType>> emblemPotentials = {
  PotentialTier.rare: [],
  PotentialTier.epic: [],
  PotentialTier.unique: [],
  PotentialTier.legendary: [],
};

//Heart, Badge
const Map<PotentialTier, List<StatType>> heartAndBadgePotentials = {
  PotentialTier.rare: [],
  PotentialTier.epic: [],
  PotentialTier.unique: [],
  PotentialTier.legendary: [],
};


//Bonus Potential
// Hat

//Top, Overall, Bottom, Shoes, Cape, Belt, Shoulder

//Gloves

//Face, Eye, Ring, Pendant, Earring

//Weapon

//Secondary

//Emblem

//Heart, Badge


class PotentialLine {
  final StatType statType;
  final bool isPrime;
  final List<num>? statValue;
  // final Skill? skillValue;

  const PotentialLine({
    required this.statType,
    required this.statValue,
    this.isPrime = false,
  });
}