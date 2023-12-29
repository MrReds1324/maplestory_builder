import 'package:flutter/material.dart';
import 'package:maplestory_builder/constants/constants.dart';
import 'package:maplestory_builder/constants/familiars/badge_stats.dart';
import 'package:maplestory_builder/modules/base.dart';
import 'package:maplestory_builder/modules/familiars/badges_mod.dart';
import 'package:maplestory_builder/modules/familiars/familiar.dart';
import 'package:maplestory_builder/modules/familiars/familiars_mod.dart';
import 'package:maplestory_builder/modules/utilities/utilities.dart';

class FamiliarsProvider with ChangeNotifier implements Copyable {
  // This is what we are going to use to set the equips hash value once it is saved here so that when 
  // rebuilding from json we can ensure the items stay "linked"
  int familiarId;
  late Map<int, Familiar> allFamiliars;
  int activeBadgeSetNumber;
  late Map<int, BadgeModule> badgeSets; 
  late BadgeModule activeBadgeSet;

  int activeFamiliarSetNumber;
  late Map<int, FamiliarModule> familiarSets; 
  late FamiliarModule activeFamiliarSet;

  Widget hoverTooltip = const SizedBox.shrink();

  FamiliarsProvider({
    this.familiarId = 1,
    this.activeBadgeSetNumber = 1,
    this.activeFamiliarSetNumber = 1,
    Map<int, Familiar>? allFamiliars,
    Map<int, BadgeModule>? badgeSets,
    BadgeModule? activeBadgeSet,
    Map<int, FamiliarModule>? familiarSets,
    FamiliarModule? activeFamiliarSet,
  }) {
    this.allFamiliars = allFamiliars ?? {};
    this.badgeSets = badgeSets ?? {
      1: BadgeModule(),
      2: BadgeModule(),
      3: BadgeModule(),
      4: BadgeModule(),
      5: BadgeModule(),
    };
    this.activeBadgeSet = activeBadgeSet ?? this.badgeSets[activeBadgeSetNumber]!;

    this.familiarSets = familiarSets ?? {
      1: FamiliarModule(getFamiliarCallback: getFamiliarCallback),
      2: FamiliarModule(getFamiliarCallback: getFamiliarCallback),
      3: FamiliarModule(getFamiliarCallback: getFamiliarCallback),
      4: FamiliarModule(getFamiliarCallback: getFamiliarCallback),
      5: FamiliarModule(getFamiliarCallback: getFamiliarCallback),
    };
    this.activeFamiliarSet = activeFamiliarSet ?? this.familiarSets[activeFamiliarSetNumber]!;
  }

  @override
  FamiliarsProvider copyWith({
    int? familiarId,
    Map<int, Familiar>? allFamiliars,
    int? activeFamiliarSetNumber,
    int? activeBadgeSetNumber,
    Map<int, BadgeModule>? badgeSets,
    BadgeModule? activeBadgeSet,
    Map<int, FamiliarModule>? familiarSets,
    FamiliarModule? activeFamiliarSet,
  }) {
    return FamiliarsProvider(
      familiarId: familiarId ?? this.familiarId,
      allFamiliars: allFamiliars ?? Map.of(this.allFamiliars),
      activeBadgeSetNumber: activeBadgeSetNumber ?? this.activeBadgeSetNumber,
      activeFamiliarSetNumber: activeFamiliarSetNumber ?? this.activeFamiliarSetNumber,
      badgeSets: badgeSets ?? mapDeepCopy(this.badgeSets),
      activeBadgeSet: activeBadgeSet ?? this.activeBadgeSet.copyWith(),
      familiarSets: familiarSets ?? mapDeepCopy(this.familiarSets),
      activeFamiliarSet: activeFamiliarSet ?? this.activeFamiliarSet.copyWith()
    );
  }

  Familiar? getFamiliarCallback(int? familiarId) {
    return allFamiliars[familiarId];
  }

  List<Map<StatType, num>> calculateStats() {
    return [activeBadgeSet.moduleStats, activeFamiliarSet.calculateStats()];
  }

  void equipFamiliar(Familiar? familiar, int familiarPosition) {
    activeFamiliarSet.equipFamiliar(familiar, familiarPosition);
    notifyListeners();
  }

  void saveEditingFamiliar(Familiar? editingFamiliar) {
    // Nothing to actually save, return immediately
    if (editingFamiliar == null) {
      return;
    }
    
    // New familiar that cannot be equipped
    if (editingFamiliar.familiarId == -1) {
      editingFamiliar.familiarId = familiarId;
      editingFamiliar.familiarName = editingFamiliar.familiarName.isEmpty ? "Familiar $familiarId" : editingFamiliar.familiarName;
      allFamiliars[editingFamiliar.familiarId] = editingFamiliar;
      familiarId++;
    }
    // Repalce the old version of the familiar with the new one if we updated one that already exists
    else {
      allFamiliars[editingFamiliar.familiarId] = editingFamiliar;
    }

    for (FamiliarModule familiarModule in familiarSets.values) {
      familiarModule.cacheValue = null;
    }

    notifyListeners();
  }

  void deleteFamiliar(Familiar deletingFamiliar) {
    allFamiliars.remove(deletingFamiliar.familiarId);
    for (FamiliarModule familiarModule in familiarSets.values) {
      familiarModule.deleteFamiliar(deletingFamiliar);
    }
    notifyListeners();
  }

  void equipBadge(BadgeName? badgeName, int badgePosition) {
    activeBadgeSet.equipBadge(badgeName, badgePosition);

    notifyListeners();
  }

  void changeActiveBadgeSet(int badgeSetNumber) {
    activeBadgeSetNumber = badgeSetNumber;
    activeBadgeSet = badgeSets[badgeSetNumber]!;

    notifyListeners();
  }

  void changeActiveFamiliarSet(int familiarSetNumber) {
    activeFamiliarSetNumber = familiarSetNumber;
    activeFamiliarSet = familiarSets[familiarSetNumber]!;

    notifyListeners();
  }
}
