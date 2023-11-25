import 'package:maplestory_builder/constants/constants.dart';

enum InnerAbility {
  attackSpeedIncrease(
    formattedName: "Attack Speed Increase",
    targetStat: StatType.attackSpeed,
    statValues: [1],
    statValuesRank: {
      InnerAbilityRank.legendary: (1, 1)
    }
  ),
  ;

  const InnerAbility({
    required this.formattedName,
    required this.targetStat,
    required this.statValues,
    required this.statValuesRank,
  });

  final String formattedName;
  final StatType targetStat;
  final List<num> statValues;
  final Map<InnerAbilityRank, (num, num)> statValuesRank;

  InnerAbilityRank? determineInnerAbilityRank(InnerAbility innerAbility, num statValue) {
    for (MapEntry<InnerAbilityRank, (num, num)> mapEntry in innerAbility.statValuesRank.entries) {
      if (mapEntry.value.$1 <= statValue && statValue <= mapEntry.value.$2) {
        return mapEntry.key;
      }
    }

    return null;
  }
}

enum InnerAbilityRank {
  rare,
  epic,
  unique,
  legendary;
}