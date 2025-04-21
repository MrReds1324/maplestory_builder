import 'package:maplestory_builder/constants/constants.dart';

Map<StatType, num> loadJsonStatMap(Map<String, dynamic> jsonStatMap) {
  Map<StatType, num> stats = {};

  for (MapEntry<String, dynamic> statEntry in jsonStatMap.entries) {
    stats[StatType.values.byName(statEntry.key)] = statEntry.value;
  }

  return stats;
}

List<Map<StatType, num>> loadJsonRandomStats(List<dynamic> jsonRandomStats) {
  List<Map<StatType, num>> randomStats = [];

  for (Map<String, dynamic> randomStatEntry in jsonRandomStats) {
    randomStats.add(loadJsonStatMap(randomStatEntry));
  }

  return randomStats;
}