import 'package:flutter/material.dart';
import 'package:maplestory_builder/constants/constants.dart';
import 'package:maplestory_builder/constants/equipment/potential_stats.dart';
import 'package:maplestory_builder/modules/equipment/equips.dart';
import 'package:maplestory_builder/modules/utilities.dart';

class PotentialModule {

  PotentialTier? mainPotential;
  PotentialLine? mainPotentialLine1;
  PotentialLine? mainPotentialLine2;
  PotentialLine? mainPotentialLine3;

  PotentialTier? bonusPotential;
  PotentialLine? bonusPotentialLine1;
  PotentialLine? bonusPotentialLine2;
  PotentialLine? bonusPotentialLine3;

  Map<StatType, num> moduleStats;

  PotentialModule({
    this.mainPotential,
    this.mainPotentialLine1,
    this.mainPotentialLine2,
    this.mainPotentialLine3,
    this.bonusPotential,
    this.bonusPotentialLine1,
    this.bonusPotentialLine2,
    this.bonusPotentialLine3,
    Map<StatType, num>? moduleStats,
  }): moduleStats = moduleStats ?? {};

  PotentialModule copyWith({
    PotentialTier? mainPotential,
    PotentialLine? mainPotentialLine1,
    PotentialLine? mainPotentialLine2,
    PotentialLine? mainPotentialLine3,
    PotentialTier? bonusPotential,
    PotentialLine? bonusPotentialLine1,
    PotentialLine? bonusPotentialLine2,
    PotentialLine? bonusPotentialLine3,
    Map<StatType, num>? moduleStats,
  }) {
    return PotentialModule(
      mainPotential: mainPotential ?? this.mainPotential,
      mainPotentialLine1: mainPotentialLine1 ?? this.mainPotentialLine1,
      mainPotentialLine2: mainPotentialLine2 ?? this.mainPotentialLine2,
      mainPotentialLine3: mainPotentialLine3 ?? this.mainPotentialLine3,
      bonusPotential: bonusPotential ?? this.bonusPotential,
      bonusPotentialLine1: bonusPotentialLine1 ?? this.bonusPotentialLine1,
      bonusPotentialLine2: bonusPotentialLine2 ?? this.bonusPotentialLine2,
      bonusPotentialLine3: bonusPotentialLine3 ?? this.bonusPotentialLine3,
      moduleStats: moduleStats ?? Map<StatType, num>.from(this.moduleStats)
    );
  }

  num get(StatType statType) {
    return moduleStats[statType] ?? 0;
  }

  void updatePotentialTier(PotentialTier? potentialTier, {bool isBonus=false}) {
    if (isBonus) {
      bonusPotential = potentialTier;
    }
    else {
      mainPotential = potentialTier;
    }
  }

  void updatePotential(Equip editingEquip, num potentialPosition, PotentialLine? potentialLine, {bool isBonus=false}) {
    moduleStats = {};

    var offset = getPotentialOffsetFromItemLevel(editingEquip.itemLevel.toInt());

    if (isBonus) {
      if (potentialPosition == 1) {
        bonusPotentialLine1 = potentialLine;
      }
      else if (potentialPosition == 2) {
        bonusPotentialLine2 = potentialLine;
      }
      else {
        bonusPotentialLine3 = potentialLine;
      }
    }
    else {
      if (potentialPosition == 1) {
        mainPotentialLine1 = potentialLine;
      }
      else if (potentialPosition == 2) {
        mainPotentialLine2 = potentialLine;
      }
      else {
        mainPotentialLine3 = potentialLine;
      }
    }

    void updateStatFromPotential(PotentialLine? potentialLine) {
      if (potentialLine == null) {
        return;
      }
      else {
        num statvalue = 0;
        if (potentialLine is PotentialLineStatic) {
          statvalue = potentialLine.statValue;
        }
        else if (potentialLine is PotentialLineRange) {
          statvalue = potentialLine.statValue[offset];
        }
        else {
          // TODO: add skill stuff here
        }

        switch(potentialLine.statType) {
          case StatType.ignoreDefense:
            // TODO: fix this calculation
            moduleStats[potentialLine.statType] = (moduleStats[potentialLine.statType] ?? 0) + statvalue;
          case StatType.skill:
            // TODO: add skill stuff here
          default:
            moduleStats[potentialLine.statType] = (moduleStats[potentialLine.statType] ?? 0) + statvalue;
        }
      }
    }

    updateStatFromPotential(mainPotentialLine1);
    updateStatFromPotential(mainPotentialLine2);
    updateStatFromPotential(mainPotentialLine3);
    updateStatFromPotential(bonusPotentialLine1);
    updateStatFromPotential(bonusPotentialLine2);
    updateStatFromPotential(bonusPotentialLine3);
  }

  Widget buildPotentialWidget(BuildContext context, Equip editingEquip) {
    List<Widget> childrenWidgets = [];

    void addPotentialLine(PotentialLine? potentialLine) {
      if (potentialLine == null) {
        return;
      }
      else {
        var offset = getPotentialOffsetFromItemLevel(editingEquip.itemLevel.toInt());
        num? valueToDisplay;
        if (potentialLine is PotentialLineStatic) {
          valueToDisplay = potentialLine.statValue;
        }
        else if (potentialLine is PotentialLineRange) {
          valueToDisplay = potentialLine.statValue[offset];
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
      addPotentialLine(mainPotentialLine1);
      addPotentialLine(mainPotentialLine2);
      addPotentialLine(mainPotentialLine3);
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
      addPotentialLine(bonusPotentialLine1);
      addPotentialLine(bonusPotentialLine2);
      addPotentialLine(bonusPotentialLine3);
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
    switch(editingEquip.equipType) {
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
    switch(editingEquip.equipType) {
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