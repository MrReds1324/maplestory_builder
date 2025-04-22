import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:maplestory_builder/constants/constants.dart';
import 'package:maplestory_builder/modules/base.dart';
import 'package:maplestory_builder/modules/familiars/familiar_badge.dart';

class BadgeModule implements Copyable {
  static Map<int, FamiliarBadge> allBadges = {};
  static Future<void> loadingBadges = BadgeModule.loadFamiliarBadges();

  // There will be 8 active badges
  Map<int, FamiliarBadge?> activeBadges;
  Map<StatType, num> moduleStats;

  BadgeModule({
    Map<int, FamiliarBadge?>? activeBadges,
    Map<StatType, num>? moduleStats,
  }) : activeBadges = activeBadges ?? {},
      moduleStats = moduleStats ?? {};

  @override
  BadgeModule copyWith({
    Map<int, FamiliarBadge?>? activeBadges,
    Map<StatType, num>? moduleStats,
  }) {
    return BadgeModule(
      activeBadges: activeBadges ?? Map.of(this.activeBadges),
      moduleStats: moduleStats ?? Map.of(this.moduleStats),
    );
  }

  void _updateStatFromBadge(FamiliarBadge? familiarBadge) {
    if (familiarBadge == null) {
      return;
    }
    else {
      for (MapEntry<StatType, num> badgeStat in familiarBadge.badgeStats.entries) {
        moduleStats[badgeStat.key] = (moduleStats[badgeStat.key] ?? 0) + badgeStat.value;
      }
    }
  }

  void calculateModuleStats() {
    moduleStats = {};

    for (FamiliarBadge? familiarBadge in activeBadges.values) {
      _updateStatFromBadge(familiarBadge);
    }
  }

  void equipBadge(FamiliarBadge? familiarBadge, int badgePosition) {
    activeBadges[badgePosition] = familiarBadge;

    calculateModuleStats();
  }

  FamiliarBadge? getSelectedBadge(int badgePosition) {
    return activeBadges[badgePosition];
  }

  static Future<void> loadFamiliarBadges() async {
    String data = await rootBundle.loadString('assets/items/familiar_badges.json');

    Map<int, FamiliarBadge> returnValue = {};

    var jsonData = json.decode(data);
    for (MapEntry<String, dynamic> badgeEntry in jsonData.entries) {
      var badgeId = int.parse(badgeEntry.key);
      var badge = FamiliarBadge.loadFromJson(badgeId, badgeEntry.value);
      returnValue[badgeId] = badge;
      BadgeModule.allBadges[badgeId] = badge;
    }
  }
}