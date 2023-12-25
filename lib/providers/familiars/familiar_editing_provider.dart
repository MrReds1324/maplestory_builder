import 'package:flutter/material.dart';
import 'package:maplestory_builder/constants/familiars/potential_stats.dart';
import 'package:maplestory_builder/modules/familiars/familiar.dart';
import 'package:maplestory_builder/providers/familiars/familiar_provider.dart';
import 'package:provider/provider.dart';

// ignore: constant_identifier_names
const int START_EDITING_FAMILIAR = 1;
// ignore: constant_identifier_names
const int NO_EDITING_FAMILIAR = 0;

class FamiliarEditingProvider with ChangeNotifier {

  Familiar? editingFamiliar;
  int updateCounter = NO_EDITING_FAMILIAR;

  FamiliarEditingProvider({
    this.editingFamiliar
  });

  void addEditingFamiliar({Familiar? familiar}) {
    editingFamiliar = familiar?.copyWith() ?? Familiar();
    _setEditingState();

    notifyListeners();
  }

  void cancelEquipEditing() {
    _clearEditingState();

    notifyListeners();
  }

  void saveEditingEquip(BuildContext context) {
    context.read<FamiliarProvider>().saveEditingFamiliar(editingFamiliar);
    _clearEditingState();

    notifyListeners();
  }

  void updatePotentialTier(FamiliarPotentialTier? familiarPotentialTier) {
    editingFamiliar?.updatePotentialTier(familiarPotentialTier);
    updateCounter += 1;
    notifyListeners();
  }

  void updatePotential(int potentialPosition, FamiliarPotential? familiarPotential) {
    editingFamiliar?.updatePotential(potentialPosition, familiarPotential);
    updateCounter += 1;
    notifyListeners();
  }

  void _setEditingState() {
    updateCounter = START_EDITING_FAMILIAR;  
  }

  void _clearEditingState() {
    editingFamiliar = null;
    updateCounter = NO_EDITING_FAMILIAR;
  }
} 