import 'package:flutter/material.dart';
import 'package:maplestory_builder/constants/constants.dart';
import 'package:maplestory_builder/constants/equipment/potential_stats.dart';
import 'package:maplestory_builder/modules/base.dart';
import 'package:maplestory_builder/modules/equipment/equips.dart';
import 'package:maplestory_builder/modules/utilities/utilities.dart';

class PotentialModule implements Copyable {

  PotentialTier? mainPotential;
  Map<int, PotentialLine?> mainPotentials;

  PotentialTier? bonusPotential;
  Map<int, PotentialLine?> bonusPotentials;

  Map<StatType, num> moduleStats;
  int potentialOffset;

  PotentialModule({
    this.mainPotential,
    Map<int, PotentialLine?>? mainPotentials,
    this.bonusPotential,
    Map<int, PotentialLine?>? bonusPotentials,
    required this.potentialOffset,
    Map<StatType, num>? moduleStats,
  }): moduleStats = moduleStats ?? {},
      mainPotentials = mainPotentials ?? {},
      bonusPotentials = bonusPotentials ?? {};

  @override
  PotentialModule copyWith({
    PotentialTier? mainPotential,
    Map<int, PotentialLine>? mainPotentials,
    PotentialTier? bonusPotential,
    Map<int, PotentialLine>? bonusPotentials,
    int? potentialOffset,
    Map<StatType, num>? moduleStats,
  }) {
    return PotentialModule(
      mainPotential: mainPotential ?? this.mainPotential,
      mainPotentials: mainPotentials ?? mapDeepCopy(this.mainPotentials),
      bonusPotential: bonusPotential ?? this.bonusPotential,
      bonusPotentials: bonusPotentials ?? mapDeepCopy(this.bonusPotentials),
      potentialOffset: potentialOffset ?? this.potentialOffset,
      moduleStats: moduleStats ?? Map<StatType, num>.from(this.moduleStats)
    );
  }

  num get(StatType statType) {
    return moduleStats[statType] ?? 0;
  }

  void _updateStatFromPotential(PotentialLine? potentialLine) {
      if (potentialLine == null) {
        return;
      }
      else {
        num statValue = 0;
        if (potentialLine.potentialName.potentialType == PotentialType.static) {
          assert(potentialLine.potentialName.statValue is num, "Static potential lines must be of type num");
          statValue = potentialLine.potentialName.statValue;
        }
        else if (potentialLine.potentialName.potentialType == PotentialType.range) {
          assert(potentialLine.potentialName.statValue is List, "Range potential lines must be of type num");
          statValue = potentialLine.potentialName.statValue[potentialOffset];
        }
        else {
          // TODO: add skill stuff here
        }

        switch(potentialLine.statType) {
          case StatType.ignoreDefense:
            moduleStats[potentialLine.statType] = calculateIgnoreDefense((moduleStats[potentialLine.statType] ?? 0), statValue);
          case StatType.skill:
            // TODO: add skill stuff here
          default:
            moduleStats[potentialLine.statType] = (moduleStats[potentialLine.statType] ?? 0) + statValue;
        }
      }
    }

  void updatePotentialTier(PotentialTier? potentialTier, {bool isBonus=false}) {
    if (isBonus) {
      if (bonusPotential != potentialTier) {
        bonusPotentials = {};
        bonusPotential = potentialTier;
      }
    }
    else {
      if (mainPotential != potentialTier) {
        mainPotentials = {};
        mainPotential = potentialTier;
      }
    }

    calculateModuleStats();
  }

  void updatePotential(int potentialPosition, PotentialLine? potentialLine, {bool isBonus=false}) {
    if (isBonus) {
      bonusPotentials[potentialPosition] = potentialLine;
    }
    else {
      mainPotentials[potentialPosition] = potentialLine;
    }

    calculateModuleStats();
  }

  void calculateModuleStats() {
    moduleStats = {};
    for (PotentialLine? potentialLine in mainPotentials.values) {
      _updateStatFromPotential(potentialLine);
    }

    for (PotentialLine? potentialLine in bonusPotentials.values) {
      _updateStatFromPotential(potentialLine);
    }
  }

  Widget buildPotentialWidget(BuildContext context, Equip editingEquip) {
    List<Widget> childrenWidgets = [];

    void addPotentialLine(PotentialLine? potentialLine) {
      if (potentialLine == null) {
        return;
      }
      else {
        num? valueToDisplay;
        if (potentialLine.potentialName.potentialType == PotentialType.static) {
          assert(potentialLine.potentialName.statValue is num, "Static potential lines must be of type num");
          valueToDisplay = potentialLine.potentialName.statValue;
        }
        else if (potentialLine.potentialName.potentialType == PotentialType.range) {
          assert(potentialLine.potentialName.statValue is List, "Range potential lines must be of type num");
          valueToDisplay = potentialLine.potentialName.statValue[potentialOffset];
        }
        else {
          // TODO: add skill stuff here
        }

        childrenWidgets.add(
          RichText(
            text: TextSpan(
              children: [
                TextSpan(
                  text: "${potentialLine.statType.formattedName} +${potentialLine.statType.isPercentage ? doubleRoundPercentFormater.format(valueToDisplay) : valueToDisplay}",
                  style: Theme.of(context).textTheme.bodyMedium
                ),
                TextSpan(
                  text: potentialLine.isPrime ? "  (Prime)" : "",
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(color: starColor),
                ),
              ]
            )
          ),
        );
      }
    }

    if (mainPotential != null) {
      childrenWidgets.add(
        RichText(
          text: TextSpan(
            children: [
              TextSpan(
                text: "Potential (${mainPotential!.formattedName})",
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(color: mainPotential!.color)
              )
            ]
          )
        )
      );
      for (PotentialLine? mainPotentialLine in mainPotentials.values) {
        addPotentialLine(mainPotentialLine);
      }
    }

    if (bonusPotential != null) {
      childrenWidgets.add(
        RichText(
          text: TextSpan(
            children: [
              TextSpan(
                text: "Bonus Potential (${bonusPotential!.formattedName})",
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(color: bonusPotential!.color)
              )
            ]
          )
        )
      );
      for (PotentialLine? bonusPotentialLine in bonusPotentials.values) {
        addPotentialLine(bonusPotentialLine);
      }
    }

    return Container(
      padding: const EdgeInsets.only(top: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: childrenWidgets
      ),
    );
  }
}

int getPotentialOffsetFromItemLevel(int itemLevel) {
  if (itemLevel <= 10) { // 0-10
    return INDEX_0;
  }
  else if (itemLevel <= 20) { // 11-20
    return INDEX_11;
  }
  else if (itemLevel <= 30) { // 21-30
    return INDEX_21;
  }
  else if (itemLevel <= 40) { // 31-40
    return INDEX_31;
  }
  else if (itemLevel <= 50) { // 41-50
    return INDEX_41;
  }
  else if (itemLevel <= 60) { // 51-60
    return INDEX_51;
  }
  else if (itemLevel <= 70) { // 61-70
    return INDEX_61;
  }
  else if (itemLevel <= 80) { // 71-80
    return INDEX_71;
  }
  else if (itemLevel <= 90) { // 81-90
    return INDEX_81;
  }
  else if (itemLevel <= 100) { // 91-100
    return INDEX_91;
  }
  else if (itemLevel <= 110) { // 101-110
    return INDEX_101;
  }
  else if (itemLevel <= 150) { // 111-150
    return INDEX_111;
  }
  else { // 151+
    return INDEX_151;
  }
}

List<PotentialLine> getPotentialsListForEquip(Equip editingEquip, {bool isBonus=false}) {
  List<PotentialLine> filteredList;
  if (isBonus) {
    switch(editingEquip.equipName.equipType) {
      case EquipType.hat:
        filteredList = bonusHatPotentials[editingEquip.potentialModule?.mainPotential] ?? [];
      case EquipType.overall:
      case EquipType.top:
      case EquipType.bottom:
      case EquipType.shoes:
      case EquipType.cape:
      case EquipType.belt:
      case EquipType.shoulder:
        filteredList = bonusTopOverallBottomShoesCapeBeltShoulderPotentials[editingEquip.potentialModule?.mainPotential] ?? [];
      case EquipType.gloves:
        filteredList = bonusGlovesPotentials[editingEquip.potentialModule?.mainPotential] ?? [];
      case EquipType.face:
      case EquipType.eye:
      case EquipType.ring:
      case EquipType.pendant:
      case EquipType.earrings:
        filteredList = bonusFaceEyeRingPendantEarringPotentials[editingEquip.potentialModule?.mainPotential] ?? [];
      case EquipType.weapon:
        filteredList = bonusWeaponPotentials[editingEquip.potentialModule?.mainPotential] ?? [];
      case EquipType.secondary:
      case EquipType.shield:
      case EquipType.katara:
        filteredList = bonusSecondaryPotentials[editingEquip.potentialModule?.mainPotential] ?? [];
      case EquipType.emblem:
        filteredList = bonusEmblemPotentials[editingEquip.potentialModule?.mainPotential] ?? [];
      case EquipType.heart:
      case EquipType.badge:
        filteredList = bonusHeartBadgePotentials[editingEquip.potentialModule?.mainPotential] ?? [];
      default:
        return [];
    }
  }
  else {
    switch(editingEquip.equipName.equipType) {
      case EquipType.hat:
        filteredList = hatPotentials[editingEquip.potentialModule?.mainPotential] ?? [];
      case EquipType.overall:
      case EquipType.top:
        filteredList = topAndOverallPotentials[editingEquip.potentialModule?.mainPotential] ?? [];
      case EquipType.bottom:
        filteredList = bottomPotentials[editingEquip.potentialModule?.mainPotential] ?? [];
      case EquipType.gloves:
        filteredList = glovesPotentials[editingEquip.potentialModule?.mainPotential] ?? [];
      case EquipType.shoes:
        filteredList = shoesPotentials[editingEquip.potentialModule?.mainPotential] ?? [];
      case EquipType.cape:
      case EquipType.belt:
      case EquipType.shoulder:
        filteredList = capeBeltShoulderPotentials[editingEquip.potentialModule?.mainPotential] ?? [];
      case EquipType.face:
      case EquipType.eye:
      case EquipType.ring:
      case EquipType.pendant:
      case EquipType.earrings:
        filteredList = faceEyeRingPendantEarringPotentials[editingEquip.potentialModule?.mainPotential] ?? [];
      case EquipType.weapon:
      case EquipType.shield:
      case EquipType.katara:
      case EquipType.secondary:
        filteredList = weaponSecondaryPotentials[editingEquip.potentialModule?.mainPotential] ?? [];
      case EquipType.emblem:
        filteredList = emblemPotentials[editingEquip.potentialModule?.mainPotential] ?? [];
      case EquipType.heart:
      case EquipType.badge:
        filteredList = heartAndBadgePotentials[editingEquip.potentialModule?.mainPotential] ?? [];
      default:
        return [];
    }
  }
  

  filteredList += isBonus ? bonusDefaultPotentials[editingEquip.potentialModule?.bonusPotential] ?? [] : defaultPotentials[editingEquip.potentialModule?.mainPotential] ?? [];

  return filteredList;
}