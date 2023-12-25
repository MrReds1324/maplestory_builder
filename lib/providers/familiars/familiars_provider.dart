import 'package:flutter/material.dart';
import 'package:maplestory_builder/constants/constants.dart';
import 'package:maplestory_builder/constants/familiars/badge_stats.dart';
import 'package:maplestory_builder/modules/base.dart';
import 'package:maplestory_builder/modules/familiars/familiar.dart';
import 'package:maplestory_builder/modules/familiars/familiars_mod.dart';
import 'package:maplestory_builder/modules/utilities/utilities.dart';

class FamiliarsProvider with ChangeNotifier implements Copyable {
  // This is what we are going to use to set the equips hash value once it is saved here so that when 
  // rebuilding from json we can ensure the items stay "linked"
  int familiarHash;
  late Map<int, Familiar> allFamiliars;
  int activeBadgeSetNumber;
  late Map<int, BadgeContainer> badgeSets; 
  late BadgeContainer activeBadgeSet;

  int activeFamiliarSetNumber;
  late Map<int, FamiliarModule> familiarSets; 
  late FamiliarModule activeFamiliarSet;

  Widget hoverTooltip = const SizedBox.shrink();

  FamiliarsProvider({
    this.familiarHash = 1,
    this.activeBadgeSetNumber = 1,
    this.activeFamiliarSetNumber = 1,
    Map<int, Familiar>? allFamiliars,
    Map<int, BadgeContainer>? badgeSets,
    BadgeContainer? activeBadgeSet,
    Map<int, FamiliarModule>? familiarSets,
    FamiliarModule? activeFamiliarSet,
  }) {
    this.allFamiliars = allFamiliars ?? {};
    this.badgeSets = badgeSets ?? {
      1: BadgeContainer(),
      2: BadgeContainer(),
      3: BadgeContainer(),
      4: BadgeContainer(),
      5: BadgeContainer(),
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
    int? familiarHash,
    Map<int, Familiar>? allEquips,
    int? activeFamiliarSetNumber,
    int? activeBadgeSetNumber,
    Map<int, BadgeContainer>? badgeSets,
    BadgeContainer? activeBadgeSet,
    Map<int, FamiliarModule>? familiarSets,
    FamiliarModule? activeFamiliarSet,
  }) {
    return FamiliarsProvider(
      familiarHash: familiarHash ?? this.familiarHash,
      activeBadgeSetNumber: activeBadgeSetNumber ?? this.activeBadgeSetNumber,
      activeFamiliarSetNumber: activeFamiliarSetNumber ?? this.activeFamiliarSetNumber,
      badgeSets: badgeSets ?? mapDeepCopy(this.badgeSets),
      activeBadgeSet: activeBadgeSet ?? this.activeBadgeSet.copyWith(),
      familiarSets: familiarSets ?? mapDeepCopy(this.familiarSets),
      activeFamiliarSet: activeFamiliarSet ?? this.activeFamiliarSet.copyWith()
    );
  }

  Familiar? getFamiliarCallback(int? familiarHash) {
    return allFamiliars[familiarHash];
  }

  Map<StatType, num> calculateStats() {
    return {
    };
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
    if (editingFamiliar.familiarHash == -1) {
      editingFamiliar.familiarHash = familiarHash;
      allFamiliars[editingFamiliar.familiarHash] = editingFamiliar;
      familiarHash++;
    }
    // Repalce the old version of the familiar with the new one if we updated one that already exists
    else {
      allFamiliars[editingFamiliar.familiarHash] = editingFamiliar;
    }
    notifyListeners();
  }

  void deleteFamiliar(Familiar deletingFamiliar) {
    allFamiliars.remove(deletingFamiliar.familiarHash);
    for (FamiliarModule familiarModule in familiarSets.values) {
      familiarModule.deleteFamiliar(deletingFamiliar);
    }
    notifyListeners();
  }

  void equipBadge(BadgeName? badgeName, int badgePosition) {
    activeBadgeSet.equipBadge(badgeName, badgePosition);
  }

  void changeActiveBadgeSet(int familiarSetNumber) {
    activeFamiliarSetNumber = familiarSetNumber;
    activeFamiliarSet = familiarSets[familiarSetNumber]!;

    notifyListeners();
  }

  void changeActiveFamiliarSet(int badgeSetNumber) {
    activeBadgeSetNumber = badgeSetNumber;
    activeBadgeSet = badgeSets[badgeSetNumber]!;

    notifyListeners();
  }
}

class BadgeContainer implements Copyable {
  // There will be 8 active badges
  Map<int, BadgeName?> activebadges;

  BadgeContainer({
    Map<int, BadgeName?>? activebadges
  }) : activebadges = activebadges ?? {};

  @override
  BadgeContainer copyWith({
    Map<int, BadgeName?>? activebadges
  }) {
    return BadgeContainer(
      activebadges: activebadges ?? Map.of(this.activebadges)
    );
  }

  void equipBadge(BadgeName? badgeName, int badgePosition) {
    activebadges[badgePosition] = badgeName;
  }

  BadgeName? getSelectedBadge(int badgePosition) {
    return activebadges[badgePosition];
  }
}