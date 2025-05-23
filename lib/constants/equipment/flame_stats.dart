// ignore_for_file: constant_identifier_names

import 'package:maplestory_builder/constants/constants.dart';

enum FlameCategory {
  none,
  nonAdvantaged,
  advantaged,
  all,
}

enum FlameType {
  static,
  range,
}

typedef StaticFlameType = List<num>;
typedef RangedFlameType = List<List<num>>;

// Gives us the row index into the bonus stats tables
enum FlameTier {
  tier1(formattedName: "1"),
  tier2(formattedName: "2"),
  tier3(formattedName: "3"),
  tier4(formattedName: "4"),
  tier5(formattedName: "5"),
  tier6(formattedName: "6"),
  tier7(formattedName: "7");

  const FlameTier({required this.formattedName});

  final String formattedName;
}

enum FlameName {
  str(
      formattedName: "STR",
      flameType: FlameType.range,
      statValue: SINGLE_STAT_FLAME),
  dex(
      formattedName: "DEX",
      flameType: FlameType.range,
      statValue: SINGLE_STAT_FLAME),
  int(
      formattedName: "INT",
      flameType: FlameType.range,
      statValue: SINGLE_STAT_FLAME),
  luk(
      formattedName: "LUK",
      flameType: FlameType.range,
      statValue: SINGLE_STAT_FLAME),
  strDex(
      formattedName: "STR & DEX",
      flameType: FlameType.range,
      statValue: DOUBLE_STAT_FLAME),
  strInt(
      formattedName: "STR & INT",
      flameType: FlameType.range,
      statValue: DOUBLE_STAT_FLAME),
  strLuk(
      formattedName: "STR & LUK",
      flameType: FlameType.range,
      statValue: DOUBLE_STAT_FLAME),
  dexInt(
      formattedName: "DEX & INT",
      flameType: FlameType.range,
      statValue: DOUBLE_STAT_FLAME),
  dexLuk(
      formattedName: "DEX & LUK",
      flameType: FlameType.range,
      statValue: DOUBLE_STAT_FLAME),
  intLuk(
      formattedName: "INT & LUK",
      flameType: FlameType.range,
      statValue: DOUBLE_STAT_FLAME),
  attack(
      formattedName: "Attack Power",
      flameType: FlameType.static,
      statValue: NON_WEAPON_ATTACK_MATTACK_FLAME),
  mattack(
      formattedName: "Magic Attack",
      flameType: FlameType.static,
      statValue: NON_WEAPON_ATTACK_MATTACK_FLAME),
  wepAttackFlameAdvantaged(
      formattedName: "Attack Power",
      flameType: FlameType.range,
      statValue: WEAPON_ATTACK_MATTACK_ADVANTAGED_FLAME),
  wepMattackFlameAdvantaged(
      formattedName: "Magic Attack",
      flameType: FlameType.range,
      statValue: WEAPON_ATTACK_MATTACK_ADVANTAGED_FLAME),
  wepAttackFlameNonAdvantaged(
      formattedName: "Attack Power",
      flameType: FlameType.range,
      statValue: WEPEAN_ATTACK_MATTACK_FLAME),
  wepMattackFlameNonAdvantaged(
      formattedName: "Magic Attack",
      flameType: FlameType.range,
      statValue: WEPEAN_ATTACK_MATTACK_FLAME),
  defense(
      formattedName: "Defense",
      flameType: FlameType.range,
      statValue: DEFENSE_FLAME),
  hp(formattedName: "HP", flameType: FlameType.range, statValue: HP_MP_FLAME),
  mp(formattedName: "MP", flameType: FlameType.range, statValue: HP_MP_FLAME),
  speed(
      formattedName: "Speed",
      flameType: FlameType.static,
      statValue: SPEED_JUMP_FLAME),
  jump(
      formattedName: "Jump",
      flameType: FlameType.static,
      statValue: SPEED_JUMP_FLAME),
  allStats(
      formattedName: "All Stats",
      flameType: FlameType.static,
      statValue: ALL_STATS_PERCENTAGE_FLAME),
  bossDamage(
      formattedName: "Boss Damage",
      flameType: FlameType.static,
      statValue: BOSS_DAMAGE_FLAME),
  damage(
      formattedName: "Damage",
      flameType: FlameType.static,
      statValue: DAMAGE_FLAME),
  levelReduction(
      formattedName: "Level Reduction",
      flameType: FlameType.static,
      statValue: LEVEL_REDUCTION_FLAME);

  const FlameName({
    required this.formattedName,
    required this.flameType,
    required this.statValue,
  });

  final String formattedName;
  final FlameType flameType;
  final List statValue;

  void validate() {
    switch (flameType) {
      case FlameType.range:
        if (statValue is! RangedFlameType) {
          throw Exception(
              "Flame '$formattedName' has the wrong statValue for its FlameType $flameType");
        }
      case FlameType.static:
        if (statValue is! StaticFlameType) {
          throw Exception(
              "Flame '$formattedName' has the wrong statValue for its FlameType $flameType");
        }
    }
  }
}

const List<List<int>> SINGLE_STAT_FLAME = [
  [1, 2, 3, 4, 5, 6, 7], // 0-9
  [1, 2, 3, 4, 5, 6, 7], // 10-19
  [2, 4, 6, 8, 10, 12, 14], // 20-29
  [2, 4, 6, 8, 10, 12, 14], // 30-39
  [3, 6, 9, 12, 15, 18, 21], // 40-49
  [3, 6, 9, 12, 15, 18, 21], // 50-59
  [4, 8, 12, 16, 20, 24, 28], // 60-69
  [4, 8, 12, 16, 20, 24, 28], // 70-79
  [5, 10, 15, 20, 25, 30, 35], // 80-89
  [5, 10, 15, 20, 25, 30, 35], // 90-99
  [6, 12, 18, 24, 30, 36, 42], // 100-109
  [6, 12, 18, 24, 30, 36, 42], // 110-119
  [7, 14, 21, 28, 35, 42, 49], // 120-129
  [7, 14, 21, 28, 35, 42, 49], // 130-139
  [8, 16, 24, 32, 40, 48, 56], // 140-149
  [8, 16, 24, 32, 40, 48, 56], // 150-159
  [9, 18, 27, 36, 45, 54, 63], // 160-169
  [9, 18, 27, 36, 45, 54, 63], // 170-179
  [10, 20, 30, 40, 50, 60, 70], // 180-189
  [10, 20, 30, 40, 50, 60, 70], // 190-199
  [11, 22, 33, 44, 55, 66, 77], // 200-209
  [11, 22, 33, 44, 55, 66, 77], // 210-229
  [12, 24, 36, 48, 60, 72, 84], // 230-239
  [12, 24, 36, 48, 60, 72, 84], // 230-249
  [12, 24, 36, 48, 60, 72, 84], // 250+
];

const List<List<int>> DOUBLE_STAT_FLAME = [
  [1, 2, 3, 4, 5, 6, 7], // 0-9
  [1, 2, 3, 4, 5, 6, 7], // 10-19
  [1, 2, 3, 4, 5, 6, 7], // 20-29
  [1, 2, 3, 4, 5, 6, 7], // 30-39
  [2, 4, 6, 8, 10, 12, 14], // 40-49
  [2, 4, 6, 8, 10, 12, 14], // 50-59
  [2, 4, 6, 8, 10, 12, 14], // 60-69
  [2, 4, 6, 8, 10, 12, 14], // 70-79
  [3, 6, 9, 12, 15, 18, 21], // 80-89
  [3, 6, 9, 12, 15, 18, 21], // 90-99
  [3, 6, 9, 12, 15, 18, 21], // 100-109
  [3, 6, 9, 12, 15, 18, 21], // 110-119
  [4, 8, 12, 16, 20, 24, 28], // 120-129
  [4, 8, 12, 16, 20, 24, 28], // 130-139
  [4, 8, 12, 16, 20, 24, 28], // 140-149
  [4, 8, 12, 16, 20, 24, 28], // 150-159
  [5, 10, 15, 20, 25, 30, 35], // 160-169
  [5, 10, 15, 20, 25, 30, 35], // 170-179
  [5, 10, 15, 20, 25, 30, 35], // 180-189
  [5, 10, 15, 20, 25, 30, 35], // 190-199
  [6, 12, 18, 24, 30, 36, 42], // 200-209
  [6, 12, 18, 24, 30, 36, 42], // 210-219
  [6, 12, 18, 24, 30, 36, 42], // 220-229
  [6, 12, 18, 24, 30, 36, 42], // 230-239
  [6, 12, 18, 24, 30, 36, 42], // 240-249
  [7, 14, 21, 28, 35, 42, 49], // 250+
];

const List<List<int>> HP_MP_FLAME = [
  [3, 6, 9, 12, 15, 18, 21], // 0-9
  [30, 60, 90, 120, 150, 180, 210], // 10-19
  [60, 120, 180, 240, 300, 360, 420], // 20-29
  [90, 180, 270, 360, 450, 540, 630], // 30-39
  [120, 240, 360, 480, 600, 720, 840], // 40-49
  [150, 300, 450, 600, 750, 900, 1050], // 50-59
  [180, 360, 540, 720, 900, 1080, 1260], // 60-69
  [210, 420, 630, 840, 1050, 1260, 1470], // 70-79
  [240, 480, 720, 960, 1200, 1440, 1680], // 80-89
  [270, 540, 810, 1080, 1350, 1620, 1890], // 90-99
  [300, 600, 900, 1200, 1500, 1800, 2100], // 100-109
  [330, 660, 990, 1320, 1650, 1980, 2310], // 110-119
  [360, 720, 1080, 1440, 1800, 2160, 2520], // 120-129
  [390, 780, 1170, 1560, 1950, 2340, 2730], // 130-139
  [420, 840, 1260, 1680, 2100, 2520, 2940], // 140-149
  [450, 900, 1350, 1800, 2250, 2700, 3150], // 150-159
  [480, 960, 1440, 1920, 2400, 2880, 3360], // 160-169
  [510, 1020, 1530, 2040, 2550, 3060, 3570], // 170-179
  [540, 1080, 1620, 2160, 2700, 3240, 3780], // 180-189
  [570, 1140, 1710, 2280, 2850, 3420, 3990], // 190-199
  [600, 1200, 1800, 2400, 3000, 3600, 4200], // 200-209
  [620, 1240, 1860, 2480, 3100, 3720, 4340], // 210-219
  [640, 1280, 1920, 2560, 3200, 3840, 4480], // 220-229
  [660, 1320, 1980, 2640, 3300, 3960, 4620], // 230-239
  [680, 1360, 2040, 2720, 3400, 4080, 4760], // 240-249
  [700, 1400, 2100, 2800, 3500, 4200, 4900], // 250+
];

const List<List<int>> DEFENSE_FLAME = [
  [1, 2, 3, 4, 5, 6, 7], // 0-9
  [1, 2, 3, 4, 5, 6, 7], // 10-19
  [2, 4, 6, 8, 10, 12, 14], // 20-29
  [2, 4, 6, 8, 10, 12, 14], // 30-39
  [3, 6, 9, 12, 15, 18, 21], // 40-49
  [3, 6, 9, 12, 15, 18, 21], // 50-59
  [4, 8, 12, 16, 20, 24, 28], // 60-69
  [4, 8, 12, 16, 20, 24, 28], // 70-79
  [5, 10, 15, 20, 25, 30, 35], // 80-89
  [5, 10, 15, 20, 25, 30, 35], // 90-99
  [6, 12, 18, 24, 30, 36, 42], // 100-109
  [6, 12, 18, 24, 30, 36, 42], // 110-119
  [7, 14, 21, 28, 35, 42, 49], // 120-129
  [7, 14, 21, 28, 35, 42, 49], // 130-139
  [8, 16, 24, 32, 40, 48, 56], // 140-149
  [8, 16, 24, 32, 40, 48, 56], // 150-159
  [9, 18, 27, 36, 45, 54, 63], // 160-169
  [9, 18, 27, 36, 45, 54, 63], // 170-179
  [10, 20, 30, 40, 50, 60, 70], // 180-189
  [10, 20, 30, 40, 50, 60, 70], // 190-199
  [11, 22, 33, 44, 55, 66, 77], // 200-209
  [11, 22, 33, 44, 55, 66, 77], // 210-219
  [11, 22, 33, 44, 55, 66, 77], // 220-229
  [12, 24, 36, 48, 60, 72, 84], // 230-239
  [12, 24, 36, 48, 60, 72, 84], // 240-249
  [12, 24, 36, 48, 60, 72, 84], // 250+
];

const List<List<double>> WEPEAN_ATTACK_MATTACK_FLAME = [
  [.01, 0.022, 0.0363, 0.05324, 0.073205, 0.087846, 0.102487],
  // 0-9
  [.01, 0.022, 0.0363, 0.05324, 0.073205, 0.087846, 0.102487],
  // 10-19
  [.01, 0.022, 0.0363, 0.05324, 0.073205, 0.087846, 0.102487],
  // 20-29
  [.01, 0.022, 0.0363, 0.05324, 0.073205, 0.087846, 0.102487],
  // 30-39
  [0.02, 0.044, 0.0726, 0.10648, 0.14641, 0.175692, 0.204974],
  // 40-49
  [0.02, 0.044, 0.0726, 0.10648, 0.14641, 0.175692, 0.204974],
  // 50-59
  [0.02, 0.044, 0.0726, 0.10648, 0.14641, 0.175692, 0.204974],
  // 60-69
  [0.02, 0.044, 0.0726, 0.10648, 0.14641, 0.175692, 0.204974],
  // 70-79
  [0.03, 0.066, 0.1089, 0.15972, 0.219615, 0.263538, 0.307461],
  // 80-89
  [0.03, 0.066, 0.1089, 0.15972, 0.219615, 0.263538, 0.307461],
  // 90-99
  [0.03, 0.066, 0.1089, 0.15972, 0.219615, 0.263538, 0.307461],
  // 100-109
  [0.03, 0.066, 0.1089, 0.15972, 0.219615, 0.263538, 0.307461],
  // 110-119
  [0.04, 0.088, 0.1452, 0.21296, 0.29282, 0.351384, 0.409948],
  // 120-129
  [0.04, 0.088, 0.1452, 0.21296, 0.29282, 0.351384, 0.409948],
  // 130-139
  [0.04, 0.088, 0.1452, 0.21296, 0.29282, 0.351384, 0.409948],
  // 140-149
  [0.04, 0.088, 0.1452, 0.21296, 0.29282, 0.351384, 0.409948],
  // 150-159
  [0.05, 0.11, 0.1815, 0.2662, 0.366025, 0.43923, 0.512435],
  // 160-169
  [0.05, 0.11, 0.1815, 0.2662, 0.366025, 0.43923, 0.512435],
  // 170-179
  [0.05, 0.11, 0.1815, 0.2662, 0.366025, 0.43923, 0.512435],
  // 180-189
  [0.05, 0.11, 0.1815, 0.2662, 0.366025, 0.43923, 0.512435],
  // 190-199
  [0.06, 0.132, 0.2178, 0.31944, 0.43923, 0.527076, 0.614922],
  // 200-209
  [0.06, 0.132, 0.2178, 0.31944, 0.43923, 0.527076, 0.614922],
  // 210-219
  [0.06, 0.132, 0.2178, 0.31944, 0.43923, 0.527076, 0.614922],
  // 220-229
  [0.06, 0.132, 0.2178, 0.31944, 0.43923, 0.527076, 0.614922],
  // 230-239
  [0.06, 0.132, 0.2178, 0.31944, 0.43923, 0.527076, 0.614922],
  // 240-249
  [0.06, 0.132, 0.2178, 0.31944, 0.43923, 0.527076, 0.614922],
  // 250+
];

// This starts at tier 3 because flame advantaged stuff can only get 3-7
const List<List<double>> WEAPON_ATTACK_MATTACK_ADVANTAGED_FLAME = [
  [0, 0, 0.03, 0.044, 0.0605, 0.07986, 0.102487], // 0-9
  [0, 0, 0.03, 0.044, 0.0605, 0.07986, 0.102487], // 10-19
  [0, 0, 0.03, 0.044, 0.0605, 0.07986, 0.102487], // 20-29
  [0, 0, 0.03, 0.044, 0.0605, 0.07986, 0.102487], // 30-39
  [0, 0, 0.06, 0.088, 0.121, 0.15972, 0.204974], // 40-49
  [0, 0, 0.06, 0.088, 0.121, 0.15972, 0.204974], // 50-59
  [0, 0, 0.06, 0.088, 0.121, 0.15972, 0.204974], // 60-69
  [0, 0, 0.06, 0.088, 0.121, 0.15972, 0.204974], // 70-79
  [0, 0, 0.09, 0.132, 0.1815, 0.23958, 0.307461], // 80-89
  [0, 0, 0.09, 0.132, 0.1815, 0.23958, 0.307461], // 90-99
  [0, 0, 0.09, 0.132, 0.1815, 0.23958, 0.307461], // 100-109
  [0, 0, 0.09, 0.132, 0.1815, 0.23958, 0.307461], // 110-119
  [0, 0, 0.12, 0.176, 0.242, 0.31944, 0.409948], // 120-129
  [0, 0, 0.12, 0.176, 0.242, 0.31944, 0.409948], // 130-139
  [0, 0, 0.12, 0.176, 0.242, 0.31944, 0.409948], // 140-149
  [0, 0, 0.12, 0.176, 0.242, 0.31944, 0.409948], // 150-159
  [0, 0, 0.15, 0.22, 0.3025, 0.3993, 0.512435], // 160-169
  [0, 0, 0.15, 0.22, 0.3025, 0.3993, 0.512435], // 170-179
  [0, 0, 0.15, 0.22, 0.3025, 0.3993, 0.512435], // 180-189
  [0, 0, 0.15, 0.22, 0.3025, 0.3993, 0.512435], // 190-199
  [0, 0, 0.18, 0.264, 0.363, 0.47916, 0.614922], // 200-209
  [0, 0, 0.18, 0.264, 0.363, 0.47916, 0.614922], // 210-219
  [0, 0, 0.18, 0.264, 0.363, 0.47916, 0.614922], // 220-229
  [0, 0, 0.18, 0.264, 0.363, 0.47916, 0.614922], // 230-239
  [0, 0, 0.18, 0.264, 0.363, 0.47916, 0.614922], // 240-249
  [0, 0, 0.18, 0.264, 0.363, 0.47916, 0.614922], // 250+
];

// Stats that do not change per level
const List<int> NON_WEAPON_ATTACK_MATTACK_FLAME = [1, 2, 3, 4, 5, 6, 7];

const List<int> SPEED_JUMP_FLAME = [1, 2, 3, 4, 5, 6, 7];

const List<double> ALL_STATS_PERCENTAGE_FLAME = [
  .01,
  .02,
  .03,
  .04,
  .05,
  .06,
  .07
];

const List<double> BOSS_DAMAGE_FLAME = [.02, .04, .06, .08, .10, .12, .14];

const List<double> DAMAGE_FLAME = [.01, .02, .03, .04, .05, .06, .07];

const List<double> LEVEL_REDUCTION_FLAME = [5, 10, 15, 20, 25, 30, 35];

const Set<EquipType> NO_FLAME_CATEGORY = <EquipType>{
  EquipType.ring,
  EquipType.shoulder,
  EquipType.badge,
  EquipType.secondary,
  EquipType.shield,
  EquipType.katara,
  EquipType.emblem,
  EquipType.medal,
  EquipType.heart
};

const Set<FlameName> WEAPON_ONLY_FLAMES = <FlameName>{
  FlameName.bossDamage,
  FlameName.damage,
  FlameName.wepAttackFlameAdvantaged,
  FlameName.wepAttackFlameNonAdvantaged,
  FlameName.wepMattackFlameAdvantaged,
  FlameName.wepMattackFlameNonAdvantaged,
};

const Set<FlameName> WEAPON_EXCLUDED_FLAMES = <FlameName>{
  FlameName.speed,
  FlameName.jump,
  FlameName.attack,
  FlameName.mattack,
};
