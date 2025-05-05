import 'dart:math';

import 'package:flutter/material.dart';
import 'package:maplestory_builder/constants/character/trait_stats.dart';
import 'package:maplestory_builder/constants/constants.dart';
import 'package:maplestory_builder/modules/base.dart';
import 'package:maplestory_builder/modules/utilities/utilities.dart';

class TraitStatsProvider with ChangeNotifier implements Copyable {
  Map<TraitName, int> traitLevels;
  Map<StatType, num>? cacheValue;

  Widget hoverTooltip = const SizedBox.shrink();

  TraitStatsProvider({
    Map<TraitName, int>? traitLevels,
  }) : traitLevels = traitLevels ??
            {
              TraitName.ambition: 0,
              TraitName.charm: 0,
              TraitName.diligence: 0,
              TraitName.empathy: 0,
              TraitName.insight: 0,
              TraitName.willpower: 0,
            };

  @override
  TraitStatsProvider copyWith({
    Map<TraitName, int>? traitLevels,
  }) {
    return TraitStatsProvider(
      traitLevels: traitLevels ?? Map<TraitName, int>.of(this.traitLevels),
    );
  }

  Map<StatType, num> calculateStats() {
    if (cacheValue != null) {
      return cacheValue!;
    } else {
      Map<StatType, num> traitStats = {};

      for (TraitName traitName in traitLevels.keys) {
        traitStats.addAll(getStatValues(traitName));
      }

      cacheValue = traitStats;
      return traitStats;
    }
  }

  Map<StatType, num> getStatValues(TraitName traitName,
      {int additionalLevels = 0}) {
    Map<StatType, num> traitStats = {};

    for (MapEntry<StatType, (num, int)> traitStat
        in traitName.traitEffect.entries) {
      traitStats[traitStat.key] = traitStat.value.$1 *
          ((traitLevels[traitName]! + additionalLevels) / traitStat.value.$2)
              .floor();
    }

    return traitStats;
  }

  void addTraitLevels(int levelAmount, TraitName traitName) {
    var currentTraitLevel = traitLevels[traitName]!;

    if (currentTraitLevel == 100) {
      return;
    }

    levelAmount = min(100 - currentTraitLevel, levelAmount);
    traitLevels[traitName] = traitLevels[traitName]! + levelAmount;

    cacheValue = null;
    notifyListeners();
  }

  void subtractTraitLevels(int levelAmount, TraitName traitName) {
    var currentTraitLevel = traitLevels[traitName]!;

    if (currentTraitLevel == 0) {
      return;
    }

    levelAmount = min(currentTraitLevel, levelAmount);
    traitLevels[traitName] = traitLevels[traitName]! - levelAmount;

    cacheValue = null;
    notifyListeners();
  }

  void getHoverTooltipText(TraitName traitName) {
    Widget? statDescription;
    Widget? currentLevelText;
    Widget? nextLevelText;

    String buildLevelString({int additionalLevels = 0}) {
      List<String> returnParts = [];
      var statValue =
          getStatValues(traitName, additionalLevels: additionalLevels);
      for (MapEntry<StatType, num> traitValue in statValue.entries) {
        returnParts.add(
            "~ ${traitValue.key.formattedName}: ${traitValue.key.isPositive ? '+' : ' -'}${traitValue.key.isPercentage ? doublePercentFormater.format(traitValue.value) : traitValue.value}");
      }

      return returnParts.join("\n");
    }

    var currentLevel = traitLevels[traitName]!;

    currentLevelText =
        Text("Current Level ($currentLevel):\n${buildLevelString()}");
    if (currentLevel != 100) {
      nextLevelText = Text(
          "Next Level (${currentLevel + 1}):\n${buildLevelString(additionalLevels: 1)}");
    }

    hoverTooltip = Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        statDescription ?? const SizedBox.shrink(),
        currentLevelText,
        nextLevelText ?? const SizedBox.shrink()
      ],
    );
  }
}
