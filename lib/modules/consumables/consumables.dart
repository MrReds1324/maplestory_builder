import 'package:flutter/material.dart';
import 'package:maplestory_builder/constants/constants.dart';
import 'package:maplestory_builder/modules/utilities/json_utilities.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class Consumable {
  String name;
  String description;
  String consumableId;
  Map<StatType, num> consumableStats;
  int duration;

  Consumable({
    required this.name,
    required this.description,
    required this.consumableId,
    required this.consumableStats,
    required this.duration
});

  static Consumable loadFromJson(String consumableId, Map<String, dynamic> jsonData) {
    String name = jsonData["name"];
    String description = jsonData["description"];
    Map<StatType, num> consumableStats = loadJsonStatMap(jsonData["consumableStats"]);
    int duration = (consumableStats.remove(StatType.duration) ?? 0).toInt();

    return Consumable(name: name, description: description, consumableId: consumableId, consumableStats: consumableStats, duration: duration);
  }

  String getDurationString() {
    if (duration >= 3600000) {
      var formattedTime = duration ~/ 3600000;
      return "$formattedTime hours";
    }
    else if (duration >= 60000) {
      var formattedTime = duration ~/ 60000;
      return "$formattedTime minutes";
    }
    else {
      return "${(duration / 1000).toInt()} seconds";
    }
  }

  Image getAssetImage() {
    return Image(image: AssetImage('assets/images/consumables/$consumableId.png'), height: 40, errorBuilder: (ctx, error, stackTrace) => Icon(
      MdiIcons.accountBox,
      size: 40,
    ));
  }

  Widget createConsumableContainer(BuildContext context) {
    List<Widget> statWidgets = [];

    for (MapEntry<StatType, num> statEntry in consumableStats.entries) {
      statWidgets.add(
          statEntry.key.buildRowDisplayWithValue(context, statEntry.value, 170, constraints: const BoxConstraints(maxWidth: 120))
      );
    }

    return Column(
      children: statWidgets,
    );
  }
}