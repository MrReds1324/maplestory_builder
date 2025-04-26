import 'dart:convert';
import 'dart:math';

import 'package:flutter/services.dart' show rootBundle;
import 'package:maplestory_builder/constants/constants.dart';
import 'package:maplestory_builder/constants/consumables/consumables.dart';
import 'package:maplestory_builder/modules/base.dart';
import 'package:maplestory_builder/modules/consumables/consumables.dart';
import 'package:maplestory_builder/modules/utilities/utilities.dart';

class ConsumablesModule implements Copyable {
  static Map<String, Consumable> allConsumables = {};
  static Future<void> loadingConsumables = ConsumablesModule.loadConsumables();

  // This tracks the consumables we have selected, as well as if it has been disabled
  // The fact that the consumable exists in the map means we have selected it, and the bool will determine if the effect takes place
  Map<ConsumableName, bool> selectedConsumables;

  Map<StatType, num>? cacheValue;

  ConsumablesModule({
    Map<ConsumableName, bool>? selectedConsumables,
  }) :
    selectedConsumables = selectedConsumables ?? {};

  @override
  ConsumablesModule copyWith({
    Map<ConsumableName, bool>? selectedConsumables,
  }) {
    return ConsumablesModule(
      selectedConsumables: selectedConsumables ?? Map.of(this.selectedConsumables),
    );
  }

  void selectConsumable(ConsumableName consumableName, bool? isAdding) {
    // TODO figure out if this consumable takes effect or not

    if (isAdding == true) {
      selectedConsumables[consumableName] = true;
    }
    else {
      selectedConsumables.remove(consumableName);
    }
    cacheValue = null;
  }

  Map<StatType, num> calculateStats() {
    if (cacheValue != null) {
      return cacheValue!;
    }

    Map<StatType, num> consumablesStats = {};

    void updateStatFromConsumableName(MapEntry<ConsumableName, bool> consumableEntry) {
      if (!consumableEntry.value) {
        return;
      }
      else {
        for (MapEntry<StatType, num> consumableStats in consumableEntry.key.statValues.entries) {
          switch(consumableStats.key) {
            case StatType.itemDropRate:
              consumablesStats[consumableStats.key] = min((consumablesStats[consumableStats.key] ?? 0) + consumableStats.value, DROP_RATE_USE_CAP);
            case StatType.mesosObtained:
              consumablesStats[consumableStats.key] = min((consumablesStats[consumableStats.key] ?? 0) + consumableStats.value, MESOS_OBTAINED_USE_CAP);
            case StatType.expMultiplicative:
              consumablesStats[consumableStats.key] = (consumablesStats[consumableStats.key] ?? 1) * (1 + consumableStats.value);
            case StatType.ignoreDefense:
              consumablesStats[consumableStats.key] = calculateIgnoreDefense((consumablesStats[consumableStats.key] ?? 0), consumableStats.value);
            default:
              consumablesStats[consumableStats.key] = (consumablesStats[consumableStats.key] ?? 0) + consumableStats.value;
          }
        }
      }
    }

    for (MapEntry<ConsumableName, bool> consumableEntry in selectedConsumables.entries) {
      updateStatFromConsumableName(consumableEntry);
    }

    cacheValue = consumablesStats;
    return consumablesStats;
  }

  static Future<void> loadConsumables() async {
    String data = await rootBundle.loadString('assets/items/consumables.json');

    var jsonData = json.decode(data);
    for (MapEntry<String, dynamic> consumableEntry in jsonData.entries) {
      var consumableId = consumableEntry.key;
      var consumable = Consumable.loadFromJson(consumableId, consumableEntry.value);
      ConsumablesModule.allConsumables[consumableId] = consumable;
    }
  }
}