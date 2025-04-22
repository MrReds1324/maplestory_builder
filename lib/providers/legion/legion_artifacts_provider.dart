import 'dart:math';

import 'package:flutter/material.dart';
import 'package:maplestory_builder/constants/constants.dart';
import 'package:maplestory_builder/constants/legion/legion_artifat_stats.dart';
import 'package:maplestory_builder/modules/base.dart';
import 'package:maplestory_builder/modules/legion/legion_artifact_mod.dart';
import 'package:maplestory_builder/modules/utilities/utilities.dart';

class LegionArtifactProvider with ChangeNotifier implements Copyable {
  late Map<int, LegionArtifactCrystalsModule> artifactSets;
  late LegionArtifactCrystalsModule activeCrystalSet;
  int activeSetNumber;
  int legionArtifactLevel;
  int abilityPoints;
  int usedAbilityPoints;

  int get activeArtifactCount {
    if (legionArtifactLevel == 0) {
      return 0;
    }
    else if (1 <= legionArtifactLevel && legionArtifactLevel <= 9) {
      return 3;
    }
    else if (10 <= legionArtifactLevel && legionArtifactLevel <= 19) {
      return 4;
    }
    else if (20 <= legionArtifactLevel && legionArtifactLevel <= 29) {
      return 5;
    }
    else if (30 <= legionArtifactLevel && legionArtifactLevel <= 39) {
      return 6;
    }
    else if (40 <= legionArtifactLevel && legionArtifactLevel <= 49) {
      return 7;
    }
    else if (50 <= legionArtifactLevel && legionArtifactLevel <= 59) {
      return 8;
    }
    else {
      return 9;
    }
  }

  LegionArtifactProvider({
    this.legionArtifactLevel = 0,
    this.activeSetNumber = 1,
    this.abilityPoints = 0,
    this.usedAbilityPoints = 0,
    Map<int, LegionArtifactCrystalsModule>? artifactSets,
    LegionArtifactCrystalsModule? activeCrystalSet,
  }) {
    this.artifactSets = artifactSets ?? {
      1: LegionArtifactCrystalsModule(),
      2: LegionArtifactCrystalsModule(),
      3: LegionArtifactCrystalsModule(),
      4: LegionArtifactCrystalsModule(),
      5: LegionArtifactCrystalsModule(),
    };
    this.activeCrystalSet = activeCrystalSet ?? this.artifactSets[activeSetNumber]!;
  }

  @override
  LegionArtifactProvider copyWith({
    int? legionArtifactLevel,
    int? activeSetNumber,
    int? abilityPoints,
    int? usedAbilityPoints,
    Map<int, LegionArtifactCrystalsModule>? artifactSets,
    LegionArtifactCrystalsModule? activeCrystalSet
  }) {
    return LegionArtifactProvider(
      legionArtifactLevel: legionArtifactLevel ?? this.legionArtifactLevel,
      activeSetNumber: activeSetNumber ?? this.activeSetNumber,
      abilityPoints: abilityPoints ?? this.abilityPoints,
      usedAbilityPoints: usedAbilityPoints ?? this.usedAbilityPoints,
      activeCrystalSet: activeCrystalSet ?? this.activeCrystalSet.copyWith(),
      artifactSets: artifactSets ?? mapDeepCopy(this.artifactSets),
    );
  }

  Map<StatType, num> calculateStats() {
    return activeCrystalSet.calculateModuleStats(activeArtifactCount);
  }

  void addLegionArtifactLevels(int levelsToAdd) {
    if (legionArtifactLevel == 60) {
      return;
    }

    legionArtifactLevel += min(levelsToAdd, MAX_LEGION_ARTIFACT_LEVEL - legionArtifactLevel);
    abilityPoints = ARTIFACT_ABILITY_POINTS_BY_LEVEL[legionArtifactLevel]!;

    // Invalidate the caches in case we go over the boundary of increasing the active crystal count
    for (LegionArtifactCrystalsModule legionArtifactModule in artifactSets.values) {
      legionArtifactModule.cacheValue = null;
    } 

    notifyListeners();
  }

  void subtractLegionArtifactLevels(int levelsToSubtract) {
    if (legionArtifactLevel == 0) {
      return;
    }

    legionArtifactLevel -= min(levelsToSubtract, legionArtifactLevel);
    abilityPoints = ARTIFACT_ABILITY_POINTS_BY_LEVEL[legionArtifactLevel]!;

    // Invalidate the caches in case we go over the boundary of decreasing the active crystal count
    for (LegionArtifactCrystalsModule legionArtifactModule in artifactSets.values) {
      legionArtifactModule.cacheValue = null;
    } 

    notifyListeners();
  }

  void updateUsedAbilityPoints() {
    usedAbilityPoints = activeCrystalSet.calculateUsedAbilityPoints();
  }

  void addArtifactLevel(int artifactPosition) {
    if (usedAbilityPoints == abilityPoints) {
      return;
    }
    if (activeCrystalSet.addArtifactLevel(artifactPosition, abilityPoints - usedAbilityPoints)) {
      updateUsedAbilityPoints();
      notifyListeners();
    }
  }

  void subtractArtifactLevel(int artifactPosition) {
    if (activeCrystalSet.subtractArtifactLevel(artifactPosition)) {
      updateUsedAbilityPoints();
      notifyListeners();
    }
  }

  void updateArtifactStat(int artifactPosition, int statPosition, StatType? statType) {
    activeCrystalSet.updateArtifactStat(artifactPosition, statPosition, statType);
    notifyListeners();
  }

  void changeActiveSet(int artifactSetPosition) {
    activeSetNumber = artifactSetPosition;
    activeCrystalSet = artifactSets[artifactSetPosition]!;
    updateUsedAbilityPoints();

    notifyListeners();
  }
}