import 'package:flutter/material.dart';
import 'package:maplestory_builder/constants/familiars/potential_stats.dart';
import 'package:maplestory_builder/modules/familiars/familiar.dart';
import 'package:maplestory_builder/providers/familiars/familiars_provider.dart';
import 'package:provider/provider.dart';

// ignore: constant_identifier_names
const int START_EDITING_FAMILIAR = 1;
// ignore: constant_identifier_names
const int NO_EDITING_FAMILIAR = 0;

class FamiliarEditingProvider with ChangeNotifier {

  HexaStat? editingFamiliar;
  int updateCounter = NO_EDITING_FAMILIAR;
  bool isEditing = false;

  TextEditingController textController;

  FamiliarEditingProvider({
    this.editingFamiliar
  }): textController = TextEditingController(text: "");

  void addEditingFamiliar({HexaStat? familiar}) {
    editingFamiliar = familiar?.copyWith() ?? HexaStat();
    _setEditingState();

    notifyListeners();
  }

  void cancelEquipFamiliar() {
    _clearEditingState();

    notifyListeners();
  }

  void saveEditingFamiliar(BuildContext context) {
    context.read<FamiliarsProvider>().saveEditingFamiliar(editingFamiliar);
    _clearEditingState();

    notifyListeners();
  }

  void updatePotentialTier(FamiliarPotentialTier? familiarPotentialTier) {
    editingFamiliar?.updatePotentialTier(familiarPotentialTier);
    updateCounter += 1;
    notifyListeners();
  }

  void updatePotentialSelection(int potentialPosition, (FamiliarPotential, bool)? familiarPotentialSelection) {
    if (editingFamiliar?.updatePotentialSelection(potentialPosition, familiarPotentialSelection) ?? false) {
      updateCounter += 1;
      notifyListeners();
    }
  }

  void updatePotential(int potentialPosition, int familiarPotentialOffset) {
    editingFamiliar?.updatePotential(potentialPosition, familiarPotentialOffset);
    updateCounter += 1;
    notifyListeners();
  }

  void updateFamiliarName(String familiarName) {
    editingFamiliar?.familiarName = familiarName;
    updateCounter += 1;
    notifyListeners();
  }

  void _setEditingState() {
    updateCounter = START_EDITING_FAMILIAR;
    textController.text = editingFamiliar?.familiarName ?? "";
    isEditing = true;
  }

  void _clearEditingState() {
    editingFamiliar = null;
    updateCounter = NO_EDITING_FAMILIAR;
    textController.text = "";
    isEditing = false;
  }
} 