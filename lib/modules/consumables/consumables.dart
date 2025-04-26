import 'package:maplestory_builder/constants/constants.dart';
import 'package:maplestory_builder/modules/utilities/json_utilities.dart';

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

}