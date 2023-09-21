import 'package:flutter/material.dart';
import 'package:maplestory_builder/core/constants.dart';
import 'package:maplestory_builder/core/constants/equipment/potential_stats.dart';
import 'package:maplestory_builder/modules/equipment/equips.dart';
import 'package:maplestory_builder/providers/equips_provider.dart';
import 'package:provider/provider.dart';

// ignore: constant_identifier_names
const int START_EDITING_EQUIP = 1;
// ignore: constant_identifier_names
const int NO_EDITING_EQUIP = 0;

class EquipEditingProvider with ChangeNotifier {

  Equip? editingEquip;
  int updateCounter = NO_EDITING_EQUIP;

  EquipEditingProvider({
    this.editingEquip
  });

  void addEditingEquip(Equip equip) {
    editingEquip = equip.copyWith();
    updateCounter = START_EDITING_EQUIP;
    notifyListeners();
  }

  void cancelEquipEditing() {
    editingEquip = null;
    updateCounter = NO_EDITING_EQUIP;
    notifyListeners();
  }

  void saveEditingEquip(BuildContext context) {
    var equipModule = context.read<EquipsProvider>();
    equipModule.saveEditingEquip(editingEquip);
    editingEquip = null;
    updateCounter = NO_EDITING_EQUIP;
    notifyListeners();
  }

  void updateStarforce(num newStarValue) {
    editingEquip?.updateStarforce(newStarValue);
    updateCounter += 1;
    notifyListeners();
  }

  void updateFlame(int flamePosition, {FlameType? flameType, FlameTier? flameTier, isUpdatingTier=false}){
    editingEquip?.updateFlame(flamePosition, flameType: flameType, flameTier: flameTier, isUpdatingTier: isUpdatingTier);
    updateCounter += 1;
    notifyListeners();
  }

  void updatePotentialTier(PotentialTier? potentialTier, {bool isBonus=false}) {
    editingEquip?.updatePotentialTier(potentialTier, isBonus: isBonus);
    updateCounter += 1;
    notifyListeners();
  }

  void updatePotential(int potentialPosition, PotentialLine? potentialLine, {bool isBonus=false}) {
    editingEquip?.updatePotential(potentialPosition, potentialLine, isBonus: isBonus);
    updateCounter += 1;
    notifyListeners();
  }
} 