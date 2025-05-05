import 'package:maplestory_builder/constants/constants.dart';
import 'package:maplestory_builder/constants/equipment/equip_constants.dart';
import 'package:maplestory_builder/modules/base.dart';
import 'package:maplestory_builder/modules/equipment/equip_sets_mod.dart';
import 'package:maplestory_builder/modules/equipment/equips.dart';

class EquipmentModule implements Copyable {
  Map<String, int?> equippedEquips;
  List<EquipName> equippedEquipNames;
  Equip? Function(int? equipId) getEquipCallback;
  SetEffectModule setEffectModule;

  EquipmentModule(
      {Map<String, int?>? equippedEquips,
      List<EquipName>? equippedEquipNames,
      required this.getEquipCallback,
      SetEffectModule? setEffectModule})
      : equippedEquips = equippedEquips ?? {},
        equippedEquipNames = equippedEquipNames ?? [],
        setEffectModule = setEffectModule ?? SetEffectModule();

  @override
  EquipmentModule copyWith({
    Map<String, int?>? equippedEquips,
    List<EquipName>? equippedEquipNames,
    Equip? Function(int?)? getEquipCallback,
    SetEffectModule? setEffectModule,
  }) {
    return EquipmentModule(
        equippedEquips: equippedEquips ?? Map.from(this.equippedEquips),
        equippedEquipNames:
            equippedEquipNames ?? List.from(this.equippedEquipNames),
        setEffectModule: setEffectModule ?? this.setEffectModule.copyWith(),
        getEquipCallback: getEquipCallback ?? this.getEquipCallback);
  }

  void registerEquipCallback(Equip? Function(int?) function) {
    getEquipCallback = function;
  }

  Equip? getSelectedEquip(EquipType equipType, {int equipPosition = 0}) {
    switch (equipType) {
      case EquipType.secondary:
      case EquipType.shield:
      case EquipType.katara:
        return getEquipCallback(
            equippedEquips[EquipType.secondary.formattedName]);
      default:
        String equipKey;
        if (equipPosition > 0) {
          equipKey = "${equipType.formattedName}$equipPosition";
        } else {
          equipKey = equipType.formattedName;
        }
        return getEquipCallback(equippedEquips[equipKey]);
    }
  }

  int? getUniqueItemPosition(EquipName equipName, EquipType equipType) {
    if (equippedEquipNames.contains(equipName)) {
      for (int i = 1; i <= 3; i++) {
        String equipKey = "${equipType.formattedName}$i";
        if (getEquipCallback(equippedEquips[equipKey])?.equipName ==
            equipName) {
          return i;
        }
      }
    }
    return null;
  }

  bool equipEquip(Equip? equip, EquipType equipType,
      {int equipPosition = 0, bool isCalculatingDifference = false}) {
    // Only equip a single unique item
    if (!isCalculatingDifference &&
        (equippedEquipNames.contains(equip?.equipName)) &&
        (equip?.equipName.isUniqueItem ?? false)) {
      return false;
    }

    if (!isCalculatingDifference && equip != null) {
      equippedEquipNames.add(equip.equipName);
    }

    int? replacedItemHash;

    switch (equipType) {
      case EquipType.overall:
        replacedItemHash = equippedEquips[EquipType.overall.formattedName];
        equippedEquips[EquipType.overall.formattedName] = equip?.equipId;

        setEffectModule.removeEquip(
            getEquipCallback(equippedEquips[EquipType.top.formattedName]),
            isCalculatingDifference: isCalculatingDifference);
        equippedEquipNames.remove(
            getEquipCallback(equippedEquips[EquipType.top.formattedName])
                ?.equipName);
        equippedEquips[EquipType.top.formattedName] = null;

        setEffectModule.removeEquip(
            getEquipCallback(equippedEquips[EquipType.bottom.formattedName]),
            isCalculatingDifference: isCalculatingDifference);
        equippedEquipNames.remove(
            getEquipCallback(equippedEquips[EquipType.bottom.formattedName])
                ?.equipName);
        equippedEquips[EquipType.bottom.formattedName] = null;
      case EquipType.top:
        replacedItemHash = equippedEquips[EquipType.top.formattedName];
        equippedEquips[EquipType.top.formattedName] = equip?.equipId;

        setEffectModule.removeEquip(
            getEquipCallback(equippedEquips[EquipType.overall.formattedName]),
            isCalculatingDifference: isCalculatingDifference);
        equippedEquipNames.remove(
            getEquipCallback(equippedEquips[EquipType.overall.formattedName])
                ?.equipName);
        equippedEquips[EquipType.overall.formattedName] = null;
      case EquipType.bottom:
        replacedItemHash = equippedEquips[EquipType.bottom.formattedName];
        equippedEquips[EquipType.bottom.formattedName] = equip?.equipId;

        setEffectModule.removeEquip(
            getEquipCallback(equippedEquips[EquipType.overall.formattedName]),
            isCalculatingDifference: isCalculatingDifference);
        equippedEquipNames.remove(
            getEquipCallback(equippedEquips[EquipType.secondary.formattedName])
                ?.equipName);
        equippedEquips[EquipType.overall.formattedName] = null;
      case EquipType.secondary:
      case EquipType.shield:
      case EquipType.katara:
        replacedItemHash = equippedEquips[EquipType.secondary.formattedName];
        equippedEquips[EquipType.secondary.formattedName] = equip?.equipId;
      default:
        String equipKey;
        if (equipPosition > 0) {
          equipKey = "${equipType.formattedName}$equipPosition";
        } else {
          equipKey = equipType.formattedName;
        }
        replacedItemHash = equippedEquips[equipKey];
        equippedEquips[equipKey] = equip?.equipId;
    }

    // Only need to update set effects if the replaced item differs from the item we are equipping
    Equip? replacedItem = getEquipCallback(replacedItemHash);
    if (replacedItem?.equipName != equip?.equipName) {
      setEffectModule.removeEquip(replacedItem,
          isCalculatingDifference: isCalculatingDifference);
      setEffectModule.addEquip(equip);
    }
    // Make sure to remove the itemName from the tracker
    equippedEquipNames.remove(replacedItem?.equipName);

    return true;
  }

  void deleteEquip(Equip deletingEquip) {
    equippedEquips.forEach((key, value) {
      if (value == deletingEquip.equipId) {
        equippedEquipNames.remove(deletingEquip.equipName);
        equippedEquips[key] = null;
        setEffectModule.removeEquip(deletingEquip);
      }
    });
  }

  List<Map<StatType, num>> calculateStats() {
    List<Map<StatType, num>> equipStats = <Map<StatType, num>>[];

    for (int? equipId in equippedEquips.values) {
      var mapValue = getEquipCallback(equipId)?.calculateStats();
      if (mapValue != null) {
        equipStats.add(mapValue);
      }
    }

    equipStats.addAll(setEffectModule.calculateStats());

    return equipStats;
  }
}
