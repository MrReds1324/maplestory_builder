import 'package:flutter/material.dart';

import 'package:maplestory_builder/constants/constants.dart';

import 'package:maplestory_builder/modules//utilities/utilities.dart';
import 'package:maplestory_builder/modules/utilities/json_utilities.dart';

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
    List<Widget> statWidgets = [];
    for (MapEntry<StatType, num> statEntry in badgeStats.entries) {
      statWidgets.add(
          SizedBox(
              width: 150,
              child: Row(
                  children: [
                    Container(
                      constraints: const BoxConstraints(maxWidth: 120),
                      child: Text(
                        statEntry.key.formattedName,
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                    ),
                    Text(
                        " ${statEntry.key.isPositive ? '+' : ' -'}${statEntry.key.isPercentage ? doubleRoundPercentFormater.format(statEntry.value) : statEntry.value}",
                        style: Theme.of(context).textTheme.bodyMedium
                    )
                  ]
              )
          )
      );
    }

    return Column(
      children: statWidgets,
    );
  }
}