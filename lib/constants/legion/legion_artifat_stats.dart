// ignore_for_file: constant_identifier_names

import 'package:maplestory_builder/constants/constants.dart';

const int MAX_ARTIFACT_STAT_LEVEL = 10;

const int MAX_ARTIFACT_CRYSTAL_LEVEL = 5;

const int MAX_LEGION_ARTIFACT_LEVEL = 60;

const Map<StatType, num> ARTIFACT_STAT_INCREMENTS = {
  StatType.allStats: 15,
  StatType.hpMp: 750,
  StatType.attackMattack: 3,
  StatType.damage: 0.015,
  StatType.bossDamage: 0.015,
  StatType.ignoreDefense: 0.02,
  StatType.buffDuration: 0.02,
  StatType.skipCooldownChance: 0.0075,
  StatType.mesosObtained: 0.012,
  StatType.itemDropRate: 0.012,
  StatType.critRate: 0.02,
  StatType.critDamage: 0.004,
  StatType.expAdditional: 0.012,
  StatType.summonDuration: 0.02,
  StatType.finalAttackSkillDamage: 0.03,
};