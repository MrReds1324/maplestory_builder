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

const List<num> epicNonPrimeStatAtt = rarePrimeStatAtt;
const List<num> epicNonPrimeAllStat = rarePrimeAllStat;
const List<num> epicNonPrimeDefenseHpMp = rarePrimeDefenseHpMp;
const List<num> epicNonPrimeStatDefenseHpMpPercentage = rarePrimeStatDefenseHpMpPercentage;
const List<num> epicNonPrimeCriticalRate = rarePrimeCriticalRate;
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

const List<num> uniqueNonPrimeStatAttackDamageDefenseHpMpPercentage = epicPrimeStatAttackDamageDefenseHpMpPercentage;
const List<num> uniqueNonPrimeAllStatPercentage = epicPrimeAllStatPercentage;
const List<num> uniqueNonPrimeCriticalRate = epicPrimeCriticalRate;
const List<num> uniqueNonPrimeIgnoreDefense = epicPrimeIgnoreDefense;
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

const List<num> legendaryNonPrimeStatAttackDamageCriticalRatePercentage = uniquePrimeStatAttackDamageCriticalRatePercentage;
const List<num> legendaryNonPrimeHpMpPercentage = uniquePrimeDefenseHpMpPercentage;
const List<num> legendaryNonPrimeAllStatPercentage = uniquePrimeAllStatPercentage;
const List<num> legendaryNonPrimeHpRecovery = uniquePrimeHpRecovery;
const List<num> legendaryNonPrimeStatAtt = uniquePrimeStatAtt;
const List<num> legendaryNonPrimeBossDamage = uniquePrimeBossDamage;
const List<num> legendaryNonPrimeIgnoreDefense = uniquePrimeIgnoreDefense;
const List<num> legendaryPrimeStatAtt = legendaryNonPrimeStatAtt;
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
const List<num> legendaryPrimeHpRecovery = legendaryNonPrimeHpRecovery;
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
    PotentialLine(statType: StatType.strPercentage, statValue: epicNonPrimeStatDefenseHpMpPercentage),
    PotentialLine(statType: StatType.dexPercentage, statValue: epicNonPrimeStatDefenseHpMpPercentage),
    PotentialLine(statType: StatType.lukPercentage, statValue: epicNonPrimeStatDefenseHpMpPercentage),
    PotentialLine(statType: StatType.intPercentage, statValue: epicNonPrimeStatDefenseHpMpPercentage),
    PotentialLine(statType: StatType.hpPercentage, statValue: epicNonPrimeStatDefenseHpMpPercentage),
    PotentialLine(statType: StatType.mpPercentage, statValue: epicNonPrimeStatDefenseHpMpPercentage),
    PotentialLine(statType: StatType.defensePercentage, statValue: epicNonPrimeStatDefenseHpMpPercentage),
    PotentialLine(statType: StatType.str, statValue: epicNonPrimeStatAtt),
    PotentialLine(statType: StatType.dex, statValue: epicNonPrimeStatAtt),
    PotentialLine(statType: StatType.int, statValue: epicNonPrimeStatAtt),
    PotentialLine(statType: StatType.luk, statValue: epicNonPrimeStatAtt),
    PotentialLine(statType: StatType.allStats, statValue: epicNonPrimeAllStat),
    PotentialLine(statType: StatType.hp, statValue: epicNonPrimeDefenseHpMp),
    PotentialLine(statType: StatType.mp, statValue: epicNonPrimeDefenseHpMp),
    PotentialLine(statType: StatType.defense, statValue: epicNonPrimeDefenseHpMp),
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
    PotentialLine(statType: StatType.defensePercentage, isPrime: true, statValue: uniquePrimeDefenseHpMpPercentage),
    // Non-Prime
    PotentialLine(statType: StatType.allStatsPercentage, statValue: uniqueNonPrimeAllStatPercentage),
    PotentialLine(statType: StatType.strPercentage, statValue: uniqueNonPrimeStatAttackDamageDefenseHpMpPercentage),
    PotentialLine(statType: StatType.dexPercentage, statValue: uniqueNonPrimeStatAttackDamageDefenseHpMpPercentage),
    PotentialLine(statType: StatType.lukPercentage, statValue: uniqueNonPrimeStatAttackDamageDefenseHpMpPercentage),
    PotentialLine(statType: StatType.intPercentage, statValue: uniqueNonPrimeStatAttackDamageDefenseHpMpPercentage),
    PotentialLine(statType: StatType.hpPercentage, statValue: uniqueNonPrimeStatAttackDamageDefenseHpMpPercentage),
    PotentialLine(statType: StatType.mpPercentage, statValue: uniqueNonPrimeStatAttackDamageDefenseHpMpPercentage),
    PotentialLine(statType: StatType.defensePercentage, statValue: uniqueNonPrimeStatAttackDamageDefenseHpMpPercentage),
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
    PotentialLine(statType: StatType.allStatsPercentage, statValue: legendaryNonPrimeAllStatPercentage),
    PotentialLine(statType: StatType.strPercentage, statValue: legendaryNonPrimeStatAttackDamageCriticalRatePercentage),
    PotentialLine(statType: StatType.dexPercentage, statValue: legendaryNonPrimeStatAttackDamageCriticalRatePercentage),
    PotentialLine(statType: StatType.lukPercentage, statValue: legendaryNonPrimeStatAttackDamageCriticalRatePercentage),
    PotentialLine(statType: StatType.intPercentage, statValue: legendaryNonPrimeStatAttackDamageCriticalRatePercentage),
    PotentialLine(statType: StatType.hpPercentage, statValue: legendaryNonPrimeHpMpPercentage),
    PotentialLine(statType: StatType.mpPercentage, statValue: legendaryNonPrimeHpMpPercentage),
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
    PotentialLine(statType: StatType.hpRecovery, statValue: legendaryNonPrimeHpRecovery),
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
    PotentialLine(statType: StatType.hpRecovery, statValue: legendaryNonPrimeHpRecovery),
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
    PotentialLine(statType: StatType.str, statValue: legendaryNonPrimeStatAtt),
    PotentialLine(statType: StatType.dex, statValue: legendaryNonPrimeStatAtt),
    PotentialLine(statType: StatType.int, statValue: legendaryNonPrimeStatAtt),
    PotentialLine(statType: StatType.luk, statValue: legendaryNonPrimeStatAtt),
    PotentialLine(statType: StatType.attack, statValue: legendaryNonPrimeStatAtt),
    PotentialLine(statType: StatType.mattack, statValue: legendaryNonPrimeStatAtt),
    PotentialLine(statType: StatType.hpRecovery, statValue: legendaryNonPrimeHpRecovery),
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
    PotentialLine(statType: StatType.hpRecovery, statValue: legendaryNonPrimeHpRecovery),
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
    PotentialLine(statType: StatType.hpRecovery, statValue: legendaryNonPrimeHpRecovery),
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
    PotentialLine(statType: StatType.hpRecovery, statValue: legendaryNonPrimeHpRecovery),
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
    StaticPotentialLine(statType: StatType.critRate, statValue: epicNonPrimeCriticalRate),
    PotentialLine(statType: StatType.attack, statValue: epicNonPrimeStatAtt),
    PotentialLine(statType: StatType.mattack, statValue: epicNonPrimeStatAtt),
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
    PotentialLine(statType: StatType.attackPercentage, statValue: uniqueNonPrimeStatAttackDamageDefenseHpMpPercentage),
    PotentialLine(statType: StatType.mattackPercentage, statValue: uniqueNonPrimeStatAttackDamageDefenseHpMpPercentage),
    StaticPotentialLine(statType: StatType.ignoreDefense, statValue: uniqueNonPrimeIgnoreDefense),
    PotentialLine(statType: StatType.damage, statValue: uniqueNonPrimeStatAttackDamageDefenseHpMpPercentage),
    StaticPotentialLine(statType: StatType.critRate, statValue: uniqueNonPrimeCriticalRate),
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
    PotentialLine(statType: StatType.attackPercentage, statValue: legendaryNonPrimeStatAttackDamageCriticalRatePercentage),
    PotentialLine(statType: StatType.mattackPercentage, statValue: legendaryNonPrimeStatAttackDamageCriticalRatePercentage),
    StaticPotentialLine(statType: StatType.bossDamage, statValue: legendaryNonPrimeBossDamage),
    StaticPotentialLine(statType: StatType.ignoreDefense, statValue: legendaryNonPrimeIgnoreDefense),
    PotentialLine(statType: StatType.damage, statValue: legendaryNonPrimeStatAttackDamageCriticalRatePercentage),
    PotentialLine(statType: StatType.critRate, statValue: legendaryNonPrimeStatAttackDamageCriticalRatePercentage),
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
    StaticPotentialLine(statType: StatType.critRate, statValue: epicNonPrimeCriticalRate),
    PotentialLine(statType: StatType.attack, statValue: epicNonPrimeStatAtt),
    PotentialLine(statType: StatType.mattack, statValue: epicNonPrimeStatAtt),
  ],
  PotentialTier.unique: [
    // Prime
    PotentialLine(statType: StatType.attackPercentage, isPrime: true, statValue: uniquePrimeStatAttackDamageCriticalRatePercentage),
    PotentialLine(statType: StatType.mattackPercentage, isPrime: true, statValue: uniquePrimeStatAttackDamageCriticalRatePercentage),
    StaticPotentialLine(statType: StatType.ignoreDefense, isPrime: true, statValue: uniquePrimeIgnoreDefense),
    PotentialLine(statType: StatType.damage, isPrime: true, statValue: uniquePrimeStatAttackDamageCriticalRatePercentage),
    PotentialLine(statType: StatType.critRate, isPrime: true, statValue: uniquePrimeStatAttackDamageCriticalRatePercentage),
    // Non Prime
    PotentialLine(statType: StatType.attackPercentage, statValue: uniqueNonPrimeStatAttackDamageDefenseHpMpPercentage),
    PotentialLine(statType: StatType.mattackPercentage, statValue: uniqueNonPrimeStatAttackDamageDefenseHpMpPercentage),
    StaticPotentialLine(statType: StatType.ignoreDefense, statValue: uniqueNonPrimeIgnoreDefense),
    PotentialLine(statType: StatType.damage, statValue: uniqueNonPrimeStatAttackDamageDefenseHpMpPercentage),
    StaticPotentialLine(statType: StatType.critRate, statValue: uniqueNonPrimeCriticalRate),
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
    PotentialLine(statType: StatType.attackPercentage, statValue: legendaryNonPrimeStatAttackDamageCriticalRatePercentage),
    PotentialLine(statType: StatType.mattackPercentage, statValue: legendaryNonPrimeStatAttackDamageCriticalRatePercentage),
    StaticPotentialLine(statType: StatType.ignoreDefense, statValue: legendaryNonPrimeIgnoreDefense),
    PotentialLine(statType: StatType.damage, statValue: legendaryNonPrimeStatAttackDamageCriticalRatePercentage),
    PotentialLine(statType: StatType.critRate, statValue: legendaryNonPrimeStatAttackDamageCriticalRatePercentage),
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
    PotentialLine(statType: StatType.hpRecovery, statValue: legendaryNonPrimeHpRecovery),
  ],
};


//Bonus Potential

const Map<PotentialTier, List<PotentialLine>> bonusDefault = {

};

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