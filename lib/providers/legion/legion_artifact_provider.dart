import 'package:flutter/material.dart';
import 'package:maplestory_builder/constants/constants.dart';
import 'package:maplestory_builder/modules/base.dart';
import 'package:maplestory_builder/modules/legion/legion_artifact_mod.dart';
import 'package:maplestory_builder/modules/utilities/utilities.dart';

class LegionArtifactProvider with ChangeNotifier implements Copyable {
  
  late Map<int, LegionArtifactModule> artifactSets;
  late LegionArtifactModule activeArtifactSet;
  int activeSetNumber;
  int legionArtifactLevel;

  Widget hoverTooltip = const SizedBox.shrink();

  LegionArtifactProvider({
    this.legionArtifactLevel = 0,
    this.activeSetNumber = 1,
    Map<int, LegionArtifactModule>? artifactSets,
    LegionArtifactModule? activeArtifactSet,
  }) {
    this.artifactSets = artifactSets ?? {
      1: LegionArtifactModule(),
      2: LegionArtifactModule(),
      3: LegionArtifactModule(),
      4: LegionArtifactModule(),
      5: LegionArtifactModule(),
    };
    this.activeArtifactSet = activeArtifactSet ?? this.artifactSets[activeSetNumber]!;
  }

  @override
  LegionArtifactProvider copyWith({
    int? legionArtifactLevel,
    int? activeSetNumber,
    Map<int, LegionArtifactModule>? artifactSets,
    LegionArtifactModule? activeArtifactSet
  }) {
    return LegionArtifactProvider(
      legionArtifactLevel: legionArtifactLevel ?? this.legionArtifactLevel,
      activeSetNumber: activeSetNumber ?? this.activeSetNumber,
      activeArtifactSet: activeArtifactSet ?? this.activeArtifactSet.copyWith(),
      artifactSets: artifactSets ?? mapDeepCopy(this.artifactSets),
    );
  }

  Map<StatType, num> calculateStats() {
    return activeArtifactSet.calculateModuleStats();
  }

  void addArtifactLevel(int artifactPosition) {
    if (activeArtifactSet.addArtifactLevel(artifactPosition)) {
      notifyListeners();
    }
  }

  void subtractArtifactLevel(int artifactPosition) {
    if (activeArtifactSet.subtractArtifactLevel(artifactPosition)) {
      notifyListeners();
    }
  }

  void updateArtifactStat(int artifactPosition, int statPosition, StatType? statType) {
    activeArtifactSet.updateArtifactStat(artifactPosition, statPosition, statType);
    notifyListeners();
  }

  void changeActiveSet(int artifactSetPosition) {
    activeSetNumber = artifactSetPosition;
    activeArtifactSet = artifactSets[artifactSetPosition]!;

    notifyListeners();
  }
}