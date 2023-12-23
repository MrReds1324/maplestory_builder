import 'dart:math';

import 'package:maplestory_builder/constants/legion/legion_artifat_stats.dart';
import 'package:maplestory_builder/constants/constants.dart';
import 'package:maplestory_builder/modules/base.dart';
import 'package:maplestory_builder/modules/utilities/utilities.dart';

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

  Map<StatType, num> calculateModuleStats(int activeArtifactCount) {
    if (cacheValue != null) {
      return cacheValue!;
    }

    Map<StatType, int> artifactStatLevels = {};
    Map<StatType, num> artifactStats = {};

    // Begin by calculating all the levels of each stat
    for (ArtifactCrystal legionArtifact in artifactCrystals.values) {
      for (StatType? statType in legionArtifact.artifactCrystalStats.values) {
        if (statType == null) {
          continue;
        }
        else {
          artifactStatLevels[statType] = (artifactStatLevels[statType] ?? 0) + legionArtifact.artifactCrystalLevel;
        }
      }
    }

    // Then calculate the actual stat value based on max level of 10
    for (MapEntry<StatType, int> artifactStatLevelsEntry in artifactStatLevels.entries) {
      artifactStats[artifactStatLevelsEntry.key] = artifactStatIncreases[artifactStatLevelsEntry.key]! * max(artifactStatLevelsEntry.value, maxArtifactStatlevel);
    }

    return artifactStats;
  }


  ArtifactCrystal getArtifactCrystal(int artifacCrystaltPosition) {
    return artifactCrystals[artifacCrystaltPosition]!;
  }

  bool addArtifactLevel(int artifacCrystaltPosition) {
    if (artifactCrystals[artifacCrystaltPosition]!.artifactCrystalLevel == maxArtifactCrystalLevel) {
      return false;
    }

    artifactCrystals[artifacCrystaltPosition]!.artifactCrystalLevel += 1;

    cacheValue = null;
    return true;
  }

  bool subtractArtifactLevel(int artifacCrystaltPosition) {
    if (artifactCrystals[artifacCrystaltPosition]!.artifactCrystalLevel == 0) {
      return false;
    }

    artifactCrystals[artifacCrystaltPosition]!.artifactCrystalLevel -= 1;

    cacheValue = null;
    return true;
  }

  void updateArtifactStat(int artifacCrystaltPosition, int statPosition, StatType? statType) {
    artifactCrystals[artifacCrystaltPosition]!.artifactCrystalStats[statPosition] = statType;
    cacheValue = null;
  }
}

class ArtifactCrystal implements Copyable {
  int artifactCrystalLevel;
  Map<int, StatType?> artifactCrystalStats;

  ArtifactCrystal({
    this.artifactCrystalLevel = 0,
    Map<int, StatType?>? artifactStats
  }) : artifactCrystalStats =  artifactStats ?? {
    1: null,
    2: null,
    3: null,
  };

  @override
  ArtifactCrystal copyWith({
    int? artifactCrystalLevel,
    Map<int, StatType?>? artifactCrystalStats
  }) {
    return ArtifactCrystal(
      artifactCrystalLevel: artifactCrystalLevel ?? this.artifactCrystalLevel,
      artifactStats: artifactCrystalStats ?? Map.of(this.artifactCrystalStats),
    );
  }
}