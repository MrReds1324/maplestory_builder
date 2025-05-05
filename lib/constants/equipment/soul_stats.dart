// ignore_for_file: constant_identifier_names

import 'package:maplestory_builder/constants/constants.dart';

enum SoulName {
  ssTier(formattedName: "SS Tier", soulStats: SS_TIER_EFFECTS),
  sTier(formattedName: "S Tier", soulStats: S_TIER_EFFECTS),
  aTier(formattedName: "A Tier", soulStats: A_TIER_EFFECTS),
  bTier(formattedName: "B Tier", soulStats: B_TIER_EFFECTS),
  cTier(formattedName: "C Tier", soulStats: C_TIER_EFFECTS),
  dTier(
    formattedName: "D Tier",
    soulStats: D_TIER_EFFECTS,
  ),
  muGongLevel1(
      formattedName: "Mu Gong (Level 1)",
      soulStats: E_TIER_EFFECTS,
      chargeAtt: 15), // 30% att/matt for 10s
  muGongLevel2(
      formattedName: "Mu Gong (Level 2)",
      soulStats: E_TIER_EFFECTS,
      chargeAtt: 15), // 30% att/matt for 20s
  ;

  const SoulName({
    required this.formattedName,
    required this.soulStats,
    this.chargeAtt = 20,
  });

  final String formattedName;
  final List<(StatType, num)> soulStats;
  final int chargeAtt;
  // final Skill skill
}

const List<(StatType, num)> SS_TIER_EFFECTS = [
  // Magnificent Stats
  (StatType.attackPercentage, 0.03),
  (StatType.mattackPercentage, 0.03),
  (StatType.bossDamage, 0.07),
  (StatType.ignoreDefense, 0.07),
  (StatType.critRate, 0.12),
  (StatType.allStatsPercentage, 0.05),
  (StatType.hp, 2000),
  (StatType.skillLevel, 2),
  // Non Magnificent Stats
  (StatType.str, 24),
  (StatType.dex, 24),
  (StatType.int, 24),
  (StatType.luk, 24),
  (StatType.allStats, 15),
  (StatType.attack, 6),
  (StatType.mattack, 6),
  (StatType.hp, 960),
];

const List<(StatType, num)> S_TIER_EFFECTS = [
  // Magnificent Stats
  (StatType.attack, 10),
  (StatType.mattack, 10),
  (StatType.bossDamage, 0.05),
  (StatType.ignoreDefense, 0.05),
  (StatType.critRate, 0.10),
  (StatType.allStats, 20),
  (StatType.hp, 1500),
  (StatType.skillLevel, 1),
  // Non Magnificent Stats
  (StatType.str, 20),
  (StatType.dex, 20),
  (StatType.int, 20),
  (StatType.luk, 20),
  (StatType.allStats, 12),
  (StatType.attack, 5),
  (StatType.mattack, 5),
  (StatType.hp, 800),
];

const List<(StatType, num)> A_TIER_EFFECTS = [
  // Magnificent Stats
  (StatType.attack, 8),
  (StatType.mattack, 8),
  (StatType.bossDamage, 0.04),
  (StatType.ignoreDefense, 0.04),
  (StatType.critRate, 0.08),
  (StatType.allStats, 17),
  (StatType.hp, 1300),
  (StatType.skillLevel, 1),
  // Non Magnificent Stats
  (StatType.str, 18),
  (StatType.dex, 18),
  (StatType.int, 18),
  (StatType.luk, 18),
  (StatType.allStats, 10),
  (StatType.attack, 4),
  (StatType.mattack, 4),
  (StatType.hp, 700),
];

const List<(StatType, num)> B_TIER_EFFECTS = [
  // Magnificent Stats
  (StatType.attack, 8),
  (StatType.mattack, 8),
  (StatType.bossDamage, 0.04),
  (StatType.ignoreDefense, 0.04),
  (StatType.critRate, 0.08),
  (StatType.allStats, 17),
  (StatType.hp, 1300),
  (StatType.skillLevel, 1),
  // Non Magnificent Stats
  (StatType.str, 15),
  (StatType.dex, 15),
  (StatType.int, 15),
  (StatType.luk, 15),
  (StatType.allStats, 10),
  (StatType.attack, 4),
  (StatType.mattack, 4),
  (StatType.hp, 600),
];

const List<(StatType, num)> C_TIER_EFFECTS = [
  // Magnificent Stats
  (StatType.attack, 6),
  (StatType.mattack, 6),
  (StatType.bossDamage, 0.03),
  (StatType.ignoreDefense, 0.03),
  (StatType.critRate, 0.06),
  (StatType.allStats, 12),
  (StatType.hp, 1100),
  (StatType.skillLevel, 1),
  // Non Magnificent Stats
  (StatType.str, 12),
  (StatType.dex, 12),
  (StatType.int, 12),
  (StatType.luk, 12),
  (StatType.allStats, 8),
  (StatType.attack, 3),
  (StatType.mattack, 3),
  (StatType.hp, 500),
];

const List<(StatType, num)> D_TIER_EFFECTS = [
  // Magnificent Stats
  (StatType.attack, 5),
  (StatType.mattack, 5),
  (StatType.bossDamage, 0.03),
  (StatType.ignoreDefense, 0.03),
  (StatType.critRate, 0.05),
  (StatType.allStats, 10),
  (StatType.hp, 1000),
  (StatType.skillLevel, 1),
  // Non Magnificent Stats
  (StatType.str, 10),
  (StatType.dex, 10),
  (StatType.int, 10),
  (StatType.luk, 10),
  (StatType.allStats, 7),
  (StatType.attack, 3),
  (StatType.mattack, 3),
  (StatType.hp, 400),
];

// These all seem to actually have different stats, just going to implement
// the sats for mugong...
const List<(StatType, num)> E_TIER_EFFECTS = [
  // Non Magnificent Stats
  (StatType.str, 7),
  (StatType.dex, 7),
  (StatType.int, 7),
  (StatType.luk, 7),
  (StatType.allStats, 5),
  (StatType.mp, 300),
  (StatType.hp, 300),
];
