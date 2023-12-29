import 'package:flutter/material.dart';
import 'package:maplestory_builder/constants/constants.dart';
import 'package:maplestory_builder/constants/hexa_stats/hexa_stats.dart';
import 'package:maplestory_builder/modules/hexa_stats.dart/hexa_stat.dart';
import 'package:maplestory_builder/providers/hexa_stats/hexa_stats_provider.dart';
import 'package:provider/provider.dart';

// ignore: constant_identifier_names
const int START_EDITING_HEXA_STAT = 1;
// ignore: constant_identifier_names
const int NO_EDITING_HEXA_STAT = 0;

class HexaStatEditingProvider with ChangeNotifier {

  HexaStat? editingHexaStat;
  int updateCounter = NO_EDITING_HEXA_STAT;
  bool isEditing = false;

  TextEditingController textController;

  HexaStatEditingProvider({
    this.editingHexaStat
  }): textController = TextEditingController(text: "");

  void addEditingHexaStat({HexaStat? hexaStat}) {
    editingHexaStat = hexaStat?.copyWith() ?? HexaStat();
    _setEditingState();

    notifyListeners();
  }

  void cancelEditingHexaStat() {
    _clearEditingState();

    notifyListeners();
  }

  void saveEditingHexaStat(BuildContext context) {
    context.read<HexaStatsProvider>().saveEditingHexaStat(editingHexaStat);
    _clearEditingState();

    notifyListeners();
  }

  void updateHexaStatType(HexaStatType? hexaStatType) {
    editingHexaStat?.updateHexaStatType(hexaStatType);
    updateCounter += 1;
    notifyListeners();
  }

  void updateStatSelection(int statPosition, StatType? statType) {
    if (editingHexaStat?.updateStatSelection(statPosition, statType) ?? false) {
      updateCounter += 1;
      notifyListeners();
    }
  }

  void addHexaStatLevel(int statPosition) {
    if (editingHexaStat?.addHexaStatLevel(statPosition) ?? false) {
      updateCounter += 1;
      notifyListeners();
    }
  }

  void subtractHexaStatLevel(int statPosition) {
    if (editingHexaStat?.subtractHexaStatLevel(statPosition) ?? false) {
      updateCounter += 1;
      notifyListeners();
    }
  }

  void updateHexaStatName(String hexaStatName) {
    editingHexaStat?.hexaStatName = hexaStatName;
    updateCounter += 1;
    notifyListeners();
  }

  void _setEditingState() {
    updateCounter = START_EDITING_HEXA_STAT;
    textController.text = editingHexaStat?.hexaStatName ?? "";
    isEditing = true;
  }

  void _clearEditingState() {
    editingHexaStat = null;
    updateCounter = NO_EDITING_HEXA_STAT;
    textController.text = "";
    isEditing = false;
  }
} 