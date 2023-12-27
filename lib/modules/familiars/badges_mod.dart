import 'package:maplestory_builder/constants/constants.dart';
import 'package:maplestory_builder/constants/familiars/badge_stats.dart';
import 'package:maplestory_builder/modules/base.dart';
import 'package:maplestory_builder/modules/utilities/utilities.dart';

class BadgeModule implements Copyable {
  // There will be 8 active badges
  Map<int, BadgeName?> activebadges;
  Map<StatType, num> moduleStats;

  BadgeModule({
    Map<int, BadgeName?>? activebadges,
    Map<StatType, num>? moduleStats,
  }) : activebadges = activebadges ?? {},
      moduleStats = moduleStats ?? {};

  @override
  BadgeModule copyWith({
    Map<int, BadgeName?>? activebadges,
    Map<StatType, num>? moduleStats,
  }) {
    return BadgeModule(
      activebadges: activebadges ?? Map.of(this.activebadges),
      moduleStats: moduleStats ?? Map.of(this.moduleStats),
    );
  }

  void _updateStatFromBadge(BadgeName? badgeName) {
    if (badgeName == null) {
      return;
    }
    else {
      for (MapEntry<StatType, num> badgeStat in badgeName.badgeStats.entries) {
        switch(badgeStat.key) {
          case StatType.ignoreDefense:
            moduleStats[badgeStat.key] = calculateIgnoreDefense((moduleStats[badgeStat.key] ?? 0), badgeStat.value);
          default:
            moduleStats[badgeStat.key] = (moduleStats[badgeStat.key] ?? 0) + badgeStat.value;
        }
      }
    }
  }

  void calculateModuleStats() {
    moduleStats = {};

    for (BadgeName? badgeName in activebadges.values) {
      _updateStatFromBadge(badgeName);
    }
  }

  void equipBadge(BadgeName? badgeName, int badgePosition) {
    activebadges[badgePosition] = badgeName;

    calculateModuleStats();
  }

  BadgeName? getSelectedBadge(int badgePosition) {
    return activebadges[badgePosition];
  }
}