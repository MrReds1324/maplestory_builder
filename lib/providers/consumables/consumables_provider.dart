import 'package:flutter/material.dart';
import 'package:maplestory_builder/constants/constants.dart';
import 'package:maplestory_builder/constants/consumables/consumables.dart';
import 'package:maplestory_builder/modules/base.dart';
import 'package:maplestory_builder/modules/consumables/consumables_mod.dart';
import 'package:maplestory_builder/modules/utilities/utilities.dart';
import 'package:maplestory_builder/providers/familiars/familiars_provider.dart';

class ConsumablesProvider with ChangeNotifier implements Copyable {
  int activeSetNumber;
  late Map<int, ConsumablesModule> consumablesSets; 
  late ConsumablesModule activeConsumablesSet;

  ConsumablesProvider({
    this.activeSetNumber = 1,
    Map<int, ConsumablesModule>? consumablesSets,
    ConsumablesModule? activeConsumablesSet,
  }) {
    this.consumablesSets = consumablesSets ?? {
      1: ConsumablesModule(),
      2: ConsumablesModule(),
      3: ConsumablesModule(),
      4: ConsumablesModule(),
      5: ConsumablesModule(),
    };
    this.activeConsumablesSet = activeConsumablesSet ?? this.consumablesSets[activeSetNumber]!;
  }

  @override
  ConsumablesProvider copyWith({
    int? activeSetNumber,
    Map<int, ConsumablesModule>? consumablesSets,
    ConsumablesModule? activeConsumablesSet,
  }) {
    return ConsumablesProvider(
      activeSetNumber: activeSetNumber ?? this.activeSetNumber,
      consumablesSets: consumablesSets ?? mapDeepCopy(this.consumablesSets),
      activeConsumablesSet: activeConsumablesSet ?? this.activeConsumablesSet.copyWith()
    );
  }

  ConsumablesProvider update(FamiliarsProvider familiarsProvider) {
    // TODO - large drop fam does not stack with drop coupons
    return this;
  }

  Map<StatType, num> calculateStats() {
    return activeConsumablesSet.calculateStats();
  }

  void selectConsumable(ConsumableName consumableName) {
    activeConsumablesSet.selectConsumable(consumableName);
    notifyListeners();
  }

  void changeActiveSet(int newSetNumber) {
    activeSetNumber = newSetNumber;
    activeConsumablesSet = consumablesSets[newSetNumber]!;

    notifyListeners();
  }
}
