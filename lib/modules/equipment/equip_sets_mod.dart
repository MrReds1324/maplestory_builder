import 'package:flutter/material.dart';
import 'package:maplestory_builder/constants/constants.dart';
import 'package:maplestory_builder/constants/equipment/equip_constants.dart';
import 'package:maplestory_builder/constants/equipment/set_effect_stats.dart';
import 'package:maplestory_builder/modules/equipment/equips.dart';
import 'package:maplestory_builder/modules/utilities/utilities.dart';

class SetEffectModule {
  Map<EquipSet, SetEffect> activeSetEffects;
  LuckyItem? activeLuckyItem;

  SetEffectModule({
    activeSetEffects,
    this.activeLuckyItem,
    bool isLuckyItemActive = false,
  }) : activeSetEffects = activeSetEffects ?? {};

  SetEffectModule copyWith({
    Map<EquipSet, SetEffect>? activeSetEffects,
    LuckyItem? activeLuckyItem,
  }){
    return SetEffectModule(
      // Deep copy the map
      activeSetEffects: activeSetEffects ?? deepCopySetEffectsMap(this.activeSetEffects),
      activeLuckyItem: activeLuckyItem ?? this.activeLuckyItem,
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
      activeSetEffects[equip.equipSet!] = SetEffect(equipSet: equip.equipSet!);
    }
    return activeSetEffects[equip.equipSet]!.addEquip(equip.equipName);
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
    var returnValue = activeSetEffects[equip.equipSet]!.removeEquip(equip.equipName);
    // Really only want to track "active" set effects, remove any that fall to zero and are no longer "active"
    // Dont do this if we are calculating differences as it causes some weird issues with display
    if (!isCalculatingDifference && activeSetEffects[equip.equipSet]!.totalSetItems == 0) {
      activeSetEffects.remove(equip.equipSet);
    }
    return returnValue;
  }

  void _updateLuckyItems(LuckyItem newLuckyItem) {
    for (SetEffect setEffect in activeSetEffects.values) {
      setEffect.updateLuckyItem(newLuckyItem);
    }
  }

  Map<EquipSet, int> getEquippedSetCounts() {
    Map<EquipSet, int> equippedSetCount = {};

    activeSetEffects.forEach((key, value) { 
      equippedSetCount[key] = value.totalSetItems;
    });

    return equippedSetCount;
  }
}

class SetEffect {
  final EquipSet equipSet;
  Map<EquipType, Set<EquipName>> equippedEquips;
  LuckyItem? activeLuckyItem;
  bool _isLuckyItemActive;
  int totalSetItems = 0;
  // Will be using this to cache the calculated set bonus later on
  Map<StatType, num>? cachedSetBonus;

  SetEffect({
    required this.equipSet,
    equippedEquips,
    this.activeLuckyItem,
    bool isLuckyItemActive = false,
    this.totalSetItems = 0,
  }) 
  : 
  equippedEquips = equippedEquips ?? {}, 
  _isLuckyItemActive = isLuckyItemActive;

  SetEffect copyWith({
    Map<EquipType, Set<EquipName>>? equippedEquips,
    LuckyItem? activeLuckyItem,
    bool? isLuckyItemActive,
    int? totalSetItems,
  }) {
    return SetEffect(
      equipSet: equipSet, 
      equippedEquips: equippedEquips ?? Map.of(this.equippedEquips),
      activeLuckyItem: activeLuckyItem ?? this.activeLuckyItem,
      isLuckyItemActive: isLuckyItemActive ?? _isLuckyItemActive,
      totalSetItems: totalSetItems ?? this.totalSetItems,
    );
  }

  Widget createSetEffectContainer(BuildContext context, {Equip? addingEquip, Equip? removingEquip}) {
    Widget createRawSetEffectLine(int setEffectCount, Map<StatType, num> rawEffect) {
      List<Widget> rawEffectChildren = [
        Text(
          "$setEffectCount Set Items Equipped",
          style: const TextStyle(color: equipFlameColor),
        )
      ];

      Color? rawEffectColor;
      // The totalSetItems will already be updated here (adding and removing will have already been reflected by the time we ask to draw the container)
      // If we are removing an equip and the totalSetItems + 1 matches the set effect count we are at
      if (removingEquip != null && setEffectCount == (totalSetItems + 1)) {
        rawEffectColor = Colors.redAccent;
      }
      // If we are adding an equip and the totalSetItems matches the set effect count we are at
      else if (addingEquip != null && setEffectCount == totalSetItems) {
        rawEffectColor = Colors.greenAccent;
      }
      else {
        rawEffectColor = setEffectCount <= totalSetItems ? null : missingColor;
      }
      
      rawEffect.forEach((key, value) {
        rawEffectChildren.add(
          Text(
            "${key.formattedName}: +${key.isPercentage ? doubleRoundPercentFormater.format(value) : value}",
            style: TextStyle(color: rawEffectColor),
          )
        );
      });

      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: rawEffectChildren
      );
    }
    
    List<Widget> widgetChildren = [
      Center(
        child: Container(
          padding: const EdgeInsets.only(bottom: 5),
          child: Text(
            equipSet.formattedName,
            style: const TextStyle(color: equipFlameColor),
          )
        )
      )
    ];

    equipSet.requiredEquips.forEach((key, value) { 
      widgetChildren.addAll(value.createSlotContainer(key, equippedEquips[key] ?? {}, addingEquip: addingEquip, removingEquip: removingEquip));
    });

    widgetChildren.add(
      const Divider(
        height: 15,
        thickness: 1,
        color: statColor,
      )
    );

    equipSet.rawSetEffect.forEach((key, value) {
      widgetChildren.add(createRawSetEffectLine(key, value));
    });

    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: statColor),
        borderRadius: const BorderRadius.all(Radius.circular(10))
      ),
      padding: const EdgeInsets.all(5),
      width: 250,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: widgetChildren
      )
    );
  }

  Map<StatType, num> calculateStats({bool recalculateCache = false}) {
    if (!recalculateCache && cachedSetBonus != null) {
      return cachedSetBonus!;
    }

    Map<StatType, num> totalSetEffect = {};

    // Need at least two items to be active
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
      updateTotalSetEffect(equipSet.rawSetEffect[currentSetKey]);
      currentSetKey += 1;
    }

    cachedSetBonus = totalSetEffect;
    return totalSetEffect;
  }

  bool addEquip(EquipName equipName) {
    // Invalidate the cache
    cachedSetBonus = null;

    var requiredEquipType = equipSet.requiredEquips[equipName.equipType];
    // If we got this wrong for some reason and this equipType does not exist in the set effect
    if (requiredEquipType == null) {
      return false;
    }
    // The set effect does contain the equip
    else if (requiredEquipType.contains(equipName)) {
      var equippedEquipType = equippedEquips[equipName.equipType];
      // We have not added the equip yet
      if (equippedEquipType == null) {
        equippedEquips[equipName.equipType] = {equipName};
        totalSetItems += 1;
        return true;
      }
      // The equip is already part of the set
      else if (equippedEquipType.contains(equipName)) {
        return false;
      }
      else {
        equippedEquips[equipName.equipType]!.add(equipName);
        totalSetItems += 1;
        return true;
      }
    }
    return false;
  }

  bool removeEquip(EquipName equipName) {
    // Invalidate the cache
    cachedSetBonus = null;

    var requiredEquipType = equipSet.requiredEquips[equipName.equipType];
    // If we got this wrong for some reason and this equipType does not exist in the set effect
    if (requiredEquipType == null) {
      return false;
    }
    // The set effect does contain the equip
    else if (requiredEquipType.contains(equipName)) {
      var equippedEquipType = equippedEquips[equipName.equipType];
      // We have not added the equip yet
      if (equippedEquipType == null) {
        return false;
      }
      // The equip is already part of the set
      else if (equippedEquipType.contains(equipName)) {
        equippedEquips[equipName.equipType]!.remove(equipName);
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

  void updateLuckyItem(LuckyItem newLuckyItem) {
    // If no current active lucky item, then we can immediately try to activate this one
    if (activeLuckyItem == null) {
      activeLuckyItem = newLuckyItem;
    }
    // If the priority is the same, then its the same "type" of lucky item and nothing further needs to be done outside of updating this for when
    // we need to remove this item later
    else if (newLuckyItem.priority == activeLuckyItem?.priority) {
      activeLuckyItem = newLuckyItem;
    }
    // If the priorty is lower, we can ignore this lucky item altogether
    else if (newLuckyItem.priority > activeLuckyItem!.priority) {
      return;
    }
  }
}

abstract class AbstractSetEffectSlot {

  const AbstractSetEffectSlot();

  bool contains(EquipName equipName);
  List<Widget> createSlotContainer(EquipType equipType, Set<EquipName> equippedEquips, {Equip? addingEquip, Equip? removingEquip});
}

// Slot that defines a regular
class SetEffectSlot extends AbstractSetEffectSlot {
  final Set<EquipName> any;

  const SetEffectSlot({
    required this.any
  });

  @override
  bool contains(EquipName equipName) {
    return any.contains(equipName);
  }

  @override
  List<Widget> createSlotContainer(EquipType equipType, Set<EquipName> equippedEquips, {Equip? addingEquip, Equip? removingEquip}) {
    List<Widget> returnWidgets = [];

    for (EquipName equipName in any) { 
      Color? textColor;
      if (removingEquip?.equipName == equipName) {
        textColor = Colors.redAccent;
      }
      else if (addingEquip?.equipName == equipName) {
        textColor = Colors.greenAccent;
      }
      else {
        textColor = equippedEquips.contains(equipName) ? null : missingColor;
      }

      returnWidgets.add(
        Row(
          children: [
            Text(
              equipName.formattedName,
              style: TextStyle(color: textColor),
            ),
            const Spacer(),
            Text(
              "(${equipType.formattedName})",
              style: TextStyle(color: textColor),
            ),
          ]
        )
      );
    }

    return returnWidgets;
  }
}

// Choose one slot, used for weapons
class SetEffectSlotChooseOne extends AbstractSetEffectSlot {
  final Set<EquipName> chooseOne;
  final String choosingName;

  const SetEffectSlotChooseOne({
    required this.chooseOne,
    required this.choosingName
  });

  @override
  bool contains(EquipName equipName) {
    return chooseOne.contains(equipName);
  }

  @override
  List<Widget> createSlotContainer(EquipType equipType, Set<EquipName> equippedEquips, {Equip? addingEquip, Equip? removingEquip}) {
    Color? textColor;
    if (chooseOne.contains(removingEquip?.equipName)) {
      textColor = Colors.redAccent;
    }
    else if (chooseOne.contains(addingEquip?.equipName)) {
      textColor = Colors.greenAccent;
    }
    else {
      textColor = missingColor;
      for (EquipName equipName in equippedEquips) {
        if (chooseOne.contains(equipName)) {
          textColor = null;
          break;
        }
      }
    }
    
    return [
      Row(
        children: [
          Text(
            "Choose one of $choosingName Weapon",
            style: TextStyle(color: textColor),
          ),
          const Spacer(),
          Text(
            "(${equipType.formattedName})",
            style: TextStyle(color: textColor),
          ),
        ]
      )
    ];
  }
}

class LuckyItem {
  // Lower Number means higher priority - Taken from https://whackybeanz.com/guides/set-effects#info-priority
  static const Map<int, Set<EquipName>> luckyItemPriority = {
    0: {}, // Chaos Root Abyss Hats
    1: {}, // Scarlet Earrings
    2: {}, // Dojo Gloves?
    3: {EquipName.genesisCrossbow}, // Genesis Weapons
    4: {}, // Scarlet Weapon - NOT IMPLEMENTING THIS
    5: {}, // Scarlet Ring
    6: {}, // Fighter's Ring
    7: {}, // Scarlet Shoulder
    8: {}, // Masteria Shoulder
  };

  final EquipName equipName;
  final int priority;

  const LuckyItem({
    required this.equipName,
    required this.priority,
  });

  static LuckyItem? getLuckyItem(EquipName equipName) {
    if (!equipName.isLuckyItem) {
      return null;
    }

    for (MapEntry<int, Set<EquipName>> mapEntry in luckyItemPriority.entries) {
      if (mapEntry.value.isNotEmpty && mapEntry.value.contains(equipName)) {
        return LuckyItem(
          equipName: equipName, 
          priority: mapEntry.key
        );
      }
    }
    return null;
  }
}