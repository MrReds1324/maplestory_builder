import 'package:flutter/material.dart';
import 'package:maplestory_builder/constants/constants.dart';
import 'package:maplestory_builder/modules/equipment/equip_sets_mod.dart';
import 'package:maplestory_builder/modules/equipment/equipment_mod.dart';

import 'package:maplestory_builder/modules/equipment/equips.dart';

class EquipsProvider with ChangeNotifier{
  // This is what we are going to use to set the equips hash value once it is saved here so that when 
  // rebuilding from json we can ensure the items stay "linked"
  int equipHash = 1;
  late Map<int, Equip> allEquips;
  late Map<int, EquipmentModule> equipSets; 
  late EquipmentModule activeEquipSet;
  SetEffectModule setEffectModule = SetEffectModule();

  EquipsProvider({
    Map<int, Equip>? allEquips,
    Map<int, EquipmentModule>? equipSets,
    EquipmentModule? activeEquipSet,
    this.equipHash = 1,
  }) {
    this.allEquips = allEquips ?? {};
    this.equipSets = equipSets ?? {
      1: EquipmentModule(getEquipCallback: getEquipCallback),
      2: EquipmentModule(getEquipCallback: getEquipCallback),
      3: EquipmentModule(getEquipCallback: getEquipCallback),
      4: EquipmentModule(getEquipCallback: getEquipCallback),
      5: EquipmentModule(getEquipCallback: getEquipCallback),
    };
    this.activeEquipSet = activeEquipSet ?? this.equipSets[1]!;
  }

  EquipsProvider copyWith({
    Map<int, Equip>? allEquips,
    Map<int, EquipmentModule>? equipSets,
    EquipmentModule? activeEquipSet,
    int? equipHash,
  }) {
    return EquipsProvider(
      allEquips: allEquips ?? Map.from(this.allEquips),
      equipSets: equipSets ?? Map.from(this.equipSets),
      activeEquipSet: activeEquipSet ?? this.activeEquipSet.copyWith(),
      equipHash: equipHash ?? this.equipHash,
    );
  }

  Equip? getEquipCallback(int? equipHash) {
    return allEquips[equipHash];
  }

  void equipEquip(Equip? equip, EquipType equipType, {int equipPosition = 0, bool isCalculatingDifference = false}) {
    var didEquip = activeEquipSet.equipEquip(equip, equipType, equipPosition: equipPosition, isCalculatingDifference: isCalculatingDifference);
    
    if (didEquip) {
      notifyListeners();
    }
  }

  void saveEditingEquip(Equip? editingEquip) {
    // Nothing to actually save, return immediately
    if (editingEquip == null) {
      return;
    }
    
    // New equip that cannot be equipped
    if (editingEquip.equipHash == -1) {
      editingEquip.equipHash = equipHash;
      allEquips[editingEquip.equipHash] = editingEquip;
      equipHash++;
    }
    // Repalce the old version of the item with the new one if we updated one that already exists
    else {
      allEquips[editingEquip.equipHash] = editingEquip;
    }
    notifyListeners();
  }

  void deleteEquip(Equip deletingEquip) {
    allEquips.remove(deletingEquip.equipHash);
    for (EquipmentModule equipmentModule in equipSets.values) {
      equipmentModule.deleteEquip(deletingEquip);
    }
    notifyListeners();
  }

  List<Map<StatType, num>> calculateStats() {
    return activeEquipSet.calculateStats();
  }
}
