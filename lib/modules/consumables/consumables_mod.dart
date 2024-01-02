import 'package:maplestory_builder/constants/constants.dart';
import 'package:maplestory_builder/constants/consumables/consumables.dart';
import 'package:maplestory_builder/modules/base.dart';

class ConsumablesModule implements Copyable {
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

  void selectConsumable(ConsumableName consumableName) {
    // TODO figure out if this consumable takes effect or not
    cacheValue = null;
  }

  Map<StatType, num> calculateStats() {
    if (cacheValue != null) {
      return cacheValue!;
    }

    Map<StatType, num> consumableStats = {};


    cacheValue = consumableStats;
    return consumableStats;
  }
}