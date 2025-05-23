// ignore_for_file: constant_identifier_names

import 'package:maplestory_builder/constants/constants.dart';

// The required hyper stats points to hit each level, 0->1 is 1 point and 14->15 is 110 points
const Map<int, int> HYPER_STATS_LEVEL_TO_POINTS = {
  0: 0,
  1: 1,
  2: 2,
  3: 4,
  4: 8,
  5: 10,
  6: 15,
  7: 20,
  8: 25,
  9: 30,
  10: 35,
  11: 50,
  12: 65,
  13: 80,
  14: 95,
  15: 110,
};

// Level to Total available Hyper Stat Points at that level
const Map<int, int> LEVEL_TO_TOTAL_HYPER_STAT_POINTS = {
  140: 3,
  141: 6,
  142: 9,
  143: 12,
  144: 15,
  145: 18,
  146: 21,
  147: 24,
  148: 27,
  149: 30,
  150: 34,
  151: 38,
  152: 42,
  153: 46,
  154: 50,
  155: 54,
  156: 58,
  157: 62,
  158: 66,
  159: 70,
  160: 75,
  161: 80,
  162: 85,
  163: 90,
  164: 95,
  165: 100,
  166: 105,
  167: 110,
  168: 115,
  169: 120,
  170: 126,
  171: 132,
  172: 138,
  173: 144,
  174: 150,
  175: 156,
  176: 162,
  177: 168,
  178: 174,
  179: 180,
  180: 187,
  181: 194,
  182: 201,
  183: 208,
  184: 215,
  185: 222,
  186: 229,
  187: 236,
  188: 243,
  189: 250,
  190: 258,
  191: 266,
  192: 274,
  193: 282,
  194: 290,
  195: 298,
  196: 306,
  197: 314,
  198: 322,
  199: 330,
  200: 339,
  201: 348,
  202: 357,
  203: 366,
  204: 375,
  205: 384,
  206: 393,
  207: 402,
  208: 411,
  209: 420,
  210: 430,
  211: 440,
  212: 450,
  213: 460,
  214: 470,
  215: 480,
  216: 490,
  217: 500,
  218: 510,
  219: 520,
  220: 531,
  221: 542,
  222: 553,
  223: 564,
  224: 575,
  225: 586,
  226: 597,
  227: 608,
  228: 619,
  229: 630,
  230: 642,
  231: 654,
  232: 666,
  233: 678,
  234: 690,
  235: 702,
  236: 714,
  237: 726,
  238: 738,
  239: 750,
  240: 763,
  241: 776,
  242: 789,
  243: 802,
  244: 815,
  245: 828,
  246: 841,
  247: 854,
  248: 867,
  249: 880,
  250: 894,
  251: 908,
  252: 922,
  253: 936,
  254: 950,
  255: 964,
  256: 978,
  257: 992,
  258: 1006,
  259: 1020,
  260: 1035,
  261: 1050,
  262: 1065,
  263: 1080,
  264: 1095,
  265: 1110,
  266: 1125,
  267: 1140,
  268: 1155,
  269: 1170,
  270: 1186,
  271: 1202,
  272: 1218,
  273: 1234,
  274: 1250,
  275: 1266,
  276: 1282,
  277: 1298,
  278: 1314,
  279: 1330,
  280: 1347,
  281: 1364,
  282: 1381,
  283: 1398,
  284: 1415,
  285: 1432,
  286: 1449,
  287: 1466,
  288: 1483,
  289: 1500,
  290: 1518,
  291: 1536,
  292: 1554,
  293: 1572,
  294: 1590,
  295: 1608,
  296: 1626,
  297: 1644,
  298: 1662,
  299: 1680,
  300: 1699,
};

const List<int> HYPER_STAT_STAT_VALUES = [
  0, // 0
  30, // 1
  60, // 2
  90, // 3
  120, // 4
  150, // 5
  180, // 6
  210, // 7
  240, // 8
  270, // 9
  300, // 10
  330, // 11
  360, // 12
  390, // 13
  420, // 14
  450, // 15
];

const List<num> HYPER_STAT_HP_MP_VALUES = [
  0, // 0
  0.02, // 1
  0.04, // 2
  0.06, // 3
  0.08, // 4
  0.10, // 5
  0.12, // 6
  0.14, // 7
  0.16, // 8
  0.18, // 9
  0.20, // 10
  0.22, // 11
  0.24, // 12
  0.26, // 13
  0.28, // 14
  0.30, // 15
];

const List<int> HYPER_STAT_SPECIAL_MANA_VALUES = [
  0, // 0
  10, // 1
  20, // 2
  30, // 3
  40, // 4
  50, // 5
  60, // 6
  70, // 7
  80, // 8
  90, // 9
  100, // 10
];

const List<num> HYPER_STAT_CRIT_RATE_VALUES = [
  0, // 0
  0.01, // 1
  0.02, // 2
  0.03, // 3
  0.04, // 4
  0.05, // 5
  0.06, // 6
  0.09, // 7
  0.11, // 8
  0.13, // 9
  0.15, // 10
  0.17, // 11
  0.19, // 12
  0.21, // 13
  0.23, // 14
  0.25, // 15
];

const List<num> HYPER_STAT_CRIT_DAMAGE_VALUES = [
  0, // 0
  0.01, // 1
  0.02, // 2
  0.03, // 3
  0.04, // 4
  0.05, // 5
  0.06, // 6
  0.07, // 7
  0.08, // 8
  0.09, // 9
  0.10, // 10
  0.11, // 11
  0.12, // 12
  0.13, // 13
  0.14, // 14
  0.15, // 15
];

const List<num> HYPER_STAT_IGNORE_DEFENSE_DAMAGE_VALUES = [
  0, // 0
  0.03, // 1
  0.06, // 2
  0.09, // 3
  0.12, // 4
  0.15, // 5
  0.18, // 6
  0.21, // 7
  0.24, // 8
  0.27, // 9
  0.30, // 10
  0.33, // 11
  0.36, // 12
  0.39, // 13
  0.42, // 14
  0.45, // 15
];

const List<num> HYPER_STAT_BOSS_DAMAGE_DAMAGE_NORMAL_MOBS_VALUES = [
  0, // 0
  0.03, // 1
  0.06, // 2
  0.09, // 3
  0.12, // 4
  0.15, // 5
  0.19, // 6
  0.23, // 7
  0.27, // 8
  0.31, // 9
  0.35, // 10
  0.39, // 11
  0.43, // 12
  0.47, // 13
  0.51, // 14
  0.55, // 15
];

const List<int> HYPER_STAT_ABNORMAL_STATUS_VALUES = [
  0, // 0
  1, // 1
  2, // 2
  3, // 3
  4, // 4
  5, // 5
  7, // 6
  9, // 7
  13, // 8
  15, // 9
  15, // 10
  17, // 11
  19, // 12
  21, // 13
  23, // 14
  25, // 15
];

const List<num> HYPER_STAT_KNOCKBACK_RESISTANCE_VALUES = [
  0, // 0
  0.02, // 1
  0.04, // 2
  0.06, // 3
  0.08, // 4
  0.10, // 5
  0.12, // 6
  0.14, // 7
  0.16, // 8
  0.18, // 9
  0.20, // 10
];

const List<int> HYPER_STAT_ATTACK_MATTACK_VALUES = [
  0, // 0
  3, // 1
  6, // 2
  9, // 3
  12, // 4
  15, // 5
  18, // 6
  21, // 7
  24, // 8
  27, // 9
  30, // 10
  33, // 11
  36, // 12
  39, // 13
  42, // 14
  45, // 15
];

const List<num> HYPER_STAT_EXP_VALUES = [
  0, // 0
  0.005, // 1
  0.01, // 2
  0.015, // 3
  0.02, // 4
  0.025, // 5
  0.03, // 6
  0.035, // 7
  0.04, // 8
  0.045, // 9
  0.05, // 10
  0.06, // 11
  0.07, // 12
  0.08, // 13
  0.09, // 14
  0.10, // 15
];

const List<int> HYPER_STAT_ARCANE_FORCE_VALUES = [
  0, // 0
  5, // 1
  10, // 2
  15, // 3
  20, // 4
  25, // 5
  30, // 6
  35, // 7
  40, // 8
  45, // 9
  50, // 10
  60, // 11
  70, // 12
  80, // 13
  90, // 14
  100, // 15
];

const Map<StatType, List<num>> HYPER_STATS_VALUES = {
  StatType.str: HYPER_STAT_STAT_VALUES,
  StatType.dex: HYPER_STAT_STAT_VALUES,
  StatType.int: HYPER_STAT_STAT_VALUES,
  StatType.luk: HYPER_STAT_STAT_VALUES,
  StatType.hp: HYPER_STAT_HP_MP_VALUES,
  StatType.mp: HYPER_STAT_HP_MP_VALUES,
  StatType.specialMana: HYPER_STAT_SPECIAL_MANA_VALUES,
  StatType.critRate: HYPER_STAT_CRIT_RATE_VALUES,
  StatType.critDamage: HYPER_STAT_CRIT_DAMAGE_VALUES,
  StatType.ignoreDefense: HYPER_STAT_IGNORE_DEFENSE_DAMAGE_VALUES,
  StatType.damage: HYPER_STAT_IGNORE_DEFENSE_DAMAGE_VALUES,
  StatType.bossDamage: HYPER_STAT_BOSS_DAMAGE_DAMAGE_NORMAL_MOBS_VALUES,
  StatType.damageNormalMobs: HYPER_STAT_BOSS_DAMAGE_DAMAGE_NORMAL_MOBS_VALUES,
  StatType.statusResistance: HYPER_STAT_ABNORMAL_STATUS_VALUES,
  StatType.attackMattack: HYPER_STAT_ATTACK_MATTACK_VALUES,
  StatType.expAdditional: HYPER_STAT_EXP_VALUES,
  StatType.arcaneForce: HYPER_STAT_ARCANE_FORCE_VALUES,
};
