import 'package:maplestory_builder/constants/constants.dart';

// ignore: constant_identifier_names
const List<StatType> AVAILABLE_HEXA_STAT_STATS = [
  StatType.critDamage,
  StatType.bossDamage,
  StatType.ignoreDefense,
  StatType.damage,
  StatType.mainAttack,
  StatType.mainStat,
];

// ignore: constant_identifier_names
const Map<StatType, num> HEXA_STAT_INCREMENTS = {
  StatType.mainAttack: 5,
  StatType.mainStat: 100,
  StatType.finalStrDexLuk: 48,
  StatType.finalHp: 2100,
  StatType.bossDamage: 0.01,
  StatType.ignoreDefense: 0.01,
  StatType.critDamage: 0.0035,
  StatType.damage: 0.0075
};