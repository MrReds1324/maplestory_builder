// ignore_for_file: constant_identifier_names

import 'package:flutter/material.dart';
import 'package:maplestory_builder/constants/constants.dart';

enum PotentialCategory {
  none, // Used for equipment the player is unable to potential at all
  player, // Used for equipment the player is able to modify
  static, // Used for equipment that has static/unmodifiable potentials
}

enum PotentialType {
  range,
  static,
  skill
}

typedef RangedPotentialType = List<num>;
typedef StaticPotentialType = num;
// typedef SkillPotentialType = Skill;

const List<EquipType> noPotentialCategory = <EquipType>[
  EquipType.medal,
];

enum PotentialTier {
  rare(formattedName: "Rare", short: "R", color: rarePotentialColor),
  epic(formattedName: "Epic", short: "E", color: epicPotentialColor),
  unique(formattedName: "Unique", short: "U", color: uniquePotentialColor),
  legendary(formattedName: "Legendary", short: "L", color: legendaryPotentialColor);

  const PotentialTier({
    required this.formattedName,
    required this.short,
    required this.color,
  });

  final String formattedName;
  final String short;
  final Color color;
}

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
  rareNonPrimeStat(potentialType: PotentialType.range, statValue: rareNonPrimeStatAttValues),
  rareNonPrimeAtt(potentialType: PotentialType.range, statValue: rareNonPrimeStatAttValues),
  rareNonPrimeDefense(potentialType: PotentialType.range, statValue: rareNonPrimeDefenseHpMpValues),
  rareNonPrimeHp(potentialType: PotentialType.range, statValue: rareNonPrimeDefenseHpMpValues),
  rareNonPrimeMp(potentialType: PotentialType.range, statValue: rareNonPrimeDefenseHpMpValues),
  // Rare Prime & Epic Non Prime
  rarePrimeStat(potentialType: PotentialType.range, statValue: rarePrimeStatAttValues),
  rarePrimeAtt(potentialType: PotentialType.range, statValue: rarePrimeStatAttValues),
  rarePrimeAllStat(potentialType: PotentialType.range, statValue: rarePrimeAllStatValues),
  rarePrimeDefense(potentialType: PotentialType.range, statValue: rarePrimeDefenseHpMpValues),
  rarePrimeHp(potentialType: PotentialType.range, statValue: rarePrimeDefenseHpMpValues),
  rarePrimeMp(potentialType: PotentialType.range, statValue: rarePrimeDefenseHpMpValues),
  rarePrimeStatPercentage(potentialType: PotentialType.range, statValue: rarePrimeStatDefenseHpMpPercentageValues),
  rarePrimeDefensePercentage(potentialType: PotentialType.range, statValue: rarePrimeStatDefenseHpMpPercentageValues),
  rarePrimeHpPercentage(potentialType: PotentialType.range, statValue: rarePrimeStatDefenseHpMpPercentageValues),
  rarePrimeMpPercentage(potentialType: PotentialType.range, statValue: rarePrimeStatDefenseHpMpPercentageValues),
  rarePrimeCriticalRate(potentialType: PotentialType.static, statValue: rarePrimeCriticalRateValue),
  // Epic Prime & Unique Non Prime
  epicPrimeStatPercentage(potentialType: PotentialType.range, statValue: epicPrimeStatAttackDamageDefenseHpMpPercentageValues),
  epicPrimeAttackPercentage(potentialType: PotentialType.range, statValue: epicPrimeStatAttackDamageDefenseHpMpPercentageValues),
  epicPrimeDamage(potentialType: PotentialType.range, statValue: epicPrimeStatAttackDamageDefenseHpMpPercentageValues),
  epicPrimeDefensePercentage(potentialType: PotentialType.range, statValue: epicPrimeStatAttackDamageDefenseHpMpPercentageValues),
  epicPrimeHpPercentage(potentialType: PotentialType.range, statValue: epicPrimeStatAttackDamageDefenseHpMpPercentageValues),
  epicPrimeMpPercentage(potentialType: PotentialType.range, statValue: epicPrimeStatAttackDamageDefenseHpMpPercentageValues),
  epicPrimeAllStatPercentage(potentialType: PotentialType.range, statValue: epicPrimeAllStatPercentageValues),
  epicPrimeCriticalRate(potentialType: PotentialType.static, statValue: epicPrimeCriticalRateValue),
  epicPrimeIgnoreDefense(potentialType: PotentialType.static, statValue: epicPrimeIgnoreDefenseValue),
  // Unique Prime & Legendary Non Prime
  uniquePrimeStatPercentage(potentialType: PotentialType.range, statValue: uniquePrimeStatAttackDamageCriticalRatePercentageValues),
  uniquePrimeAttackPercentage(potentialType: PotentialType.range, statValue: uniquePrimeStatAttackDamageCriticalRatePercentageValues),
  uniquePrimeDamage(potentialType: PotentialType.range, statValue: uniquePrimeStatAttackDamageCriticalRatePercentageValues),
  uniquePrimeCriticalRate(potentialType: PotentialType.range, statValue: uniquePrimeStatAttackDamageCriticalRatePercentageValues),
  uniquePrimeDefensePercentage(potentialType: PotentialType.range, statValue: uniquePrimeDefenseHpMpPercentageValues),
  uniquePrimeHpPercentage(potentialType: PotentialType.range, statValue: uniquePrimeDefenseHpMpPercentageValues),
  uniquePrimeMpPercentage(potentialType: PotentialType.range, statValue: uniquePrimeDefenseHpMpPercentageValues),
  uniquePrimeAllStatPercentage(potentialType: PotentialType.range, statValue: uniquePrimeAllStatPercentageValues),
  uniquePrimeHpRecovery(potentialType: PotentialType.range, statValue: uniquePrimeHpRecoveryValues),
  uniquePrimeStat(potentialType: PotentialType.range, statValue: uniquePrimeStatAttValues),
  uniquePrimeAtt(potentialType: PotentialType.range, statValue: uniquePrimeStatAttValues),
  uniquePrimeBossDamage(potentialType: PotentialType.static, statValue: uniquePrimeBossDamageValue),
  uniquePrimeIgnoreDefense(potentialType: PotentialType.static, statValue: uniquePrimeIgnoreDefenseValue),
  // uniquePrimeDecentMysticDoor(potentialType: PotentialType.skill, statValue: ,)
  // uniquePrimeDecentHyperBody(potentialType: PotentialType.skill, statValue: ,)
  // unqiuePrimeDecentSharpEyes(potentialType: PotentialType.skill, statValue: ,)
  // uniquePrimeDecentHaste(potentialType: PotentialType.skill, statValue: ,)
  // Legendary Prime
  legendaryPrimeStat(potentialType: PotentialType.range, statValue: legendaryPrimeStatAttValues),
  legendaryPrimeAtt(potentialType: PotentialType.range, statValue: legendaryPrimeStatAttValues),
  legendaryPrimeStatPercentage(potentialType: PotentialType.range, statValue: legendaryPrimeStatAttackDamageCriticalRatePercentageValues),
  legendaryPrimeAttackPercentage(potentialType: PotentialType.range, statValue: legendaryPrimeStatAttackDamageCriticalRatePercentageValues),
  legendaryPrimeDamagePercentage(potentialType: PotentialType.range, statValue: legendaryPrimeStatAttackDamageCriticalRatePercentageValues),
  legendaryPrimeCriticalRatePercentage(potentialType: PotentialType.range, statValue: legendaryPrimeStatAttackDamageCriticalRatePercentageValues),
  legendaryPrimeHpPercentage(potentialType: PotentialType.range, statValue: legendaryPrimeHpMpPercentageValues),
  legendaryPrimeMpPercentage(potentialType: PotentialType.range, statValue: legendaryPrimeHpMpPercentageValues),
  legendaryPrimeAllStatPercentage(potentialType: PotentialType.range, statValue: legendaryPrimeAllStatPercentageValues),
  legendaryPrimeHpRecovery(potentialType: PotentialType.range, statValue: legendaryPrimeHpRecoveryValues),
  legendaryPrimeSkillCooldown1(potentialType: PotentialType.static, statValue: legendaryPrimeSkillCooldown1Value),
  legendaryPrimeSkillCooldown2(potentialType: PotentialType.static, statValue: legendaryPrimeSkillCooldown2Value),
  legendaryPrimeCriticalDamage(potentialType: PotentialType.range, statValue: legendaryPrimeCriticalDamageValues),
  legendaryPrimeMesosObtained(potentialType: PotentialType.range, statValue: legendaryPrimeMesosObtainedItemDropRateValues),
  legendaryPrimeItemDropRate(potentialType: PotentialType.range, statValue: legendaryPrimeMesosObtainedItemDropRateValues),
  legendaryPrimeBossDamage35(potentialType: PotentialType.static, statValue: legendaryPrimeBossDamage35Value),
  legendaryPrimeBossDamage40(potentialType: PotentialType.static, statValue: legendaryPrimeBossDamage40Value),
  legendaryPrimeIgnoreDefense35(potentialType: PotentialType.static, statValue: legendaryPrimeIgnoreDefense35Value),
  legendaryPrimeIgnoreDefense40(potentialType: PotentialType.static, statValue: legendaryPrimeIgnoreDefense40Value),
  // legendaryPrimeDecentAdvancedBlessing(potentialType: , statValue: ,)
  // legendaryPrimeDecentSpeedInfusion(potentialType: , statValue: ,)
  // legendaryPrimeDecentCombatOrders(potentialType: , statValue: ,)
  // ---------------------------------------------------------------------- //
  // Bonus Potentials
  // ---------------------------------------------------------------------- //
  // Rare Non Prime
  bonusRareNonPrimeStat(potentialType: PotentialType.range, statValue: bonusRareNonPrimeStatValues),
  bonusRareNonPrimeAtt(potentialType: PotentialType.range, statValue: bonusRareNonPrimeAttValues),
  bonusRareNonPrimeDefense(potentialType: PotentialType.range, statValue: bonusRareNonPrimeHpMpDefenseValues),
  bonusRareNonPrimeHp(potentialType: PotentialType.range, statValue: bonusRareNonPrimeHpMpDefenseValues),
  bonusRareNonPrimeMp(potentialType: PotentialType.range, statValue: bonusRareNonPrimeHpMpDefenseValues),
  bonusRareNonPrimeSpeed(potentialType: PotentialType.range, statValue: bonusRareNonPrimeSpeedJumpValues),
  bonusRareNonPrimeJump(potentialType: PotentialType.range, statValue: bonusRareNonPrimeSpeedJumpValues),
  // Rare Prime & Epic Non Prime
  bonusRarePrimeStat(potentialType: PotentialType.range, statValue: bonusRarePrimeStatValues),
  bonusRarePrimeAtt(potentialType: PotentialType.range, statValue: bonusRarePrimeAttValues),
  bonusRarePrimeAllStat(potentialType: PotentialType.range, statValue: bonusRarePrimeAllStatValues),
  bonusRarePrimeDefense(potentialType: PotentialType.range, statValue: bonusRarePrimeDefenseHpMpValues),
  bonusRarePrimeHp(potentialType: PotentialType.range, statValue: bonusRarePrimeDefenseHpMpValues),
  bonusRarePrimeMp(potentialType: PotentialType.range, statValue: bonusRarePrimeDefenseHpMpValues),
  bonusRarePrimeStatPercentage(potentialType: PotentialType.range, statValue: bonusRarePrimeStatHpMpDefenseAttackDamageCriticalRatePercentageValues),
  bonusRarePrimeHpPercentage(potentialType: PotentialType.range, statValue: bonusRarePrimeStatHpMpDefenseAttackDamageCriticalRatePercentageValues),
  bonusRarePrimeMpPercentage(potentialType: PotentialType.range, statValue: bonusRarePrimeStatHpMpDefenseAttackDamageCriticalRatePercentageValues),
  bonusRarePrimeDefensePercentage(potentialType: PotentialType.range, statValue: bonusRarePrimeStatHpMpDefenseAttackDamageCriticalRatePercentageValues),
  bonusRarePrimeAttackPercentage(potentialType: PotentialType.range, statValue: bonusRarePrimeStatHpMpDefenseAttackDamageCriticalRatePercentageValues),
  bonusRarePrimeDamage(potentialType: PotentialType.range, statValue: bonusRarePrimeStatHpMpDefenseAttackDamageCriticalRatePercentageValues),
  bonusRarePrimeCriticalRate(potentialType: PotentialType.range, statValue: bonusRarePrimeStatHpMpDefenseAttackDamageCriticalRatePercentageValues),
  bonusRarePrimeSpeed(potentialType: PotentialType.range, statValue: bonusRarePrimeSpeedJumpValues),
  bonusRarePrimeJump(potentialType: PotentialType.range, statValue: bonusRarePrimeSpeedJumpValues),
  // Epic Prime & Unique Non Prime
  bonusEpicPrimeStat(potentialType: PotentialType.range, statValue: bonusEpicPrimeStatValues),
  bonusEpicPrimeAtt(potentialType: PotentialType.range, statValue: bonusEpicPrimeAttValues),
  bonusEpicPrimeHp(potentialType: PotentialType.range, statValue: bonusEpicPrimeHpMpValues),
  bonusEpicPrimeMp(potentialType: PotentialType.range, statValue: bonusEpicPrimeHpMpValues),
  bonusEpicPrimeDefense(potentialType: PotentialType.range, statValue: bonusEpicPrimeDefenseValues),
  bonusEpicPrimeSpeed(potentialType: PotentialType.range, statValue: bonusEpicPrimeSpeedJumpValues),
  bonusEpicPrimeJump(potentialType: PotentialType.range, statValue: bonusEpicPrimeSpeedJumpValues),
  bonusEpicPrimeStatPercentage(potentialType: PotentialType.range, statValue: bonusEpicPrimeStatDefenseAttackDamageCriticalRatePercentageValues),
  bonusEpicPrimeDefensePercentage(potentialType: PotentialType.range, statValue: bonusEpicPrimeStatDefenseAttackDamageCriticalRatePercentageValues),
  bonusEpicPrimeAttackPercentage(potentialType: PotentialType.range, statValue: bonusEpicPrimeStatDefenseAttackDamageCriticalRatePercentageValues),
  bonusEpicPrimeDamage(potentialType: PotentialType.range, statValue: bonusEpicPrimeStatDefenseAttackDamageCriticalRatePercentageValues),
  bonusEpicPrimeCriticalRate(potentialType: PotentialType.range, statValue: bonusEpicPrimeStatDefenseAttackDamageCriticalRatePercentageValues),
  bonusEpicPrimeHpPercentage(potentialType: PotentialType.range, statValue: bonusEpicPrimeHpMpPercentageValues),
  bonusEpicPrimeMpPercentage(potentialType: PotentialType.range, statValue: bonusEpicPrimeHpMpPercentageValues),
  bonusEpicPrimeAllStatPercentage(potentialType: PotentialType.range, statValue: bonusEpicPrimeAllStatPercentageValues),
  bonusEpicPrimeIgnoreDefense(potentialType: PotentialType.static, statValue: bonusEpicPrimeIgnoreDefenseValue),
  // Unique Prime & Legendary Non Prime
  bonusUniquePrimeStat(potentialType: PotentialType.range, statValue: bonusUniquePrimeStatValues),
  bonusUniquePrimeStatPerLevel(potentialType: PotentialType.static, statValue: bonusUniquePrimeStatPerLevelValue),
  bonusUniquePrimeAtt(potentialType: PotentialType.range, statValue: bonusUniquePrimeAttValues),
  bonusUniquePrimeHp(potentialType: PotentialType.range, statValue: bonusUniquePrimeHpMpValues),
  bonusUniquePrimeMp(potentialType: PotentialType.range, statValue: bonusUniquePrimeHpMpValues),
  bonusUniquePrimeStatPercentage(potentialType: PotentialType.range, statValue: bonusUniquePrimeStatAttackDamageCriticalRatePercentageValues),
  bonusUniquePrimeAttackPercentage(potentialType: PotentialType.range, statValue: bonusUniquePrimeStatAttackDamageCriticalRatePercentageValues),
  bonusUniquePrimeDamage(potentialType: PotentialType.range, statValue: bonusUniquePrimeStatAttackDamageCriticalRatePercentageValues),
  bonusUniquePrimeCriticalRate(potentialType: PotentialType.range, statValue: bonusUniquePrimeStatAttackDamageCriticalRatePercentageValues),
  bonusUniquePrimeHpPercentage(potentialType: PotentialType.range, statValue: bonusUniquePrimeHpMpPercentageValues),
  bonusUniquePrimeMpPercentage(potentialType: PotentialType.range, statValue: bonusUniquePrimeHpMpPercentageValues),
  bonusUniquePrimeAllStatPercentage(potentialType: PotentialType.range, statValue: bonusUniquePrimeAllStatPercentageValues),
  bonusUniquePrimeHpRecovery(potentialType: PotentialType.range, statValue: bonusUniquePrimeHpRecoveryValues),
  bonusUniquePrimeBossDamage(potentialType: PotentialType.static, statValue: bonusUniquePrimeBossDamageValue),
  bonusUniquePrimeIgnoreDefense(potentialType: PotentialType.static, statValue: bonusUniquePrimeIgnoreDefenseValue),
  // Legendary Prime
  bonusLegendaryPrimeStat(potentialType: PotentialType.range, statValue: bonusLegendaryPrimeStatValues),
  bonusLegendaryPrimeAtt(potentialType: PotentialType.range, statValue: bonusLegendaryPrimeAttValues),
  bonusLegendaryPrimeHp(potentialType: PotentialType.range, statValue: bonusLegendaryPrimeHpMpValues),
  bonusLegendaryPrimeMp(potentialType: PotentialType.range, statValue: bonusLegendaryPrimeHpMpValues),
  bonusLegendaryPrimeStatPercentage(potentialType: PotentialType.range, statValue: bonusLegendaryPrimeStatAttackDamageCriticalRatePercentageValues),
  bonusLegendaryPrimeAttackPercentage(potentialType: PotentialType.range, statValue: bonusLegendaryPrimeStatAttackDamageCriticalRatePercentageValues),
  bonusLegendaryPrimeDamage(potentialType: PotentialType.range, statValue: bonusLegendaryPrimeStatAttackDamageCriticalRatePercentageValues),
  bonusLegendaryPrimeCriticalRate(potentialType: PotentialType.range, statValue: bonusLegendaryPrimeStatAttackDamageCriticalRatePercentageValues),
  bonusLegendaryPrimeHpPercentage(potentialType: PotentialType.range, statValue: bonusLegendaryPrimeHpMpPercentageValues),
  bonusLegendaryPrimeMpPercentage(potentialType: PotentialType.range, statValue: bonusLegendaryPrimeHpMpPercentageValues),
  bonusLegendaryPrimeAllStatPercentage(potentialType: PotentialType.range, statValue: bonusLegendaryPrimeAllStatPercentageValues),
  bonusLegendaryPrimeStatPerLevel(potentialType: PotentialType.static, statValue: bonusLegendaryPrimeStatPerLevelValue),
  bonusLegendaryPrimeHpRecovery(potentialType: PotentialType.range, statValue: bonusLegendaryPrimeHpRecoveryValues),
  bonusLegendaryPrimeMesosObtained(potentialType: PotentialType.range, statValue: bonusLegendaryPrimeMesosObtainedItemDropRateValues),
  bonusLegendaryPrimeItemDropRate(potentialType: PotentialType.range, statValue: bonusLegendaryPrimeMesosObtainedItemDropRateValues),
  bonusLegendaryPrimeSkillCooldown1(potentialType: PotentialType.static, statValue: bonusLegendaryPrimeSkillCooldown1Value),
  bonusLegendaryPrimeCriticalDamageStatic(potentialType: PotentialType.static, statValue: bonusLegendaryPrimeCriticalDamageStaticValue),
  bonusLegendaryPrimeCriticalDamage(potentialType: PotentialType.range, statValue: bonusLegendaryPrimeCriticalDamageValues),
  bonusLegendaryPrimeBossDamage(potentialType: PotentialType.static, statValue: bonusLegendaryPrimeBossDamageValue),
  bonusLegendaryPrimeIgnoreDefense(potentialType: PotentialType.static, statValue: bonusLegendaryPrimeIgnoreDefenseValue);

  const PotentialName({
    required this.potentialType,
    required this.statValue,
  });

  final PotentialType potentialType; // Using this to ensure we know what type to expect from statValue
  final dynamic statValue; // We lost the type safety here

  void validate() {
    switch(potentialType) {
      case PotentialType.range:
        if (statValue is! RangedPotentialType) {
          throw Exception("Potential '$this' has the wrong statValue for its PotentialType $potentialType");
        }
      case PotentialType.static:
        if (statValue is! StaticPotentialType) {
          throw Exception("Potential '$this' has the wrong statValue for its PotentialType $potentialType");
        }
      case PotentialType.skill:
        return;
    }
  }
}

class PotentialLine {
  final StatType statType;
  final bool isPrime;
  final PotentialName potentialName;

  const PotentialLine({
    required this.statType,
    required this.potentialName,
    this.isPrime = false,
  });
}

//Main Potential
const List<num> rareNonPrimeStatAttValues = [
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
const List<num> rareNonPrimeDefenseHpMpValues = [
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
const List<num> rarePrimeStatAttValues = [
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
const List<num> rarePrimeAllStatValues = [
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
const List<num> rarePrimeDefenseHpMpValues = [
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
const List<num> rarePrimeStatDefenseHpMpPercentageValues = [
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
const num rarePrimeCriticalRateValue = 0.04; // 0+

const List<num> epicPrimeStatAttackDamageDefenseHpMpPercentageValues = [
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
const List<num> epicPrimeAllStatPercentageValues = [
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
const num epicPrimeCriticalRateValue = 0.08; // 50+
const num epicPrimeIgnoreDefenseValue = 0.15; // 50+

const List<num> uniquePrimeStatAttackDamageCriticalRatePercentageValues = [
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
const List<num> uniquePrimeDefenseHpMpPercentageValues = [
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
const List<num> uniquePrimeAllStatPercentageValues = [
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
const List<num> uniquePrimeHpRecoveryValues = [
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
const List<num> uniquePrimeStatAttValues = [
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
const num uniquePrimeBossDamageValue = 0.3; // 100+
const num uniquePrimeIgnoreDefenseValue = 0.3; // 100+

const List<num> legendaryPrimeStatAttValues = uniquePrimeStatAttValues;
const List<num> legendaryPrimeStatAttackDamageCriticalRatePercentageValues = [
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
const List<num> legendaryPrimeHpMpPercentageValues = [
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
const List<num> legendaryPrimeAllStatPercentageValues = [
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
const List<num> legendaryPrimeHpRecoveryValues = uniquePrimeHpRecoveryValues;
const num legendaryPrimeSkillCooldown1Value = 1; // Requires 70+ equipment
const num legendaryPrimeSkillCooldown2Value = 2; // Requires 120+ equipment
const List<num> legendaryPrimeCriticalDamageValues = [
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
const List<num> legendaryPrimeMesosObtainedItemDropRateValues = [
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
const num legendaryPrimeBossDamage35Value = 0.35; // 100+
const num legendaryPrimeBossDamage40Value = 0.4; // 100+
const num legendaryPrimeIgnoreDefense35Value = 0.35; // 100+
const num legendaryPrimeIgnoreDefense40Value = 0.4; // 100+

// Default that is shared between all equips
const Map<PotentialTier, List<PotentialLine>> defaultPotentials = {
  PotentialTier.rare: [
    // Prime
    PotentialLine(statType: StatType.strPercentage, isPrime: true, potentialName: PotentialName.rarePrimeStatPercentage),
    PotentialLine(statType: StatType.dexPercentage, isPrime: true, potentialName: PotentialName.rarePrimeStatPercentage),
    PotentialLine(statType: StatType.lukPercentage, isPrime: true, potentialName: PotentialName.rarePrimeStatPercentage),
    PotentialLine(statType: StatType.intPercentage, isPrime: true, potentialName: PotentialName.rarePrimeStatPercentage),
    PotentialLine(statType: StatType.hpPercentage, isPrime: true, potentialName: PotentialName.rarePrimeHpPercentage),
    PotentialLine(statType: StatType.mpPercentage, isPrime: true, potentialName: PotentialName.rarePrimeMpPercentage),
    PotentialLine(statType: StatType.defensePercentage, isPrime: true, potentialName: PotentialName.rarePrimeDefensePercentage),
    PotentialLine(statType: StatType.allStats, isPrime: true, potentialName: PotentialName.rarePrimeAllStat),
    PotentialLine(statType: StatType.str, isPrime: true, potentialName: PotentialName.rarePrimeStat),
    PotentialLine(statType: StatType.dex, isPrime: true, potentialName: PotentialName.rarePrimeStat),
    PotentialLine(statType: StatType.int, isPrime: true, potentialName: PotentialName.rarePrimeStat),
    PotentialLine(statType: StatType.luk, isPrime: true, potentialName: PotentialName.rarePrimeStat),
    PotentialLine(statType: StatType.hp, isPrime: true, potentialName: PotentialName.rarePrimeHp),
    PotentialLine(statType: StatType.mp, isPrime: true, potentialName: PotentialName.rarePrimeMp),
    PotentialLine(statType: StatType.defense, isPrime: true, potentialName: PotentialName.rarePrimeDefense),
    // Non-Prime
    PotentialLine(statType: StatType.str, potentialName: PotentialName.rareNonPrimeStat),
    PotentialLine(statType: StatType.dex, potentialName: PotentialName.rareNonPrimeStat),
    PotentialLine(statType: StatType.int, potentialName: PotentialName.rareNonPrimeStat),
    PotentialLine(statType: StatType.luk, potentialName: PotentialName.rareNonPrimeStat),
    PotentialLine(statType: StatType.hp, potentialName: PotentialName.rareNonPrimeHp),
    PotentialLine(statType: StatType.mp, potentialName: PotentialName.rareNonPrimeMp),
    PotentialLine(statType: StatType.defense, potentialName: PotentialName.rareNonPrimeDefense),
  ],
  PotentialTier.epic: [
    // Prime
    PotentialLine(statType: StatType.strPercentage, isPrime: true, potentialName: PotentialName.epicPrimeStatPercentage),
    PotentialLine(statType: StatType.dexPercentage, isPrime: true, potentialName: PotentialName.epicPrimeStatPercentage),
    PotentialLine(statType: StatType.lukPercentage, isPrime: true, potentialName: PotentialName.epicPrimeStatPercentage),
    PotentialLine(statType: StatType.intPercentage, isPrime: true, potentialName: PotentialName.epicPrimeStatPercentage),
    PotentialLine(statType: StatType.hpPercentage, isPrime: true, potentialName: PotentialName.epicPrimeHpPercentage),
    PotentialLine(statType: StatType.mpPercentage, isPrime: true, potentialName: PotentialName.epicPrimeMpPercentage),
    PotentialLine(statType: StatType.defensePercentage, isPrime: true, potentialName: PotentialName.epicPrimeDefensePercentage),
    PotentialLine(statType: StatType.allStatsPercentage, isPrime: true, potentialName: PotentialName.epicPrimeAllStatPercentage),
    // Non-Prime
    PotentialLine(statType: StatType.strPercentage, potentialName: PotentialName.rarePrimeStatPercentage),
    PotentialLine(statType: StatType.dexPercentage, potentialName: PotentialName.rarePrimeStatPercentage),
    PotentialLine(statType: StatType.lukPercentage, potentialName: PotentialName.rarePrimeStatPercentage),
    PotentialLine(statType: StatType.intPercentage, potentialName: PotentialName.rarePrimeStatPercentage),
    PotentialLine(statType: StatType.hpPercentage, potentialName: PotentialName.rarePrimeHpPercentage),
    PotentialLine(statType: StatType.mpPercentage, potentialName: PotentialName.rarePrimeMpPercentage),
    PotentialLine(statType: StatType.defensePercentage, potentialName: PotentialName.rarePrimeDefensePercentage),
    PotentialLine(statType: StatType.str, potentialName: PotentialName.rarePrimeStat),
    PotentialLine(statType: StatType.dex, potentialName: PotentialName.rarePrimeStat),
    PotentialLine(statType: StatType.int, potentialName: PotentialName.rarePrimeStat),
    PotentialLine(statType: StatType.luk, potentialName: PotentialName.rarePrimeStat),
    PotentialLine(statType: StatType.allStats, potentialName: PotentialName.rarePrimeAllStat),
    PotentialLine(statType: StatType.hp, potentialName: PotentialName.rarePrimeHp),
    PotentialLine(statType: StatType.mp, potentialName: PotentialName.rarePrimeMp),
    PotentialLine(statType: StatType.defense, potentialName: PotentialName.rarePrimeDefense),
  ],
  PotentialTier.unique: [
    // Prime
    PotentialLine(statType: StatType.allStatsPercentage, isPrime: true, potentialName: PotentialName.uniquePrimeAllStatPercentage),
    PotentialLine(statType: StatType.strPercentage, isPrime: true, potentialName: PotentialName.uniquePrimeStatPercentage),
    PotentialLine(statType: StatType.dexPercentage, isPrime: true, potentialName: PotentialName.uniquePrimeStatPercentage),
    PotentialLine(statType: StatType.lukPercentage, isPrime: true, potentialName: PotentialName.uniquePrimeStatPercentage),
    PotentialLine(statType: StatType.intPercentage, isPrime: true, potentialName: PotentialName.uniquePrimeStatPercentage),
    PotentialLine(statType: StatType.hpPercentage, isPrime: true, potentialName: PotentialName.uniquePrimeHpPercentage),
    PotentialLine(statType: StatType.mpPercentage, isPrime: true, potentialName: PotentialName.uniquePrimeMpPercentage),
    // Non-Prime
    PotentialLine(statType: StatType.strPercentage, potentialName: PotentialName.epicPrimeStatPercentage),
    PotentialLine(statType: StatType.dexPercentage, potentialName: PotentialName.epicPrimeStatPercentage),
    PotentialLine(statType: StatType.lukPercentage, potentialName: PotentialName.epicPrimeStatPercentage),
    PotentialLine(statType: StatType.intPercentage, potentialName: PotentialName.epicPrimeStatPercentage),
    PotentialLine(statType: StatType.hpPercentage, potentialName: PotentialName.epicPrimeHpPercentage),
    PotentialLine(statType: StatType.mpPercentage, potentialName: PotentialName.epicPrimeMpPercentage),
    PotentialLine(statType: StatType.defensePercentage, potentialName: PotentialName.epicPrimeDefensePercentage),
    PotentialLine(statType: StatType.allStatsPercentage, potentialName: PotentialName.epicPrimeAllStatPercentage),
  ],
  PotentialTier.legendary: [
    // Prime
    PotentialLine(statType: StatType.allStatsPercentage, isPrime: true, potentialName: PotentialName.legendaryPrimeAllStatPercentage),
    PotentialLine(statType: StatType.strPercentage, isPrime: true, potentialName: PotentialName.legendaryPrimeStatPercentage),
    PotentialLine(statType: StatType.dexPercentage, isPrime: true, potentialName: PotentialName.legendaryPrimeStatPercentage),
    PotentialLine(statType: StatType.lukPercentage, isPrime: true, potentialName: PotentialName.legendaryPrimeStatPercentage),
    PotentialLine(statType: StatType.intPercentage, isPrime: true, potentialName: PotentialName.legendaryPrimeStatPercentage),
    PotentialLine(statType: StatType.hpPercentage, isPrime: true, potentialName: PotentialName.legendaryPrimeHpPercentage),
    PotentialLine(statType: StatType.mpPercentage, isPrime: true, potentialName: PotentialName.legendaryPrimeMpPercentage),
    // Non-Prime
    PotentialLine(statType: StatType.allStatsPercentage, potentialName: PotentialName.uniquePrimeAllStatPercentage),
    PotentialLine(statType: StatType.strPercentage, potentialName: PotentialName.uniquePrimeStatPercentage),
    PotentialLine(statType: StatType.dexPercentage, potentialName: PotentialName.uniquePrimeStatPercentage),
    PotentialLine(statType: StatType.lukPercentage, potentialName: PotentialName.uniquePrimeStatPercentage),
    PotentialLine(statType: StatType.intPercentage, potentialName: PotentialName.uniquePrimeStatPercentage),
    PotentialLine(statType: StatType.hpPercentage, potentialName: PotentialName.uniquePrimeHpPercentage),
    PotentialLine(statType: StatType.mpPercentage, potentialName: PotentialName.uniquePrimeMpPercentage),
  ],
};

// Hat
const Map<PotentialTier, List<PotentialLine>> hatPotentials = {
  PotentialTier.unique: [
    // Prime
    PotentialLine(statType: StatType.hpRecovery, isPrime: true, potentialName: PotentialName.uniquePrimeHpRecovery),
    // TODO: StatType.skill - Decent Mystic Door - requires 70+
  ],
  PotentialTier.legendary: [
    // Prime
    PotentialLine(statType: StatType.skillCooldown, isPrime: true, potentialName: PotentialName.legendaryPrimeSkillCooldown2),
    PotentialLine(statType: StatType.skillCooldown, isPrime: true, potentialName: PotentialName.legendaryPrimeSkillCooldown1),
    PotentialLine(statType: StatType.hpRecovery, isPrime: true, potentialName: PotentialName.legendaryPrimeHpRecovery),
    // TODO: StatType.skill - Decent Advanced Blessing - requires 120+
    // Non-Prime
    PotentialLine(statType: StatType.hpRecovery, potentialName: PotentialName.uniquePrimeHpRecovery),
    // TODO: StatType.skill - Decent Mystic Door - requires 70+
  ],
};

//Top, Overall
const Map<PotentialTier, List<PotentialLine>> topAndOverallPotentials = {
  PotentialTier.unique: [
    // Prime
    PotentialLine(statType: StatType.hpRecovery, isPrime: true, potentialName: PotentialName.uniquePrimeHpRecovery),
  ],
  PotentialTier.legendary: [
    // Prime
    PotentialLine(statType: StatType.hpRecovery, isPrime: true, potentialName: PotentialName.legendaryPrimeHpRecovery),
    // Non-Prime
    PotentialLine(statType: StatType.hpRecovery, potentialName: PotentialName.uniquePrimeHpRecovery),
  ],
};

//Bottom
const Map<PotentialTier, List<PotentialLine>> bottomPotentials = {
  PotentialTier.unique: [
    // Prime
    PotentialLine(statType: StatType.hpRecovery, isPrime: true, potentialName: PotentialName.uniquePrimeHpRecovery),
    // TODO: StatType.skill - Decent Hyper Body - requires 70+
    
  ],
  PotentialTier.legendary: [
    // Prime
    PotentialLine(statType: StatType.hpRecovery, isPrime: true, potentialName: PotentialName.legendaryPrimeHpRecovery),
    // Non-Prime
    PotentialLine(statType: StatType.hpRecovery, potentialName: PotentialName.uniquePrimeHpRecovery),
    // TODO: StatType.skill - Decent Hyper Body - requires 70+
  ],
};

//Gloves
const Map<PotentialTier, List<PotentialLine>> glovesPotentials = {
  PotentialTier.unique: [
    // Prime
    PotentialLine(statType: StatType.hpRecovery, isPrime: true, potentialName: PotentialName.uniquePrimeHpRecovery),
    PotentialLine(statType: StatType.str, isPrime: true, potentialName: PotentialName.uniquePrimeStat),
    PotentialLine(statType: StatType.dex, isPrime: true, potentialName: PotentialName.uniquePrimeStat),
    PotentialLine(statType: StatType.int, isPrime: true, potentialName: PotentialName.uniquePrimeStat),
    PotentialLine(statType: StatType.luk, isPrime: true, potentialName: PotentialName.uniquePrimeStat),
    PotentialLine(statType: StatType.attack, isPrime: true, potentialName: PotentialName.uniquePrimeAtt),
    PotentialLine(statType: StatType.mattack, isPrime: true, potentialName: PotentialName.uniquePrimeAtt),
    // TODO: StatType.skill - Decent Sharp Eyes - requires 120+
  ],
  PotentialTier.legendary: [
    // Prime
    PotentialLine(statType: StatType.critDamage, isPrime: true, potentialName: PotentialName.legendaryPrimeCriticalDamage),
    PotentialLine(statType: StatType.hpRecovery, isPrime: true, potentialName: PotentialName.legendaryPrimeHpRecovery),
    // TODO: StatType.skill - Decent Speed Infusion - requires 120+
    // Non-Prime
    PotentialLine(statType: StatType.str, potentialName: PotentialName.uniquePrimeStat),
    PotentialLine(statType: StatType.dex, potentialName: PotentialName.uniquePrimeStat),
    PotentialLine(statType: StatType.int, potentialName: PotentialName.uniquePrimeStat),
    PotentialLine(statType: StatType.luk, potentialName: PotentialName.uniquePrimeStat),
    PotentialLine(statType: StatType.attack, potentialName: PotentialName.uniquePrimeAtt),
    PotentialLine(statType: StatType.mattack, potentialName: PotentialName.uniquePrimeAtt),
    PotentialLine(statType: StatType.hpRecovery, potentialName: PotentialName.uniquePrimeHpRecovery),
    // TODO: StatType.skill - Decent Sharp Eyes - requires 120+
  ],
};

//Shoes
const Map<PotentialTier, List<PotentialLine>> shoesPotentials = {
  PotentialTier.unique: [
    // Prime
    PotentialLine(statType: StatType.hpRecovery, isPrime: true, potentialName: PotentialName.uniquePrimeHpRecovery),
    // TODO: StatType.skill - Decent Haste - requires 70+
  ],
  PotentialTier.legendary: [
    // Prime
    PotentialLine(statType: StatType.hpRecovery, isPrime: true, potentialName: PotentialName.legendaryPrimeHpRecovery),
    // TODO: StatType.skill - Decent Combat Orders - requires 70+
    // Non-Prime
    PotentialLine(statType: StatType.hpRecovery, potentialName: PotentialName.uniquePrimeHpRecovery),
    // TODO: StatType.skill - Decent Haste - requires 70+
  ],
};

//Cape, Belt, Shoulder
const Map<PotentialTier, List<PotentialLine>> capeBeltShoulderPotentials = {
  PotentialTier.unique: [
    // Prime
    PotentialLine(statType: StatType.hpRecovery, isPrime: true, potentialName: PotentialName.uniquePrimeHpRecovery),
  ],
  PotentialTier.legendary: [
    // Prime
    PotentialLine(statType: StatType.hpRecovery, isPrime: true, potentialName: PotentialName.legendaryPrimeHpRecovery),
    // Non-Prime
    PotentialLine(statType: StatType.hpRecovery, potentialName: PotentialName.uniquePrimeHpRecovery),
  ],
};

//Face, Eye, Ring, Pendant, Earring
const Map<PotentialTier, List<PotentialLine>> faceEyeRingPendantEarringPotentials = {
  PotentialTier.unique: [
    // Prime
    PotentialLine(statType: StatType.hpRecovery, isPrime: true, potentialName: PotentialName.uniquePrimeHpRecovery),
  ],
  PotentialTier.legendary: [
    // Prime
    PotentialLine(statType: StatType.itemDropRate, isPrime: true, potentialName: PotentialName.legendaryPrimeItemDropRate),
    PotentialLine(statType: StatType.mesosObtained, isPrime: true, potentialName: PotentialName.legendaryPrimeMesosObtained),
    PotentialLine(statType: StatType.hpRecovery, isPrime: true, potentialName: PotentialName.legendaryPrimeHpRecovery),
    // Non-Prime
    PotentialLine(statType: StatType.hpRecovery, potentialName: PotentialName.uniquePrimeHpRecovery),
  ],
};

//Weapon, Secondary
const Map<PotentialTier, List<PotentialLine>> weaponSecondaryPotentials = {
  PotentialTier.rare: [
    // Prime
    PotentialLine(statType: StatType.critRate, isPrime: true, potentialName: PotentialName.rarePrimeCriticalRate),
    PotentialLine(statType: StatType.attack, isPrime: true, potentialName: PotentialName.rarePrimeAtt),
    PotentialLine(statType: StatType.mattack, isPrime: true, potentialName: PotentialName.rarePrimeAtt),
    // Non Prime
    PotentialLine(statType: StatType.attack, potentialName: PotentialName.rareNonPrimeAtt),
    PotentialLine(statType: StatType.mattack, potentialName: PotentialName.rareNonPrimeAtt),
  ],
  PotentialTier.epic: [
    // Prime
    PotentialLine(statType: StatType.attackPercentage, isPrime: true, potentialName: PotentialName.epicPrimeAttackPercentage),
    PotentialLine(statType: StatType.mattackPercentage, isPrime: true, potentialName: PotentialName.epicPrimeAttackPercentage),
    PotentialLine(statType: StatType.ignoreDefense, isPrime: true, potentialName: PotentialName.epicPrimeIgnoreDefense),
    PotentialLine(statType: StatType.damage, isPrime: true, potentialName: PotentialName.epicPrimeDamage),
    PotentialLine(statType: StatType.critRate, isPrime: true, potentialName: PotentialName.epicPrimeCriticalRate),
    // Non Prime
    PotentialLine(statType: StatType.critRate, potentialName: PotentialName.rarePrimeCriticalRate),
    PotentialLine(statType: StatType.attack, potentialName: PotentialName.rarePrimeAtt),
    PotentialLine(statType: StatType.mattack, potentialName: PotentialName.rarePrimeAtt),
  ],
  PotentialTier.unique: [
    // Prime
    PotentialLine(statType: StatType.attackPercentage, isPrime: true, potentialName: PotentialName.uniquePrimeAttackPercentage),
    PotentialLine(statType: StatType.mattackPercentage, isPrime: true, potentialName: PotentialName.uniquePrimeAttackPercentage),
    PotentialLine(statType: StatType.bossDamage, isPrime: true, potentialName: PotentialName.uniquePrimeBossDamage),
    PotentialLine(statType: StatType.ignoreDefense, isPrime: true, potentialName: PotentialName.uniquePrimeIgnoreDefense),
    PotentialLine(statType: StatType.damage, isPrime: true, potentialName: PotentialName.uniquePrimeDamage),
    PotentialLine(statType: StatType.critRate, isPrime: true, potentialName: PotentialName.uniquePrimeCriticalRate),
    // Non Prime
    PotentialLine(statType: StatType.attackPercentage, potentialName: PotentialName.epicPrimeAttackPercentage),
    PotentialLine(statType: StatType.mattackPercentage, potentialName: PotentialName.epicPrimeAttackPercentage),
    PotentialLine(statType: StatType.ignoreDefense, potentialName: PotentialName.epicPrimeIgnoreDefense),
    PotentialLine(statType: StatType.damage, potentialName: PotentialName.epicPrimeDamage),
    PotentialLine(statType: StatType.critRate, potentialName: PotentialName.epicPrimeCriticalRate),
  ],
  PotentialTier.legendary: [
    // Prime
    PotentialLine(statType: StatType.attackPercentage, isPrime: true, potentialName: PotentialName.legendaryPrimeAttackPercentage),
    PotentialLine(statType: StatType.mattackPercentage, isPrime: true, potentialName: PotentialName.legendaryPrimeAttackPercentage),
    PotentialLine(statType: StatType.bossDamage, isPrime: true, potentialName: PotentialName.legendaryPrimeBossDamage40),
    PotentialLine(statType: StatType.bossDamage, isPrime: true, potentialName: PotentialName.legendaryPrimeBossDamage35),
    PotentialLine(statType: StatType.ignoreDefense, isPrime: true, potentialName: PotentialName.legendaryPrimeIgnoreDefense40),
    PotentialLine(statType: StatType.ignoreDefense, isPrime: true, potentialName: PotentialName.legendaryPrimeIgnoreDefense35),
    PotentialLine(statType: StatType.damage, isPrime: true, potentialName: PotentialName.legendaryPrimeDamagePercentage),
    PotentialLine(statType: StatType.critRate, isPrime: true, potentialName: PotentialName.legendaryPrimeCriticalRatePercentage),
    PotentialLine(statType: StatType.attack, isPrime: true, potentialName: PotentialName.legendaryPrimeAtt),
    PotentialLine(statType: StatType.mattack, isPrime: true, potentialName: PotentialName.legendaryPrimeAtt),
    // Non Prime
    PotentialLine(statType: StatType.attackPercentage, potentialName: PotentialName.uniquePrimeAttackPercentage),
    PotentialLine(statType: StatType.mattackPercentage, potentialName: PotentialName.uniquePrimeAttackPercentage),
    PotentialLine(statType: StatType.bossDamage, potentialName: PotentialName.uniquePrimeBossDamage),
    PotentialLine(statType: StatType.ignoreDefense, potentialName: PotentialName.uniquePrimeIgnoreDefense),
    PotentialLine(statType: StatType.damage, potentialName: PotentialName.uniquePrimeDamage),
    PotentialLine(statType: StatType.critRate, potentialName: PotentialName.uniquePrimeCriticalRate),
  ],
};

//Emblem
const Map<PotentialTier, List<PotentialLine>> emblemPotentials = {
  PotentialTier.rare: [
    // Prime
    PotentialLine(statType: StatType.critRate, isPrime: true, potentialName: PotentialName.rarePrimeCriticalRate),
    PotentialLine(statType: StatType.attack, isPrime: true, potentialName: PotentialName.rarePrimeAtt),
    PotentialLine(statType: StatType.mattack, isPrime: true, potentialName: PotentialName.rarePrimeAtt),
    // Non Prime
    PotentialLine(statType: StatType.attack, potentialName: PotentialName.rareNonPrimeAtt),
    PotentialLine(statType: StatType.mattack, potentialName: PotentialName.rareNonPrimeAtt),
  ],
  PotentialTier.epic: [
    // Prime
    PotentialLine(statType: StatType.attackPercentage, isPrime: true, potentialName: PotentialName.epicPrimeAttackPercentage),
    PotentialLine(statType: StatType.mattackPercentage, isPrime: true, potentialName: PotentialName.epicPrimeAttackPercentage),
    PotentialLine(statType: StatType.ignoreDefense, isPrime: true, potentialName: PotentialName.epicPrimeIgnoreDefense),
    PotentialLine(statType: StatType.damage, isPrime: true, potentialName: PotentialName.epicPrimeDamage),
    PotentialLine(statType: StatType.critRate, isPrime: true, potentialName: PotentialName.epicPrimeCriticalRate),
    // Non Prime
    PotentialLine(statType: StatType.critRate, potentialName: PotentialName.rarePrimeCriticalRate),
    PotentialLine(statType: StatType.attack, potentialName: PotentialName.rarePrimeAtt),
    PotentialLine(statType: StatType.mattack, potentialName: PotentialName.rarePrimeAtt),
  ],
  PotentialTier.unique: [
    // Prime
    PotentialLine(statType: StatType.attackPercentage, isPrime: true, potentialName: PotentialName.uniquePrimeAttackPercentage),
    PotentialLine(statType: StatType.mattackPercentage, isPrime: true, potentialName: PotentialName.uniquePrimeAttackPercentage),
    PotentialLine(statType: StatType.ignoreDefense, isPrime: true, potentialName: PotentialName.uniquePrimeIgnoreDefense),
    PotentialLine(statType: StatType.damage, isPrime: true, potentialName: PotentialName.uniquePrimeDamage),
    PotentialLine(statType: StatType.critRate, isPrime: true, potentialName: PotentialName.uniquePrimeCriticalRate),
    // Non Prime
    PotentialLine(statType: StatType.attackPercentage, potentialName: PotentialName.epicPrimeAttackPercentage),
    PotentialLine(statType: StatType.mattackPercentage, potentialName: PotentialName.epicPrimeAttackPercentage),
    PotentialLine(statType: StatType.ignoreDefense, potentialName: PotentialName.epicPrimeIgnoreDefense),
    PotentialLine(statType: StatType.damage, potentialName: PotentialName.epicPrimeDamage),
    PotentialLine(statType: StatType.critRate, potentialName: PotentialName.epicPrimeCriticalRate),
  ],
  PotentialTier.legendary: [
    // Prime
    PotentialLine(statType: StatType.attackPercentage, isPrime: true, potentialName: PotentialName.legendaryPrimeAttackPercentage),
    PotentialLine(statType: StatType.mattackPercentage, isPrime: true, potentialName: PotentialName.legendaryPrimeAttackPercentage),
    PotentialLine(statType: StatType.ignoreDefense, isPrime: true, potentialName: PotentialName.legendaryPrimeIgnoreDefense40),
    PotentialLine(statType: StatType.ignoreDefense, isPrime: true, potentialName: PotentialName.legendaryPrimeIgnoreDefense35),
    PotentialLine(statType: StatType.damage, isPrime: true, potentialName: PotentialName.legendaryPrimeDamagePercentage),
    PotentialLine(statType: StatType.critRate, isPrime: true, potentialName: PotentialName.legendaryPrimeCriticalRatePercentage),
    PotentialLine(statType: StatType.attack, isPrime: true, potentialName: PotentialName.legendaryPrimeAtt),
    PotentialLine(statType: StatType.mattack, isPrime: true, potentialName: PotentialName.legendaryPrimeAtt),
    // Non Prime
    PotentialLine(statType: StatType.attackPercentage, potentialName: PotentialName.uniquePrimeAttackPercentage),
    PotentialLine(statType: StatType.mattackPercentage, potentialName: PotentialName.uniquePrimeAttackPercentage),
    PotentialLine(statType: StatType.ignoreDefense,potentialName: PotentialName.uniquePrimeIgnoreDefense),
    PotentialLine(statType: StatType.damage, potentialName: PotentialName.uniquePrimeDamage),
    PotentialLine(statType: StatType.critRate, potentialName: PotentialName.uniquePrimeCriticalRate),
  ],
};

//Heart, Badge
const Map<PotentialTier, List<PotentialLine>> heartAndBadgePotentials = {
  PotentialTier.unique: [
    // Prime
    PotentialLine(statType: StatType.hpRecovery, isPrime: true, potentialName: PotentialName.uniquePrimeHpRecovery),
  ],
  PotentialTier.legendary: [
    // Prime
    PotentialLine(statType: StatType.hpRecovery, isPrime: true, potentialName: PotentialName.legendaryPrimeHpRecovery),
    // Non-Prime
    PotentialLine(statType: StatType.hpRecovery, potentialName: PotentialName.uniquePrimeHpRecovery),
  ],
};


//Bonus Potential
const List<num> bonusRareNonPrimeStatValues = [
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
const List<num> bonusRareNonPrimeAttValues = [
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
const List<num> bonusRareNonPrimeHpMpDefenseValues = [
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
const List<num> bonusRareNonPrimeSpeedJumpValues = [
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
const List<num> bonusRarePrimeStatValues = [
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
const List<num> bonusRarePrimeAttValues = [
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
const List<num> bonusRarePrimeAllStatValues = [
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
const List<num> bonusRarePrimeDefenseHpMpValues = [
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
const List<num> bonusRarePrimeStatHpMpDefenseAttackDamageCriticalRatePercentageValues = [
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
const List<num> bonusRarePrimeSpeedJumpValues = [
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

const List<num> bonusEpicPrimeStatValues = [
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
const List<num> bonusEpicPrimeAttValues = [
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
const List<num> bonusEpicPrimeHpMpValues = [
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
const List<num> bonusEpicPrimeDefenseValues = [
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
const List<num> bonusEpicPrimeSpeedJumpValues = [
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
const List<num> bonusEpicPrimeStatDefenseAttackDamageCriticalRatePercentageValues = [
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
const List<num> bonusEpicPrimeHpMpPercentageValues = [
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
const List<num> bonusEpicPrimeAllStatPercentageValues = [
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
const num bonusEpicPrimeIgnoreDefenseValue = 0.03;

const List<num> bonusUniquePrimeStatValues = [
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
const num bonusUniquePrimeStatPerLevelValue = 32;
const List<num> bonusUniquePrimeAttValues = [
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
const List<num> bonusUniquePrimeHpMpValues = [
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
const List<num> bonusUniquePrimeStatAttackDamageCriticalRatePercentageValues = [
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
const List<num> bonusUniquePrimeHpMpPercentageValues = [
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
const List<num> bonusUniquePrimeAllStatPercentageValues = [
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
const List<num> bonusUniquePrimeHpRecoveryValues = [
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
const num bonusUniquePrimeBossDamageValue = 0.12;
const num bonusUniquePrimeIgnoreDefenseValue = 0.04;

const List<num> bonusLegendaryPrimeStatValues = [
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
const List<num> bonusLegendaryPrimeAttValues = [
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
const List<num> bonusLegendaryPrimeHpMpValues = [
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
const List<num> bonusLegendaryPrimeStatAttackDamageCriticalRatePercentageValues = [
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
const List<num> bonusLegendaryPrimeHpMpPercentageValues = [
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
const List<num> bonusLegendaryPrimeAllStatPercentageValues = [
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
const num bonusLegendaryPrimeStatPerLevelValue = 32;
const List<num> bonusLegendaryPrimeHpRecoveryValues = [
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
const List<num> bonusLegendaryPrimeMesosObtainedItemDropRateValues = [
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
const num bonusLegendaryPrimeSkillCooldown1Value = 1;
const num bonusLegendaryPrimeCriticalDamageStaticValue = 0.01;
const List<num> bonusLegendaryPrimeCriticalDamageValues = [
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
const num bonusLegendaryPrimeBossDamageValue = 0.18;
const num bonusLegendaryPrimeIgnoreDefenseValue = 0.05;

const Map<PotentialTier, List<PotentialLine>> bonusDefaultPotentials = {
  PotentialTier.rare: [
    // Prime
    PotentialLine(statType: StatType.strPercentage, isPrime: true, potentialName: PotentialName.bonusRarePrimeStatPercentage),
    PotentialLine(statType: StatType.dexPercentage, isPrime: true, potentialName: PotentialName.bonusRarePrimeStatPercentage),
    PotentialLine(statType: StatType.intPercentage, isPrime: true, potentialName: PotentialName.bonusRarePrimeStatPercentage),
    PotentialLine(statType: StatType.lukPercentage, isPrime: true, potentialName: PotentialName.bonusRarePrimeStatPercentage),
    PotentialLine(statType: StatType.allStats, isPrime: true, potentialName: PotentialName.bonusRarePrimeAllStat),
    PotentialLine(statType: StatType.hpPercentage, isPrime: true, potentialName: PotentialName.bonusRarePrimeHpPercentage),
    PotentialLine(statType: StatType.mpPercentage, isPrime: true, potentialName: PotentialName.bonusRarePrimeMpPercentage),
    PotentialLine(statType: StatType.defensePercentage, isPrime: true, potentialName: PotentialName.bonusRarePrimeDefensePercentage),
    PotentialLine(statType: StatType.str, isPrime: true, potentialName: PotentialName.bonusRarePrimeStat),
    PotentialLine(statType: StatType.dex, isPrime: true, potentialName: PotentialName.bonusRarePrimeStat),
    PotentialLine(statType: StatType.int, isPrime: true, potentialName: PotentialName.bonusRarePrimeStat),
    PotentialLine(statType: StatType.luk, isPrime: true, potentialName: PotentialName.bonusRarePrimeStat),
    PotentialLine(statType: StatType.attack, isPrime: true, potentialName: PotentialName.bonusRarePrimeAtt),
    PotentialLine(statType: StatType.mattack, isPrime: true, potentialName: PotentialName.bonusRarePrimeAtt),
    PotentialLine(statType: StatType.hp, isPrime: true, potentialName: PotentialName.bonusRarePrimeHp),
    PotentialLine(statType: StatType.mp, isPrime: true, potentialName: PotentialName.bonusRarePrimeMp),
    PotentialLine(statType: StatType.defense, isPrime: true, potentialName: PotentialName.bonusRarePrimeDefense),
    PotentialLine(statType: StatType.speed, isPrime: true, potentialName: PotentialName.bonusRarePrimeSpeed),
    PotentialLine(statType: StatType.jump, isPrime: true, potentialName: PotentialName.bonusRarePrimeJump),
    // Non-Prime
    PotentialLine(statType: StatType.str, potentialName: PotentialName.bonusRareNonPrimeStat),
    PotentialLine(statType: StatType.dex, potentialName: PotentialName.bonusRareNonPrimeStat),
    PotentialLine(statType: StatType.int, potentialName: PotentialName.bonusRareNonPrimeStat),
    PotentialLine(statType: StatType.luk, potentialName: PotentialName.bonusRareNonPrimeStat),
    PotentialLine(statType: StatType.attack, potentialName: PotentialName.bonusRareNonPrimeAtt),
    PotentialLine(statType: StatType.mattack, potentialName: PotentialName.bonusRareNonPrimeAtt),
    PotentialLine(statType: StatType.hp, potentialName: PotentialName.bonusRareNonPrimeHp),
    PotentialLine(statType: StatType.mp, potentialName: PotentialName.bonusRareNonPrimeMp),
    PotentialLine(statType: StatType.defense, potentialName: PotentialName.bonusRareNonPrimeDefense),
    PotentialLine(statType: StatType.speed, potentialName: PotentialName.bonusRareNonPrimeSpeed),
    PotentialLine(statType: StatType.jump, potentialName: PotentialName.bonusRareNonPrimeJump),
  ],
  PotentialTier.epic: [
    // Prime
    PotentialLine(statType: StatType.strPercentage, isPrime: true, potentialName: PotentialName.bonusEpicPrimeStatPercentage),
    PotentialLine(statType: StatType.dexPercentage, isPrime: true, potentialName: PotentialName.bonusEpicPrimeStatPercentage),
    PotentialLine(statType: StatType.intPercentage, isPrime: true, potentialName: PotentialName.bonusEpicPrimeStatPercentage),
    PotentialLine(statType: StatType.lukPercentage, isPrime: true, potentialName: PotentialName.bonusEpicPrimeStatPercentage),
    PotentialLine(statType: StatType.allStatsPercentage, isPrime: true, potentialName: PotentialName.bonusEpicPrimeAllStatPercentage),
    PotentialLine(statType: StatType.hpPercentage, isPrime: true, potentialName: PotentialName.bonusEpicPrimeHpPercentage),
    PotentialLine(statType: StatType.mpPercentage, isPrime: true, potentialName: PotentialName.bonusEpicPrimeMpPercentage),
    PotentialLine(statType: StatType.defensePercentage, isPrime: true, potentialName: PotentialName.bonusEpicPrimeDefensePercentage),
    PotentialLine(statType: StatType.str, isPrime: true, potentialName: PotentialName.bonusEpicPrimeStat),
    PotentialLine(statType: StatType.dex, isPrime: true, potentialName: PotentialName.bonusEpicPrimeStat),
    PotentialLine(statType: StatType.int, isPrime: true, potentialName: PotentialName.bonusEpicPrimeStat),
    PotentialLine(statType: StatType.luk, isPrime: true, potentialName: PotentialName.bonusEpicPrimeStat),
    PotentialLine(statType: StatType.attack, isPrime: true, potentialName: PotentialName.bonusEpicPrimeAtt),
    PotentialLine(statType: StatType.mattack, isPrime: true, potentialName: PotentialName.bonusEpicPrimeAtt),
    PotentialLine(statType: StatType.hp, isPrime: true, potentialName: PotentialName.bonusEpicPrimeHp),
    PotentialLine(statType: StatType.mp, isPrime: true, potentialName: PotentialName.bonusEpicPrimeMp),
    PotentialLine(statType: StatType.defense, isPrime: true, potentialName: PotentialName.bonusEpicPrimeDefense),
    PotentialLine(statType: StatType.speed, isPrime: true, potentialName: PotentialName.bonusEpicPrimeSpeed),
    PotentialLine(statType: StatType.jump, isPrime: true, potentialName: PotentialName.bonusEpicPrimeJump),
    // Non-Prime
    PotentialLine(statType: StatType.strPercentage, potentialName: PotentialName.bonusRarePrimeStatPercentage),
    PotentialLine(statType: StatType.dexPercentage, potentialName: PotentialName.bonusRarePrimeStatPercentage),
    PotentialLine(statType: StatType.intPercentage, potentialName: PotentialName.bonusRarePrimeStatPercentage),
    PotentialLine(statType: StatType.lukPercentage, potentialName: PotentialName.bonusRarePrimeStatPercentage),
    PotentialLine(statType: StatType.allStats, potentialName: PotentialName.bonusRarePrimeAllStat),
    PotentialLine(statType: StatType.hpPercentage, potentialName: PotentialName.bonusRarePrimeHpPercentage),
    PotentialLine(statType: StatType.mpPercentage, potentialName: PotentialName.bonusRarePrimeMpPercentage),
    PotentialLine(statType: StatType.defensePercentage, potentialName: PotentialName.bonusRarePrimeDefensePercentage),
    PotentialLine(statType: StatType.str, potentialName: PotentialName.bonusRarePrimeStat),
    PotentialLine(statType: StatType.dex, potentialName: PotentialName.bonusRarePrimeStat),
    PotentialLine(statType: StatType.int, potentialName: PotentialName.bonusRarePrimeStat),
    PotentialLine(statType: StatType.luk, potentialName: PotentialName.bonusRarePrimeStat),
    PotentialLine(statType: StatType.attack, potentialName: PotentialName.bonusRarePrimeAtt),
    PotentialLine(statType: StatType.mattack, potentialName: PotentialName.bonusRarePrimeAtt),
    PotentialLine(statType: StatType.hp, potentialName: PotentialName.bonusRarePrimeHp),
    PotentialLine(statType: StatType.mp, potentialName: PotentialName.bonusRarePrimeMp),
    PotentialLine(statType: StatType.defense, potentialName: PotentialName.bonusRarePrimeDefense),
    PotentialLine(statType: StatType.speed, potentialName: PotentialName.bonusRarePrimeSpeed),
    PotentialLine(statType: StatType.jump, potentialName: PotentialName.bonusRarePrimeJump),
  ],
  PotentialTier.unique: [
    // Prime
    PotentialLine(statType: StatType.strPercentage, isPrime: true, potentialName: PotentialName.bonusUniquePrimeStatPercentage),
    PotentialLine(statType: StatType.dexPercentage, isPrime: true, potentialName: PotentialName.bonusUniquePrimeStatPercentage),
    PotentialLine(statType: StatType.intPercentage, isPrime: true, potentialName: PotentialName.bonusUniquePrimeStatPercentage),
    PotentialLine(statType: StatType.lukPercentage, isPrime: true, potentialName: PotentialName.bonusUniquePrimeStatPercentage),
    PotentialLine(statType: StatType.allStatsPercentage, isPrime: true, potentialName: PotentialName.bonusUniquePrimeAllStatPercentage),
    PotentialLine(statType: StatType.hpPercentage, isPrime: true, potentialName: PotentialName.bonusUniquePrimeHpPercentage),
    PotentialLine(statType: StatType.mpPercentage, isPrime: true, potentialName: PotentialName.bonusUniquePrimeMpPercentage),
    PotentialLine(statType: StatType.str, isPrime: true, potentialName: PotentialName.bonusUniquePrimeStatPerLevel),
    PotentialLine(statType: StatType.dex, isPrime: true, potentialName: PotentialName.bonusUniquePrimeStatPerLevel),
    PotentialLine(statType: StatType.int, isPrime: true, potentialName: PotentialName.bonusUniquePrimeStatPerLevel),
    PotentialLine(statType: StatType.luk, isPrime: true, potentialName: PotentialName.bonusUniquePrimeStatPerLevel),
    PotentialLine(statType: StatType.str, isPrime: true, potentialName: PotentialName.bonusUniquePrimeStat),
    PotentialLine(statType: StatType.dex, isPrime: true, potentialName: PotentialName.bonusUniquePrimeStat),
    PotentialLine(statType: StatType.int, isPrime: true, potentialName: PotentialName.bonusUniquePrimeStat),
    PotentialLine(statType: StatType.luk, isPrime: true, potentialName: PotentialName.bonusUniquePrimeStat),
    PotentialLine(statType: StatType.attack, isPrime: true, potentialName: PotentialName.bonusUniquePrimeAtt),
    PotentialLine(statType: StatType.mattack, isPrime: true, potentialName: PotentialName.bonusUniquePrimeAtt),
    PotentialLine(statType: StatType.hp, isPrime: true, potentialName: PotentialName.bonusUniquePrimeHp),
    PotentialLine(statType: StatType.mp, isPrime: true, potentialName: PotentialName.bonusUniquePrimeMp),
    // Non-Prime
    PotentialLine(statType: StatType.strPercentage, potentialName: PotentialName.bonusEpicPrimeStatPercentage),
    PotentialLine(statType: StatType.dexPercentage, potentialName: PotentialName.bonusEpicPrimeStatPercentage),
    PotentialLine(statType: StatType.intPercentage, potentialName: PotentialName.bonusEpicPrimeStatPercentage),
    PotentialLine(statType: StatType.lukPercentage, potentialName: PotentialName.bonusEpicPrimeStatPercentage),
    PotentialLine(statType: StatType.allStatsPercentage, potentialName: PotentialName.bonusEpicPrimeAllStatPercentage),
    PotentialLine(statType: StatType.hpPercentage, potentialName: PotentialName.bonusEpicPrimeHpPercentage),
    PotentialLine(statType: StatType.mpPercentage, potentialName: PotentialName.bonusEpicPrimeMpPercentage),
    PotentialLine(statType: StatType.defensePercentage, potentialName: PotentialName.bonusEpicPrimeDefensePercentage),
    PotentialLine(statType: StatType.str, potentialName: PotentialName.bonusEpicPrimeStat),
    PotentialLine(statType: StatType.dex, potentialName: PotentialName.bonusEpicPrimeStat),
    PotentialLine(statType: StatType.int, potentialName: PotentialName.bonusEpicPrimeStat),
    PotentialLine(statType: StatType.luk, potentialName: PotentialName.bonusEpicPrimeStat),
    PotentialLine(statType: StatType.attack, potentialName: PotentialName.bonusEpicPrimeAtt),
    PotentialLine(statType: StatType.mattack, potentialName: PotentialName.bonusEpicPrimeAtt),
    PotentialLine(statType: StatType.hp, potentialName: PotentialName.bonusEpicPrimeHp),
    PotentialLine(statType: StatType.mp, potentialName: PotentialName.bonusEpicPrimeMp),
    PotentialLine(statType: StatType.defense, potentialName: PotentialName.bonusEpicPrimeDefense),
    PotentialLine(statType: StatType.speed, potentialName: PotentialName.bonusEpicPrimeSpeed),
    PotentialLine(statType: StatType.jump, potentialName: PotentialName.bonusEpicPrimeJump),
  ],
  PotentialTier.legendary: [
    // Prime
    PotentialLine(statType: StatType.strPercentage, isPrime: true, potentialName: PotentialName.bonusLegendaryPrimeStatPercentage),
    PotentialLine(statType: StatType.dexPercentage, isPrime: true, potentialName: PotentialName.bonusLegendaryPrimeStatPercentage),
    PotentialLine(statType: StatType.intPercentage, isPrime: true, potentialName: PotentialName.bonusLegendaryPrimeStatPercentage),
    PotentialLine(statType: StatType.lukPercentage, isPrime: true, potentialName: PotentialName.bonusLegendaryPrimeStatPercentage),
    PotentialLine(statType: StatType.allStatsPercentage, isPrime: true, potentialName: PotentialName.bonusLegendaryPrimeAllStatPercentage),
    PotentialLine(statType: StatType.hpPercentage, isPrime: true, potentialName: PotentialName.bonusLegendaryPrimeHpPercentage),
    PotentialLine(statType: StatType.mpPercentage, isPrime: true, potentialName: PotentialName.bonusLegendaryPrimeMpPercentage),
    PotentialLine(statType: StatType.str, isPrime: true, potentialName: PotentialName.bonusLegendaryPrimeStatPerLevel),
    PotentialLine(statType: StatType.dex, isPrime: true, potentialName: PotentialName.bonusLegendaryPrimeStatPerLevel),
    PotentialLine(statType: StatType.int, isPrime: true, potentialName: PotentialName.bonusLegendaryPrimeStatPerLevel),
    PotentialLine(statType: StatType.luk, isPrime: true, potentialName: PotentialName.bonusLegendaryPrimeStatPerLevel),
    PotentialLine(statType: StatType.str, isPrime: true, potentialName: PotentialName.bonusLegendaryPrimeStat),
    PotentialLine(statType: StatType.dex, isPrime: true, potentialName: PotentialName.bonusLegendaryPrimeStat),
    PotentialLine(statType: StatType.int, isPrime: true, potentialName: PotentialName.bonusLegendaryPrimeStat),
    PotentialLine(statType: StatType.luk, isPrime: true, potentialName: PotentialName.bonusLegendaryPrimeStat),
    PotentialLine(statType: StatType.attack, isPrime: true, potentialName: PotentialName.bonusLegendaryPrimeAtt),
    PotentialLine(statType: StatType.mattack, isPrime: true, potentialName: PotentialName.bonusLegendaryPrimeAtt),
    PotentialLine(statType: StatType.hp, isPrime: true, potentialName: PotentialName.bonusLegendaryPrimeHp),
    PotentialLine(statType: StatType.mp, isPrime: true, potentialName: PotentialName.bonusLegendaryPrimeMp),
    // Non-Prime
    PotentialLine(statType: StatType.strPercentage, potentialName: PotentialName.bonusUniquePrimeStatPercentage),
    PotentialLine(statType: StatType.dexPercentage, potentialName: PotentialName.bonusUniquePrimeStatPercentage),
    PotentialLine(statType: StatType.intPercentage, potentialName: PotentialName.bonusUniquePrimeStatPercentage),
    PotentialLine(statType: StatType.lukPercentage, potentialName: PotentialName.bonusUniquePrimeStatPercentage),
    PotentialLine(statType: StatType.allStatsPercentage, potentialName: PotentialName.bonusUniquePrimeAllStatPercentage),
    PotentialLine(statType: StatType.hpPercentage, potentialName: PotentialName.bonusUniquePrimeHpPercentage),
    PotentialLine(statType: StatType.mpPercentage, potentialName: PotentialName.bonusUniquePrimeMpPercentage),
    PotentialLine(statType: StatType.str, potentialName: PotentialName.bonusUniquePrimeStatPerLevel),
    PotentialLine(statType: StatType.dex, potentialName: PotentialName.bonusUniquePrimeStatPerLevel),
    PotentialLine(statType: StatType.int, potentialName: PotentialName.bonusUniquePrimeStatPerLevel),
    PotentialLine(statType: StatType.luk, potentialName: PotentialName.bonusUniquePrimeStatPerLevel),
    PotentialLine(statType: StatType.str, potentialName: PotentialName.bonusUniquePrimeStat),
    PotentialLine(statType: StatType.dex, potentialName: PotentialName.bonusUniquePrimeStat),
    PotentialLine(statType: StatType.int, potentialName: PotentialName.bonusUniquePrimeStat),
    PotentialLine(statType: StatType.luk, potentialName: PotentialName.bonusUniquePrimeStat),
    PotentialLine(statType: StatType.attack, potentialName: PotentialName.bonusUniquePrimeAtt),
    PotentialLine(statType: StatType.mattack, potentialName: PotentialName.bonusUniquePrimeAtt),
    PotentialLine(statType: StatType.hp, potentialName: PotentialName.bonusUniquePrimeHp),
    PotentialLine(statType: StatType.mp, potentialName: PotentialName.bonusUniquePrimeMp),
  ],
};

// Hat
const Map<PotentialTier, List<PotentialLine>> bonusHatPotentials = {
  PotentialTier.unique: [
    // Prime
    PotentialLine(statType: StatType.hpRecovery, isPrime: true, potentialName: PotentialName.bonusUniquePrimeHpRecovery),
  ],
  PotentialTier.legendary: [
    // Prime
    PotentialLine(statType: StatType.critDamage, isPrime: true, potentialName: PotentialName.bonusLegendaryPrimeCriticalDamageStatic),
    PotentialLine(statType: StatType.skillCooldown, isPrime: true, potentialName: PotentialName.bonusLegendaryPrimeSkillCooldown1),
    PotentialLine(statType: StatType.mesosObtained, isPrime: true, potentialName: PotentialName.bonusLegendaryPrimeMesosObtained),
    PotentialLine(statType: StatType.itemDropRate, isPrime: true, potentialName: PotentialName.bonusLegendaryPrimeItemDropRate),
    PotentialLine(statType: StatType.hpRecovery, isPrime: true, potentialName: PotentialName.legendaryPrimeHpRecovery),
    // Non-Prime
    PotentialLine(statType: StatType.hpRecovery, potentialName: PotentialName.bonusUniquePrimeHpRecovery),
  ],
};

//Top, Overall, Bottom, Shoes, Cape, Belt, Shoulder
const Map<PotentialTier, List<PotentialLine>> bonusTopOverallBottomShoesCapeBeltShoulderPotentials = {
  PotentialTier.unique: [
    // Prime
    PotentialLine(statType: StatType.hpRecovery, isPrime: true, potentialName: PotentialName.bonusUniquePrimeHpRecovery),
  ],
  PotentialTier.legendary: [
    // Prime
    PotentialLine(statType: StatType.critDamage, isPrime: true, potentialName: PotentialName.bonusLegendaryPrimeCriticalDamageStatic),
    PotentialLine(statType: StatType.mesosObtained, isPrime: true, potentialName: PotentialName.bonusLegendaryPrimeMesosObtained),
    PotentialLine(statType: StatType.itemDropRate, isPrime: true, potentialName: PotentialName.bonusLegendaryPrimeItemDropRate),
    PotentialLine(statType: StatType.hpRecovery, isPrime: true, potentialName: PotentialName.legendaryPrimeHpRecovery),
    // Non-Prime
    PotentialLine(statType: StatType.hpRecovery, potentialName: PotentialName.bonusUniquePrimeHpRecovery),
  ],
};

//Gloves
const Map<PotentialTier, List<PotentialLine>> bonusGlovesPotentials = {
  PotentialTier.unique: [
    // Prime
    PotentialLine(statType: StatType.hpRecovery, isPrime: true, potentialName: PotentialName.bonusUniquePrimeHpRecovery),
  ],
  PotentialTier.legendary: [
    // Prime
    PotentialLine(statType: StatType.critDamage, isPrime: true, potentialName: PotentialName.bonusLegendaryPrimeCriticalDamage),
    PotentialLine(statType: StatType.critDamage, isPrime: true, potentialName: PotentialName.bonusLegendaryPrimeCriticalDamageStatic),
    PotentialLine(statType: StatType.mesosObtained, isPrime: true, potentialName: PotentialName.bonusLegendaryPrimeMesosObtained),
    PotentialLine(statType: StatType.itemDropRate, isPrime: true, potentialName: PotentialName.bonusLegendaryPrimeItemDropRate),
    PotentialLine(statType: StatType.hpRecovery, isPrime: true, potentialName: PotentialName.legendaryPrimeHpRecovery),
    // Non-Prime
    PotentialLine(statType: StatType.hpRecovery, potentialName: PotentialName.bonusUniquePrimeHpRecovery),
  ],
};

//Face, Eye, Ring, Pendant, Earring
const Map<PotentialTier, List<PotentialLine>> bonusFaceEyeRingPendantEarringPotentials = {
  PotentialTier.unique: [
    // Prime
    PotentialLine(statType: StatType.hpRecovery, isPrime: true, potentialName: PotentialName.bonusUniquePrimeHpRecovery),
  ],
  PotentialTier.legendary: [
    // Prime
    PotentialLine(statType: StatType.critDamage, isPrime: true, potentialName: PotentialName.bonusLegendaryPrimeCriticalDamageStatic),
    PotentialLine(statType: StatType.mesosObtained, isPrime: true, potentialName: PotentialName.bonusLegendaryPrimeMesosObtained),
    PotentialLine(statType: StatType.itemDropRate, isPrime: true, potentialName: PotentialName.bonusLegendaryPrimeItemDropRate),
    PotentialLine(statType: StatType.hpRecovery, isPrime: true, potentialName: PotentialName.legendaryPrimeHpRecovery),
    // Non-Prime
    PotentialLine(statType: StatType.hpRecovery, potentialName: PotentialName.bonusUniquePrimeHpRecovery),
  ],
};

//Weapon
const Map<PotentialTier, List<PotentialLine>> bonusWeaponPotentials = {
  PotentialTier.rare: [
    // Prime
    PotentialLine(statType: StatType.attackPercentage, isPrime: true, potentialName: PotentialName.bonusRarePrimeAttackPercentage),
    PotentialLine(statType: StatType.mattackPercentage, isPrime: true, potentialName: PotentialName.bonusRarePrimeAttackPercentage),
    PotentialLine(statType: StatType.critRate, isPrime: true, potentialName: PotentialName.bonusRarePrimeCriticalRate),
    PotentialLine(statType: StatType.damage, isPrime: true, potentialName: PotentialName.bonusRarePrimeDamage),
  ],
  PotentialTier.epic: [
    // Prime
    PotentialLine(statType: StatType.attackPercentage, isPrime: true, potentialName: PotentialName.bonusEpicPrimeAttackPercentage),
    PotentialLine(statType: StatType.mattackPercentage, isPrime: true, potentialName: PotentialName.bonusEpicPrimeAttackPercentage),
    PotentialLine(statType: StatType.critRate, isPrime: true, potentialName: PotentialName.bonusEpicPrimeCriticalRate),
    PotentialLine(statType: StatType.damage, isPrime: true, potentialName: PotentialName.bonusEpicPrimeDamage),
    PotentialLine(statType: StatType.ignoreDefense, isPrime: true, potentialName: PotentialName.bonusEpicPrimeIgnoreDefense),
    // Non-Prime
    PotentialLine(statType: StatType.attackPercentage, potentialName: PotentialName.bonusRarePrimeAttackPercentage),
    PotentialLine(statType: StatType.mattackPercentage, potentialName: PotentialName.bonusRarePrimeAttackPercentage),
    PotentialLine(statType: StatType.critRate, potentialName: PotentialName.bonusRarePrimeCriticalRate),
    PotentialLine(statType: StatType.damage, potentialName: PotentialName.bonusRarePrimeDamage),
  ],
  PotentialTier.unique: [
    // Prime
    PotentialLine(statType: StatType.attackPercentage, isPrime: true, potentialName: PotentialName.bonusUniquePrimeAttackPercentage),
    PotentialLine(statType: StatType.mattackPercentage, isPrime: true, potentialName: PotentialName.bonusUniquePrimeAttackPercentage),
    PotentialLine(statType: StatType.critRate, isPrime: true, potentialName: PotentialName.bonusUniquePrimeCriticalRate),
    PotentialLine(statType: StatType.damage, isPrime: true, potentialName: PotentialName.bonusUniquePrimeDamage),
    PotentialLine(statType: StatType.bossDamage, isPrime: true, potentialName: PotentialName.bonusUniquePrimeBossDamage),
    PotentialLine(statType: StatType.ignoreDefense, isPrime: true, potentialName: PotentialName.bonusUniquePrimeIgnoreDefense),
    // None-Prime
    PotentialLine(statType: StatType.attackPercentage, potentialName: PotentialName.bonusEpicPrimeAttackPercentage),
    PotentialLine(statType: StatType.mattackPercentage, potentialName: PotentialName.bonusEpicPrimeAttackPercentage),
    PotentialLine(statType: StatType.critRate, potentialName: PotentialName.bonusEpicPrimeCriticalRate),
    PotentialLine(statType: StatType.damage, potentialName: PotentialName.bonusEpicPrimeDamage),
    PotentialLine(statType: StatType.ignoreDefense, potentialName: PotentialName.bonusEpicPrimeIgnoreDefense),
  ],
  PotentialTier.legendary: [
    // Prime
    PotentialLine(statType: StatType.attackPercentage, isPrime: true, potentialName: PotentialName.bonusLegendaryPrimeAttackPercentage),
    PotentialLine(statType: StatType.mattackPercentage, isPrime: true, potentialName: PotentialName.bonusLegendaryPrimeAttackPercentage),
    PotentialLine(statType: StatType.critRate, isPrime: true, potentialName: PotentialName.bonusLegendaryPrimeCriticalRate),
    PotentialLine(statType: StatType.damage, isPrime: true, potentialName: PotentialName.bonusLegendaryPrimeDamage),
    PotentialLine(statType: StatType.bossDamage, isPrime: true, potentialName: PotentialName.bonusLegendaryPrimeBossDamage),
    PotentialLine(statType: StatType.ignoreDefense, isPrime: true, potentialName: PotentialName.bonusLegendaryPrimeIgnoreDefense),
    // Non-Prime
    PotentialLine(statType: StatType.attackPercentage, potentialName: PotentialName.bonusUniquePrimeAttackPercentage),
    PotentialLine(statType: StatType.mattackPercentage, potentialName: PotentialName.bonusUniquePrimeAttackPercentage),
    PotentialLine(statType: StatType.critRate, potentialName: PotentialName.bonusUniquePrimeCriticalRate),
    PotentialLine(statType: StatType.damage, potentialName: PotentialName.bonusUniquePrimeDamage),
    PotentialLine(statType: StatType.bossDamage, potentialName: PotentialName.bonusUniquePrimeBossDamage),
    PotentialLine(statType: StatType.ignoreDefense, potentialName: PotentialName.bonusUniquePrimeIgnoreDefense),
  ],
};

//Secondary
const Map<PotentialTier, List<PotentialLine>> bonusSecondaryPotentials = {
  PotentialTier.rare: [
    // Prime
    PotentialLine(statType: StatType.attackPercentage, isPrime: true, potentialName: PotentialName.bonusRarePrimeAttackPercentage),
    PotentialLine(statType: StatType.mattackPercentage, isPrime: true, potentialName: PotentialName.bonusRarePrimeAttackPercentage),
    PotentialLine(statType: StatType.critRate, isPrime: true, potentialName: PotentialName.bonusRarePrimeCriticalRate),
    PotentialLine(statType: StatType.damage, isPrime: true, potentialName: PotentialName.bonusRarePrimeDamage),
  ],
  PotentialTier.epic: [
    // Prime
    PotentialLine(statType: StatType.attackPercentage, isPrime: true, potentialName: PotentialName.bonusEpicPrimeAttackPercentage),
    PotentialLine(statType: StatType.mattackPercentage, isPrime: true, potentialName: PotentialName.bonusEpicPrimeAttackPercentage),
    PotentialLine(statType: StatType.critRate, isPrime: true, potentialName: PotentialName.bonusEpicPrimeCriticalRate),
    PotentialLine(statType: StatType.damage, isPrime: true, potentialName: PotentialName.bonusEpicPrimeDamage),
    PotentialLine(statType: StatType.ignoreDefense, isPrime: true, potentialName: PotentialName.bonusEpicPrimeIgnoreDefense),
    // Non-Prime
    PotentialLine(statType: StatType.attackPercentage, potentialName: PotentialName.bonusRarePrimeAttackPercentage),
    PotentialLine(statType: StatType.mattackPercentage, potentialName: PotentialName.bonusRarePrimeAttackPercentage),
    PotentialLine(statType: StatType.critRate, potentialName: PotentialName.bonusRarePrimeCriticalRate),
    PotentialLine(statType: StatType.damage, potentialName: PotentialName.bonusRarePrimeDamage),
  ],
  PotentialTier.unique: [
    // Prime
    PotentialLine(statType: StatType.attackPercentage, isPrime: true, potentialName: PotentialName.bonusUniquePrimeAttackPercentage),
    PotentialLine(statType: StatType.mattackPercentage, isPrime: true, potentialName: PotentialName.bonusUniquePrimeAttackPercentage),
    PotentialLine(statType: StatType.critRate, isPrime: true, potentialName: PotentialName.bonusUniquePrimeCriticalRate),
    PotentialLine(statType: StatType.damage, isPrime: true, potentialName: PotentialName.bonusUniquePrimeDamage),
    PotentialLine(statType: StatType.bossDamage, isPrime: true, potentialName: PotentialName.bonusUniquePrimeBossDamage),
    PotentialLine(statType: StatType.ignoreDefense, isPrime: true, potentialName: PotentialName.bonusUniquePrimeIgnoreDefense),
    // None-Prime
    PotentialLine(statType: StatType.attackPercentage, potentialName: PotentialName.bonusEpicPrimeAttackPercentage),
    PotentialLine(statType: StatType.mattackPercentage, potentialName: PotentialName.bonusEpicPrimeAttackPercentage),
    PotentialLine(statType: StatType.critRate, potentialName: PotentialName.bonusEpicPrimeCriticalRate),
    PotentialLine(statType: StatType.damage, potentialName: PotentialName.bonusEpicPrimeDamage),
    PotentialLine(statType: StatType.ignoreDefense, potentialName: PotentialName.bonusEpicPrimeIgnoreDefense),
  ],
  PotentialTier.legendary: [
    // Prime
    PotentialLine(statType: StatType.attackPercentage, isPrime: true, potentialName: PotentialName.bonusLegendaryPrimeAttackPercentage),
    PotentialLine(statType: StatType.mattackPercentage, isPrime: true, potentialName: PotentialName.bonusLegendaryPrimeAttackPercentage),
    PotentialLine(statType: StatType.critRate, isPrime: true, potentialName: PotentialName.bonusLegendaryPrimeCriticalRate),
    PotentialLine(statType: StatType.damage, isPrime: true, potentialName: PotentialName.bonusLegendaryPrimeDamage),
    PotentialLine(statType: StatType.bossDamage, isPrime: true, potentialName:PotentialName. bonusLegendaryPrimeBossDamage),
    PotentialLine(statType: StatType.ignoreDefense, isPrime: true, potentialName: PotentialName.bonusLegendaryPrimeIgnoreDefense),
    PotentialLine(statType: StatType.critDamage, isPrime: true, potentialName: PotentialName.bonusLegendaryPrimeCriticalDamageStatic),
    // Non-Prime
    PotentialLine(statType: StatType.attackPercentage, potentialName: PotentialName.bonusUniquePrimeAttackPercentage),
    PotentialLine(statType: StatType.mattackPercentage, potentialName: PotentialName.bonusUniquePrimeAttackPercentage),
    PotentialLine(statType: StatType.critRate, potentialName: PotentialName.bonusUniquePrimeCriticalRate),
    PotentialLine(statType: StatType.damage, potentialName: PotentialName.bonusUniquePrimeDamage),
    PotentialLine(statType: StatType.bossDamage, potentialName: PotentialName.bonusUniquePrimeBossDamage),
    PotentialLine(statType: StatType.ignoreDefense, potentialName: PotentialName.bonusUniquePrimeIgnoreDefense),
  ],
};

//Emblem
const Map<PotentialTier, List<PotentialLine>> bonusEmblemPotentials = {
  PotentialTier.rare: [
    // Prime
    PotentialLine(statType: StatType.attackPercentage, isPrime: true, potentialName: PotentialName.bonusRarePrimeAttackPercentage),
    PotentialLine(statType: StatType.mattackPercentage, isPrime: true, potentialName: PotentialName.bonusRarePrimeAttackPercentage),
    PotentialLine(statType: StatType.critRate, isPrime: true, potentialName: PotentialName.bonusRarePrimeCriticalRate),
    PotentialLine(statType: StatType.damage, isPrime: true, potentialName: PotentialName.bonusRarePrimeDamage),
  ],
  PotentialTier.epic: [
    // Prime
    PotentialLine(statType: StatType.attackPercentage, isPrime: true, potentialName: PotentialName.bonusEpicPrimeAttackPercentage),
    PotentialLine(statType: StatType.mattackPercentage, isPrime: true, potentialName: PotentialName.bonusEpicPrimeAttackPercentage),
    PotentialLine(statType: StatType.critRate, isPrime: true, potentialName: PotentialName.bonusEpicPrimeCriticalRate),
    PotentialLine(statType: StatType.damage, isPrime: true, potentialName: PotentialName.bonusEpicPrimeDamage),
    PotentialLine(statType: StatType.ignoreDefense, isPrime: true, potentialName: PotentialName.bonusEpicPrimeIgnoreDefense),
    // Non-Prime
    PotentialLine(statType: StatType.attackPercentage, potentialName: PotentialName.bonusRarePrimeAttackPercentage),
    PotentialLine(statType: StatType.mattackPercentage, potentialName: PotentialName.bonusRarePrimeAttackPercentage),
    PotentialLine(statType: StatType.critRate, potentialName: PotentialName.bonusRarePrimeCriticalRate),
    PotentialLine(statType: StatType.damage, potentialName: PotentialName.bonusRarePrimeDamage),
  ],
  PotentialTier.unique: [
    // Prime
    PotentialLine(statType: StatType.attackPercentage, isPrime: true, potentialName: PotentialName.bonusUniquePrimeAttackPercentage),
    PotentialLine(statType: StatType.mattackPercentage, isPrime: true, potentialName: PotentialName.bonusUniquePrimeAttackPercentage),
    PotentialLine(statType: StatType.critRate, isPrime: true, potentialName: PotentialName.bonusUniquePrimeCriticalRate),
    PotentialLine(statType: StatType.damage, isPrime: true, potentialName: PotentialName.bonusUniquePrimeDamage),
    PotentialLine(statType: StatType.ignoreDefense, isPrime: true, potentialName: PotentialName.bonusUniquePrimeIgnoreDefense),
    // None-Prime
    PotentialLine(statType: StatType.attackPercentage, potentialName: PotentialName.bonusEpicPrimeAttackPercentage),
    PotentialLine(statType: StatType.mattackPercentage, potentialName: PotentialName.bonusEpicPrimeAttackPercentage),
    PotentialLine(statType: StatType.critRate, potentialName: PotentialName.bonusEpicPrimeCriticalRate),
    PotentialLine(statType: StatType.damage, potentialName: PotentialName.bonusEpicPrimeDamage),
    PotentialLine(statType: StatType.ignoreDefense, potentialName: PotentialName.bonusEpicPrimeIgnoreDefense),
  ],
  PotentialTier.legendary: [
    // Prime
    PotentialLine(statType: StatType.attackPercentage, isPrime: true, potentialName: PotentialName.bonusLegendaryPrimeAttackPercentage),
    PotentialLine(statType: StatType.mattackPercentage, isPrime: true, potentialName: PotentialName.bonusLegendaryPrimeAttackPercentage),
    PotentialLine(statType: StatType.critRate, isPrime: true, potentialName: PotentialName.bonusLegendaryPrimeCriticalRate),
    PotentialLine(statType: StatType.damage, isPrime: true, potentialName: PotentialName.bonusLegendaryPrimeDamage),
    PotentialLine(statType: StatType.ignoreDefense, isPrime: true, potentialName: PotentialName.bonusLegendaryPrimeIgnoreDefense),
    // Non-Prime
    PotentialLine(statType: StatType.attackPercentage, potentialName: PotentialName.bonusUniquePrimeAttackPercentage),
    PotentialLine(statType: StatType.mattackPercentage, potentialName: PotentialName.bonusUniquePrimeAttackPercentage),
    PotentialLine(statType: StatType.critRate, potentialName: PotentialName.bonusUniquePrimeCriticalRate),
    PotentialLine(statType: StatType.damage, potentialName: PotentialName.bonusUniquePrimeDamage),
    PotentialLine(statType: StatType.ignoreDefense, potentialName: PotentialName.bonusUniquePrimeIgnoreDefense),
  ],
};

//Heart, Badge
const Map<PotentialTier, List<PotentialLine>> bonusHeartBadgePotentials = {
  PotentialTier.unique: [
    // Prime
    PotentialLine(statType: StatType.hpRecovery, isPrime: true, potentialName: PotentialName.bonusUniquePrimeHpRecovery),
  ],
  PotentialTier.legendary: [
    // Prime
    PotentialLine(statType: StatType.critDamage, isPrime: true, potentialName: PotentialName.bonusLegendaryPrimeCriticalDamageStatic),
    PotentialLine(statType: StatType.mesosObtained, isPrime: true, potentialName: PotentialName.bonusLegendaryPrimeMesosObtained),
    PotentialLine(statType: StatType.itemDropRate, isPrime: true, potentialName: PotentialName.bonusLegendaryPrimeItemDropRate),
    PotentialLine(statType: StatType.hpRecovery, isPrime: true, potentialName: PotentialName.legendaryPrimeHpRecovery),
    // Non-Prime
    PotentialLine(statType: StatType.hpRecovery, potentialName: PotentialName.bonusUniquePrimeHpRecovery),
  ],
};