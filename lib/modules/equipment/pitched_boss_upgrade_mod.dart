import 'package:flutter/material.dart';
import 'package:maplestory_builder/constants/constants.dart';
import 'package:maplestory_builder/constants/equipment/pitched_boss_upgrades.dart';

class PitchedBossUpgradeModule {
  final PitchedBossUpgrade pitchedBossUpgrade;
  bool isActive;

  PitchedBossUpgradeModule({
    required this.pitchedBossUpgrade,
    this.isActive = false,
  });

  PitchedBossUpgradeModule copyWith({
    PitchedBossUpgrade? pitchedBossUpgrade,
    bool? isActive,
  }) {
    return PitchedBossUpgradeModule(
      pitchedBossUpgrade: pitchedBossUpgrade ?? this.pitchedBossUpgrade,
      isActive: isActive ?? this.isActive,
    );
  }

  Widget createPitchedBossUpgradeContainer() {
    return const SizedBox.shrink();
  }

  num get(StatType statType) {
    return isActive ? pitchedBossUpgrade.upgradeStats[statType] ?? 0 : 0;
  }

}