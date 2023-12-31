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

const List<EquipType> NO_POTENTIAL_CATEGORY = <EquipType>[
  EquipType.medal,
];

enum PotentialTier {
  rare(formattedName: "Rare", short: "R", color: RARE_COLOR),
  epic(formattedName: "Epic", short: "E", color: EPIC_COLOR),
  unique(formattedName: "Unique", short: "U", color: UNIQUE_COLOR),
  legendary(formattedName: "Legendary", short: "L", color: LEGENDARY_COLOR);

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
  rareNonPrimeStat(potentialType: PotentialType.range, statValue: RARE_NON_PRIME_STAT_ATT_VALUES),
  rareNonPrimeAtt(potentialType: PotentialType.range, statValue: RARE_NON_PRIME_STAT_ATT_VALUES),
  rareNonPrimeDefense(potentialType: PotentialType.range, statValue: RARE_NON_PRIME_DEFENSE_HP_MP_VALUES),
  rareNonPrimeHp(potentialType: PotentialType.range, statValue: RARE_NON_PRIME_DEFENSE_HP_MP_VALUES),
  rareNonPrimeMp(potentialType: PotentialType.range, statValue: RARE_NON_PRIME_DEFENSE_HP_MP_VALUES),
  // Rare Prime & Epic Non Prime
  rarePrimeStat(potentialType: PotentialType.range, statValue: RARE_PRIME_STAT_ATT_VALUES),
  rarePrimeAtt(potentialType: PotentialType.range, statValue: RARE_PRIME_STAT_ATT_VALUES),
  rarePrimeAllStat(potentialType: PotentialType.range, statValue: RARE_PRIME_ALL_STAT_VALUES),
  rarePrimeDefense(potentialType: PotentialType.range, statValue: RARE_PRIME_DEFENSE_HP_MP_VALUES),
  rarePrimeHp(potentialType: PotentialType.range, statValue: RARE_PRIME_DEFENSE_HP_MP_VALUES),
  rarePrimeMp(potentialType: PotentialType.range, statValue: RARE_PRIME_DEFENSE_HP_MP_VALUES),
  rarePrimeStatPercentage(potentialType: PotentialType.range, statValue: RARE_PRIME_STAT_DEFENSE_HP_MP_PERCENTAGE_VALUES),
  rarePrimeDefensePercentage(potentialType: PotentialType.range, statValue: RARE_PRIME_STAT_DEFENSE_HP_MP_PERCENTAGE_VALUES),
  rarePrimeHpPercentage(potentialType: PotentialType.range, statValue: RARE_PRIME_STAT_DEFENSE_HP_MP_PERCENTAGE_VALUES),
  rarePrimeMpPercentage(potentialType: PotentialType.range, statValue: RARE_PRIME_STAT_DEFENSE_HP_MP_PERCENTAGE_VALUES),
  rarePrimeCriticalRate(potentialType: PotentialType.static, statValue: RARE_PRIME_CRIT_RATE_VALUE),
  // Epic Prime & Unique Non Prime
  epicPrimeStatPercentage(potentialType: PotentialType.range, statValue: EPIC_PRIME_STAT_ATT_DAMAGE_DEFENSE_HP_MP_PERCENTAGE_VALUES),
  epicPrimeAttackPercentage(potentialType: PotentialType.range, statValue: EPIC_PRIME_STAT_ATT_DAMAGE_DEFENSE_HP_MP_PERCENTAGE_VALUES),
  epicPrimeDamage(potentialType: PotentialType.range, statValue: EPIC_PRIME_STAT_ATT_DAMAGE_DEFENSE_HP_MP_PERCENTAGE_VALUES),
  epicPrimeDefensePercentage(potentialType: PotentialType.range, statValue: EPIC_PRIME_STAT_ATT_DAMAGE_DEFENSE_HP_MP_PERCENTAGE_VALUES),
  epicPrimeHpPercentage(potentialType: PotentialType.range, statValue: EPIC_PRIME_STAT_ATT_DAMAGE_DEFENSE_HP_MP_PERCENTAGE_VALUES),
  epicPrimeMpPercentage(potentialType: PotentialType.range, statValue: EPIC_PRIME_STAT_ATT_DAMAGE_DEFENSE_HP_MP_PERCENTAGE_VALUES),
  epicPrimeAllStatPercentage(potentialType: PotentialType.range, statValue: EPIC_PRIME_ALL_STAT_PERCENTAGE_VALUES),
  epicPrimeCriticalRate(potentialType: PotentialType.static, statValue: EPIC_PRIME_CRIT_RATE_VALUE),
  epicPrimeIgnoreDefense(potentialType: PotentialType.static, statValue: EPIC_PRIME_IGNORE_DEFENSE_VALUE),
  // Unique Prime & Legendary Non Prime
  uniquePrimeStatPercentage(potentialType: PotentialType.range, statValue: UNIQUE_PRIME_STAT_ATT_DAMAGE_CRIT_RATE_PERCENTAGE_VALUES),
  uniquePrimeAttackPercentage(potentialType: PotentialType.range, statValue: UNIQUE_PRIME_STAT_ATT_DAMAGE_CRIT_RATE_PERCENTAGE_VALUES),
  uniquePrimeDamage(potentialType: PotentialType.range, statValue: UNIQUE_PRIME_STAT_ATT_DAMAGE_CRIT_RATE_PERCENTAGE_VALUES),
  uniquePrimeCriticalRate(potentialType: PotentialType.range, statValue: UNIQUE_PRIME_STAT_ATT_DAMAGE_CRIT_RATE_PERCENTAGE_VALUES),
  uniquePrimeDefensePercentage(potentialType: PotentialType.range, statValue: UNIQUE_PRIME_DEFENSE_HP_MP_PERCENTAGE_VALUES),
  uniquePrimeHpPercentage(potentialType: PotentialType.range, statValue: UNIQUE_PRIME_DEFENSE_HP_MP_PERCENTAGE_VALUES),
  uniquePrimeMpPercentage(potentialType: PotentialType.range, statValue: UNIQUE_PRIME_DEFENSE_HP_MP_PERCENTAGE_VALUES),
  uniquePrimeAllStatPercentage(potentialType: PotentialType.range, statValue: UNIQUE_PRIME_ALL_STAT_PERCENTAGE_VALUES),
  uniquePrimeHpRecovery(potentialType: PotentialType.range, statValue: UNIQUE_PRIME_HP_RECOVERY_VALUES),
  uniquePrimeStat(potentialType: PotentialType.range, statValue: UNIQUE_PRIME_STAT_ATT_VALUES),
  uniquePrimeAtt(potentialType: PotentialType.range, statValue: UNIQUE_PRIME_STAT_ATT_VALUES),
  uniquePrimeBossDamage(potentialType: PotentialType.static, statValue: UNIQUE_PRIME_BOSS_DAMAGE_VALUE),
  uniquePrimeIgnoreDefense(potentialType: PotentialType.static, statValue: UNIQUE_PRIME_IGNORE_DEFENSE_VALUE),
  // uniquePrimeDecentMysticDoor(potentialType: PotentialType.skill, statValue: ,)
  // uniquePrimeDecentHyperBody(potentialType: PotentialType.skill, statValue: ,)
  // unqiuePrimeDecentSharpEyes(potentialType: PotentialType.skill, statValue: ,)
  // uniquePrimeDecentHaste(potentialType: PotentialType.skill, statValue: ,)
  // Legendary Prime
  legendaryPrimeStat(potentialType: PotentialType.range, statValue: LEGENDARY_PRIME_STAT_ATT_VALUES),
  legendaryPrimeAtt(potentialType: PotentialType.range, statValue: LEGENDARY_PRIME_STAT_ATT_VALUES),
  legendaryPrimeStatPercentage(potentialType: PotentialType.range, statValue: LEGENDARY_PRIME_STAT_ATT_DAMAGE_CRIT_RATE_PERCENTAGE_VALUES),
  legendaryPrimeAttackPercentage(potentialType: PotentialType.range, statValue: LEGENDARY_PRIME_STAT_ATT_DAMAGE_CRIT_RATE_PERCENTAGE_VALUES),
  legendaryPrimeDamagePercentage(potentialType: PotentialType.range, statValue: LEGENDARY_PRIME_STAT_ATT_DAMAGE_CRIT_RATE_PERCENTAGE_VALUES),
  legendaryPrimeCriticalRatePercentage(potentialType: PotentialType.range, statValue: LEGENDARY_PRIME_STAT_ATT_DAMAGE_CRIT_RATE_PERCENTAGE_VALUES),
  legendaryPrimeHpPercentage(potentialType: PotentialType.range, statValue: LEGENDARY_PRIME_HP_MP_PERCENTAGE_VALUES),
  legendaryPrimeMpPercentage(potentialType: PotentialType.range, statValue: LEGENDARY_PRIME_HP_MP_PERCENTAGE_VALUES),
  legendaryPrimeAllStatPercentage(potentialType: PotentialType.range, statValue: LEGENDARY_PRIME_ALL_STAT_PERCENTAGE_VALUES),
  legendaryPrimeHpRecovery(potentialType: PotentialType.range, statValue: LEGENDARY_PRIME_HP_RECOVERY_VALUES),
  legendaryPrimeSkillCooldown1(potentialType: PotentialType.static, statValue: LEGENDARY_PRIME_SKILL_COOLDOWN_1_VALUE),
  legendaryPrimeSkillCooldown2(potentialType: PotentialType.static, statValue: LEGENDARY_PRIME_SKILL_COOLDOWN_2_VALUE),
  legendaryPrimeCriticalDamage(potentialType: PotentialType.range, statValue: LEGENDARY_PRIME_CRIT_DAMAGE_VALUES),
  legendaryPrimeMesosObtained(potentialType: PotentialType.range, statValue: LEGENDARY_PRIME_MESOS_OBTAINED_ITEM_DROP_RATE_VALUES),
  legendaryPrimeItemDropRate(potentialType: PotentialType.range, statValue: LEGENDARY_PRIME_MESOS_OBTAINED_ITEM_DROP_RATE_VALUES),
  legendaryPrimeBossDamage35(potentialType: PotentialType.static, statValue: LEGENDARY_PRIME_BOSS_DAMAGE_35_VALUE),
  legendaryPrimeBossDamage40(potentialType: PotentialType.static, statValue: LEGENDARY_PRIME_BOSS_DAMAGE_40_VALUE),
  legendaryPrimeIgnoreDefense35(potentialType: PotentialType.static, statValue: LEGENDARY_PRIME_IGNORE_DEFENSE_35_VALUE),
  legendaryPrimeIgnoreDefense40(potentialType: PotentialType.static, statValue: LEGENDARY_PRIME_IGNORE_DEFENSE_40_VALUE),
  // legendaryPrimeDecentAdvancedBlessing(potentialType: , statValue: ,)
  // legendaryPrimeDecentSpeedInfusion(potentialType: , statValue: ,)
  // legendaryPrimeDecentCombatOrders(potentialType: , statValue: ,)
  // ---------------------------------------------------------------------- //
  // Bonus Potentials
  // ---------------------------------------------------------------------- //
  // Rare Non Prime
  bonusRareNonPrimeStat(potentialType: PotentialType.range, statValue: BONUS_RARE_NON_PRIME_STAT_VALUES),
  bonusRareNonPrimeAtt(potentialType: PotentialType.range, statValue: BONUS_RARE_NON_PRIME_ATT_VALUES),
  bonusRareNonPrimeDefense(potentialType: PotentialType.range, statValue: BONUS_RARE_NON_PRIME_HP_MP_DEFENSE_VALUES),
  bonusRareNonPrimeHp(potentialType: PotentialType.range, statValue: BONUS_RARE_NON_PRIME_HP_MP_DEFENSE_VALUES),
  bonusRareNonPrimeMp(potentialType: PotentialType.range, statValue: BONUS_RARE_NON_PRIME_HP_MP_DEFENSE_VALUES),
  bonusRareNonPrimeSpeed(potentialType: PotentialType.range, statValue: BONUS_RARE_NON_PRIME_SPEED_JUMP_VALUES),
  bonusRareNonPrimeJump(potentialType: PotentialType.range, statValue: BONUS_RARE_NON_PRIME_SPEED_JUMP_VALUES),
  // Rare Prime & Epic Non Prime
  bonusRarePrimeStat(potentialType: PotentialType.range, statValue: BONUS_RARE_PRIME_STAT_VALUES),
  bonusRarePrimeAtt(potentialType: PotentialType.range, statValue: BONUS_RARE_PRIME_ATT_VALUES),
  bonusRarePrimeAllStat(potentialType: PotentialType.range, statValue: BONUS_RARE_PRIME_ALL_STAT_VALUES),
  bonusRarePrimeDefense(potentialType: PotentialType.range, statValue: BONUS_RARE_PRIME_DEFENSE_HP_MP_VALUES),
  bonusRarePrimeHp(potentialType: PotentialType.range, statValue: BONUS_RARE_PRIME_DEFENSE_HP_MP_VALUES),
  bonusRarePrimeMp(potentialType: PotentialType.range, statValue: BONUS_RARE_PRIME_DEFENSE_HP_MP_VALUES),
  bonusRarePrimeStatPercentage(potentialType: PotentialType.range, statValue: BONUS_RARE_PRIME_STAT_HP_MP_DEFENSE_ATT_DAMAGE_CRIT_RATE_PERCENTAGE_VALUES),
  bonusRarePrimeHpPercentage(potentialType: PotentialType.range, statValue: BONUS_RARE_PRIME_STAT_HP_MP_DEFENSE_ATT_DAMAGE_CRIT_RATE_PERCENTAGE_VALUES),
  bonusRarePrimeMpPercentage(potentialType: PotentialType.range, statValue: BONUS_RARE_PRIME_STAT_HP_MP_DEFENSE_ATT_DAMAGE_CRIT_RATE_PERCENTAGE_VALUES),
  bonusRarePrimeDefensePercentage(potentialType: PotentialType.range, statValue: BONUS_RARE_PRIME_STAT_HP_MP_DEFENSE_ATT_DAMAGE_CRIT_RATE_PERCENTAGE_VALUES),
  bonusRarePrimeAttackPercentage(potentialType: PotentialType.range, statValue: BONUS_RARE_PRIME_STAT_HP_MP_DEFENSE_ATT_DAMAGE_CRIT_RATE_PERCENTAGE_VALUES),
  bonusRarePrimeDamage(potentialType: PotentialType.range, statValue: BONUS_RARE_PRIME_STAT_HP_MP_DEFENSE_ATT_DAMAGE_CRIT_RATE_PERCENTAGE_VALUES),
  bonusRarePrimeCriticalRate(potentialType: PotentialType.range, statValue: BONUS_RARE_PRIME_STAT_HP_MP_DEFENSE_ATT_DAMAGE_CRIT_RATE_PERCENTAGE_VALUES),
  bonusRarePrimeSpeed(potentialType: PotentialType.range, statValue: BONUS_RARE_PRIME_SPEED_JUMP_VALUES),
  bonusRarePrimeJump(potentialType: PotentialType.range, statValue: BONUS_RARE_PRIME_SPEED_JUMP_VALUES),
  // Epic Prime & Unique Non Prime
  bonusEpicPrimeStat(potentialType: PotentialType.range, statValue: BONUS_EPIC_PRIME_STAT_VALUES),
  bonusEpicPrimeAtt(potentialType: PotentialType.range, statValue: BONUS_EPIC_PRIME_ATT_VALUES),
  bonusEpicPrimeHp(potentialType: PotentialType.range, statValue: BONUS_EPIC_PRIME_HP_MP_VALUES),
  bonusEpicPrimeMp(potentialType: PotentialType.range, statValue: BONUS_EPIC_PRIME_HP_MP_VALUES),
  bonusEpicPrimeDefense(potentialType: PotentialType.range, statValue: BONUS_EPIC_PRIME_DEFENSE_VALUES),
  bonusEpicPrimeSpeed(potentialType: PotentialType.range, statValue: BONUS_EPIC_PRIME_SPEED_JUMP_VALUES),
  bonusEpicPrimeJump(potentialType: PotentialType.range, statValue: BONUS_EPIC_PRIME_SPEED_JUMP_VALUES),
  bonusEpicPrimeStatPercentage(potentialType: PotentialType.range, statValue: BONUS_EPIC_PRIME_STAT_DEFENSE_ATT_DAMAGE_CRIT_RATE_PERCENTAGE_VALUES),
  bonusEpicPrimeDefensePercentage(potentialType: PotentialType.range, statValue: BONUS_EPIC_PRIME_STAT_DEFENSE_ATT_DAMAGE_CRIT_RATE_PERCENTAGE_VALUES),
  bonusEpicPrimeAttackPercentage(potentialType: PotentialType.range, statValue: BONUS_EPIC_PRIME_STAT_DEFENSE_ATT_DAMAGE_CRIT_RATE_PERCENTAGE_VALUES),
  bonusEpicPrimeDamage(potentialType: PotentialType.range, statValue: BONUS_EPIC_PRIME_STAT_DEFENSE_ATT_DAMAGE_CRIT_RATE_PERCENTAGE_VALUES),
  bonusEpicPrimeCriticalRate(potentialType: PotentialType.range, statValue: BONUS_EPIC_PRIME_STAT_DEFENSE_ATT_DAMAGE_CRIT_RATE_PERCENTAGE_VALUES),
  bonusEpicPrimeHpPercentage(potentialType: PotentialType.range, statValue: BONUS_EPIC_PRIME_HP_MP_PERCENTAGE_VALUES),
  bonusEpicPrimeMpPercentage(potentialType: PotentialType.range, statValue: BONUS_EPIC_PRIME_HP_MP_PERCENTAGE_VALUES),
  bonusEpicPrimeAllStatPercentage(potentialType: PotentialType.range, statValue: BONUS_EPIC_PRIME_ALL_STAT_PERCENTAGE_VALUES),
  bonusEpicPrimeIgnoreDefense(potentialType: PotentialType.static, statValue: BONUS_EPIC_PRIME_IGNORE_DEFENSE_VALUE),
  // Unique Prime & Legendary Non Prime
  bonusUniquePrimeStat(potentialType: PotentialType.range, statValue: BONUS_UNIQUE_PRIME_STAT_VALUES),
  bonusUniquePrimeStatPerLevel(potentialType: PotentialType.static, statValue: BONUS_UNIQUE_PRIME_STAT_PER_LEVEL_VALUE),
  bonusUniquePrimeAtt(potentialType: PotentialType.range, statValue: BONUS_UNIQUE_PRIME_ATT_VALUES),
  bonusUniquePrimeHp(potentialType: PotentialType.range, statValue: BONUS_UNIQUE_PRIME_HP_MP_VALUES),
  bonusUniquePrimeMp(potentialType: PotentialType.range, statValue: BONUS_UNIQUE_PRIME_HP_MP_VALUES),
  bonusUniquePrimeStatPercentage(potentialType: PotentialType.range, statValue: BONUS_UNIQUE_PRIME_STAT_ATT_DAMAGE_CRIT_RATE_PERCENTAGE_VALUES),
  bonusUniquePrimeAttackPercentage(potentialType: PotentialType.range, statValue: BONUS_UNIQUE_PRIME_STAT_ATT_DAMAGE_CRIT_RATE_PERCENTAGE_VALUES),
  bonusUniquePrimeDamage(potentialType: PotentialType.range, statValue: BONUS_UNIQUE_PRIME_STAT_ATT_DAMAGE_CRIT_RATE_PERCENTAGE_VALUES),
  bonusUniquePrimeCriticalRate(potentialType: PotentialType.range, statValue: BONUS_UNIQUE_PRIME_STAT_ATT_DAMAGE_CRIT_RATE_PERCENTAGE_VALUES),
  bonusUniquePrimeHpPercentage(potentialType: PotentialType.range, statValue: BONUS_UNIQUE_PRIME_HP_MP_PERCENTAGE_VALUES),
  bonusUniquePrimeMpPercentage(potentialType: PotentialType.range, statValue: BONUS_UNIQUE_PRIME_HP_MP_PERCENTAGE_VALUES),
  bonusUniquePrimeAllStatPercentage(potentialType: PotentialType.range, statValue: BONUS_UNIQUE_PRIME_ALL_STAT_PERCENTAGE_VALUES),
  bonusUniquePrimeHpRecovery(potentialType: PotentialType.range, statValue: BONUS_UNIQUE_PRIME_HP_RECOVERY_VALUES),
  bonusUniquePrimeBossDamage(potentialType: PotentialType.static, statValue: BONUS_UNIQUE_PRIME_BOSS_DAMAGE_VALUE),
  bonusUniquePrimeIgnoreDefense(potentialType: PotentialType.static, statValue: BONUS_UNIQUE_PRIME_IGNORE_DEFENSE_VALUE),
  // Legendary Prime
  bonusLegendaryPrimeStat(potentialType: PotentialType.range, statValue: BONUS_LEGENDARY_PRIME_STAT_VALUES),
  bonusLegendaryPrimeAtt(potentialType: PotentialType.range, statValue: BONUS_LEGENDARY_PRIME_ATT_VALUES),
  bonusLegendaryPrimeHp(potentialType: PotentialType.range, statValue: BONUS_LEGENDARY_PRIME_HP_MP_VALUES),
  bonusLegendaryPrimeMp(potentialType: PotentialType.range, statValue: BONUS_LEGENDARY_PRIME_HP_MP_VALUES),
  bonusLegendaryPrimeStatPercentage(potentialType: PotentialType.range, statValue: BONUS_LEGENDARY_PRIME_STAT_ATT_DAMAGE_CRIT_RATE_PERCENTAGE_VALUES),
  bonusLegendaryPrimeAttackPercentage(potentialType: PotentialType.range, statValue: BONUS_LEGENDARY_PRIME_STAT_ATT_DAMAGE_CRIT_RATE_PERCENTAGE_VALUES),
  bonusLegendaryPrimeDamage(potentialType: PotentialType.range, statValue: BONUS_LEGENDARY_PRIME_STAT_ATT_DAMAGE_CRIT_RATE_PERCENTAGE_VALUES),
  bonusLegendaryPrimeCriticalRate(potentialType: PotentialType.range, statValue: BONUS_LEGENDARY_PRIME_STAT_ATT_DAMAGE_CRIT_RATE_PERCENTAGE_VALUES),
  bonusLegendaryPrimeHpPercentage(potentialType: PotentialType.range, statValue: BONUS_LEGENARY_PRIME_HP_MP_PERCENTAGE_VALUES),
  bonusLegendaryPrimeMpPercentage(potentialType: PotentialType.range, statValue: BONUS_LEGENARY_PRIME_HP_MP_PERCENTAGE_VALUES),
  bonusLegendaryPrimeAllStatPercentage(potentialType: PotentialType.range, statValue: BONUS_LEGENDARY_PRIME_ALL_STAT_PERCENTAGE_VALUES),
  bonusLegendaryPrimeStatPerLevel(potentialType: PotentialType.static, statValue: BONUS_LEGENDARY_PRIME_STAT_PER_LEVEL_VALUE),
  bonusLegendaryPrimeHpRecovery(potentialType: PotentialType.range, statValue: BONUS_LEGENARY_PRIME_HP_RECOVERY_VALUES),
  bonusLegendaryPrimeMesosObtained(potentialType: PotentialType.range, statValue: BONUS_LEGENDARY_PRIME_MESOS_OBTAINED_ITEM_DROP_RATE_VALUES),
  bonusLegendaryPrimeItemDropRate(potentialType: PotentialType.range, statValue: BONUS_LEGENDARY_PRIME_MESOS_OBTAINED_ITEM_DROP_RATE_VALUES),
  bonusLegendaryPrimeSkillCooldown1(potentialType: PotentialType.static, statValue: BONUS_LEGENDARY_PRIME_SKILL_COOLDOWN_VALUE),
  bonusLegendaryPrimeCriticalDamageStatic(potentialType: PotentialType.static, statValue: BONUS_LEGENDARY_PRIME_CRIT_DAMAGE_VALUE),
  bonusLegendaryPrimeCriticalDamage(potentialType: PotentialType.range, statValue: BONUS_LEGENDARY_PRIME_CRIT_DAMAGE_VALUES),
  bonusLegendaryPrimeBossDamage(potentialType: PotentialType.static, statValue: BONUS_LEGENDARY_PRIME_BOSS_DAMAGE_VALUE),
  bonusLegendaryPrimeIgnoreDefense(potentialType: PotentialType.static, statValue: BONUS_LEGENARY_PRIME_IGNORE_DEFENSE_VALUE);

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
const List<int> RARE_NON_PRIME_STAT_ATT_VALUES = [
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
const List<int> RARE_NON_PRIME_DEFENSE_HP_MP_VALUES = [
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
const List<int> RARE_PRIME_STAT_ATT_VALUES = [
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
const List<int> RARE_PRIME_ALL_STAT_VALUES = [
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
const List<int> RARE_PRIME_DEFENSE_HP_MP_VALUES = [
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
const List<double> RARE_PRIME_STAT_DEFENSE_HP_MP_PERCENTAGE_VALUES = [
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
const double RARE_PRIME_CRIT_RATE_VALUE = 0.04; // 0+

const List<double> EPIC_PRIME_STAT_ATT_DAMAGE_DEFENSE_HP_MP_PERCENTAGE_VALUES = [
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
const List<double> EPIC_PRIME_ALL_STAT_PERCENTAGE_VALUES = [
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
const double EPIC_PRIME_CRIT_RATE_VALUE = 0.08; // 50+
const double EPIC_PRIME_IGNORE_DEFENSE_VALUE = 0.15; // 50+

const List<double> UNIQUE_PRIME_STAT_ATT_DAMAGE_CRIT_RATE_PERCENTAGE_VALUES = [
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
const List<double> UNIQUE_PRIME_DEFENSE_HP_MP_PERCENTAGE_VALUES = [
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
const List<double> UNIQUE_PRIME_ALL_STAT_PERCENTAGE_VALUES = [
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
const List<double> UNIQUE_PRIME_HP_RECOVERY_VALUES = [
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
const List<int> UNIQUE_PRIME_STAT_ATT_VALUES = [
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
const double UNIQUE_PRIME_BOSS_DAMAGE_VALUE = 0.3; // 100+
const double UNIQUE_PRIME_IGNORE_DEFENSE_VALUE = 0.3; // 100+

const List<int> LEGENDARY_PRIME_STAT_ATT_VALUES = UNIQUE_PRIME_STAT_ATT_VALUES;
const List<double> LEGENDARY_PRIME_STAT_ATT_DAMAGE_CRIT_RATE_PERCENTAGE_VALUES = [
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
const List<double> LEGENDARY_PRIME_HP_MP_PERCENTAGE_VALUES = [
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
const List<double> LEGENDARY_PRIME_ALL_STAT_PERCENTAGE_VALUES = [
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
const List<double> LEGENDARY_PRIME_HP_RECOVERY_VALUES = UNIQUE_PRIME_HP_RECOVERY_VALUES;
const int LEGENDARY_PRIME_SKILL_COOLDOWN_1_VALUE = 1; // Requires 70+ equipment
const int LEGENDARY_PRIME_SKILL_COOLDOWN_2_VALUE = 2; // Requires 120+ equipment
const List<double> LEGENDARY_PRIME_CRIT_DAMAGE_VALUES = [
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
const List<double> LEGENDARY_PRIME_MESOS_OBTAINED_ITEM_DROP_RATE_VALUES = [
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
const double LEGENDARY_PRIME_BOSS_DAMAGE_35_VALUE = 0.35; // 100+
const double LEGENDARY_PRIME_BOSS_DAMAGE_40_VALUE = 0.4; // 100+
const double LEGENDARY_PRIME_IGNORE_DEFENSE_35_VALUE = 0.35; // 100+
const double LEGENDARY_PRIME_IGNORE_DEFENSE_40_VALUE = 0.4; // 100+

// Default that is shared between all equips
const Map<PotentialTier, List<PotentialLine>> DEFAULT_POTENTIALS = {
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
const Map<PotentialTier, List<PotentialLine>> HAT_POTENTIALS = {
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
const Map<PotentialTier, List<PotentialLine>> TOP_OVERALL_POTENTIALS = {
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
const Map<PotentialTier, List<PotentialLine>> BOTTOM_POTENTIALS = {
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
const Map<PotentialTier, List<PotentialLine>> GLOVES_POTENTIALS = {
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
const Map<PotentialTier, List<PotentialLine>> SHOES_POTENTIALS = {
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
const Map<PotentialTier, List<PotentialLine>> CAPE_BELT_SHOULDER_POTENTIALS = {
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
const Map<PotentialTier, List<PotentialLine>> FACE_EYE_RING_PENDANT_EARRINGS_POTENTIALS = {
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
const Map<PotentialTier, List<PotentialLine>> WEAPON_SECONDARY_POTENTIALS = {
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
const Map<PotentialTier, List<PotentialLine>> EMBLEM_POTENTIALS = {
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
const Map<PotentialTier, List<PotentialLine>> HEART_BADGE_POTENTIALS = {
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
const List<int> BONUS_RARE_NON_PRIME_STAT_VALUES = [
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
const List<int> BONUS_RARE_NON_PRIME_ATT_VALUES = [
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
const List<int> BONUS_RARE_NON_PRIME_HP_MP_DEFENSE_VALUES = [
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
const List<int> BONUS_RARE_NON_PRIME_SPEED_JUMP_VALUES = [
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
const List<int> BONUS_RARE_PRIME_STAT_VALUES = [
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
const List<int> BONUS_RARE_PRIME_ATT_VALUES = [
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
const List<int> BONUS_RARE_PRIME_ALL_STAT_VALUES = [
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
const List<int> BONUS_RARE_PRIME_DEFENSE_HP_MP_VALUES = [
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
const List<double> BONUS_RARE_PRIME_STAT_HP_MP_DEFENSE_ATT_DAMAGE_CRIT_RATE_PERCENTAGE_VALUES = [
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
const List<int> BONUS_RARE_PRIME_SPEED_JUMP_VALUES = [
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

const List<int> BONUS_EPIC_PRIME_STAT_VALUES = [
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
const List<int> BONUS_EPIC_PRIME_ATT_VALUES = [
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
const List<int> BONUS_EPIC_PRIME_HP_MP_VALUES = [
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
const List<int> BONUS_EPIC_PRIME_DEFENSE_VALUES = [
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
const List<int> BONUS_EPIC_PRIME_SPEED_JUMP_VALUES = [
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
const List<double> BONUS_EPIC_PRIME_STAT_DEFENSE_ATT_DAMAGE_CRIT_RATE_PERCENTAGE_VALUES = [
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
const List<double> BONUS_EPIC_PRIME_HP_MP_PERCENTAGE_VALUES = [
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
const List<double> BONUS_EPIC_PRIME_ALL_STAT_PERCENTAGE_VALUES = [
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
const double BONUS_EPIC_PRIME_IGNORE_DEFENSE_VALUE = 0.03;

const List<int> BONUS_UNIQUE_PRIME_STAT_VALUES = [
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
const int BONUS_UNIQUE_PRIME_STAT_PER_LEVEL_VALUE = 32;
const List<int> BONUS_UNIQUE_PRIME_ATT_VALUES = [
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
const List<int> BONUS_UNIQUE_PRIME_HP_MP_VALUES = [
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
const List<double> BONUS_UNIQUE_PRIME_STAT_ATT_DAMAGE_CRIT_RATE_PERCENTAGE_VALUES = [
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
const List<double> BONUS_UNIQUE_PRIME_HP_MP_PERCENTAGE_VALUES = [
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
const List<double> BONUS_UNIQUE_PRIME_ALL_STAT_PERCENTAGE_VALUES = [
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
const List<double> BONUS_UNIQUE_PRIME_HP_RECOVERY_VALUES = [
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
const double BONUS_UNIQUE_PRIME_BOSS_DAMAGE_VALUE = 0.12;
const double BONUS_UNIQUE_PRIME_IGNORE_DEFENSE_VALUE = 0.04;

const List<int> BONUS_LEGENDARY_PRIME_STAT_VALUES = [
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
const List<int> BONUS_LEGENDARY_PRIME_ATT_VALUES = [
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
const List<int> BONUS_LEGENDARY_PRIME_HP_MP_VALUES = [
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
const List<double> BONUS_LEGENDARY_PRIME_STAT_ATT_DAMAGE_CRIT_RATE_PERCENTAGE_VALUES = [
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
const List<double> BONUS_LEGENARY_PRIME_HP_MP_PERCENTAGE_VALUES = [
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
const List<double> BONUS_LEGENDARY_PRIME_ALL_STAT_PERCENTAGE_VALUES = [
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
const int BONUS_LEGENDARY_PRIME_STAT_PER_LEVEL_VALUE = 32;
const List<double> BONUS_LEGENARY_PRIME_HP_RECOVERY_VALUES = [
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
const List<double> BONUS_LEGENDARY_PRIME_MESOS_OBTAINED_ITEM_DROP_RATE_VALUES = [
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
const int BONUS_LEGENDARY_PRIME_SKILL_COOLDOWN_VALUE = 1;
const double BONUS_LEGENDARY_PRIME_CRIT_DAMAGE_VALUE = 0.01;
const List<double> BONUS_LEGENDARY_PRIME_CRIT_DAMAGE_VALUES = [
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
const double BONUS_LEGENDARY_PRIME_BOSS_DAMAGE_VALUE = 0.18;
const double BONUS_LEGENARY_PRIME_IGNORE_DEFENSE_VALUE = 0.05;

const Map<PotentialTier, List<PotentialLine>> BONUS_DEFAULT_POTENTIALS = {
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
const Map<PotentialTier, List<PotentialLine>> BONUS_HAT_POTENTIALS = {
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
const Map<PotentialTier, List<PotentialLine>> BONUS_TOP_OVERALL_BOTTOM_SHOES_CAPE_BELT_SHOULDER_POTENTIALS = {
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
const Map<PotentialTier, List<PotentialLine>> BONUS_GLOVES_POTENTIALS = {
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
const Map<PotentialTier, List<PotentialLine>> BONUS_FACE_EYE_RING_PENDANT_EARRINGS_POTENTIALS = {
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
const Map<PotentialTier, List<PotentialLine>> BONUS_WEAPON_POTENTIALS = {
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
const Map<PotentialTier, List<PotentialLine>> BONUS_SECONDARY_POTENTIALS = {
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
const Map<PotentialTier, List<PotentialLine>> BONUS_EMBLEM_POTENTIALS = {
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
const Map<PotentialTier, List<PotentialLine>> BONUS_HEART_BADGE_POTENTIALS = {
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