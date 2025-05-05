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

const Map<int, int> ARTIFACT_ABILITY_POINTS_BY_LEVEL = {
  0: 0,
  1: 1,
  2: 2,
  3: 3,
  4: 4,
  5: 6,
  6: 7,
  7: 8,
  8: 9,
  9: 10,
  10: 12,
  11: 13,
  12: 14,
  13: 15,
  14: 16,
  15: 18,
  16: 19,
  17: 20,
  18: 21,
  19: 22,
  20: 24,
  21: 25,
  22: 26,
  23: 27,
  24: 28,
  25: 30,
  26: 31,
  27: 32,
  28: 33,
  29: 34,
  30: 36,
  31: 37,
  32: 38,
  33: 39,
  34: 40,
  35: 42,
  36: 43,
  37: 44,
  38: 45,
  39: 46,
  40: 48,
  41: 49,
  42: 50,
  43: 51,
  44: 52,
  45: 54,
  46: 55,
  47: 56,
  48: 57,
  49: 58,
  50: 60,
  51: 61,
  52: 62,
  53: 63,
  54: 64,
  55: 66,
  56: 67,
  57: 68,
  58: 69,
  59: 70,
  60: 72,
};

const Map<int, int> ARTIFACT_CRYSTAL_LEVEL_COST = {
  1: 0,
  2: 1,
  3: 2,
  4: 2,
  5: 3
};
