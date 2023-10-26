import 'package:flutter/material.dart';
import 'package:maplestory_builder/constants/constants.dart';
import 'package:maplestory_builder/constants/equipment/potential_stats.dart';
import 'package:maplestory_builder/constants/equipment/scroll_stats.dart';
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
  Map<StatType, TextEditingController> tweakTextControllers = {};

  EquipEditingProvider({
    this.editingEquip
  });

  void addEditingEquip(Equip equip) {
    editingEquip = equip.copyWith();
    updateCounter = START_EDITING_EQUIP;

    tweakTextControllers.forEach((key, value) {
      value.text = editingEquip?.tweakModule?.get(key).toString() ?? "0";
    });

    notifyListeners();
  }

  void cancelEquipEditing() {
    editingEquip = null;
    updateCounter = NO_EDITING_EQUIP;
    _clearTweakTextControllers();

    notifyListeners();
  }

  void saveEditingEquip(BuildContext context) {
    var equipModule = context.read<EquipsProvider>();
    equipModule.saveEditingEquip(editingEquip);
    editingEquip = null;
    updateCounter = NO_EDITING_EQUIP;
    _clearTweakTextControllers();

    notifyListeners();
  }

  void updateStarforce(num newStarValue) {
    if (editingEquip?.starForceModule != null) {
      editingEquip?.starForceModule?.updateStarforce(editingEquip!, newStarValue);
      updateCounter += 1;
      notifyListeners();
    }
  }

  void updateFlame(int flamePosition, {FlameType? flameType, FlameTier? flameTier, isUpdatingTier=false}) {
    if (editingEquip?.flameModule != null) {
      editingEquip?.flameModule?.updateFlame(editingEquip!, flamePosition, flameType: flameType, flameTier: flameTier, isUpdatingTier: isUpdatingTier);
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

  void addEditingScroll(BaseScroll? baseScroll) {
    if (baseScroll != null && editingEquip?.scrollModule != null) {
      editingEquip?.scrollModule?.addEditingScroll(baseScroll);
      updateCounter += 1;
      notifyListeners();
    }
  }

  void addScroll(BaseScroll? baseScroll) {
    if (baseScroll != null && editingEquip?.scrollModule != null) {
      editingEquip?.scrollModule?.addScroll(baseScroll);
      updateCounter += 1;
      notifyListeners();
    }
  }

  void deleteScroll(BaseScroll? scroll) {
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
      textController = TextEditingController(text: editingEquip?.tweakModule?.get(statType).toString() ?? "0");
      tweakTextControllers[statType] = textController;
    }

    return textController;
  }

  void _clearTweakTextControllers() {
    tweakTextControllers.forEach((key, value) {
      value.text = "0";
    });
  }
} 