import 'package:flutter/material.dart';
import 'package:maplestory_builder/constants/constants.dart';
import 'package:maplestory_builder/constants/equipment/pitched_boss_upgrades.dart';
import 'package:maplestory_builder/modules/base.dart';

class PitchedBossUpgradeModule implements Copyable {
  final PitchedBossUpgrade pitchedBossUpgrade;
  bool isActive;

  PitchedBossUpgradeModule({
    required this.pitchedBossUpgrade,
    this.isActive = false,
  });

  @override
  PitchedBossUpgradeModule copyWith({
    PitchedBossUpgrade? pitchedBossUpgrade,
    bool? isActive,
  }) {
    return PitchedBossUpgradeModule(
      pitchedBossUpgrade: pitchedBossUpgrade ?? this.pitchedBossUpgrade,
      isActive: isActive ?? this.isActive,
    );
  }

  num get(StatType statType) {
    return isActive ? pitchedBossUpgrade.upgradeStats[statType] ?? 0 : 0;
  }

  void activatePitchedBossUpgrade(bool trigger) {
    isActive = trigger;
  }

  Widget createPitchedBossUpgradeContainer(BuildContext context) {
    List<Widget> createTextLines(BuildContext context) {
      List<Widget> childrenRows = [
        Text(
          pitchedBossUpgrade.formattedName,
          style: Theme.of(context).textTheme.bodyLarge?.copyWith(decoration: TextDecoration.underline),
        ),
      ];
      
      pitchedBossUpgrade.upgradeStats.forEach((key, value) {
        childrenRows.add(
          Text(
            "${key.formattedName}: +$value",
            style: Theme.of(context).textTheme.bodyMedium,
          ),
        );
      });

      return childrenRows;
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: createTextLines(context)
    );
  }
}