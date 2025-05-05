// ignore_for_file: constant_identifier_names

import 'package:maplestory_builder/constants/constants.dart';

const int MAX_HEXA_STAT_LEVEL = 20;

const int MAX_SINGLE_HEXA_STAT_LEVEL = 10;

const List<StatType> AVAILABLE_HEXA_STAT_STATS = [
  StatType.critDamage,
  StatType.bossDamage,
  StatType.ignoreDefense,
  StatType.damage,
  StatType.mainAttack,
  StatType.mainStat,
];

const Map<StatType, num> HEXA_STAT_SECONDARY_INCREMENTS = {
  StatType.mainAttack: 5,
  StatType.mainStat: 100,
  StatType.finalStrDexLuk: 48,
  StatType.finalHp: 2100,
  StatType.bossDamage: 0.01,
  StatType.ignoreDefense: 0.01,
  StatType.critDamage: 0.0035,
  StatType.damage: 0.0075
};

const Map<int, Map<StatType, num>> HEXA_STAT_PRIMARY = {
  0: {},
  1: {
    StatType.mainAttack: 5,
    StatType.mainStat: 100,
    StatType.finalStrDexLuk: 48,
    StatType.finalHp: 2100,
    StatType.bossDamage: 0.01,
    StatType.ignoreDefense: 0.01,
    StatType.critDamage: 0.0035,
    StatType.damage: 0.0075
  },
  2: {
    StatType.mainAttack: 10,
    StatType.mainStat: 200,
    StatType.finalStrDexLuk: 96,
    StatType.finalHp: 4200,
    StatType.bossDamage: 0.02,
    StatType.ignoreDefense: 0.02,
    StatType.critDamage: 0.007,
    StatType.damage: 0.015
  },
  3: {
    StatType.mainAttack: 15,
    StatType.mainStat: 300,
    StatType.finalStrDexLuk: 144,
    StatType.finalHp: 6300,
    StatType.bossDamage: 0.03,
    StatType.ignoreDefense: 0.03,
    StatType.critDamage: 0.0105,
    StatType.damage: 0.0225
  },
  4: {
    StatType.mainAttack: 20,
    StatType.mainStat: 400,
    StatType.finalStrDexLuk: 192,
    StatType.finalHp: 8400,
    StatType.bossDamage: 0.04,
    StatType.ignoreDefense: 0.04,
    StatType.critDamage: 0.014,
    StatType.damage: 0.03
  },
  5: {
    StatType.mainAttack: 30,
    StatType.mainStat: 600,
    StatType.finalStrDexLuk: 288,
    StatType.finalHp: 12600,
    StatType.bossDamage: 0.06,
    StatType.ignoreDefense: 0.06,
    StatType.critDamage: 0.021,
    StatType.damage: 0.045
  },
  6: {
    StatType.mainAttack: 40,
    StatType.mainStat: 800,
    StatType.finalStrDexLuk: 384,
    StatType.finalHp: 16800,
    StatType.bossDamage: 0.08,
    StatType.ignoreDefense: 0.08,
    StatType.critDamage: 0.028,
    StatType.damage: 0.06
  },
  7: {
    StatType.mainAttack: 50,
    StatType.mainStat: 1000,
    StatType.finalStrDexLuk: 480,
    StatType.finalHp: 21000,
    StatType.bossDamage: 0.1,
    StatType.ignoreDefense: 0.1,
    StatType.critDamage: 0.035,
    StatType.damage: 0.075
  },
  8: {
    StatType.mainAttack: 65,
    StatType.mainStat: 1300,
    StatType.finalStrDexLuk: 624,
    StatType.finalHp: 27300,
    StatType.bossDamage: 0.13,
    StatType.ignoreDefense: 0.13,
    StatType.critDamage: 0.0455,
    StatType.damage: 0.0975
  },
  9: {
    StatType.mainAttack: 80,
    StatType.mainStat: 1600,
    StatType.finalStrDexLuk: 768,
    StatType.finalHp: 33600,
    StatType.bossDamage: 0.16,
    StatType.ignoreDefense: 0.16,
    StatType.critDamage: 0.056,
    StatType.damage: 0.12
  },
  10: {
    StatType.mainAttack: 100,
    StatType.mainStat: 2000,
    StatType.finalStrDexLuk: 960,
    StatType.finalHp: 42000,
    StatType.bossDamage: 0.20,
    StatType.ignoreDefense: 0.20,
    StatType.critDamage: 0.07,
    StatType.damage: 0.15
  },
};