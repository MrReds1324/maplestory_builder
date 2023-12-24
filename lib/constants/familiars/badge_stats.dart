import 'package:maplestory_builder/constants/constants.dart';

enum BadgeName {
  starterBadge(
    formattedName: "Starter Badge",
    badgeStats: {
      StatType.hp: 5
    }
  ),
  snowflakeBadge(
    formattedName: "Snowflake badge",
    badgeStats: {
      StatType.hp: 5
    }
  ),
  oppressorBadge(
    formattedName: "Oppressor Badge",
    badgeStats: {
      StatType.hp: 5
    }
  ),
  shadowBadge(
    formattedName: "Shadow Badge",
    badgeStats: {
      StatType.luk: 2
    }
  ),
  magicalBadge(
    formattedName: "Magical Badge",
    badgeStats: {
      StatType.int: 2
    }
  ),
  secretBadge(
    formattedName: "Secret Badge",
    badgeStats: {
      StatType.attack: 1,
      StatType.defense: 5
    }
  ),
  mesaBadge(
    formattedName: "Mesa Badge",
    badgeStats: {
      StatType.str: 2
    }
  ),
  peacefulBadge(
    formattedName: "Peaceful Badge",
    badgeStats: {
      StatType.dex: 2
    }
  ),
  beachBadge(
    formattedName: "Beach Badge",
    badgeStats: {
      StatType.speed: 1,
      StatType.mattackPercentage: 0.01
    }
  ),
  rebelBadge(
    formattedName: "Rebel badge",
    badgeStats: {
      StatType.critRate: 0.01
    }
  ),
  mineralBadge(
    formattedName: "Mineral Badge",
    badgeStats: {
      StatType.defense: 5,
      StatType.ignoreDefense: 0.03
    }
  ),
  sandyBadge(
    formattedName: "Sandy Badge",
    badgeStats: {
      StatType.damage: 0.01,
      StatType.defense: 5
    }
  ),
  machineBadge(
    formattedName: "Machine Badge",
    badgeStats: {
      StatType.int: 2,
      StatType.mattack: 1
    }
  ),
  toyBadge(
    formattedName: "Toy Badge",
    badgeStats: {
      StatType.hp: 10,
      StatType.ignoreDefense: 0.03
    }
  ),
  clockworkBadge(
    formattedName: "Clockwork Badge",
    badgeStats: {
      StatType.hpPercentage: 0.01,
      StatType.defense: 5
    }
  ),
  forestBadge(
    formattedName: "Forest Badge",
    badgeStats: {
      StatType.hp: 5,
      StatType.defense: 5
    }
  ),
  waveBadge(
    formattedName: "Wave badge",
    badgeStats: {
      StatType.mattackPercentage: 0.01,
      StatType.defense: 20
    }
  ),
  wingsBadge(
    formattedName: "Wings Badge",
    badgeStats: {
      StatType.speed: 1,
      StatType.allStatsPercentage: 0.01
    }
  ),
  snowBadge(
    formattedName: "Snow Badge",
    badgeStats: {
      StatType.attack: 1,
      StatType.dex: 1
    }
  ),
  depthsBadge(
    formattedName: "Depths Badge",
    badgeStats: {
      StatType.attackPercentage: 0.01,
      StatType.mattack: 2
    }
  ),
  cloudBadge(
    formattedName: "Cloud Badge",
    badgeStats: {
      StatType.allStats: 1,
      StatType.ignoreDefense: 0.03
    }
  ),
  hatchingBadge(
    formattedName: "Hatching Badge",
    badgeStats: {
      StatType.skillLevel: 1,
    }
  ),
  timeBadge(
    formattedName: "Time Badge",
    badgeStats: {
      StatType.ignoreDefense: 0.03
    }
  ),
  shrineBadge(
    formattedName: "Shrine Badge",
    badgeStats: {
      StatType.damage: 0.01
    }
  ),
  shurikenbadge(
    formattedName: "Shuriken Badge",
    badgeStats: {
      StatType.dex: 1,
      StatType.damage: 0.01
    }
  ),
  showabadge(
    formattedName: "Showa Badge",
    badgeStats: {
      StatType.allStats: 1,
      StatType.damage: 0.01
    }
  ),
  cityBadge(
    formattedName: "City Badge",
    badgeStats: {
      StatType.attack: 1,
      StatType.mattack: 2
    }
  ),
  mightyBadge(
    formattedName: "Mighty Badge",
    badgeStats: {
      StatType.str: 2,
      StatType.attack: 2
    }
  ),
  exorcismBadge(
    formattedName: "Exorcism Badge",
    badgeStats: {
      StatType.allStatsPercentage: 0.01
    }
  ),
  tyrantBadge(
    formattedName: "Tyrant Badge",
    badgeStats: {
      StatType.allStatsPercentage: 0.01
    }
  ),
  lionBadge(
    formattedName: "Lion Badge",
    badgeStats: {
      StatType.attackPercentage: 0.01,
      StatType.hpPercentage: 0.01
    }
  ),
  futureBadge(
    formattedName: "Future Badge",
    badgeStats: {
      StatType.attackMattackPercentage: 0.01
    }
  ),
  marinerbadge(
    formattedName: "Mariner Badge",
    badgeStats: {
      StatType.jump: 1,
      StatType.luk: 2,
    }
  ),
  cursedBadge(
    formattedName: "CursedBadge",
    badgeStats: {
      StatType.defensePercentage: 0.02,
      StatType.critRate: 0.01
    }
  ),
  commerciBadge(
    formattedName: "Commerci Badge",
    badgeStats: {
      StatType.defensePercentage: 0.02,
      StatType.critRate: 0.01
    }
  ),
  mushkingBadge(
    formattedName: "Mushking Badge",
    badgeStats: {
      StatType.attackMattack: 2
    }
  ),
  darknessBadge(
    formattedName: "Darkness Badge",
    badgeStats: {
      StatType.damage: 0.01
    }
  ),
  dragonBadge(
    formattedName: "Dragon Badge",
    badgeStats: {
      StatType.hp: 5,
      StatType.ignoreDefense: 0.03
    }
  ),
  voidbadge(
    formattedName: "Void Badge",
    badgeStats: {
      StatType.mattackPercentage: 0.01,
      StatType.mattack: 2
    }
  ),
  labyrinthBadge(
    formattedName: "Labyrinth Badge",
    badgeStats: {
      StatType.allStatsPercentage: 0.01,
      StatType.damage: 0.01
    }
  ),
  apocalypseBadge(
    formattedName: "Apocalypse Badge",
    badgeStats: {
      StatType.attackPercentage: 0.01,
      StatType.attack: 2
    }
  ),
  oceanBadge(
    formattedName: "Ocean Badge",
    badgeStats: {
      StatType.critRate: 0.01,
      StatType.damage: 0.01
    }
  ),
  swampbadge(
    formattedName: "Swamp badge",
    badgeStats: {
      StatType.allStatsPercentage: 0.01,
      StatType.attack: 2
    }
  ),
  ;

  const BadgeName({
    required this.formattedName,
    required this.badgeStats
  });

  final String formattedName;
  final Map<StatType, num> badgeStats;
}