import 'package:maplestory_builder/constants/constants.dart';

enum InnerAbility {
  attackSpeedIncrease(
    formattedName: "Attack Speed",
    description: "Increases Attack Speed by 1 level",
    targetStat: StatType.attackSpeed,
    statValues: [1],
    statValuesRank: {
      InnerAbilityRank.legendary: (1, 1)
    },
    isUnique: true,
  ),
  criticalRateIncrease(
    formattedName: "Critical Rate",
    description: "Increases Critical Rate by a certain amount",
    targetStat: StatType.critRate,
    statValues: [0.05, 0.06, 0.07, 0.08, 0.09, 0.1, 0.15, 0.16, 0.17, 0.18, 0.19, 0.2, 0.25, 0.26, 0.27, 0.28, 0.29, 0.3],
    statValuesRank: {
      InnerAbilityRank.epic: (0.05, 0.1),
      InnerAbilityRank.unique: (0.15, 0.2),
      InnerAbilityRank.legendary: (0.25, 0.3),
    },
    isUnique: true
  ),
  bossDamageIncrease(
    formattedName: "Boss Damage",
    description: "Increases Boss Damage by a certain amount",
    targetStat: StatType.bossDamage,
    statValues: [0.05, 0.06, 0.07, 0.08, 0.09, 0.1, 0.15, 0.16, 0.17, 0.18, 0.19, 0.2],
    statValuesRank: {
      InnerAbilityRank.unique: (0.05, 0.1),
      InnerAbilityRank.legendary: (0.15, 0.2),
    },
    isUnique: true
  ),
  damageToMobsInflictedWithStatus(
    formattedName: "Damage Increase to Monster with Abornmal Status",
    description: "Increases Damage to monsters inflicted with abnormal status",
    targetStat: StatType.damage,
    statValues: [0.02, 0.03, 0.04, 0.05, 0.07, 0.08, 0.09, 0.1],
    statValuesRank: {
      InnerAbilityRank.rare: (0.02, 0.03),
      InnerAbilityRank.epic: (0.04, 0.05),
      InnerAbilityRank.unique: (0.07, 0.08),
      InnerAbilityRank.legendary: (0.09, 0.1),
    },
    isUnique: true,
  ),
  buffDurationIncrease(
    formattedName: "Buff Duration",
    description: "Increases Buff Duration by a certain amount",
    targetStat: StatType.buffDuration,
    statValues: [0.07, 0.08, 0.09, 0.1, 0.11, 0.12, 0.13, 0.19, 0.2, 0.21, 0.22, 0.23, 0.24, 0.25, 0.32, 0.33, 0.34, 0.35, 0.36, 0.37, 0.38, 0.44, 0.45, 0.46, 0.47, 0.48, 0.49, 0.5],
    statValuesRank: {
      InnerAbilityRank.rare: (0.07, 0.13),
      InnerAbilityRank.epic: (0.19, 0.25),
      InnerAbilityRank.unique: (0.32, 0.38),
      InnerAbilityRank.legendary: (0.44, 0.5),
    },
    isUnique: true,
  ),
  skillSkipChance(
    formattedName: "Cooldown Skip Chance",
    description: "Increases the chance to skip skill cooldown a certain amount",
    targetStat: StatType.skipCooldownChance,
    statValues: [0.05, 0.06, 0.07, 0.08, 0.09, 0.1, 0.15, 0.16, 0.17, 0.18, 0.19, 0.2],
    statValuesRank: {
      InnerAbilityRank.unique: (0.05, 0.1),
      InnerAbilityRank.legendary: (0.15, 0.2),
    },
    isUnique: true
  ),
  itemDropRateIncrease(
    formattedName: "Item Drop Rate",
    description: "Increases Item Drop Rate by a certain ammount",
    targetStat: StatType.itemDropRate,
    statValues: [0.03, 0.04, 0.05, 0.08, 0.09, 0.1, 0.13, 0.14, 0.15, 0.18, 0.19, 0.2],
    statValuesRank: {
      InnerAbilityRank.rare: (0.03, 0.05),
      InnerAbilityRank.epic: (0.08, 0.1),
      InnerAbilityRank.unique: (0.13, 0.15),
      InnerAbilityRank.legendary: (0.18, 0.2),
    },
    isUnique: true,
  ),
  mesoObtainedIncrease(
    formattedName: "Mesos Obtained",
    description: "Increases Mesos Obtained by a certain ammount",
    targetStat: StatType.mesosObtained,
    statValues: [0.03, 0.04, 0.05, 0.08, 0.09, 0.1, 0.13, 0.14, 0.15, 0.18, 0.19, 0.2],
    statValuesRank: {
      InnerAbilityRank.rare: (0.03, 0.05),
      InnerAbilityRank.epic: (0.08, 0.1),
      InnerAbilityRank.unique: (0.13, 0.15),
      InnerAbilityRank.legendary: (0.18, 0.2),
    },
    isUnique: true,
  ),
  attackPowerIncrease(
    formattedName: "Attack Power",
    description: "Increases Attack Power by a certain amount",
    targetStat: StatType.attack,
    statValues: [6, 9, 12, 15, 18, 21, 24, 27, 30],
    statValuesRank: {
      InnerAbilityRank.epic: (6, 12),
      InnerAbilityRank.unique: (15, 24),
      InnerAbilityRank.legendary: (27, 30),
    },
    isUnique: true,
  ),
  magicAttackIncrease(
    formattedName: "Magic Attack",
    description: "Increases Magic Attack by a certain amount",
    targetStat: StatType.mattack,
    statValues: [6, 9, 12, 15, 18, 21, 24, 27, 30],
    statValuesRank: {
      InnerAbilityRank.epic: (6, 12),
      InnerAbilityRank.unique: (15, 24),
      InnerAbilityRank.legendary: (27, 30),
    },
    isUnique: true,
  ),
  attackSkillTargetIncrease(
    formattedName: "Attack Skill Target Increase",
    description: "Increases the amount of targets attacking skills can hit by 1",
    targetStat: StatType.attackSkillTargetIncrease,
    statValues: [1],
    statValuesRank: {
      InnerAbilityRank.legendary: (1, 1)
    },
    isUnique: true,
  ),
  defensePercentageIncrease(
    formattedName: "Defense Percentage",
    description: "Increases Defense Percentage by a certain amount",
    targetStat: StatType.defensePercentage,
    statValues: [0.05, 0.06, 0.07, 0.08, 0.09, 0.1, 0.15, 0.16, 0.17, 0.18, 0.19, 0.2],
    statValuesRank: {
      InnerAbilityRank.unique: (0.05, 0.1),
      InnerAbilityRank.legendary: (0.15, 0.2),
    },
    isUnique: true
  ),
  hpPercentageIncrease(
    formattedName: "HP Percentage",
    description: "Increases HP Percentage by a certain amount",
    targetStat: StatType.hpPercentage,
    statValues: [0.05, 0.06, 0.07, 0.08, 0.09, 0.1, 0.15, 0.16, 0.17, 0.18, 0.19, 0.2],
    statValuesRank: {
      InnerAbilityRank.unique: (0.05, 0.1),
      InnerAbilityRank.legendary: (0.15, 0.2),
    },
    isUnique: true
  ),
  mpPercentageIncrease(
    formattedName: "MP Percentage",
    description: "Increases MP Percentage by a certain amount",
    targetStat: StatType.mpPercentage,
    statValues: [0.05, 0.06, 0.07, 0.08, 0.09, 0.1, 0.15, 0.16, 0.17, 0.18, 0.19, 0.2],
    statValuesRank: {
      InnerAbilityRank.unique: (0.05, 0.1),
      InnerAbilityRank.legendary: (0.15, 0.2),
    },
    isUnique: true
  ),
  passiveSkillIncrease(
    formattedName: "Passive Skill Levels Increase",
    description: "Increases all passive skill levels by 1\n~only works on passive skills, does not work for active skills with passives",
    targetStat: StatType.skillLevel,
    statValues: [1],
    statValuesRank: {
      InnerAbilityRank.legendary: (1, 1)
    },
    isUnique: true,
  ),
  damageIncreaseToMobs(
    formattedName: "Damage Increase to Normal Monsters",
    description: "Increases Damage to normal monsters by a certain amount",
    targetStat: StatType.damageNormalMobs,
    statValues: [0.02, 0.03, 0.04, 0.05, 0.07, 0.08, 0.09, 0.1],
    statValuesRank: {
      InnerAbilityRank.rare: (0.02, 0.03),
      InnerAbilityRank.epic: (0.04, 0.05),
      InnerAbilityRank.unique: (0.07, 0.08),
      InnerAbilityRank.legendary: (0.09, 0.1),
    },
    isUnique: true,
  ),
  jumpIncrease(
    formattedName: "Jump",
    description: "Increases Jump by a certain amount",
    targetStat: StatType.jump,
    statValues: [4, 6, 8, 10, 12, 14, 18, 20],
    statValuesRank: {
      InnerAbilityRank.rare: (4, 8),
      InnerAbilityRank.epic: (10, 14),
      InnerAbilityRank.unique: (18, 20),
    },
    isUnique: true,
  ),
  speedIncrease(
    formattedName: "Speed",
    description: "Increases Speed by a certain amount",
    targetStat: StatType.speed,
    statValues: [4, 6, 8, 10, 12, 14, 18, 20],
    statValuesRank: {
      InnerAbilityRank.rare: (4, 8),
      InnerAbilityRank.epic: (10, 14),
      InnerAbilityRank.unique: (18, 20),
    },
    isUnique: true,
  ),
  hpIncrease(
    formattedName: "HP",
    description: "Increases HP by a certain amount",
    targetStat: StatType.hp,
    statValues: [75, 90, 105, 120, 135, 150, 225, 240, 255, 270, 285, 300, 375, 390, 405, 420, 435, 450, 525, 540, 555, 570, 585, 600],
    statValuesRank: {
      InnerAbilityRank.rare: (75, 150),
      InnerAbilityRank.epic: (225, 300),
      InnerAbilityRank.unique: (375, 450),
      InnerAbilityRank.legendary: (525, 600),
    },
    isUnique: true,
  ),
  mpIncrease(
    formattedName: "MP",
    description: "Increases MP by a certain amount",
    targetStat: StatType.mp,
    statValues: [75, 90, 105, 120, 135, 150, 225, 240, 255, 270, 285, 300, 375, 390, 405, 420, 435, 450, 525, 540, 555, 570, 585, 600],
    statValuesRank: {
      InnerAbilityRank.rare: (75, 150),
      InnerAbilityRank.epic: (225, 300),
      InnerAbilityRank.unique: (375, 450),
      InnerAbilityRank.legendary: (525, 600),
    },
    isUnique: true,
  ),
  defIncrease(
    formattedName: "Defense",
    description: "Increases Defense by a certain amount",
    targetStat: StatType.mp,
    statValues: [50, 60, 70, 80, 90, 100, 150, 160, 170, 180, 190, 200, 250, 260, 270, 280, 290, 300],
    statValuesRank: {
      InnerAbilityRank.rare: (50, 100),
      InnerAbilityRank.epic: (150, 200),
      InnerAbilityRank.unique: (250, 300),
      InnerAbilityRank.legendary: (350, 400),
    },
    isUnique: true,
  ),
  strIncrease(
    formattedName: "STR",
    description: "Increases STR by a certain amount",
    targetStat: StatType.finalStr,
    statValues: [5, 6, 7, 8, 9, 10, 15, 16, 17, 18, 19, 20, 25, 26, 27, 28, 29, 30],
    statValuesRank: {
      InnerAbilityRank.rare: (5, 10),
      InnerAbilityRank.epic: (15, 20),
      InnerAbilityRank.unique: (25, 30),
      InnerAbilityRank.legendary: (35, 40),
    },
    isUnique: true,
  ),
  dexIncrease(
    formattedName: "DEX",
    description: "Increases DEX by a certain amount",
    targetStat: StatType.finalDex,
    statValues: [5, 6, 7, 8, 9, 10, 15, 16, 17, 18, 19, 20, 25, 26, 27, 28, 29, 30],
    statValuesRank: {
      InnerAbilityRank.rare: (5, 10),
      InnerAbilityRank.epic: (15, 20),
      InnerAbilityRank.unique: (25, 30),
      InnerAbilityRank.legendary: (35, 40),
    },
    isUnique: true,
  ),
  intIncrease(
    formattedName: "INT",
    description: "Increases INT by a certain amount",
    targetStat: StatType.finalInt,
    statValues: [5, 6, 7, 8, 9, 10, 15, 16, 17, 18, 19, 20, 25, 26, 27, 28, 29, 30],
    statValuesRank: {
      InnerAbilityRank.rare: (5, 10),
      InnerAbilityRank.epic: (15, 20),
      InnerAbilityRank.unique: (25, 30),
      InnerAbilityRank.legendary: (35, 40),
    },
    isUnique: true,
  ),
  lukIncrease(
    formattedName: "LUK",
    description: "Increases LUK by a certain amount",
    targetStat: StatType.finalLuk,
    statValues: [5, 6, 7, 8, 9, 10, 15, 16, 17, 18, 19, 20, 25, 26, 27, 28, 29, 30],
    statValuesRank: {
      InnerAbilityRank.rare: (5, 10),
      InnerAbilityRank.epic: (15, 20),
      InnerAbilityRank.unique: (25, 30),
      InnerAbilityRank.legendary: (35, 40),
    },
    isUnique: true,
  ),
  ;

  const InnerAbility({
    required this.formattedName,
    this.description = '',
    required this.targetStat,
    required this.statValues,
    required this.statValuesRank,
    this.isUnique = false,
  });

  final String formattedName;
  final String description;
  final StatType targetStat;
  final List<num> statValues;
  final Map<InnerAbilityRank, (num, num)> statValuesRank;
  final bool isUnique;

  InnerAbilityRank? determineInnerAbilityRank(num statValue) {
    for (MapEntry<InnerAbilityRank, (num, num)> mapEntry in statValuesRank.entries) {
      if (mapEntry.value.$1 <= statValue && statValue <= mapEntry.value.$2) {
        return mapEntry.key;
      }
    }

    return null;
  }

  double getStatValueSliderLength() {
    return statValues.length - 1;
  }
}

enum InnerAbilityRank {
  rare,
  epic,
  unique,
  legendary;
}