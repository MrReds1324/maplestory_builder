import 'package:flutter/material.dart';
import 'package:maplestory_builder/constants/constants.dart';
import 'package:maplestory_builder/constants/equipment/equip_constants.dart';
import 'package:maplestory_builder/modules/equipment/equips.dart';
import 'package:maplestory_builder/modules/utilities/utilities.dart';

class SetEffect {
  final EquipSet equipSet;
  Map<EquipType, Set<EquipName>> equippedEquips;
  int totalSetItems = 0;
  // Will be using this to cache the calculated set bonus later on
  Map<StatType, num>? cachedSetBonus;

  SetEffect({
    required this.equipSet,
    equippedEquips,
    this.totalSetItems = 0,
  }) : equippedEquips = equippedEquips ?? {};

  SetEffect copyWith({
    Map<EquipType, Set<EquipName>>? equippedEquips,
    int? totalSetItems,
  }) {
    return SetEffect(
      equipSet: equipSet, 
      equippedEquips: equippedEquips ?? Map.of(this.equippedEquips),
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

enum EquipSet {
  superiorGollux(
    formattedName: "Superior Gollux Set", 
    requiredEquips: {
      EquipType.ring: SetEffectSlot(any: {EquipName.superiorGolluxRing}),
      EquipType.pendant: SetEffectSlot(any: {EquipName.superiorGolluxPendant}),
      EquipType.belt: SetEffectSlot(any: {EquipName.superiorGolluxBelt}),
      EquipType.earrings: SetEffectSlot(any: {EquipName.superiorGolluxEarrings}),
    },
    rawSetEffect: {
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
  ),
  dawnBossSet(
    formattedName: "Dawn Boss Set",
    requiredEquips: {
      EquipType.face: SetEffectSlot(any: {EquipName.twilightMark}),
      EquipType.earrings: SetEffectSlot(any: {EquipName.estellaEarrings}),
      EquipType.ring: SetEffectSlot(any: {EquipName.dawnGuardianAngelRing}),
      EquipType.pendant: SetEffectSlot(any: {EquipName.daybreakPendant}),
    }, 
    rawSetEffect: {
      2: {
        StatType.allStats: 10,
        StatType.hp: 250,
        StatType.attack: 10,
        StatType.mattack: 10,
        StatType.bossDamage: 0.1,
      },
      3: {
        StatType.allStats: 10,
        StatType.hp: 250,
        StatType.attack: 10,
        StatType.mattack: 10,
      },
      4: {
        StatType.allStats: 10,
        StatType.hp: 250,
        StatType.attack: 10,
        StatType.mattack: 10,
        StatType.defense: 100,
        StatType.ignoreDefense: 0.1,
      },
    }
  ),
  eternalSetBowman(
    formattedName: "Eternal Set (Bowman)", 
    requiredEquips: {
      EquipType.hat: SetEffectSlot(any: {EquipName.eternalArcherHat}),
      EquipType.top: SetEffectSlot(any: {EquipName.eternalArcherHood}),
      EquipType.bottom: SetEffectSlot(any: {EquipName.eternalArcherPants}),
      EquipType.shoulder: SetEffectSlot(any: {EquipName.eternalArcherShoulder}),
      EquipType.weapon: SetEffectSlotChooseOne(chooseOne: {EquipName.genesisCrossbow}, choosingName: "Genesis")
    }, 
    rawSetEffect: {
      2: {
        StatType.hp: 2500,
        StatType.mp: 2500,
        StatType.attack: 40,
        StatType.mattack: 40,
        StatType.bossDamage: 0.1
      },
      3: {
        StatType.allStats: 50,
        StatType.attack: 40,
        StatType.mattack: 40,
        StatType.defense: 600,
        StatType.bossDamage: 0.1
      },
      4: {
        StatType.hpPercentage: 0.15,
        StatType.mpPercentage: 0.15,
        StatType.attack: 40,
        StatType.mattack: 40,
        StatType.bossDamage: 0.1
      },
      5: {
        StatType.attack: 40,
        StatType.mattack: 40,
        StatType.ignoreDefense: 0.2
      }
    }
  ),
  arcaneSetBowman(
    formattedName: "Arcane Umbra Set (Bowman)", 
    requiredEquips: {}, 
    rawSetEffect: {}
  ),
  ;

  const EquipSet({
    required this.formattedName,
    required this.requiredEquips,
    required this.rawSetEffect,
  });

  final String formattedName;
  final Map<EquipType, AbstractSetEffectSlot> requiredEquips;
  final Map<int, Map<StatType, num>> rawSetEffect;
}
