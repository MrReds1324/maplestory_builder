import 'package:flutter/material.dart';
import 'package:maplestory_builder/constants/character/legion_stats.dart';
import 'package:maplestory_builder/modules/legion/legion_mod.dart';
import 'package:maplestory_builder/providers/legion/legion_stats_provider.dart';
import 'package:provider/provider.dart';

// ignore: constant_identifier_names
const int START_EDITING_EQUIP = 1;
// ignore: constant_identifier_names
const int NO_EDITING_EQUIP = 0;

class LegionCharacterEditingProvider with ChangeNotifier {

  LegionCharacter? editingLegionCharacter;
  int updateCounter = NO_EDITING_EQUIP;

  // Used to accurately modify/update the value in the level text controllers when loading an legion character
  // that already has a value in the levels
  TextEditingController levelTextController = TextEditingController(text: "0");

  LegionCharacterEditingProvider({
    this.editingLegionCharacter
  });

  void addEditingLegionCharacter({LegionCharacter? legionCharacter}) {
    if (legionCharacter == null) {
      editingLegionCharacter = LegionCharacter(legionBlock: LegionBlock.nothing);
    }
    else {
      editingLegionCharacter = legionCharacter.copyWith();
      levelTextController.text = "${legionCharacter.legionCharacterLevel}";
    }
    _setEditingState();

    notifyListeners();
  }

  void cancelLegionCharacterEditing() {
    _clearEditingState();

    notifyListeners();
  }

  void saveEditingLegionCharacter(BuildContext context) {
    var legionStatsProvider = context.read<LegionStatsProvider>();
    legionStatsProvider.saveEditingLegionCharacter(editingLegionCharacter);
    _clearEditingState();

    notifyListeners();
  }

  void updateCharacterLevel(int characterLevel) {
    if (editingLegionCharacter != null) {
      if (characterLevel > 300) {
        characterLevel = 300;
      }
      editingLegionCharacter!.legionCharacterLevel = characterLevel;
      updateCounter += 1;
      notifyListeners();
    }
  }

  void updatedLegionBlock(LegionBlock legionBlock) {
    if (editingLegionCharacter != null) {
      editingLegionCharacter!.legionBlock = legionBlock;

      if (legionBlock.staticLegionLevel != null) {
        editingLegionCharacter!.legionCharacterLevel = legionBlock.staticLegionLevel!;
        levelTextController.text = "${editingLegionCharacter!.legionCharacterLevel}";
      }
    
      updateCounter += 1;
      notifyListeners();
    }
  }

  void _setEditingState() {
    updateCounter = START_EDITING_EQUIP;
  }

  void _clearLevelTextController() {
    levelTextController.text = "0";
  }

  void _clearEditingState() {
    editingLegionCharacter = null;
    updateCounter = NO_EDITING_EQUIP;
    _clearLevelTextController();
  }
} 