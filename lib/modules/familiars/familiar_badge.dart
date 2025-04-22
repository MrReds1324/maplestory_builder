import 'package:flutter/material.dart';

import 'package:maplestory_builder/constants/constants.dart';

import 'package:maplestory_builder/modules/utilities/json_utilities.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class FamiliarBadge {

  String badgeName;
  int badgeId;
  Map<StatType, num> badgeStats;
  List<Map<StatType, num>> randomStats;

  FamiliarBadge({
    required this.badgeName,
    required this.badgeId,
    required this.badgeStats,
    required this.randomStats
  });

  static FamiliarBadge loadFromJson(int badgeId, Map<String, dynamic> jsonData) {
    String badgeName = jsonData["badgeName"];
    Map<StatType, num> badgeStats = loadJsonStatMap(jsonData["badgeStats"]);
    List<Map<StatType, num>> randomStats = loadJsonRandomStats(jsonData["randomStats"]);

    return FamiliarBadge(badgeName: badgeName, badgeId: badgeId, badgeStats: badgeStats, randomStats: randomStats);
  }

  Widget createBadgeContainer(BuildContext context) {
    Widget assetImage = Image(image: AssetImage('assets/images/familiar_badges/${badgeId}.png'), height: 105, errorBuilder: (ctx, error, stackTrace) => Icon(
        MdiIcons.accountBox,
        size: 96,
      ));

    List<Widget> statWidgets = [assetImage];

    for (MapEntry<StatType, num> statEntry in badgeStats.entries) {
      statWidgets.add(
        statEntry.key.buildRowDisplayWithValue(context, statEntry.value, 150, constraints: const BoxConstraints(maxWidth: 120))
      );
    }

    return Column(
      children: statWidgets,
    );
  }
}
