import 'dart:math';

import 'package:maplestory_builder/constants/legion/legion_artifat_stats.dart';
import 'package:maplestory_builder/constants/constants.dart';
import 'package:maplestory_builder/modules/base.dart';
import 'package:maplestory_builder/modules/utilities/utilities.dart';

class LegionArtifactModule implements Copyable {
  Map<int, LegionArtifact> legionArtifacts;

  Map<StatType, num>? cacheValue;

  LegionArtifactModule({
    Map<int, LegionArtifact>? legionArtifacts,
  }) : legionArtifacts = legionArtifacts ?? {
    1: LegionArtifact(),
    2: LegionArtifact(),
    3: LegionArtifact(),
    4: LegionArtifact(),
    5: LegionArtifact(),
    6: LegionArtifact(),
    7: LegionArtifact(),
    8: LegionArtifact(),
    9: LegionArtifact(),

  };

  @override
  LegionArtifactModule copyWith({
    Map<int, LegionArtifact>? legionArtifacts,
  }) {
    return LegionArtifactModule(
      legionArtifacts: legionArtifacts ?? mapDeepCopy(this.legionArtifacts),
    );
  }

  Map<StatType, num> calculateModuleStats() {
    if (cacheValue != null) {
      return cacheValue!;
    }

    Map<StatType, int> artifactStatLevels = {};
    Map<StatType, num> artifactStats = {};

    // Begin by calculating all the levels of each stat
    for (LegionArtifact legionArtifact in legionArtifacts.values) {
      for (StatType? statType in legionArtifact.artifactStats.values) {
        if (statType == null) {
          continue;
        }
        else {
          artifactStatLevels[statType] = (artifactStatLevels[statType] ?? 0) + legionArtifact.artifactLevel;
        }
      }
    }

    // Then calculate the actual stat value based on max level of 10
    for (MapEntry<StatType, int> artifactStatLevelsEntry in artifactStatLevels.entries) {
      artifactStats[artifactStatLevelsEntry.key] = artifactStatIncreases[artifactStatLevelsEntry.key]! * max(artifactStatLevelsEntry.value, maxArtifactStatlevel);
    }

    return artifactStats;
  }


  LegionArtifact getArtifact(int artifactPosition) {
    return legionArtifacts[artifactPosition]!;
  }

  bool addArtifactLevel(int artifactPosition) {
    if (legionArtifacts[artifactPosition]!.artifactLevel == maxArtifactlevel) {
      return false;
    }

    legionArtifacts[artifactPosition]!.artifactLevel += 1;

    cacheValue = null;
    return true;
  }

  bool subtractArtifactLevel(int artifactPosition) {
    if (legionArtifacts[artifactPosition]!.artifactLevel == 0) {
      return false;
    }

    legionArtifacts[artifactPosition]!.artifactLevel -= 1;

    cacheValue = null;
    return true;
  }

  void updateArtifactStat(int artifactPosition, int statPosition, StatType? statType) {
    legionArtifacts[artifactPosition]!.artifactStats[statPosition] = statType;
    cacheValue = null;
  }
}

class LegionArtifact implements Copyable {
  int artifactLevel;
  Map<int, StatType?> artifactStats;

  LegionArtifact({
    this.artifactLevel = 0,
    Map<int, StatType?>? artifactStats
  }) : artifactStats =  artifactStats ?? {
    1: null,
    2: null,
    3: null,
  };

  @override
  LegionArtifact copyWith({
    int? artifactLevel,
    Map<int, StatType?>? artifactStats
  }) {
    return LegionArtifact(
      artifactLevel: artifactLevel ?? this.artifactLevel,
      artifactStats: artifactStats ?? Map.of(this.artifactStats),
    );
  }
}