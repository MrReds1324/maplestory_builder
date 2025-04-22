import 'dart:math';

import 'package:flutter/material.dart';
import 'package:maplestory_builder/constants/legion/legion_artifat_stats.dart';
import 'package:maplestory_builder/constants/constants.dart';
import 'package:maplestory_builder/modules/base.dart';
import 'package:maplestory_builder/modules/utilities/utilities.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class LegionArtifactCrystalsModule implements Copyable {
  Map<int, ArtifactCrystal> artifactCrystals;

  Map<StatType, num>? cacheValue;

  LegionArtifactCrystalsModule({
    Map<int, ArtifactCrystal>? legionArtifacts,
  }) : artifactCrystals = legionArtifacts ?? {
    1: ArtifactCrystal(),
    2: ArtifactCrystal(),
    3: ArtifactCrystal(),
    4: ArtifactCrystal(),
    5: ArtifactCrystal(),
    6: ArtifactCrystal(),
    7: ArtifactCrystal(),
    8: ArtifactCrystal(),
    9: ArtifactCrystal(),
  };

  @override
  LegionArtifactCrystalsModule copyWith({
    Map<int, ArtifactCrystal>? artifactCrystals,
  }) {
    return LegionArtifactCrystalsModule(
      legionArtifacts: artifactCrystals ?? mapDeepCopy(this.artifactCrystals),
    );
  }

  int calculateUsedAbilityPoints() {
    int usedAbilityPoints = 0;
    for (MapEntry<int, ArtifactCrystal> crystalEntry in artifactCrystals.entries) {
      usedAbilityPoints += crystalEntry.value.artifactCrystalCost;
    }
    return usedAbilityPoints;
  }

  Map<StatType, num> calculateModuleStats(int activeArtifactCount) {
    if (cacheValue != null) {
      return cacheValue!;
    }

    if (activeArtifactCount == 0) {
      cacheValue = {};
      return {};
    }

    Map<StatType, int> artifactStatLevels = {};
    Map<StatType, num> artifactStats = {};

    // Begin by calculating all the levels of each stat
    for (MapEntry<int, ArtifactCrystal> artifactCrystalEntry in artifactCrystals.entries) {
      if (artifactCrystalEntry.key > activeArtifactCount) {
        continue;
      }

      for (StatType? statType in artifactCrystalEntry.value.artifactCrystalStats.values) {
        if (statType == null) {
          continue;
        }
        else {
          artifactStatLevels[statType] = (artifactStatLevels[statType] ?? 0) + artifactCrystalEntry.value.artifactCrystalLevel;
        }
      }
    }

    // Then calculate the actual stat value based on max level of 10
    for (MapEntry<StatType, int> artifactStatLevelsEntry in artifactStatLevels.entries) {
      artifactStats[artifactStatLevelsEntry.key] = ARTIFACT_STAT_INCREMENTS[artifactStatLevelsEntry.key]! * min(artifactStatLevelsEntry.value, MAX_ARTIFACT_STAT_LEVEL);
    }

    return artifactStats;
  }


  ArtifactCrystal getArtifactCrystal(int artifactCrystalPosition) {
    return artifactCrystals[artifactCrystalPosition]!;
  }

  bool addArtifactLevel(int artifactCrystalPosition, int availableAbilityPoints) {
    var crystalTarget = artifactCrystals[artifactCrystalPosition]!;

    if (crystalTarget.artifactCrystalLevel == MAX_ARTIFACT_CRYSTAL_LEVEL) {
      return false;
    }
    else if (ARTIFACT_CRYSTAL_LEVEL_COST[crystalTarget.artifactCrystalLevel + 1]! > availableAbilityPoints) {
      return false;
    }

    crystalTarget.artifactCrystalLevel += 1;
    crystalTarget.artifactCrystalCost += ARTIFACT_CRYSTAL_LEVEL_COST[crystalTarget.artifactCrystalLevel]!;

    cacheValue = null;
    return true;
  }

  bool subtractArtifactLevel(int artifactCrystalPosition) {
    if (artifactCrystals[artifactCrystalPosition]!.artifactCrystalLevel == 1) {
      return false;
    }

    var crystalTarget = artifactCrystals[artifactCrystalPosition]!;
    crystalTarget.artifactCrystalCost -= ARTIFACT_CRYSTAL_LEVEL_COST[crystalTarget.artifactCrystalLevel]!;
    crystalTarget.artifactCrystalLevel -= 1;

    cacheValue = null;
    return true;
  }

  void updateArtifactStat(int artifactCrystalPosition, int statPosition, StatType? statType) {
    artifactCrystals[artifactCrystalPosition]!.artifactCrystalStats[statPosition] = statType;
    cacheValue = null;
  }
}

class ArtifactCrystal implements Copyable {
  int artifactCrystalLevel;
  int artifactCrystalCost;
  Map<int, StatType?> artifactCrystalStats;

  ArtifactCrystal({
    this.artifactCrystalLevel = 1,
    this.artifactCrystalCost = 0,
    Map<int, StatType?>? artifactStats
  }) : artifactCrystalStats =  artifactStats ?? {
    1: null,
    2: null,
    3: null,
  };

  @override
  ArtifactCrystal copyWith({
    int? artifactCrystalLevel,
    int? artifactCrystalCost,
    Map<int, StatType?>? artifactCrystalStats
  }) {
    return ArtifactCrystal(
      artifactCrystalLevel: artifactCrystalLevel ?? this.artifactCrystalLevel,
      artifactCrystalCost: artifactCrystalCost ?? this.artifactCrystalCost,
      artifactStats: artifactCrystalStats ?? Map.of(this.artifactCrystalStats),
    );
  }

  Widget buildLevelWidget(BuildContext context) { 
    var unfilled = MAX_ARTIFACT_CRYSTAL_LEVEL - artifactCrystalLevel;
    var starGroup = <Icon>[];

    for (var i = 0; i < artifactCrystalLevel; i++){
      starGroup.add(FILLED_STAR);
    }

    for (var i = 0; i < unfilled; i++){
      starGroup.add(EMPTY_STAR);
    }

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: starGroup
    );
  }

  Widget getArtifactImage(BuildContext context, int artifactCrystalPosition, bool enabled) {
    String assetPath;
    if (enabled) {
      int levelToPart;
      switch (artifactCrystalLevel) {
        case 0:
          levelToPart = 0;
        case 1:
        case 2:
        case 3:
        case 4:
          levelToPart = 1;
        case 5:
          levelToPart = 4;
        default:
          levelToPart = 0;
      }
      assetPath = "assets/images/legion_artifacts/$artifactCrystalPosition.$levelToPart.png";
    }
    else {
      assetPath = "assets/images/legion_artifacts/$artifactCrystalPosition.disabled.png";
    }

    return Image(image: AssetImage(assetPath),
        height: 135, errorBuilder: (ctx, error, stackTrace) => Icon(
      MdiIcons.accountBox,
      size: 115,
    )
    );
  }
}