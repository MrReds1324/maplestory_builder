import 'package:flutter/material.dart';
import 'package:maplestory_builder/constants/constants.dart';
import 'package:maplestory_builder/modules/base.dart';
import 'package:maplestory_builder/modules/consumables/consumables.dart';
import 'package:maplestory_builder/modules/consumables/consumables_mod.dart';
import 'package:maplestory_builder/modules/utilities/utilities.dart';
import 'package:maplestory_builder/providers/familiars/familiars_provider.dart';

class ConsumablesProvider with ChangeNotifier implements Copyable {
  int activeSetNumber;
  late Map<int, ConsumablesModule> consumablesSets; 
  late ConsumablesModule activeConsumablesSet;
  bool isDropFamiliarActive;

  ConsumablesProvider({
    this.activeSetNumber = 1,
    Map<int, ConsumablesModule>? consumablesSets,
    ConsumablesModule? activeConsumablesSet,
    this.isDropFamiliarActive = false,
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

  // Set<BuffSlot> get disabledBuffSlots {
  //   int alchemyPotionCounter = 0;
  //   Set<BuffSlot> disabledBuffSlots = isDropFamiliarActive ? {BuffSlot.dropCoupon} : {};
  //
  //   for (String consumableId in activeConsumablesSet.activeConsumables) {
  //     disabledBuffSlots.addAll(consumableName.buffSlots);
  //
  //     if (alchemyPotionCounter < 2 && consumableName.buffSlots.contains(BuffSlot.alchemyPotion)) {
  //       alchemyPotionCounter += 1;
  //       if (alchemyPotionCounter == 1) {
  //         disabledBuffSlots.remove(BuffSlot.alchemyPotion);
  //       }
  //     }
  //   }
  //   return disabledBuffSlots;
  // }

  @override
  ConsumablesProvider copyWith({
    int? activeSetNumber,
    Map<int, ConsumablesModule>? consumablesSets,
    ConsumablesModule? activeConsumablesSet,
    bool? isDropFamiliarActive,
  }) {
    return ConsumablesProvider(
      activeSetNumber: activeSetNumber ?? this.activeSetNumber,
      consumablesSets: consumablesSets ?? mapDeepCopy(this.consumablesSets),
      activeConsumablesSet: activeConsumablesSet ?? this.activeConsumablesSet.copyWith(),
      isDropFamiliarActive: isDropFamiliarActive ?? this.isDropFamiliarActive,
    );
  }

  ConsumablesProvider update(FamiliarsProvider familiarsProvider) {
    // TODO - drop fam does not stack with drop coupons
    return this;
  }

  Map<StatType, num> calculateStats() {
    return activeConsumablesSet.calculateStats();
  }

  void activateConsumable(Consumable consumable) {
    activeConsumablesSet.activateConsumable(consumable);
    notifyListeners();
  }

  void changeActiveSet(int newSetNumber) {
    activeSetNumber = newSetNumber;
    activeConsumablesSet = consumablesSets[newSetNumber]!;

    notifyListeners();
  }
}
