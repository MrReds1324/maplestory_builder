import 'package:flutter/material.dart';
import 'package:maplestory_builder/constants/constants.dart';
import 'package:maplestory_builder/constants/equipment/flame_stats.dart';
import 'package:maplestory_builder/constants/equipment/pitched_boss_upgrades.dart';
import 'package:maplestory_builder/constants/equipment/potential_stats.dart';
import 'package:maplestory_builder/constants/equipment/scroll_stats.dart';
import 'package:maplestory_builder/constants/equipment/starforce_stats.dart';
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
  // Used to hide/show editing expansion tiles and their contents in the editing window
  bool canStar = false;
  bool canFlame = false;
  bool canPotential = false;
  bool canScroll = false;
  bool canSoul = false;
  bool canPitchedBossUpgrade = false;
  // Used to accurately modify/update the value in the tweak text controllers when loading an equip item
  // that already has values in the tweak module
  Map<StatType, TextEditingController> tweakTextControllers = {};

  EquipEditingProvider({
    this.editingEquip
  });

  void addEditingEquip(Equip equip) {
    editingEquip = equip.copyWith();
    _setEditingState();

    notifyListeners();
  }

  void cancelEquipEditing() {
    _clearEditingState();

    notifyListeners();
  }

  void saveEditingEquip(BuildContext context) {
    var equipModule = context.read<EquipsProvider>();
    equipModule.saveEditingEquip(editingEquip);
    _clearEditingState();

    notifyListeners();
  }

  void updateStarforce(num newStarValue) {
    if (editingEquip?.starForceModule != null) {
      editingEquip?.starForceModule?.updateStarforce(editingEquip!, newStarValue);
      updateCounter += 1;
      notifyListeners();
    }
  }

  void updateFlame(int flamePosition, {FlameName? flameName, FlameTier? flameTier, isUpdatingTier=false}) {
    if (editingEquip?.flameModule != null) {
      editingEquip?.flameModule?.updateFlame(editingEquip!, flamePosition, flameName: flameName, flameTier: flameTier, isUpdatingTier: isUpdatingTier);
      updateCounter += 1;
      notifyListeners();
    }
  }

  void updatePotentialTier(PotentialTier? potentialTier, {bool isBonus=false}) {
    if (editingEquip?.potentialModule != null) {
      editingEquip?.potentialModule?.updatePotentialTier(potentialTier, isBonus: isBonus);
      updateCounter += 1;
      notifyListeners();
    }
  }

  void updatePotential(int potentialPosition, PotentialLine? potentialLine, {bool isBonus=false}) {
    if (editingEquip?.potentialModule != null) {
      editingEquip?.potentialModule?.updatePotential(potentialPosition, potentialLine, isBonus: isBonus);
      updateCounter += 1;
      notifyListeners();
    }
  }

  void addScrollByName(ScrollName? baseScroll) {
    if (baseScroll != null && editingEquip?.scrollModule != null) {
      editingEquip?.scrollModule?.addScrollByName(baseScroll);
      updateCounter += 1;
      notifyListeners();
    }
  }

  void addEditingScroll(AbstractScroll? scroll) {
    if (scroll != null && editingEquip?.scrollModule != null) {
      editingEquip?.scrollModule?.addEditingScroll(scroll);
      updateCounter += 1;
      notifyListeners();
    }
  }

  void addScroll(AbstractScroll? scroll) {
    if (scroll != null && editingEquip?.scrollModule != null) {
      editingEquip?.scrollModule?.addScroll(scroll);
      updateCounter += 1;
      notifyListeners();
    }
  }

  void deleteScroll(AbstractScroll? scroll) {
    if (scroll != null && editingEquip?.scrollModule != null) {
      editingEquip?.scrollModule?.deleteScroll(scroll);
      updateCounter += 1;
      notifyListeners();
    }
  }

  void updateEditingScrollStatsValue(StatType statType, double statValue) {
    if (editingEquip?.scrollModule != null) {
      editingEquip!.scrollModule!.updateEditingScrollStatsValue(statType, statValue);
      updateCounter += 1;
      notifyListeners();
    }
  }

  void clearEditingScroll() {
    if (editingEquip?.scrollModule != null) {
      editingEquip!.scrollModule!.clearEditingScroll();
      updateCounter += 1;
      notifyListeners();
    }
  }

  void updateTweakStat(StatType statType, int statValue) {
    if (editingEquip?.tweakModule != null) {
      editingEquip!.tweakModule!.updateTweakStat(statType, statValue);
      updateCounter += 1;
      notifyListeners();
    }
  }

  TextEditingController getTweakTextController(StatType statType) {
    var textController = tweakTextControllers[statType];
    if (textController == null) {
      textController = TextEditingController(text: editingEquip?.tweakModule?.get(statType).toString() ?? "");
      tweakTextControllers[statType] = textController;
    }

    return textController;
  }

  void _setEditingState() {
    updateCounter = START_EDITING_EQUIP;

    tweakTextControllers.forEach((key, value) {
      value.text = editingEquip!.tweakModule?.get(key).toString() ?? "";
    });

    if (editingEquip!.equipName.starForceCategory == StarForceCategory.player) {
      canStar = true;
    }

    if (editingEquip!.equipName.flameCategory != FlameCategory.none) {
      canFlame = true;
    }

    if (editingEquip!.equipName.potentialCategory == PotentialCategory.player) {
      canPotential = true;
    }

    if (editingEquip!.equipName.maxScrollsSlots != 0) {
      canScroll = true;
    }

    if (editingEquip!.equipName.equipType == EquipType.weapon && editingEquip!.equipName.itemLevel >= 75) {
      canSoul = true;
    }

    canPitchedBossUpgrade = isEquipPitchBossUpgradeable(editingEquip!.equipName);   
  }

  void _clearTweakTextControllers() {
    tweakTextControllers.forEach((key, value) {
      value.text = "";
    });
  }

  void _clearEditingState() {
    editingEquip = null;
    updateCounter = NO_EDITING_EQUIP;
    canStar = false;
    canFlame = false;
    canPotential = false;
    canScroll = false;
    canSoul = false;
    canPitchedBossUpgrade = false;
    _clearTweakTextControllers();
  }
} 