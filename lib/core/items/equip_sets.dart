import 'package:maplestory_builder/core/constants.dart';
import 'package:maplestory_builder/core/constants/set_effect_stats.dart';
import 'package:maplestory_builder/core/items/equips.dart';
import 'package:maplestory_builder/modules/utilities.dart';

class SetEffectModule {
  Map<EquipSet, SetEffect> activeSetEffects;

  SetEffectModule({
    activeSetEffects
  }) : activeSetEffects = activeSetEffects ?? {};

  List<Map<StatType, num>> calculateStats({bool recalculateCache = false}) {
    List<Map<StatType, num>> activeSetEffectStats = [];

    activeSetEffects.forEach((key, value) { 
      activeSetEffectStats.add(value.calculateStats(recalculateCache: recalculateCache));
    });

    return activeSetEffectStats;
  }

  bool addEquip(Equip? equip, {bool isCalculatingDifference = false}) {
    if (equip == null) {
      return false;
    }
    
    if (equip.equipSet == null) {
      return false;
    }

    if (activeSetEffects[equip.equipSet] == null) {
      // We want to update the "global" set effect when we are modifying the main character
      if (!isCalculatingDifference) {
        activeSetEffects[equip.equipSet!] = allSetEffects[equip.equipSet]!;
      }
      else {
        activeSetEffects[equip.equipSet!] = allSetEffects[equip.equipSet]!.copyWith();
      }
    }
    return activeSetEffects[equip.equipSet]!.addEquip(equip);
  }

  bool removeEquip(Equip? equip, {bool isCalculatingDifference = false}) {
    if (equip == null) {
      return false;
    }

    if (equip.equipSet == null) {
      return false;
    }

    if (activeSetEffects[equip.equipSet] == null) {
      return false;
    }
    var returnValue = activeSetEffects[equip.equipSet]!.removeEquip(equip);
    // Really only want to track "active" set effects, remove any that fall to zero and are no longer "active"
    if (!isCalculatingDifference && activeSetEffects[equip.equipSet]!.totalSetItems == 0) {
      activeSetEffects.remove(equip.equipSet);
    }
    return returnValue;
  }

  SetEffectModule copyWith({
    Map<EquipSet, SetEffect>? activeSetEffects,
  }){
    return SetEffectModule(
      // Deep copy the map
      activeSetEffects: activeSetEffects ?? deepCopySetEffectsMap(this.activeSetEffects),
    );
  }
}