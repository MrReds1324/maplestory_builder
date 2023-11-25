import 'package:maplestory_builder/constants/constants.dart';

enum InnerAbility {
  attackSpeedIncrease(
    formattedName: "Attack Speed Increase",
    targetStat: StatType.attackSpeed,
    statValues: [1],
    statValuesRank: {
      InnerAbilityRank.legendary: (1, 1)
    },
    isUnique: true,
  ),
  criticalRateIncrease(
    formattedName: "Critical Rate Increase",
    targetStat: StatType.critRate,
    statValues: [0.05, 0.06, 0.07, 0.08, 0.09, 0.1, 0.15, 0.16, 0.17, 0.18, 0.19, 0.2, 0.25, 0.26, 0.27, 0.28, 0.29, 0.3],
    statValuesRank: {
      InnerAbilityRank.epic: (0.05, 0.1),
      InnerAbilityRank.unique: (0.15, 0.2),
      InnerAbilityRank.legendary: (0.25, 0.3),
    },
    isUnique: true
  ),
  ;

  const InnerAbility({
    required this.formattedName,
    required this.targetStat,
    required this.statValues,
    required this.statValuesRank,
    this.isUnique = false,
  });

  final String formattedName;
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