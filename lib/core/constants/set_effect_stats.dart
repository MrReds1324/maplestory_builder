import 'package:maplestory_builder/core/constants.dart';
import 'package:maplestory_builder/core/items/equips.dart';

class SetEffect {
  final EquipSet equipSet;
  final Map<EquipType, Set<int>> requiredEquips;
  final Map<int, Map<StatType, num>> rawSetEffect;
  Map<EquipType, Set<int>> equippedEquips;
  int totalSetItems = 0;
  // Will be using this to cache the calculated set bonus later on
  Map<StatType, num>? cachedSetBonus;

  SetEffect({
    required this.equipSet,
    required this.requiredEquips,
    required this.rawSetEffect,
    equippedEquips,
    this.totalSetItems = 0,
  }) : equippedEquips = equippedEquips ?? {};

  Map<StatType, num> calculateStats({bool recalculateCache = false}) {
    if (!recalculateCache && cachedSetBonus != null) {
      return cachedSetBonus!;
    }

    Map<StatType, num> totalSetEffect = {};

    if (totalSetItems < 1) {
      return totalSetEffect;
    }

    void updateTotalSetEffect(Map<StatType, num>? setEffectBonus) {
      if (setEffectBonus == null) {
        return;
      }
      if (totalSetEffect.isEmpty) {
        totalSetEffect.addAll(setEffectBonus);
      }
      else {
        setEffectBonus.forEach((key, value) { 
          if (totalSetEffect[key] == null) {
            totalSetEffect[key] = value;
          }
          else{
            switch(key) {
              // TODO: Fix the calculations for these
              case StatType.ignoreDefense:
              case StatType.ignoreElementalDefense:
              default:
                totalSetEffect[key] = totalSetEffect[key]! + value;
            }
          }
        });
      }
    }

    var currentSetKey = 0;
    while (currentSetKey <= totalSetItems) {
      updateTotalSetEffect(rawSetEffect[currentSetKey]);
      currentSetKey += 1;
    }

    cachedSetBonus = totalSetEffect;
    return totalSetEffect;
  }

  bool addEquip(Equip equip) {
    // Invalidate the cache
    cachedSetBonus = null;

    var requiredEquipType = requiredEquips[equip.equipType];
    // If we got this wrong for some reason and this equipType does not exist in the set effect
    if (requiredEquipType == null) {
      return false;
    }
    // The set effect does contain the equip
    else if (requiredEquipType.contains(equip.itemId)) {
      var equippedEquipType = equippedEquips[equip.equipType];
      // We have not added the equip yet
      if (equippedEquipType == null) {
        equippedEquips[equip.equipType] = {equip.itemId.toInt()};
        totalSetItems += 1;
        return true;
      }
      // The equip is already part of the set
      else if (equippedEquipType.contains(equip.itemId)) {
        return false;
      }
      else {
        equippedEquips[equip.equipType]!.add(equip.itemId.toInt());
        totalSetItems += 1;
        return true;
      }
    }
    return false;
  }

  bool removeEquip(Equip equip) {
    // Invalidate the cache
    cachedSetBonus = null;

    var requiredEquipType = requiredEquips[equip.equipType];
    // If we got this wrong for some reason and this equipType does not exist in the set effect
    if (requiredEquipType == null) {
      return false;
    }
    // The set effect does contain the equip
    else if (requiredEquipType.contains(equip.itemId)) {
      var equippedEquipType = equippedEquips[equip.equipType];
      // We have not added the equip yet
      if (equippedEquipType == null) {
        return false;
      }
      // The equip is already part of the set
      else if (equippedEquipType.contains(equip.itemId)) {
        equippedEquips[equip.equipType]!.remove(equip.itemId.toInt());
        totalSetItems -= 1;
        return true;
      }
      // The equip is not already part of the set
      else {
        return false;
      }
    }
    return false;
  }

  SetEffect copyWith({
    Map<EquipType, Set<int>>? equippedEquips,
    int? totalSetItems,
  }) {
      return SetEffect(
        equipSet: equipSet, 
        requiredEquips: requiredEquips,
        rawSetEffect: rawSetEffect,
        equippedEquips: equippedEquips ?? Map.of(this.equippedEquips),
        totalSetItems: totalSetItems ?? this.totalSetItems,
      );
    }
}

enum EquipSet {
  superiorGollux(formattedName: "Superior Gollux Set");

  const EquipSet({
    required this.formattedName
  });

  final String formattedName;
}

SetEffect superiorGollux = SetEffect(
  equipSet: EquipSet.superiorGollux, 
  requiredEquips: const {
    EquipType.ring: {1},
    EquipType.pendant: {2},
    EquipType.belt: {3},
    EquipType.earrings: {4},
  },
  rawSetEffect: const {
    2: {
      StatType.allStats: 20,
      StatType.hp: 1500,
      StatType.mp: 1500
    },
    3: {
      StatType.hpPercentage: 0.13,
      StatType.mpPercentage: 0.13,
      StatType.attack: 35,
      StatType.mattack: 35
    },
    4: {
      StatType.bossDamage: 0.3,
      StatType.ignoreDefense: 0.3,
    },
  }
);

final Map<EquipSet, SetEffect> allSetEffects = {
  EquipSet.superiorGollux: superiorGollux
};

