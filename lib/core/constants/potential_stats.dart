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
const List<num> rarePrimeCriticalRate = [
  0.04 // 0+
];

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
const List<num> epicPrimeCriticalRate = [
  0.08 // 50+
];
const List<num> epicPrimeIgnoreDefense = [
  0.15 // 50+
];

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
  0.010, // 151+
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
const List<num> uniquePrimeBossDamage = [
  0.3 // 100+
];
const List<num> uniquePrimeIgnoreDefense = [
  0.3 // 100+
];

const List<num> legendaryPrimeStatAtt = uniquePrimeStatAtt;
const List<num> legendaryPrimeStatAttackDamageCriticalRatePercentagePercentage = [
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
const List<num> legendaryPrimeSkillCooldown1 = [
  1 // Requires 70+ equipment
];
const List<num> legendaryPrimeSkillCooldown2 = [
  2 // Requires 120+ equipment
];
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
const List<num> legendaryPrimeBossDamage35 = [
  0.35 // 100+
];
const List<num> legendaryPrimeBossDamage40 = [
  0.4 // 100+
];
const List<num> legendaryPrimeIgnoreDefense35 = [
  0.35 // 100+
];
const List<num> legendaryPrimeIgnoreDefense40 = [
  0.4 // 100+
];

// Default that is shared between all equips
const Map<PotentialTier, List<PotentialLine>> defaultPotentials = {
  PotentialTier.rare: [
    // Prime
    PotentialLine(statType: StatType.strPercentage, isPrime: true, statValue: rarePrimeStatDefenseHpMpPercentage),
    PotentialLine(statType: StatType.dexPercentage, isPrime: true, statValue: rarePrimeStatDefenseHpMpPercentage),
    PotentialLine(statType: StatType.lukPercentage, isPrime: true, statValue: rarePrimeStatDefenseHpMpPercentage),
    PotentialLine(statType: StatType.intPercentage, isPrime: true, statValue: rarePrimeStatDefenseHpMpPercentage),
    PotentialLine(statType: StatType.hpPercentage, isPrime: true, statValue: rarePrimeStatDefenseHpMpPercentage),
    PotentialLine(statType: StatType.mpPercentage, isPrime: true, statValue: rarePrimeStatDefenseHpMpPercentage),
    PotentialLine(statType: StatType.defensePercentage, isPrime: true, statValue: rarePrimeStatDefenseHpMpPercentage),
    PotentialLine(statType: StatType.allStats, isPrime: true, statValue: rarePrimeAllStat),
    PotentialLine(statType: StatType.str, isPrime: true, statValue: rarePrimeStatAtt),
    PotentialLine(statType: StatType.dex, isPrime: true, statValue: rarePrimeStatAtt),
    PotentialLine(statType: StatType.int, isPrime: true, statValue: rarePrimeStatAtt),
    PotentialLine(statType: StatType.luk, isPrime: true, statValue: rarePrimeStatAtt),
    PotentialLine(statType: StatType.hp, isPrime: true, statValue: rarePrimeDefenseHpMp),
    PotentialLine(statType: StatType.mp, isPrime: true, statValue: rarePrimeDefenseHpMp),
    PotentialLine(statType: StatType.defense, isPrime: true, statValue: rarePrimeDefenseHpMp),
    // Non-Prime
    PotentialLine(statType: StatType.str, statValue: rareNonPrimeStatAtt),
    PotentialLine(statType: StatType.dex, statValue: rareNonPrimeStatAtt),
    PotentialLine(statType: StatType.int, statValue: rareNonPrimeStatAtt),
    PotentialLine(statType: StatType.luk, statValue: rareNonPrimeStatAtt),
    PotentialLine(statType: StatType.hp, statValue: rareNonPrimeDefenseHpMp),
    PotentialLine(statType: StatType.mp, statValue: rareNonPrimeDefenseHpMp),
    PotentialLine(statType: StatType.defense, statValue: rareNonPrimeDefenseHpMp),
  ],
  PotentialTier.epic: [
    // Prime
    PotentialLine(statType: StatType.strPercentage, isPrime: true, statValue: epicPrimeStatAttackDamageDefenseHpMpPercentage),
    PotentialLine(statType: StatType.dexPercentage, isPrime: true, statValue: epicPrimeStatAttackDamageDefenseHpMpPercentage),
    PotentialLine(statType: StatType.lukPercentage, isPrime: true, statValue: epicPrimeStatAttackDamageDefenseHpMpPercentage),
    PotentialLine(statType: StatType.intPercentage, isPrime: true, statValue: epicPrimeStatAttackDamageDefenseHpMpPercentage),
    PotentialLine(statType: StatType.hpPercentage, isPrime: true, statValue: epicPrimeStatAttackDamageDefenseHpMpPercentage),
    PotentialLine(statType: StatType.mpPercentage, isPrime: true, statValue: epicPrimeStatAttackDamageDefenseHpMpPercentage),
    PotentialLine(statType: StatType.defensePercentage, isPrime: true, statValue: epicPrimeStatAttackDamageDefenseHpMpPercentage),
    PotentialLine(statType: StatType.allStatsPercentage, isPrime: true, statValue: epicPrimeAllStatPercentage),
    // Non-Prime
    PotentialLine(statType: StatType.strPercentage, statValue: rarePrimeStatDefenseHpMpPercentage),
    PotentialLine(statType: StatType.dexPercentage, statValue: rarePrimeStatDefenseHpMpPercentage),
    PotentialLine(statType: StatType.lukPercentage, statValue: rarePrimeStatDefenseHpMpPercentage),
    PotentialLine(statType: StatType.intPercentage, statValue: rarePrimeStatDefenseHpMpPercentage),
    PotentialLine(statType: StatType.hpPercentage, statValue: rarePrimeStatDefenseHpMpPercentage),
    PotentialLine(statType: StatType.mpPercentage, statValue: rarePrimeStatDefenseHpMpPercentage),
    PotentialLine(statType: StatType.defensePercentage, statValue: rarePrimeStatDefenseHpMpPercentage),
    PotentialLine(statType: StatType.str, statValue: rarePrimeStatAtt),
    PotentialLine(statType: StatType.dex, statValue: rarePrimeStatAtt),
    PotentialLine(statType: StatType.int, statValue: rarePrimeStatAtt),
    PotentialLine(statType: StatType.luk, statValue: rarePrimeStatAtt),
    PotentialLine(statType: StatType.allStats, statValue: rarePrimeAllStat),
    PotentialLine(statType: StatType.hp, statValue: rarePrimeDefenseHpMp),
    PotentialLine(statType: StatType.mp, statValue: rarePrimeDefenseHpMp),
    PotentialLine(statType: StatType.defense, statValue: rarePrimeDefenseHpMp),
  ],
  PotentialTier.unique: [
    // Prime
    PotentialLine(statType: StatType.allStatsPercentage, isPrime: true, statValue: uniquePrimeAllStatPercentage),
    PotentialLine(statType: StatType.strPercentage, isPrime: true, statValue: uniquePrimeStatAttackDamageCriticalRatePercentage),
    PotentialLine(statType: StatType.dexPercentage, isPrime: true, statValue: uniquePrimeStatAttackDamageCriticalRatePercentage),
    PotentialLine(statType: StatType.lukPercentage, isPrime: true, statValue: uniquePrimeStatAttackDamageCriticalRatePercentage),
    PotentialLine(statType: StatType.intPercentage, isPrime: true, statValue: uniquePrimeStatAttackDamageCriticalRatePercentage),
    PotentialLine(statType: StatType.hpPercentage, isPrime: true, statValue: uniquePrimeDefenseHpMpPercentage),
    PotentialLine(statType: StatType.mpPercentage, isPrime: true, statValue: uniquePrimeDefenseHpMpPercentage),
    // Non-Prime
    PotentialLine(statType: StatType.allStatsPercentage, statValue: epicPrimeAllStatPercentage),
    PotentialLine(statType: StatType.strPercentage, statValue: epicPrimeStatAttackDamageDefenseHpMpPercentage),
    PotentialLine(statType: StatType.dexPercentage, statValue: epicPrimeStatAttackDamageDefenseHpMpPercentage),
    PotentialLine(statType: StatType.lukPercentage, statValue: epicPrimeStatAttackDamageDefenseHpMpPercentage),
    PotentialLine(statType: StatType.intPercentage, statValue: epicPrimeStatAttackDamageDefenseHpMpPercentage),
    PotentialLine(statType: StatType.hpPercentage, statValue: epicPrimeStatAttackDamageDefenseHpMpPercentage),
    PotentialLine(statType: StatType.mpPercentage, statValue: epicPrimeStatAttackDamageDefenseHpMpPercentage),
    PotentialLine(statType: StatType.defensePercentage, statValue: epicPrimeStatAttackDamageDefenseHpMpPercentage),
  ],
  PotentialTier.legendary: [
    // Prime
    PotentialLine(statType: StatType.allStatsPercentage, isPrime: true, statValue: legendaryPrimeAllStatPercentage),
    PotentialLine(statType: StatType.strPercentage, isPrime: true, statValue: legendaryPrimeStatAttackDamageCriticalRatePercentagePercentage),
    PotentialLine(statType: StatType.dexPercentage, isPrime: true, statValue: legendaryPrimeStatAttackDamageCriticalRatePercentagePercentage),
    PotentialLine(statType: StatType.lukPercentage, isPrime: true, statValue: legendaryPrimeStatAttackDamageCriticalRatePercentagePercentage),
    PotentialLine(statType: StatType.intPercentage, isPrime: true, statValue: legendaryPrimeStatAttackDamageCriticalRatePercentagePercentage),
    PotentialLine(statType: StatType.hpPercentage, isPrime: true, statValue: legendaryPrimeHpMpPercentage),
    PotentialLine(statType: StatType.mpPercentage, isPrime: true, statValue: legendaryPrimeHpMpPercentage),
    // Non-Prime
    PotentialLine(statType: StatType.allStatsPercentage, statValue: uniquePrimeAllStatPercentage),
    PotentialLine(statType: StatType.strPercentage, statValue: uniquePrimeStatAttackDamageCriticalRatePercentage),
    PotentialLine(statType: StatType.dexPercentage, statValue: uniquePrimeStatAttackDamageCriticalRatePercentage),
    PotentialLine(statType: StatType.lukPercentage, statValue: uniquePrimeStatAttackDamageCriticalRatePercentage),
    PotentialLine(statType: StatType.intPercentage, statValue: uniquePrimeStatAttackDamageCriticalRatePercentage),
    PotentialLine(statType: StatType.hpPercentage, statValue: uniquePrimeDefenseHpMpPercentage),
    PotentialLine(statType: StatType.mpPercentage, statValue: uniquePrimeDefenseHpMpPercentage),
  ],
};

// Hat
const Map<PotentialTier, List<PotentialLine>> hatPotentials = {
  PotentialTier.unique: [
    // Prime
    PotentialLine(statType: StatType.hpRecovery, isPrime: true, statValue: uniquePrimeHpRecovery),
    // TODO: StatType.skill - Decent Mystic Door - requires 70+
  ],
  PotentialTier.legendary: [
    // Prime
    StaticPotentialLine(statType: StatType.skillCooldown, isPrime: true, statValue: legendaryPrimeSkillCooldown2),
    StaticPotentialLine(statType: StatType.skillCooldown, isPrime: true, statValue: legendaryPrimeSkillCooldown1),
    PotentialLine(statType: StatType.hpRecovery, isPrime: true, statValue: legendaryPrimeHpRecovery),
    // TODO: StatType.skill - Decent Advanced Blessing - requires 120+
    // Non-Prime
    PotentialLine(statType: StatType.hpRecovery, statValue: uniquePrimeHpRecovery),
    // TODO: StatType.skill - Decent Mystic Door - requires 70+
  ],
};

//Top, Overall
const Map<PotentialTier, List<PotentialLine>> topAndOverallPotentials = {
  PotentialTier.unique: [
    // Prime
    PotentialLine(statType: StatType.hpRecovery, isPrime: true, statValue: uniquePrimeHpRecovery),
  ],
  PotentialTier.legendary: [
    // Prime
    PotentialLine(statType: StatType.hpRecovery, isPrime: true, statValue: legendaryPrimeHpRecovery),
    // Non-Prime
    PotentialLine(statType: StatType.hpRecovery, statValue: uniquePrimeHpRecovery),
  ],
};

//Bottom
const Map<PotentialTier, List<PotentialLine>> bottomPotentials = {
  PotentialTier.unique: [
    // Prime
    PotentialLine(statType: StatType.hpRecovery, isPrime: true, statValue: uniquePrimeHpRecovery),
    // TODO: StatType.skill - Decent Hyper Body - requires 70+
    
  ],
  PotentialTier.legendary: [
    // Prime
    PotentialLine(statType: StatType.hpRecovery, isPrime: true, statValue: legendaryPrimeHpRecovery),
    // Non-Prime
    PotentialLine(statType: StatType.hpRecovery, statValue: uniquePrimeHpRecovery),
    // TODO: StatType.skill - Decent Hyper Body - requires 70+
  ],
};

//Gloves
const Map<PotentialTier, List<PotentialLine>> glovesPotentials = {
  PotentialTier.unique: [
    // Prime
    PotentialLine(statType: StatType.hpRecovery, isPrime: true, statValue: uniquePrimeHpRecovery),
    PotentialLine(statType: StatType.str, isPrime: true, statValue: uniquePrimeStatAtt),
    PotentialLine(statType: StatType.dex, isPrime: true, statValue: uniquePrimeStatAtt),
    PotentialLine(statType: StatType.int, isPrime: true, statValue: uniquePrimeStatAtt),
    PotentialLine(statType: StatType.luk, isPrime: true, statValue: uniquePrimeStatAtt),
    PotentialLine(statType: StatType.attack, isPrime: true, statValue: uniquePrimeStatAtt),
    PotentialLine(statType: StatType.mattack, isPrime: true, statValue: uniquePrimeStatAtt),
    // TODO: StatType.skill - Decent Sharp Eyes - requires 120+
  ],
  PotentialTier.legendary: [
    // Prime
    PotentialLine(statType: StatType.critDamage, isPrime: true, statValue: legendaryPrimeCriticalDamage),
    PotentialLine(statType: StatType.hpRecovery, isPrime: true, statValue: legendaryPrimeHpRecovery),
    // TODO: StatType.skill - Decent Speed Infusion - requires 120+
    // Non-Prime
    PotentialLine(statType: StatType.str, statValue: uniquePrimeStatAtt),
    PotentialLine(statType: StatType.dex, statValue: uniquePrimeStatAtt),
    PotentialLine(statType: StatType.int, statValue: uniquePrimeStatAtt),
    PotentialLine(statType: StatType.luk, statValue: uniquePrimeStatAtt),
    PotentialLine(statType: StatType.attack, statValue: uniquePrimeStatAtt),
    PotentialLine(statType: StatType.mattack, statValue: uniquePrimeStatAtt),
    PotentialLine(statType: StatType.hpRecovery, statValue: uniquePrimeHpRecovery),
    // TODO: StatType.skill - Decent Sharp Eyes - requires 120+
  ],
};

//Shoes
const Map<PotentialTier, List<PotentialLine>> shoesPotentials = {
  PotentialTier.unique: [
    // Prime
    PotentialLine(statType: StatType.hpRecovery, isPrime: true, statValue: uniquePrimeHpRecovery),
    // TODO: StatType.skill - Decent Haste - requires 70+
  ],
  PotentialTier.legendary: [
    // Prime
    PotentialLine(statType: StatType.hpRecovery, isPrime: true, statValue: legendaryPrimeHpRecovery),
    // TODO: StatType.skill - Decent Combat Orders - requires 70+
    // Non-Prime
    PotentialLine(statType: StatType.hpRecovery, statValue: uniquePrimeHpRecovery),
    // TODO: StatType.skill - Decent Haste - requires 70+
  ],
};

//Cape, Belt, Shoulder
const Map<PotentialTier, List<PotentialLine>> capeBeltShoulderPotentials = {
  PotentialTier.unique: [
    // Prime
    PotentialLine(statType: StatType.hpRecovery, isPrime: true, statValue: uniquePrimeHpRecovery),
  ],
  PotentialTier.legendary: [
    // Prime
    PotentialLine(statType: StatType.hpRecovery, isPrime: true, statValue: legendaryPrimeHpRecovery),
    // Non-Prime
    PotentialLine(statType: StatType.hpRecovery, statValue: uniquePrimeHpRecovery),
  ],
};

//Face, Eye, Ring, Pendant, Earring
const Map<PotentialTier, List<PotentialLine>> faceEyeRingPendantEarringPotentials = {
  PotentialTier.unique: [
    // Prime
    PotentialLine(statType: StatType.hpRecovery, isPrime: true, statValue: uniquePrimeHpRecovery),
  ],
  PotentialTier.legendary: [
    // Prime
    PotentialLine(statType: StatType.itemDropRate, isPrime: true, statValue: legendaryPrimeMesosObtainedItemDropRate),
    PotentialLine(statType: StatType.mesosObtained, isPrime: true, statValue: legendaryPrimeMesosObtainedItemDropRate),
    PotentialLine(statType: StatType.hpRecovery, isPrime: true, statValue: legendaryPrimeHpRecovery),
    // Non-Prime
    PotentialLine(statType: StatType.hpRecovery, statValue: uniquePrimeHpRecovery),
  ],
};

//Weapon, Secondary
const Map<PotentialTier, List<PotentialLine>> weaponSecondaryPotentials = {
  PotentialTier.rare: [
    // Prime
    StaticPotentialLine(statType: StatType.critRate, isPrime: true, statValue: rarePrimeCriticalRate),
    PotentialLine(statType: StatType.attack, isPrime: true, statValue: rarePrimeStatAtt),
    PotentialLine(statType: StatType.mattack, isPrime: true, statValue: rarePrimeStatAtt),
    // Non Prime
    PotentialLine(statType: StatType.attack, statValue: rareNonPrimeStatAtt),
    PotentialLine(statType: StatType.mattack, statValue: rareNonPrimeStatAtt),
  ],
  PotentialTier.epic: [
    // Prime
    PotentialLine(statType: StatType.attackPercentage, isPrime: true, statValue: epicPrimeStatAttackDamageDefenseHpMpPercentage),
    PotentialLine(statType: StatType.mattackPercentage, isPrime: true, statValue: epicPrimeStatAttackDamageDefenseHpMpPercentage),
    StaticPotentialLine(statType: StatType.ignoreDefense, isPrime: true, statValue: epicPrimeIgnoreDefense),
    PotentialLine(statType: StatType.damage, isPrime: true, statValue: epicPrimeStatAttackDamageDefenseHpMpPercentage),
    StaticPotentialLine(statType: StatType.critRate, isPrime: true, statValue: epicPrimeCriticalRate),
    // Non Prime
    StaticPotentialLine(statType: StatType.critRate, statValue: rarePrimeCriticalRate),
    PotentialLine(statType: StatType.attack, statValue: rarePrimeStatAtt),
    PotentialLine(statType: StatType.mattack, statValue: rarePrimeStatAtt),
  ],
  PotentialTier.unique: [
    // Prime
    PotentialLine(statType: StatType.attackPercentage, isPrime: true, statValue: uniquePrimeStatAttackDamageCriticalRatePercentage),
    PotentialLine(statType: StatType.mattackPercentage, isPrime: true, statValue: uniquePrimeStatAttackDamageCriticalRatePercentage),
    StaticPotentialLine(statType: StatType.bossDamage, isPrime: true, statValue: uniquePrimeBossDamage),
    StaticPotentialLine(statType: StatType.ignoreDefense, isPrime: true, statValue: uniquePrimeIgnoreDefense),
    PotentialLine(statType: StatType.damage, isPrime: true, statValue: uniquePrimeStatAttackDamageCriticalRatePercentage),
    PotentialLine(statType: StatType.critRate, isPrime: true, statValue: uniquePrimeStatAttackDamageCriticalRatePercentage),
    // Non Prime
    PotentialLine(statType: StatType.attackPercentage, statValue: epicPrimeStatAttackDamageDefenseHpMpPercentage),
    PotentialLine(statType: StatType.mattackPercentage, statValue: epicPrimeStatAttackDamageDefenseHpMpPercentage),
    StaticPotentialLine(statType: StatType.ignoreDefense, statValue: epicPrimeIgnoreDefense),
    PotentialLine(statType: StatType.damage, statValue: epicPrimeStatAttackDamageDefenseHpMpPercentage),
    StaticPotentialLine(statType: StatType.critRate, statValue: epicPrimeCriticalRate),
  ],
  PotentialTier.legendary: [
    // Prime
    PotentialLine(statType: StatType.attackPercentage, isPrime: true, statValue: legendaryPrimeStatAttackDamageCriticalRatePercentagePercentage),
    PotentialLine(statType: StatType.mattackPercentage, isPrime: true, statValue: legendaryPrimeStatAttackDamageCriticalRatePercentagePercentage),
    StaticPotentialLine(statType: StatType.bossDamage, isPrime: true, statValue: legendaryPrimeBossDamage40),
    StaticPotentialLine(statType: StatType.bossDamage, isPrime: true, statValue: legendaryPrimeBossDamage35),
    StaticPotentialLine(statType: StatType.ignoreDefense, isPrime: true, statValue: legendaryPrimeIgnoreDefense40),
    StaticPotentialLine(statType: StatType.ignoreDefense, isPrime: true, statValue: legendaryPrimeIgnoreDefense35),
    PotentialLine(statType: StatType.damage, isPrime: true, statValue: legendaryPrimeStatAttackDamageCriticalRatePercentagePercentage),
    PotentialLine(statType: StatType.critRate, isPrime: true, statValue: legendaryPrimeStatAttackDamageCriticalRatePercentagePercentage),
    PotentialLine(statType: StatType.attack, isPrime: true, statValue: legendaryPrimeStatAtt),
    PotentialLine(statType: StatType.mattack, isPrime: true, statValue: legendaryPrimeStatAtt),
    // Non Prime
    PotentialLine(statType: StatType.attackPercentage, statValue: uniquePrimeStatAttackDamageCriticalRatePercentage),
    PotentialLine(statType: StatType.mattackPercentage, statValue: uniquePrimeStatAttackDamageCriticalRatePercentage),
    StaticPotentialLine(statType: StatType.bossDamage, statValue: uniquePrimeBossDamage),
    StaticPotentialLine(statType: StatType.ignoreDefense, statValue: uniquePrimeIgnoreDefense),
    PotentialLine(statType: StatType.damage, statValue: uniquePrimeStatAttackDamageCriticalRatePercentage),
    PotentialLine(statType: StatType.critRate, statValue: uniquePrimeStatAttackDamageCriticalRatePercentage),
  ],
};

//Emblem
const Map<PotentialTier, List<PotentialLine>> emblemPotentials = {
  PotentialTier.rare: [
    // Prime
    StaticPotentialLine(statType: StatType.critRate, isPrime: true, statValue: rarePrimeCriticalRate),
    PotentialLine(statType: StatType.attack, isPrime: true, statValue: rarePrimeStatAtt),
    PotentialLine(statType: StatType.mattack, isPrime: true, statValue: rarePrimeStatAtt),
    // Non Prime
    PotentialLine(statType: StatType.attack, statValue: rareNonPrimeStatAtt),
    PotentialLine(statType: StatType.mattack, statValue: rareNonPrimeStatAtt),
  ],
  PotentialTier.epic: [
    // Prime
    PotentialLine(statType: StatType.attackPercentage, isPrime: true, statValue: epicPrimeStatAttackDamageDefenseHpMpPercentage),
    PotentialLine(statType: StatType.mattackPercentage, isPrime: true, statValue: epicPrimeStatAttackDamageDefenseHpMpPercentage),
    StaticPotentialLine(statType: StatType.ignoreDefense, isPrime: true, statValue: epicPrimeIgnoreDefense),
    PotentialLine(statType: StatType.damage, isPrime: true, statValue: epicPrimeStatAttackDamageDefenseHpMpPercentage),
    StaticPotentialLine(statType: StatType.critRate, isPrime: true, statValue: epicPrimeCriticalRate),
    // Non Prime
    StaticPotentialLine(statType: StatType.critRate, statValue: rarePrimeCriticalRate),
    PotentialLine(statType: StatType.attack, statValue: rarePrimeStatAtt),
    PotentialLine(statType: StatType.mattack, statValue: rarePrimeStatAtt),
  ],
  PotentialTier.unique: [
    // Prime
    PotentialLine(statType: StatType.attackPercentage, isPrime: true, statValue: uniquePrimeStatAttackDamageCriticalRatePercentage),
    PotentialLine(statType: StatType.mattackPercentage, isPrime: true, statValue: uniquePrimeStatAttackDamageCriticalRatePercentage),
    StaticPotentialLine(statType: StatType.ignoreDefense, isPrime: true, statValue: uniquePrimeIgnoreDefense),
    PotentialLine(statType: StatType.damage, isPrime: true, statValue: uniquePrimeStatAttackDamageCriticalRatePercentage),
    PotentialLine(statType: StatType.critRate, isPrime: true, statValue: uniquePrimeStatAttackDamageCriticalRatePercentage),
    // Non Prime
    PotentialLine(statType: StatType.attackPercentage, statValue: epicPrimeStatAttackDamageDefenseHpMpPercentage),
    PotentialLine(statType: StatType.mattackPercentage, statValue: epicPrimeStatAttackDamageDefenseHpMpPercentage),
    StaticPotentialLine(statType: StatType.ignoreDefense, statValue: epicPrimeIgnoreDefense),
    PotentialLine(statType: StatType.damage, statValue: epicPrimeStatAttackDamageDefenseHpMpPercentage),
    StaticPotentialLine(statType: StatType.critRate, statValue: epicPrimeCriticalRate),
  ],
  PotentialTier.legendary: [
    // Prime
    PotentialLine(statType: StatType.attackPercentage, isPrime: true, statValue: legendaryPrimeStatAttackDamageCriticalRatePercentagePercentage),
    PotentialLine(statType: StatType.mattackPercentage, isPrime: true, statValue: legendaryPrimeStatAttackDamageCriticalRatePercentagePercentage),
    StaticPotentialLine(statType: StatType.ignoreDefense, isPrime: true, statValue: legendaryPrimeIgnoreDefense40),
    StaticPotentialLine(statType: StatType.ignoreDefense, isPrime: true, statValue: legendaryPrimeIgnoreDefense35),
    PotentialLine(statType: StatType.damage, isPrime: true, statValue: legendaryPrimeStatAttackDamageCriticalRatePercentagePercentage),
    PotentialLine(statType: StatType.critRate, isPrime: true, statValue: legendaryPrimeStatAttackDamageCriticalRatePercentagePercentage),
    PotentialLine(statType: StatType.attack, isPrime: true, statValue: legendaryPrimeStatAtt),
    PotentialLine(statType: StatType.mattack, isPrime: true, statValue: legendaryPrimeStatAtt),
    // Non Prime
    PotentialLine(statType: StatType.attackPercentage, statValue: uniquePrimeStatAttackDamageCriticalRatePercentage),
    PotentialLine(statType: StatType.mattackPercentage, statValue: uniquePrimeStatAttackDamageCriticalRatePercentage),
    StaticPotentialLine(statType: StatType.ignoreDefense, statValue: uniquePrimeIgnoreDefense),
    PotentialLine(statType: StatType.damage, statValue: uniquePrimeStatAttackDamageCriticalRatePercentage),
    PotentialLine(statType: StatType.critRate, statValue: uniquePrimeStatAttackDamageCriticalRatePercentage),
  ],
};

//Heart, Badge
const Map<PotentialTier, List<PotentialLine>> heartAndBadgePotentials = {
  PotentialTier.unique: [
    // Prime
    PotentialLine(statType: StatType.hpRecovery, isPrime: true, statValue: uniquePrimeHpRecovery),
  ],
  PotentialTier.legendary: [
    // Prime
    PotentialLine(statType: StatType.hpRecovery, isPrime: true, statValue: legendaryPrimeHpRecovery),
    // Non-Prime
    PotentialLine(statType: StatType.hpRecovery, statValue: uniquePrimeHpRecovery),
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
const List<num> bonusRarePrimeHpMpDefense = [
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
const List<num> bonusRarePrimeSpeedjump = [
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
const List<num> bonusEpicPrimeIgnoreDefense = [
  0.03
];

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
const List<num> bonusUniquePrimeStatPerLevel = [
  32,
];
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
const List<num> bonusUniquePrimeBossDamage = [
  0.12
];
const List<num> bonusUniquePrimeIgnoreDefense = [
  0.04
];

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
const List<num> bonusLegendaryPrimeStatPerLevel = [
  32
];
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
const List<num> bonusLegendaryPrimeSkillCooldown1 = [
  1
];
const List<num> bonusLegendaryPrimeCriticalDamageStatic = [
  0.01
];
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
const List<num> bonusLegendaryPrimeBossDamage = [
  0.18
];
const List<num> bonusLegendaryprimeIgnoreDefense = [
  0.05
];

const Map<PotentialTier, List<PotentialLine>> bonusDefaultPotentials = {
  PotentialTier.rare: [
    // Prime
    PotentialLine(statType: StatType.strPercentage, isPrime: true, statValue: bonusRarePrimeStatHpMpDefenseAttackDamageCriticalRatePercentage),
    PotentialLine(statType: StatType.dexPercentage, isPrime: true, statValue: bonusRarePrimeStatHpMpDefenseAttackDamageCriticalRatePercentage),
    PotentialLine(statType: StatType.intPercentage, isPrime: true, statValue: bonusRarePrimeStatHpMpDefenseAttackDamageCriticalRatePercentage),
    PotentialLine(statType: StatType.lukPercentage, isPrime: true, statValue: bonusRarePrimeStatHpMpDefenseAttackDamageCriticalRatePercentage),
    PotentialLine(statType: StatType.allStats, isPrime: true, statValue: bonusRarePrimeAllStat),
    PotentialLine(statType: StatType.hpPercentage, isPrime: true, statValue: bonusRarePrimeStatHpMpDefenseAttackDamageCriticalRatePercentage),
    PotentialLine(statType: StatType.mpPercentage, isPrime: true, statValue: bonusRarePrimeStatHpMpDefenseAttackDamageCriticalRatePercentage),
    PotentialLine(statType: StatType.defensePercentage, isPrime: true, statValue: bonusRarePrimeStatHpMpDefenseAttackDamageCriticalRatePercentage),
    PotentialLine(statType: StatType.str, isPrime: true, statValue: bonusRarePrimeStat),
    PotentialLine(statType: StatType.dex, isPrime: true, statValue: bonusRarePrimeStat),
    PotentialLine(statType: StatType.int, isPrime: true, statValue: bonusRarePrimeStat),
    PotentialLine(statType: StatType.luk, isPrime: true, statValue: bonusRarePrimeStat),
    PotentialLine(statType: StatType.attack, isPrime: true, statValue: bonusRarePrimeAtt),
    PotentialLine(statType: StatType.mattack, isPrime: true, statValue: bonusRarePrimeAtt),
    PotentialLine(statType: StatType.hp, isPrime: true, statValue: bonusRarePrimeHpMpDefense),
    PotentialLine(statType: StatType.mp, isPrime: true, statValue: bonusRarePrimeHpMpDefense),
    PotentialLine(statType: StatType.defense, isPrime: true, statValue: bonusRarePrimeHpMpDefense),
    PotentialLine(statType: StatType.speed, isPrime: true, statValue: bonusRarePrimeSpeedjump),
    PotentialLine(statType: StatType.jump, isPrime: true, statValue: bonusRarePrimeSpeedjump),
    // Non-Prime
    PotentialLine(statType: StatType.str, statValue: bonusRareNonPrimeStat),
    PotentialLine(statType: StatType.dex, statValue: bonusRareNonPrimeStat),
    PotentialLine(statType: StatType.int, statValue: bonusRareNonPrimeStat),
    PotentialLine(statType: StatType.luk, statValue: bonusRareNonPrimeStat),
    PotentialLine(statType: StatType.attack, statValue: bonusRareNonPrimeAtt),
    PotentialLine(statType: StatType.mattack, statValue: bonusRareNonPrimeAtt),
    PotentialLine(statType: StatType.hp, statValue: bonusRareNonPrimeHpMpDefense),
    PotentialLine(statType: StatType.mp, statValue: bonusRareNonPrimeHpMpDefense),
    PotentialLine(statType: StatType.defense, statValue: bonusRareNonPrimeHpMpDefense),
    PotentialLine(statType: StatType.speed, statValue: bonusRareNonPrimeSpeedJump),
    PotentialLine(statType: StatType.jump, statValue: bonusRareNonPrimeSpeedJump),
  ],
  PotentialTier.epic: [
    // Prime
    PotentialLine(statType: StatType.strPercentage, isPrime: true, statValue: bonusEpicPrimeStatDefenseAttackDamageCriticalRatePercentage),
    PotentialLine(statType: StatType.dexPercentage, isPrime: true, statValue: bonusEpicPrimeStatDefenseAttackDamageCriticalRatePercentage),
    PotentialLine(statType: StatType.intPercentage, isPrime: true, statValue: bonusEpicPrimeStatDefenseAttackDamageCriticalRatePercentage),
    PotentialLine(statType: StatType.lukPercentage, isPrime: true, statValue: bonusEpicPrimeStatDefenseAttackDamageCriticalRatePercentage),
    PotentialLine(statType: StatType.allStatsPercentage, isPrime: true, statValue: bonusEpicPrimeAllStatPercentage),
    PotentialLine(statType: StatType.hpPercentage, isPrime: true, statValue: bonusEpicPrimeHpMpPercentage),
    PotentialLine(statType: StatType.mpPercentage, isPrime: true, statValue: bonusEpicPrimeHpMpPercentage),
    PotentialLine(statType: StatType.defensePercentage, isPrime: true, statValue: bonusEpicPrimeStatDefenseAttackDamageCriticalRatePercentage),
    PotentialLine(statType: StatType.str, isPrime: true, statValue: bonusEpicPrimeStat),
    PotentialLine(statType: StatType.dex, isPrime: true, statValue: bonusEpicPrimeStat),
    PotentialLine(statType: StatType.int, isPrime: true, statValue: bonusEpicPrimeStat),
    PotentialLine(statType: StatType.luk, isPrime: true, statValue: bonusEpicPrimeStat),
    PotentialLine(statType: StatType.attack, isPrime: true, statValue: bonusEpicPrimeAtt),
    PotentialLine(statType: StatType.mattack, isPrime: true, statValue: bonusEpicPrimeAtt),
    PotentialLine(statType: StatType.hp, isPrime: true, statValue: bonusEpicPrimeHpMp),
    PotentialLine(statType: StatType.mp, isPrime: true, statValue: bonusEpicPrimeHpMp),
    PotentialLine(statType: StatType.defense, isPrime: true, statValue: bonusEpicPrimeDefense),
    PotentialLine(statType: StatType.speed, isPrime: true, statValue: bonusEpicPrimeSpeedJump),
    PotentialLine(statType: StatType.jump, isPrime: true, statValue: bonusEpicPrimeSpeedJump),
    // Non-Prime
    PotentialLine(statType: StatType.strPercentage, statValue: bonusRarePrimeStatHpMpDefenseAttackDamageCriticalRatePercentage),
    PotentialLine(statType: StatType.dexPercentage, statValue: bonusRarePrimeStatHpMpDefenseAttackDamageCriticalRatePercentage),
    PotentialLine(statType: StatType.intPercentage, statValue: bonusRarePrimeStatHpMpDefenseAttackDamageCriticalRatePercentage),
    PotentialLine(statType: StatType.lukPercentage, statValue: bonusRarePrimeStatHpMpDefenseAttackDamageCriticalRatePercentage),
    PotentialLine(statType: StatType.allStats, statValue: bonusRarePrimeAllStat),
    PotentialLine(statType: StatType.hpPercentage, statValue: bonusRarePrimeStatHpMpDefenseAttackDamageCriticalRatePercentage),
    PotentialLine(statType: StatType.mpPercentage, statValue: bonusRarePrimeStatHpMpDefenseAttackDamageCriticalRatePercentage),
    PotentialLine(statType: StatType.defensePercentage, statValue: bonusRarePrimeStatHpMpDefenseAttackDamageCriticalRatePercentage),
    PotentialLine(statType: StatType.str, statValue: bonusRarePrimeStat),
    PotentialLine(statType: StatType.dex, statValue: bonusRarePrimeStat),
    PotentialLine(statType: StatType.int, statValue: bonusRarePrimeStat),
    PotentialLine(statType: StatType.luk, statValue: bonusRarePrimeStat),
    PotentialLine(statType: StatType.attack, statValue: bonusRarePrimeAtt),
    PotentialLine(statType: StatType.mattack, statValue: bonusRarePrimeAtt),
    PotentialLine(statType: StatType.hp, statValue: bonusRarePrimeHpMpDefense),
    PotentialLine(statType: StatType.mp, statValue: bonusRarePrimeHpMpDefense),
    PotentialLine(statType: StatType.defense, statValue: bonusRarePrimeHpMpDefense),
    PotentialLine(statType: StatType.speed, statValue: bonusRarePrimeSpeedjump),
    PotentialLine(statType: StatType.jump, statValue: bonusRarePrimeSpeedjump),
  ],
  PotentialTier.unique: [
    // Prime
    PotentialLine(statType: StatType.strPercentage, isPrime: true, statValue: bonusUniquePrimeStatAttackDamageCriticalRatePercentage),
    PotentialLine(statType: StatType.dexPercentage, isPrime: true, statValue: bonusUniquePrimeStatAttackDamageCriticalRatePercentage),
    PotentialLine(statType: StatType.intPercentage, isPrime: true, statValue: bonusUniquePrimeStatAttackDamageCriticalRatePercentage),
    PotentialLine(statType: StatType.lukPercentage, isPrime: true, statValue: bonusUniquePrimeStatAttackDamageCriticalRatePercentage),
    PotentialLine(statType: StatType.allStatsPercentage, isPrime: true, statValue: bonusUniquePrimeAllStatPercentage),
    PotentialLine(statType: StatType.hpPercentage, isPrime: true, statValue: bonusUniquePrimeHpMpPercentage),
    PotentialLine(statType: StatType.mpPercentage, isPrime: true, statValue: bonusUniquePrimeHpMpPercentage),
    StaticPotentialLine(statType: StatType.str, isPrime: true, statValue: bonusUniquePrimeStatPerLevel),
    StaticPotentialLine(statType: StatType.dex, isPrime: true, statValue: bonusUniquePrimeStatPerLevel),
    StaticPotentialLine(statType: StatType.int, isPrime: true, statValue: bonusUniquePrimeStatPerLevel),
    StaticPotentialLine(statType: StatType.luk, isPrime: true, statValue: bonusUniquePrimeStatPerLevel),
    PotentialLine(statType: StatType.str, isPrime: true, statValue: bonusUniquePrimeStat),
    PotentialLine(statType: StatType.dex, isPrime: true, statValue: bonusUniquePrimeStat),
    PotentialLine(statType: StatType.int, isPrime: true, statValue: bonusUniquePrimeStat),
    PotentialLine(statType: StatType.luk, isPrime: true, statValue: bonusUniquePrimeStat),
    PotentialLine(statType: StatType.attack, isPrime: true, statValue: bonusUniquePrimeAtt),
    PotentialLine(statType: StatType.mattack, isPrime: true, statValue: bonusUniquePrimeAtt),
    PotentialLine(statType: StatType.hp, isPrime: true, statValue: bonusUniquePrimeHpMp),
    PotentialLine(statType: StatType.mp, isPrime: true, statValue: bonusUniquePrimeHpMp),
    // Non-Prime
    PotentialLine(statType: StatType.strPercentage, statValue: bonusEpicPrimeStatDefenseAttackDamageCriticalRatePercentage),
    PotentialLine(statType: StatType.dexPercentage, statValue: bonusEpicPrimeStatDefenseAttackDamageCriticalRatePercentage),
    PotentialLine(statType: StatType.intPercentage, statValue: bonusEpicPrimeStatDefenseAttackDamageCriticalRatePercentage),
    PotentialLine(statType: StatType.lukPercentage, statValue: bonusEpicPrimeStatDefenseAttackDamageCriticalRatePercentage),
    PotentialLine(statType: StatType.allStatsPercentage, statValue: bonusEpicPrimeAllStatPercentage),
    PotentialLine(statType: StatType.hpPercentage, statValue: bonusEpicPrimeHpMpPercentage),
    PotentialLine(statType: StatType.mpPercentage, statValue: bonusEpicPrimeHpMpPercentage),
    PotentialLine(statType: StatType.defensePercentage, statValue: bonusEpicPrimeStatDefenseAttackDamageCriticalRatePercentage),
    PotentialLine(statType: StatType.str, statValue: bonusEpicPrimeStat),
    PotentialLine(statType: StatType.dex, statValue: bonusEpicPrimeStat),
    PotentialLine(statType: StatType.int, statValue: bonusEpicPrimeStat),
    PotentialLine(statType: StatType.luk, statValue: bonusEpicPrimeStat),
    PotentialLine(statType: StatType.attack, statValue: bonusEpicPrimeAtt),
    PotentialLine(statType: StatType.mattack, statValue: bonusEpicPrimeAtt),
    PotentialLine(statType: StatType.hp, statValue: bonusEpicPrimeHpMp),
    PotentialLine(statType: StatType.mp, statValue: bonusEpicPrimeHpMp),
    PotentialLine(statType: StatType.defense, statValue: bonusEpicPrimeDefense),
    PotentialLine(statType: StatType.speed, statValue: bonusEpicPrimeSpeedJump),
    PotentialLine(statType: StatType.jump, statValue: bonusEpicPrimeSpeedJump),
  ],
  PotentialTier.legendary: [
    // Prime
    PotentialLine(statType: StatType.strPercentage, isPrime: true, statValue: bonusLegendaryPrimeStatAttackDamageCriticalRatePercentage),
    PotentialLine(statType: StatType.dexPercentage, isPrime: true, statValue: bonusLegendaryPrimeStatAttackDamageCriticalRatePercentage),
    PotentialLine(statType: StatType.intPercentage, isPrime: true, statValue: bonusLegendaryPrimeStatAttackDamageCriticalRatePercentage),
    PotentialLine(statType: StatType.lukPercentage, isPrime: true, statValue: bonusLegendaryPrimeStatAttackDamageCriticalRatePercentage),
    PotentialLine(statType: StatType.allStatsPercentage, isPrime: true, statValue: bonusLegendaryPrimeAllStatPercentage),
    PotentialLine(statType: StatType.hpPercentage, isPrime: true, statValue: bonusLegendaryPrimeHpMpPercentage),
    PotentialLine(statType: StatType.mpPercentage, isPrime: true, statValue: bonusLegendaryPrimeHpMpPercentage),
    StaticPotentialLine(statType: StatType.str, isPrime: true, statValue: bonusLegendaryPrimeStatPerLevel),
    StaticPotentialLine(statType: StatType.dex, isPrime: true, statValue: bonusLegendaryPrimeStatPerLevel),
    StaticPotentialLine(statType: StatType.int, isPrime: true, statValue: bonusLegendaryPrimeStatPerLevel),
    StaticPotentialLine(statType: StatType.luk, isPrime: true, statValue: bonusLegendaryPrimeStatPerLevel),
    PotentialLine(statType: StatType.str, isPrime: true, statValue: bonusLegendaryPrimeStat),
    PotentialLine(statType: StatType.dex, isPrime: true, statValue: bonusLegendaryPrimeStat),
    PotentialLine(statType: StatType.int, isPrime: true, statValue: bonusLegendaryPrimeStat),
    PotentialLine(statType: StatType.luk, isPrime: true, statValue: bonusLegendaryPrimeStat),
    PotentialLine(statType: StatType.attack, isPrime: true, statValue: bonusLegendaryPrimeAtt),
    PotentialLine(statType: StatType.mattack, isPrime: true, statValue: bonusLegendaryPrimeAtt),
    PotentialLine(statType: StatType.hp, isPrime: true, statValue: bonusLegendaryPrimeHpMp),
    PotentialLine(statType: StatType.mp, isPrime: true, statValue: bonusLegendaryPrimeHpMp),
    // Non-Prime
    PotentialLine(statType: StatType.strPercentage, statValue: bonusUniquePrimeStatAttackDamageCriticalRatePercentage),
    PotentialLine(statType: StatType.dexPercentage, statValue: bonusUniquePrimeStatAttackDamageCriticalRatePercentage),
    PotentialLine(statType: StatType.intPercentage, statValue: bonusUniquePrimeStatAttackDamageCriticalRatePercentage),
    PotentialLine(statType: StatType.lukPercentage, statValue: bonusUniquePrimeStatAttackDamageCriticalRatePercentage),
    PotentialLine(statType: StatType.allStatsPercentage, statValue: bonusUniquePrimeAllStatPercentage),
    PotentialLine(statType: StatType.hpPercentage, statValue: bonusUniquePrimeHpMpPercentage),
    PotentialLine(statType: StatType.mpPercentage, statValue: bonusUniquePrimeHpMpPercentage),
    StaticPotentialLine(statType: StatType.str, statValue: bonusUniquePrimeStatPerLevel),
    StaticPotentialLine(statType: StatType.dex, statValue: bonusUniquePrimeStatPerLevel),
    StaticPotentialLine(statType: StatType.int, statValue: bonusUniquePrimeStatPerLevel),
    StaticPotentialLine(statType: StatType.luk, statValue: bonusUniquePrimeStatPerLevel),
    PotentialLine(statType: StatType.str, statValue: bonusUniquePrimeStat),
    PotentialLine(statType: StatType.dex, statValue: bonusUniquePrimeStat),
    PotentialLine(statType: StatType.int, statValue: bonusUniquePrimeStat),
    PotentialLine(statType: StatType.luk, statValue: bonusUniquePrimeStat),
    PotentialLine(statType: StatType.attack, statValue: bonusUniquePrimeAtt),
    PotentialLine(statType: StatType.mattack, statValue: bonusUniquePrimeAtt),
    PotentialLine(statType: StatType.hp, statValue: bonusUniquePrimeHpMp),
    PotentialLine(statType: StatType.mp, statValue: bonusUniquePrimeHpMp),
  ],
};

// Hat
const Map<PotentialTier, List<PotentialLine>> bonusHatPotentials = {
  PotentialTier.unique: [
    // Prime
    PotentialLine(statType: StatType.hpRecovery, isPrime: true, statValue: bonusUniquePrimeHpRecovery),
  ],
  PotentialTier.legendary: [
    // Prime
    StaticPotentialLine(statType: StatType.critDamage, isPrime: true, statValue: bonusLegendaryPrimeCriticalDamageStatic),
    StaticPotentialLine(statType: StatType.skillCooldown, isPrime: true, statValue: bonusLegendaryPrimeSkillCooldown1),
    StaticPotentialLine(statType: StatType.mesosObtained, isPrime: true, statValue: bonusLegendaryPrimeMesosObtainedItemDropRate),
    StaticPotentialLine(statType: StatType.itemDropRate, isPrime: true, statValue: bonusLegendaryPrimeMesosObtainedItemDropRate),
    PotentialLine(statType: StatType.hpRecovery, isPrime: true, statValue: legendaryPrimeHpRecovery),
    // Non-Prime
    PotentialLine(statType: StatType.hpRecovery, statValue: bonusUniquePrimeHpRecovery),
  ],
};

//Top, Overall, Bottom, Shoes, Cape, Belt, Shoulder
const Map<PotentialTier, List<PotentialLine>> bonusTopOverallBottomShoesCapeBeltShoulderPotentials = {
  PotentialTier.unique: [
    // Prime
    PotentialLine(statType: StatType.hpRecovery, isPrime: true, statValue: bonusUniquePrimeHpRecovery),
  ],
  PotentialTier.legendary: [
    // Prime
    StaticPotentialLine(statType: StatType.critDamage, isPrime: true, statValue: bonusLegendaryPrimeCriticalDamageStatic),
    StaticPotentialLine(statType: StatType.mesosObtained, isPrime: true, statValue: bonusLegendaryPrimeMesosObtainedItemDropRate),
    StaticPotentialLine(statType: StatType.itemDropRate, isPrime: true, statValue: bonusLegendaryPrimeMesosObtainedItemDropRate),
    PotentialLine(statType: StatType.hpRecovery, isPrime: true, statValue: legendaryPrimeHpRecovery),
    // Non-Prime
    PotentialLine(statType: StatType.hpRecovery, statValue: bonusUniquePrimeHpRecovery),
  ],
};

//Gloves
const Map<PotentialTier, List<PotentialLine>> bonusGlovesPotentials = {
  PotentialTier.unique: [
    // Prime
    PotentialLine(statType: StatType.hpRecovery, isPrime: true, statValue: bonusUniquePrimeHpRecovery),
  ],
  PotentialTier.legendary: [
    // Prime
    PotentialLine(statType: StatType.critDamage, isPrime: true, statValue: bonusLegendaryPrimeCriticalDamage),
    StaticPotentialLine(statType: StatType.critDamage, isPrime: true, statValue: bonusLegendaryPrimeCriticalDamageStatic),
    StaticPotentialLine(statType: StatType.mesosObtained, isPrime: true, statValue: bonusLegendaryPrimeMesosObtainedItemDropRate),
    StaticPotentialLine(statType: StatType.itemDropRate, isPrime: true, statValue: bonusLegendaryPrimeMesosObtainedItemDropRate),
    PotentialLine(statType: StatType.hpRecovery, isPrime: true, statValue: legendaryPrimeHpRecovery),
    // Non-Prime
    PotentialLine(statType: StatType.hpRecovery, statValue: bonusUniquePrimeHpRecovery),
  ],
};

//Face, Eye, Ring, Pendant, Earring
const Map<PotentialTier, List<PotentialLine>> bonusFaceEyeRingPendantEarringPotentials = {
  PotentialTier.unique: [
    // Prime
    PotentialLine(statType: StatType.hpRecovery, isPrime: true, statValue: bonusUniquePrimeHpRecovery),
  ],
  PotentialTier.legendary: [
    // Prime
    StaticPotentialLine(statType: StatType.critDamage, isPrime: true, statValue: bonusLegendaryPrimeCriticalDamageStatic),
    StaticPotentialLine(statType: StatType.mesosObtained, isPrime: true, statValue: bonusLegendaryPrimeMesosObtainedItemDropRate),
    StaticPotentialLine(statType: StatType.itemDropRate, isPrime: true, statValue: bonusLegendaryPrimeMesosObtainedItemDropRate),
    PotentialLine(statType: StatType.hpRecovery, isPrime: true, statValue: legendaryPrimeHpRecovery),
    // Non-Prime
    PotentialLine(statType: StatType.hpRecovery, statValue: bonusUniquePrimeHpRecovery),
  ],
};

//Weapon
const Map<PotentialTier, List<PotentialLine>> bonusWeaponPotentials = {
  PotentialTier.rare: [
    // Prime
    PotentialLine(statType: StatType.attackPercentage, isPrime: true, statValue: bonusRarePrimeStatHpMpDefenseAttackDamageCriticalRatePercentage),
    PotentialLine(statType: StatType.mattackPercentage, isPrime: true, statValue: bonusRarePrimeStatHpMpDefenseAttackDamageCriticalRatePercentage),
    PotentialLine(statType: StatType.critRate, isPrime: true, statValue: bonusRarePrimeStatHpMpDefenseAttackDamageCriticalRatePercentage),
    PotentialLine(statType: StatType.damage, isPrime: true, statValue: bonusRarePrimeStatHpMpDefenseAttackDamageCriticalRatePercentage),
  ],
  PotentialTier.epic: [
    // Prime
    PotentialLine(statType: StatType.attackPercentage, isPrime: true, statValue: bonusEpicPrimeStatDefenseAttackDamageCriticalRatePercentage),
    PotentialLine(statType: StatType.mattackPercentage, isPrime: true, statValue: bonusEpicPrimeStatDefenseAttackDamageCriticalRatePercentage),
    PotentialLine(statType: StatType.critRate, isPrime: true, statValue: bonusEpicPrimeStatDefenseAttackDamageCriticalRatePercentage),
    PotentialLine(statType: StatType.damage, isPrime: true, statValue: bonusEpicPrimeStatDefenseAttackDamageCriticalRatePercentage),
    StaticPotentialLine(statType: StatType.ignoreDefense, isPrime: true, statValue: bonusEpicPrimeIgnoreDefense),
    // Non-Prime
    PotentialLine(statType: StatType.attackPercentage, statValue: bonusRarePrimeStatHpMpDefenseAttackDamageCriticalRatePercentage),
    PotentialLine(statType: StatType.mattackPercentage, statValue: bonusRarePrimeStatHpMpDefenseAttackDamageCriticalRatePercentage),
    PotentialLine(statType: StatType.critRate, statValue: bonusRarePrimeStatHpMpDefenseAttackDamageCriticalRatePercentage),
    PotentialLine(statType: StatType.damage, statValue: bonusRarePrimeStatHpMpDefenseAttackDamageCriticalRatePercentage),
  ],
  PotentialTier.unique: [
    // Prime
    PotentialLine(statType: StatType.attackPercentage, isPrime: true, statValue: uniquePrimeStatAttackDamageCriticalRatePercentage),
    PotentialLine(statType: StatType.mattackPercentage, isPrime: true, statValue: uniquePrimeStatAttackDamageCriticalRatePercentage),
    PotentialLine(statType: StatType.critRate, isPrime: true, statValue: uniquePrimeStatAttackDamageCriticalRatePercentage),
    PotentialLine(statType: StatType.damage, isPrime: true, statValue: uniquePrimeStatAttackDamageCriticalRatePercentage),
    StaticPotentialLine(statType: StatType.bossDamage, isPrime: true, statValue: bonusUniquePrimeBossDamage),
    StaticPotentialLine(statType: StatType.ignoreDefense, isPrime: true, statValue: bonusUniquePrimeIgnoreDefense),
    // None-Prime
    PotentialLine(statType: StatType.attackPercentage, statValue: bonusEpicPrimeStatDefenseAttackDamageCriticalRatePercentage),
    PotentialLine(statType: StatType.mattackPercentage, statValue: bonusEpicPrimeStatDefenseAttackDamageCriticalRatePercentage),
    PotentialLine(statType: StatType.critRate, statValue: bonusEpicPrimeStatDefenseAttackDamageCriticalRatePercentage),
    PotentialLine(statType: StatType.damage, statValue: bonusEpicPrimeStatDefenseAttackDamageCriticalRatePercentage),
    StaticPotentialLine(statType: StatType.ignoreDefense, statValue: bonusEpicPrimeIgnoreDefense),
  ],
  PotentialTier.legendary: [
    // Prime
    PotentialLine(statType: StatType.attackPercentage, isPrime: true, statValue: bonusLegendaryPrimeStatAttackDamageCriticalRatePercentage),
    PotentialLine(statType: StatType.mattackPercentage, isPrime: true, statValue: bonusLegendaryPrimeStatAttackDamageCriticalRatePercentage),
    PotentialLine(statType: StatType.critRate, isPrime: true, statValue: bonusLegendaryPrimeStatAttackDamageCriticalRatePercentage),
    PotentialLine(statType: StatType.damage, isPrime: true, statValue: bonusLegendaryPrimeStatAttackDamageCriticalRatePercentage),
    StaticPotentialLine(statType: StatType.bossDamage, isPrime: true, statValue: bonusLegendaryPrimeBossDamage),
    StaticPotentialLine(statType: StatType.ignoreDefense, isPrime: true, statValue: bonusLegendaryprimeIgnoreDefense),
    // Non-Prime
    PotentialLine(statType: StatType.attackPercentage, statValue: uniquePrimeStatAttackDamageCriticalRatePercentage),
    PotentialLine(statType: StatType.mattackPercentage, statValue: uniquePrimeStatAttackDamageCriticalRatePercentage),
    PotentialLine(statType: StatType.critRate, statValue: uniquePrimeStatAttackDamageCriticalRatePercentage),
    PotentialLine(statType: StatType.damage, statValue: uniquePrimeStatAttackDamageCriticalRatePercentage),
    StaticPotentialLine(statType: StatType.bossDamage, statValue: bonusUniquePrimeBossDamage),
    StaticPotentialLine(statType: StatType.ignoreDefense, statValue: bonusUniquePrimeIgnoreDefense),
  ],
};

//Secondary
const Map<PotentialTier, List<PotentialLine>> bonusSecondaryPotentials = {
  PotentialTier.rare: [
    // Prime
    PotentialLine(statType: StatType.attackPercentage, isPrime: true, statValue: bonusRarePrimeStatHpMpDefenseAttackDamageCriticalRatePercentage),
    PotentialLine(statType: StatType.mattackPercentage, isPrime: true, statValue: bonusRarePrimeStatHpMpDefenseAttackDamageCriticalRatePercentage),
    PotentialLine(statType: StatType.critRate, isPrime: true, statValue: bonusRarePrimeStatHpMpDefenseAttackDamageCriticalRatePercentage),
    PotentialLine(statType: StatType.damage, isPrime: true, statValue: bonusRarePrimeStatHpMpDefenseAttackDamageCriticalRatePercentage),
  ],
  PotentialTier.epic: [
    // Prime
    PotentialLine(statType: StatType.attackPercentage, isPrime: true, statValue: bonusEpicPrimeStatDefenseAttackDamageCriticalRatePercentage),
    PotentialLine(statType: StatType.mattackPercentage, isPrime: true, statValue: bonusEpicPrimeStatDefenseAttackDamageCriticalRatePercentage),
    PotentialLine(statType: StatType.critRate, isPrime: true, statValue: bonusEpicPrimeStatDefenseAttackDamageCriticalRatePercentage),
    PotentialLine(statType: StatType.damage, isPrime: true, statValue: bonusEpicPrimeStatDefenseAttackDamageCriticalRatePercentage),
    StaticPotentialLine(statType: StatType.ignoreDefense, isPrime: true, statValue: bonusEpicPrimeIgnoreDefense),
    // Non-Prime
    PotentialLine(statType: StatType.attackPercentage, statValue: bonusRarePrimeStatHpMpDefenseAttackDamageCriticalRatePercentage),
    PotentialLine(statType: StatType.mattackPercentage, statValue: bonusRarePrimeStatHpMpDefenseAttackDamageCriticalRatePercentage),
    PotentialLine(statType: StatType.critRate, statValue: bonusRarePrimeStatHpMpDefenseAttackDamageCriticalRatePercentage),
    PotentialLine(statType: StatType.damage, statValue: bonusRarePrimeStatHpMpDefenseAttackDamageCriticalRatePercentage),
  ],
  PotentialTier.unique: [
    // Prime
    PotentialLine(statType: StatType.attackPercentage, isPrime: true, statValue: uniquePrimeStatAttackDamageCriticalRatePercentage),
    PotentialLine(statType: StatType.mattackPercentage, isPrime: true, statValue: uniquePrimeStatAttackDamageCriticalRatePercentage),
    PotentialLine(statType: StatType.critRate, isPrime: true, statValue: uniquePrimeStatAttackDamageCriticalRatePercentage),
    PotentialLine(statType: StatType.damage, isPrime: true, statValue: uniquePrimeStatAttackDamageCriticalRatePercentage),
    StaticPotentialLine(statType: StatType.bossDamage, isPrime: true, statValue: bonusUniquePrimeBossDamage),
    StaticPotentialLine(statType: StatType.ignoreDefense, isPrime: true, statValue: bonusUniquePrimeIgnoreDefense),
    // None-Prime
    PotentialLine(statType: StatType.attackPercentage, statValue: bonusEpicPrimeStatDefenseAttackDamageCriticalRatePercentage),
    PotentialLine(statType: StatType.mattackPercentage, statValue: bonusEpicPrimeStatDefenseAttackDamageCriticalRatePercentage),
    PotentialLine(statType: StatType.critRate, statValue: bonusEpicPrimeStatDefenseAttackDamageCriticalRatePercentage),
    PotentialLine(statType: StatType.damage, statValue: bonusEpicPrimeStatDefenseAttackDamageCriticalRatePercentage),
    StaticPotentialLine(statType: StatType.ignoreDefense, statValue: bonusEpicPrimeIgnoreDefense),
  ],
  PotentialTier.legendary: [
    // Prime
    PotentialLine(statType: StatType.attackPercentage, isPrime: true, statValue: bonusLegendaryPrimeStatAttackDamageCriticalRatePercentage),
    PotentialLine(statType: StatType.mattackPercentage, isPrime: true, statValue: bonusLegendaryPrimeStatAttackDamageCriticalRatePercentage),
    PotentialLine(statType: StatType.critRate, isPrime: true, statValue: bonusLegendaryPrimeStatAttackDamageCriticalRatePercentage),
    PotentialLine(statType: StatType.damage, isPrime: true, statValue: bonusLegendaryPrimeStatAttackDamageCriticalRatePercentage),
    StaticPotentialLine(statType: StatType.bossDamage, isPrime: true, statValue: bonusLegendaryPrimeBossDamage),
    StaticPotentialLine(statType: StatType.ignoreDefense, isPrime: true, statValue: bonusLegendaryprimeIgnoreDefense),
    StaticPotentialLine(statType: StatType.critDamage, isPrime: true, statValue: bonusLegendaryPrimeCriticalDamageStatic),
    // Non-Prime
    PotentialLine(statType: StatType.attackPercentage, statValue: uniquePrimeStatAttackDamageCriticalRatePercentage),
    PotentialLine(statType: StatType.mattackPercentage, statValue: uniquePrimeStatAttackDamageCriticalRatePercentage),
    PotentialLine(statType: StatType.critRate, statValue: uniquePrimeStatAttackDamageCriticalRatePercentage),
    PotentialLine(statType: StatType.damage, statValue: uniquePrimeStatAttackDamageCriticalRatePercentage),
    StaticPotentialLine(statType: StatType.bossDamage, statValue: bonusUniquePrimeBossDamage),
    StaticPotentialLine(statType: StatType.ignoreDefense, statValue: bonusUniquePrimeIgnoreDefense),
  ],
};

//Emblem
const Map<PotentialTier, List<PotentialLine>> bonusEmblemPotentials = {
  PotentialTier.rare: [
    // Prime
    PotentialLine(statType: StatType.attackPercentage, isPrime: true, statValue: bonusRarePrimeStatHpMpDefenseAttackDamageCriticalRatePercentage),
    PotentialLine(statType: StatType.mattackPercentage, isPrime: true, statValue: bonusRarePrimeStatHpMpDefenseAttackDamageCriticalRatePercentage),
    PotentialLine(statType: StatType.critRate, isPrime: true, statValue: bonusRarePrimeStatHpMpDefenseAttackDamageCriticalRatePercentage),
    PotentialLine(statType: StatType.damage, isPrime: true, statValue: bonusRarePrimeStatHpMpDefenseAttackDamageCriticalRatePercentage),
  ],
  PotentialTier.epic: [
    // Prime
    PotentialLine(statType: StatType.attackPercentage, isPrime: true, statValue: bonusEpicPrimeStatDefenseAttackDamageCriticalRatePercentage),
    PotentialLine(statType: StatType.mattackPercentage, isPrime: true, statValue: bonusEpicPrimeStatDefenseAttackDamageCriticalRatePercentage),
    PotentialLine(statType: StatType.critRate, isPrime: true, statValue: bonusEpicPrimeStatDefenseAttackDamageCriticalRatePercentage),
    PotentialLine(statType: StatType.damage, isPrime: true, statValue: bonusEpicPrimeStatDefenseAttackDamageCriticalRatePercentage),
    StaticPotentialLine(statType: StatType.ignoreDefense, isPrime: true, statValue: bonusEpicPrimeIgnoreDefense),
    // Non-Prime
    PotentialLine(statType: StatType.attackPercentage, statValue: bonusRarePrimeStatHpMpDefenseAttackDamageCriticalRatePercentage),
    PotentialLine(statType: StatType.mattackPercentage, statValue: bonusRarePrimeStatHpMpDefenseAttackDamageCriticalRatePercentage),
    PotentialLine(statType: StatType.critRate, statValue: bonusRarePrimeStatHpMpDefenseAttackDamageCriticalRatePercentage),
    PotentialLine(statType: StatType.damage, statValue: bonusRarePrimeStatHpMpDefenseAttackDamageCriticalRatePercentage),
  ],
  PotentialTier.unique: [
    // Prime
    PotentialLine(statType: StatType.attackPercentage, isPrime: true, statValue: uniquePrimeStatAttackDamageCriticalRatePercentage),
    PotentialLine(statType: StatType.mattackPercentage, isPrime: true, statValue: uniquePrimeStatAttackDamageCriticalRatePercentage),
    PotentialLine(statType: StatType.critRate, isPrime: true, statValue: uniquePrimeStatAttackDamageCriticalRatePercentage),
    PotentialLine(statType: StatType.damage, isPrime: true, statValue: uniquePrimeStatAttackDamageCriticalRatePercentage),
    StaticPotentialLine(statType: StatType.ignoreDefense, isPrime: true, statValue: bonusUniquePrimeIgnoreDefense),
    // None-Prime
    PotentialLine(statType: StatType.attackPercentage, statValue: bonusEpicPrimeStatDefenseAttackDamageCriticalRatePercentage),
    PotentialLine(statType: StatType.mattackPercentage, statValue: bonusEpicPrimeStatDefenseAttackDamageCriticalRatePercentage),
    PotentialLine(statType: StatType.critRate, statValue: bonusEpicPrimeStatDefenseAttackDamageCriticalRatePercentage),
    PotentialLine(statType: StatType.damage, statValue: bonusEpicPrimeStatDefenseAttackDamageCriticalRatePercentage),
    StaticPotentialLine(statType: StatType.ignoreDefense, statValue: bonusEpicPrimeIgnoreDefense),
  ],
  PotentialTier.legendary: [
    // Prime
    PotentialLine(statType: StatType.attackPercentage, isPrime: true, statValue: bonusLegendaryPrimeStatAttackDamageCriticalRatePercentage),
    PotentialLine(statType: StatType.mattackPercentage, isPrime: true, statValue: bonusLegendaryPrimeStatAttackDamageCriticalRatePercentage),
    PotentialLine(statType: StatType.critRate, isPrime: true, statValue: bonusLegendaryPrimeStatAttackDamageCriticalRatePercentage),
    PotentialLine(statType: StatType.damage, isPrime: true, statValue: bonusLegendaryPrimeStatAttackDamageCriticalRatePercentage),
    StaticPotentialLine(statType: StatType.ignoreDefense, isPrime: true, statValue: bonusLegendaryprimeIgnoreDefense),
    // Non-Prime
    PotentialLine(statType: StatType.attackPercentage, statValue: uniquePrimeStatAttackDamageCriticalRatePercentage),
    PotentialLine(statType: StatType.mattackPercentage, statValue: uniquePrimeStatAttackDamageCriticalRatePercentage),
    PotentialLine(statType: StatType.critRate, statValue: uniquePrimeStatAttackDamageCriticalRatePercentage),
    PotentialLine(statType: StatType.damage, statValue: uniquePrimeStatAttackDamageCriticalRatePercentage),
    StaticPotentialLine(statType: StatType.ignoreDefense, statValue: bonusUniquePrimeIgnoreDefense),
  ],
};

//Heart, Badge
const Map<PotentialTier, List<PotentialLine>> bonusHeartBadgePotentials = {
  PotentialTier.unique: [
    // Prime
    PotentialLine(statType: StatType.hpRecovery, isPrime: true, statValue: bonusUniquePrimeHpRecovery),
  ],
  PotentialTier.legendary: [
    // Prime
    StaticPotentialLine(statType: StatType.critDamage, isPrime: true, statValue: bonusLegendaryPrimeCriticalDamageStatic),
    StaticPotentialLine(statType: StatType.mesosObtained, isPrime: true, statValue: bonusLegendaryPrimeMesosObtainedItemDropRate),
    StaticPotentialLine(statType: StatType.itemDropRate, isPrime: true, statValue: bonusLegendaryPrimeMesosObtainedItemDropRate),
    PotentialLine(statType: StatType.hpRecovery, isPrime: true, statValue: legendaryPrimeHpRecovery),
    // Non-Prime
    PotentialLine(statType: StatType.hpRecovery, statValue: bonusUniquePrimeHpRecovery),
  ],
};


class PotentialLine {
  final StatType statType;
  final bool isPrime;
  final List<num>? statValue;
  // final Skill? skillValue;

  const PotentialLine({
    required this.statType,
    this.statValue,
    this.isPrime = false,
  });
}

// Defines a Potential Line with only a single value in the list
class StaticPotentialLine extends PotentialLine {

  const StaticPotentialLine({
    required super.statType,
    super.statValue,
    super.isPrime = false,
  });
}