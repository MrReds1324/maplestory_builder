import 'package:maplestory_builder/constants/constants.dart';
import 'package:maplestory_builder/constants/equipment/set_effect_stats.dart';
import 'package:maplestory_builder/modules/equipment/equips.dart';
import 'package:maplestory_builder/modules/utilities/utilities.dart';

class SetEffectModule {
  Map<EquipSet, SetEffect> activeSetEffects;

  SetEffectModule({
    activeSetEffects
  }) : activeSetEffects = activeSetEffects ?? {};

  SetEffectModule copyWith({
    Map<EquipSet, SetEffect>? activeSetEffects,
  }){
    return SetEffectModule(
      // Deep copy the map
      activeSetEffects: activeSetEffects ?? deepCopySetEffectsMap(this.activeSetEffects),
    );
  }

  List<Map<StatType, num>> calculateStats({bool recalculateCache = false}) {
    List<Map<StatType, num>> activeSetEffectStats = [];

    activeSetEffects.forEach((key, value) { 
      activeSetEffectStats.add(value.calculateStats(recalculateCache: recalculateCache));
    });

    return activeSetEffectStats;
  }

  bool addEquip(Equip? equip) {
    if (equip == null) {
      return false;
    }
    
    if (equip.equipSet == null) {
      return false;
    }

    if (activeSetEffects[equip.equipSet] == null) {
      activeSetEffects[equip.equipSet!] = allSetEffects[equip.equipSet]!.copyWith();
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
    // Dont do this if we are calculating differences as it causes some weird issues with display
    if (!isCalculatingDifference && activeSetEffects[equip.equipSet]!.totalSetItems == 0) {
      activeSetEffects.remove(equip.equipSet);
    }
    return returnValue;
  }

  Map<EquipSet, int> getEquippedSetCounts() {
    Map<EquipSet, int> equippedSetCount = {};

    activeSetEffects.forEach((key, value) { 
      equippedSetCount[key] = value.totalSetItems;
    });

    return equippedSetCount;
  }
}