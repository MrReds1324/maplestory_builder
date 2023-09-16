import 'package:flutter/material.dart';
import 'package:maplestory_builder/core/constants.dart';
import 'package:maplestory_builder/core/constants/equip_constants.dart';
import 'package:maplestory_builder/core/items/equips.dart';
import 'package:maplestory_builder/modules/utilities.dart';

class SetEffect {
  final EquipSet equipSet;
  final Map<EquipType, SetEffectSlot> requiredEquips;
  final Map<int, Map<StatType, num>> rawSetEffect;
  Map<EquipType, Set<EquipName>> equippedEquips;
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

  SetEffect copyWith({
    Map<EquipType, Set<EquipName>>? equippedEquips,
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

  Widget createSetEffectContainer({Equip? addingEquip}) {
    Widget __createRawSetEffectLine(int setEffectCount, Map<StatType, num> rawEffect) {
      List<Widget> rawEffectChildren = [
        Text(
          "$setEffectCount Set Items Equipped",
          style: const TextStyle(color: equipFlameColor),
        )
      ];

      Color? rawEffectColor;
      // If the equip we are adding is not in the alread equipped equips
      if (addingEquip != null && !(equippedEquips[addingEquip.equipType]?.contains(addingEquip.equipName) ?? false) && setEffectCount == (totalSetItems + 1)) {
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

    requiredEquips.forEach((key, value) { 
      widgetChildren.addAll(value.createSlotContainer(key, equippedEquips[key] ?? {}, addingEquip: addingEquip));
    });

    widgetChildren.add(
      const Divider(
        height: 15,
        thickness: 1,
        color: statColor,
      )
    );

    rawSetEffect.forEach((key, value) {
      widgetChildren.add(__createRawSetEffectLine(key, value));
    });

    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: statColor),
        borderRadius: const BorderRadius.all(Radius.circular(10))
      ),
      padding: const EdgeInsets.all(5),
      width: 225,
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
    else if (requiredEquipType.contains(equip.equipName)) {
      var equippedEquipType = equippedEquips[equip.equipType];
      // We have not added the equip yet
      if (equippedEquipType == null) {
        equippedEquips[equip.equipType] = {equip.equipName};
        totalSetItems += 1;
        return true;
      }
      // The equip is already part of the set
      else if (equippedEquipType.contains(equip.equipName)) {
        return false;
      }
      else {
        equippedEquips[equip.equipType]!.add(equip.equipName);
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
    else if (requiredEquipType.contains(equip.equipName)) {
      var equippedEquipType = equippedEquips[equip.equipType];
      // We have not added the equip yet
      if (equippedEquipType == null) {
        return false;
      }
      // The equip is already part of the set
      else if (equippedEquipType.contains(equip.equipName)) {
        equippedEquips[equip.equipType]!.remove(equip.equipName);
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
  List<Widget> createSlotContainer(EquipType equipType, Set<EquipName> equippedEquips, {Equip? addingEquip});
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
  List<Widget> createSlotContainer(EquipType equipType, Set<EquipName> equippedEquips, {Equip? addingEquip}) {
    List<Widget> returnWidgets = [];

    for (EquipName equipName in any) { 
      Color? textColor;
      if (addingEquip?.equipName == equipName) {
        textColor = equippedEquips.contains(equipName) ? starColor : Colors.greenAccent;
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
  List<Widget> createSlotContainer(EquipType equipType, Set<EquipName> equippedEquips, {Equip? addingEquip}) {
    return [
      Row(
        children: [
          Text("Choose one of $choosingName Weapon"),
          // Spacer(),
        ]
      )
    ];
  }
}

enum EquipSet {
  superiorGollux(formattedName: "Superior Gollux Set"),
  dawnBossSet(formattedName: "Dawn Boss Set"),
  ;

  const EquipSet({
    required this.formattedName
  });

  final String formattedName;
}

SetEffect superiorGollux = SetEffect(
  equipSet: EquipSet.superiorGollux, 
  requiredEquips: const {
    EquipType.ring: SetEffectSlot(any: {EquipName.superiorGolluxRing}),
    EquipType.pendant: SetEffectSlot(any: {EquipName.superiorGolluxPendant}),
    EquipType.belt: SetEffectSlot(any: {EquipName.superiorGolluxBelt}),
    EquipType.earrings: SetEffectSlot(any: {EquipName.superiorGolluxEarrings}),
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

SetEffect dawnBossSet = SetEffect(
  equipSet: EquipSet.dawnBossSet, 
  requiredEquips: const {
    EquipType.face: SetEffectSlot(any: {EquipName.twilightMark}),
    EquipType.earrings: SetEffectSlot(any: {EquipName.estellaEarrings}),
    EquipType.ring: SetEffectSlot(any: {EquipName.dawnGuardianAngelRing}),
    EquipType.pendant: SetEffectSlot(any: {EquipName.daybreakPendant}),
  }, 
  rawSetEffect: const {
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
);


final Map<EquipSet, SetEffect> allSetEffects = {
  EquipSet.superiorGollux: superiorGollux,
  EquipSet.dawnBossSet: dawnBossSet,
};

