import 'package:flutter/material.dart';
import 'package:maplestory_builder/constants/constants.dart';
import 'package:maplestory_builder/constants/equipment/equip_constants.dart';
import 'package:maplestory_builder/constants/equipment/set_effect_stats.dart';
import 'package:maplestory_builder/modules/base.dart';
import 'package:maplestory_builder/modules/equipment/equips.dart';
import 'package:maplestory_builder/modules/utilities/utilities.dart';

class SetEffectModule implements Copyable {
  Map<EquipSet, SetEffect> activeSetEffects;
  Map<int, LuckyItem> trackedLuckyItems;
  LuckyItem? activeLuckyItem;

  SetEffectModule({
    Map<EquipSet, SetEffect>? activeSetEffects,
    this.activeLuckyItem,
    Map<int, LuckyItem>? trackedLuckyItems,
  }) 
  : 
  activeSetEffects = activeSetEffects ?? {},
  trackedLuckyItems = trackedLuckyItems ?? {};

  @override
  SetEffectModule copyWith({
    Map<EquipSet, SetEffect>? activeSetEffects,
    LuckyItem? activeLuckyItem,
    Map<int, LuckyItem>? trackedLuckyItems,
  }){
    return SetEffectModule(
      // Deep copy the map
      activeSetEffects: activeSetEffects ?? deepCopySetEffectsMap(this.activeSetEffects),
      activeLuckyItem: activeLuckyItem ?? this.activeLuckyItem,
      trackedLuckyItems: trackedLuckyItems ?? Map.from(this.trackedLuckyItems),
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

    if (equip.equipName.isLuckyItem) {
      _updateLuckyItems(equip);
    }
    
    if (equip.equipSet == null) {
      return false;
    }

    if (activeSetEffects[equip.equipSet] == null) {
      activeSetEffects[equip.equipSet!] = SetEffect(equipSet: equip.equipSet!);
      activeSetEffects[equip.equipSet!]!.updateLuckyItem(activeLuckyItem);
    }
    return activeSetEffects[equip.equipSet]!.addEquip(equip.equipName);
  }

  bool removeEquip(Equip? equip, {bool isCalculatingDifference = false}) {
    if (equip == null) {
      return false;
    }

    if (equip.equipName.isLuckyItem) {
      _updateLuckyItems(equip, isRemoving: true);
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

  void _updateLuckyItems(Equip equip, {bool isRemoving = false}) {
    LuckyItem luckyItem = LuckyItem.getLuckyItem(equip)!;

    if (isRemoving) {
      trackedLuckyItems.remove(luckyItem.priority);

      // Only need to bother updating active lucky items if we are removing the active lucky item
      if (luckyItem.priority == activeLuckyItem?.priority) {
        activeLuckyItem = null;
        // If we are removing the active lucky item, then find the next one if any
        if (luckyItem.priority == activeLuckyItem?.priority) {
          for (int priority in LuckyItem.luckyItemPriority.keys) {
            if (trackedLuckyItems[priority] != null) {
              activeLuckyItem = trackedLuckyItems[priority];
              break;
            }
          }
        }

        for (SetEffect setEffect in activeSetEffects.values) {
          setEffect.updateLuckyItem(activeLuckyItem);
        }
      }
    }
    else {
      trackedLuckyItems[luckyItem.priority] = luckyItem;
      // If the activeLuckyItem is null then we can immediately activate and update set effects
      // If the luckyItem is the same priority as the current one
      // If the luckyItem is a higher priortiy as the current one
      if (activeLuckyItem == null || luckyItem.priority == activeLuckyItem!.priority || luckyItem.priority < activeLuckyItem!.priority) {
        activeLuckyItem = luckyItem;
        for (SetEffect setEffect in activeSetEffects.values) {
          setEffect.updateLuckyItem(activeLuckyItem);
        }
      } 
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

class SetEffect implements Copyable {
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

  @override
  SetEffect copyWith({
    Map<EquipType, Set<EquipName>>? equippedEquips,
    LuckyItem? activeLuckyItem,
    bool? isLuckyItemActive,
    int? totalSetItems,
  }) {
    return SetEffect(
      equipSet: equipSet, 
      equippedEquips: equippedEquips ?? deepCopyEquippedEquips(this.equippedEquips),
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
      if (removingEquip != null && (setEffectCount == (totalSetItems + 1) || (activeLuckyItem != null && totalSetItems == 2 && setEffectCount == (totalSetItems + 2)))) {
        rawEffectColor = Colors.redAccent;
      }
      // If we are adding an equip and the totalSetItems matches both the set effect count we are at or we recently activated a lucky item (3 -> 4 items)
      else if (addingEquip != null && (setEffectCount == totalSetItems || (_isLuckyItemActive && totalSetItems == 4 && setEffectCount == totalSetItems -1))) {
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

    for (AbstractSetEffectSlot effectSlot in equipSet.requiredEquips.values) {
      widgetChildren.addAll(effectSlot.createSlotContainer(this, addingEquip: addingEquip, removingEquip: removingEquip));
    }

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
      width: 300,
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
              case StatType.ignoreDefense:
              case StatType.ignoreElementalDefense:
                totalSetEffect[key] = calculateIgnoreDefense(totalSetEffect[key]!, value);
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
        _caluclateLuckyItemBonus();
        return true;
      }
      // The equip is already part of the set
      else if (equippedEquipType.contains(equipName)) {
        return false;
      }
      else {
        equippedEquips[equipName.equipType]!.add(equipName);
        totalSetItems += 1;
        _caluclateLuckyItemBonus();
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
        _caluclateLuckyItemBonus();
        return true;
      }
      // The equip is not already part of the set
      else {
        return false;
      }
    }
    return false;
  }

  void updateLuckyItem(LuckyItem? newLuckyItem) {
    // Only want to update if the lucky item would actually activate part of the set
    if (newLuckyItem == null || equipSet.requiredEquips.keys.toList().contains(newLuckyItem.equipName.equipType)) {
      // This only applies to Genesis Weapons - Do not want to be a lucky item for the set that the equip is also a part of
      if (newLuckyItem != null && newLuckyItem.equipSet == equipSet) {
        activeLuckyItem = null;
      }
      else {
        activeLuckyItem = newLuckyItem;
      }
    }
    else {
      activeLuckyItem = null;
    }
    _calculateLuckyItemUpdate();
  }

  void _calculateLuckyItemUpdate() {
    // If we update a LuckyItem to null, or one that does not count towards the set effect
    if (activeLuckyItem == null && _isLuckyItemActive) {
      totalSetItems -= 1;
      _isLuckyItemActive = false;
    }
    else {
      _caluclateLuckyItemBonus();
    }
  }

  void _caluclateLuckyItemBonus() {
    // Determine if we need to deactive the lucky item bonus, happens when we fall below the required 3 items equipped
    if (_isLuckyItemActive) {
      if (totalSetItems <= 3) {
        totalSetItems -= 1;
        _isLuckyItemActive = false;
      }
    }
    // Determine if we need to activate the lucky item bonus
    else {
      if (activeLuckyItem == null) {
        return;
      }
      else if (totalSetItems >= 3) {
        totalSetItems += 1;
        _isLuckyItemActive = true;
      }
    }
  }
}

abstract class AbstractSetEffectSlot {
  final EquipType equipType;

  const AbstractSetEffectSlot({required this.equipType});

  bool contains(EquipName equipName);
  List<Widget> createSlotContainer(SetEffect setEffect, {Equip? addingEquip, Equip? removingEquip});
}

// Slot that defines a regular
class SetEffectSlot extends AbstractSetEffectSlot {
  final Set<EquipName> any;

  const SetEffectSlot({
    required super.equipType,
    required this.any
  });

  @override
  bool contains(EquipName equipName) {
    return any.contains(equipName);
  }

  @override
  List<Widget> createSlotContainer(SetEffect setEffect, {Equip? addingEquip, Equip? removingEquip}) {
    List<Widget> returnWidgets = [];

    if (setEffect.activeLuckyItem != null && setEffect.activeLuckyItem!.equipName.equipType == equipType) {
      var luckyColor = starColor;
      if (addingEquip != null && setEffect.totalSetItems == 4 && setEffect._isLuckyItemActive) {
        luckyColor = Colors.greenAccent;
      }
      else if (removingEquip != null && setEffect.activeLuckyItem != null && setEffect.totalSetItems == 2) {
        luckyColor = Colors.redAccent;
      }

      returnWidgets.add(
        Row(
          children: [
            Text(
              setEffect.activeLuckyItem!.equipName.formattedName,
              style: TextStyle(color: luckyColor),
            ),
            const Spacer(),
            Text(
              "(${equipType.formattedName})",
              style: TextStyle(color: luckyColor),
            ),
          ]
        )
      );
    }

    for (EquipName equipName in any) { 
      Color? textColor;
      if (removingEquip?.equipName == equipName) {
        textColor = Colors.redAccent;
      }
      else if (addingEquip?.equipName == equipName) {
        textColor = Colors.greenAccent;
      }
      else {
        textColor = (setEffect.equippedEquips[equipType] ?? {}).contains(equipName) ? null : missingColor;
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
class SetEffectSlotSelectOne extends AbstractSetEffectSlot {
  final Set<EquipName> selectOne;
  final String selectString;

  const SetEffectSlotSelectOne({
    required super.equipType,
    required this.selectOne,
    required this.selectString
  });

  @override
  bool contains(EquipName equipName) {
    return selectOne.contains(equipName);
  }

  @override
  List<Widget> createSlotContainer(SetEffect setEffect, {Equip? addingEquip, Equip? removingEquip}) {
    Color? textColor;
    if (setEffect.activeLuckyItem != null && setEffect.activeLuckyItem!.equipName.equipType == equipType) {
      textColor = starColor;
      if (addingEquip != null && setEffect.totalSetItems == 4 && setEffect._isLuckyItemActive) {
        textColor = Colors.greenAccent;
      }
      else if (removingEquip != null && setEffect.activeLuckyItem != null && setEffect.totalSetItems == 2) {
        textColor = Colors.redAccent;
      }
    }
    else if (selectOne.contains(removingEquip?.equipName)) {
      textColor = Colors.redAccent;
    }
    else if (selectOne.contains(addingEquip?.equipName)) {
      textColor = Colors.greenAccent;
    }
    else {
      textColor = missingColor;
      for (EquipName equipName in (setEffect.equippedEquips[equipType] ?? {})) {
        if (selectOne.contains(equipName)) {
          textColor = null;
          break;
        }
      }
    }
    
    return [
      Row(
        children: [
          Text(
            "Select 1 $selectString",
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
  final EquipSet? equipSet;
  final int priority;

  const LuckyItem({
    required this.equipName,
    required this.equipSet,
    required this.priority,
  });

  static LuckyItem? getLuckyItem(Equip equip) {
    if (!equip.equipName.isLuckyItem) {
      return null;
    }

    for (MapEntry<int, Set<EquipName>> mapEntry in luckyItemPriority.entries) {
      if (mapEntry.value.isNotEmpty && mapEntry.value.contains(equip.equipName)) {
        return LuckyItem(
          equipName: equip.equipName, 
          equipSet: equip.equipSet,
          priority: mapEntry.key
        );
      }
    }
    return null;
  }
}