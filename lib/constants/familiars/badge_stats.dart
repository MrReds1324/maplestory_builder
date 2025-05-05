// ignore_for_file: constant_identifier_names
import 'package:maplestory_builder/constants/constants.dart';

// Taken from https://maplestory.fandom.com/wiki/Familiars
const Map<StatType, num> FAMILIAR_BADGE_LIMITS = {
  StatType.int: 2,
  StatType.str: 2,
  StatType.dex: 2,
  StatType.luk: 2,
  StatType.allStats: 2,
  StatType.allStatsPercentage: 0.01,
  StatType.hp: 10,
  StatType.hpPercentage: 0.02,
  StatType.mp: 5,
  StatType.defense: 10,
  StatType.defensePercentage: 0.02,
  StatType.attack: 2,
  StatType.attackPercentage: 0.03,
  StatType.mattack: 2,
  StatType.mattackPercentage: 0.03,
  StatType.speed: 2,
  StatType.jump: 2,
  StatType.damage: 0.03,
  StatType.critRate: 0.03,
  StatType.ignoreDefense: 0.15,
};