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

  num str = 0;
  num dex = 0;
  num int = 0;
  num luk = 0;
  num allStats = 0;
  num hp = 0;
  num mp = 0;
  num speed = 0;
  num jump = 0;
  num defense = 0;
  num attackPower = 0;
  num mattack = 0;
  num strPercentage = 0;
  num dexPercentage = 0;
  num intPercentage = 0;
  num lukPercentage = 0;
  num allStatsPercentage = 0;
  num hpPercentage = 0;
  num mpPercentage = 0;
  num defensePercentage = 0;
  num attackPercentage = 0;
  num mattackPercentage = 0;
  num damage = 0;
  num bossDamage = 0;
  num ignoreDefense = 0;
  num criticalDamage = 0;
  num criticalRate = 0;
  num mesosObtained = 0;
  num itemDropRate = 0;
  num hpRecovery = 0;
  num skillCooldown = 0;

  void updatePotentialTier(PotentialTier? potentialTier, {bool isBonus=false}) {
    if (isBonus) {
      bonusPotential = potentialTier;
    }
    else {
      mainPotential = potentialTier;
    }
  }

  void updatePotential(Equip editingEquip, num potentialPosition, PotentialLine? potentialLine, {bool isBonus=false}) {
    str = 0;
    dex = 0;
    int = 0;
    luk = 0;
    allStats = 0;
    hp = 0;
    mp = 0;
    speed = 0;
    jump = 0;
    defense = 0;
    attackPower = 0;
    mattack = 0;
    strPercentage = 0;
    dexPercentage = 0;
    intPercentage = 0;
    lukPercentage = 0;
    allStatsPercentage = 0;
    hpPercentage = 0;
    mpPercentage = 0;
    defensePercentage = 0;
    attackPercentage = 0;
    mattackPercentage = 0;
    damage = 0;
    bossDamage = 0;
    ignoreDefense = 0;
    criticalDamage = 0;
    criticalRate = 0;
    mesosObtained = 0;
    itemDropRate = 0;
    hpRecovery = 0;
    skillCooldown = 0;

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
          case StatType.str:
            str += statvalue;
          case StatType.dex:
            dex += statvalue;
          case StatType.int:
            int += statvalue;
          case StatType.luk:
            luk += statvalue;
          case StatType.allStats:
            allStats += statvalue;
          case StatType.hp:
            hp += statvalue;
          case StatType.mp:
            mp += statvalue;
          case StatType.speed:
            speed += statvalue;
          case StatType.jump:
            jump += statvalue;
          case StatType.defense:
            defense += statvalue;
          case StatType.attack:
            attackPower += statvalue;
          case StatType.mattack:
            mattack += statvalue;
          case StatType.strPercentage:
            strPercentage += statvalue;
          case StatType.dexPercentage:
            dexPercentage += statvalue;
          case StatType.intPercentage:
            intPercentage += statvalue;
          case StatType.lukPercentage:
            lukPercentage += statvalue;
          case StatType.allStatsPercentage:
            allStatsPercentage += statvalue;
          case StatType.hpPercentage:
            hpPercentage += statvalue;
          case StatType.mpPercentage:
            mpPercentage += statvalue;
          case StatType.defensePercentage:
            defensePercentage += statvalue;
          case StatType.attackPercentage:
            attackPercentage += statvalue;
          case StatType.mattackPercentage:
            mattackPercentage += statvalue;
          case StatType.damage:
            damage += statvalue;
          case StatType.bossDamage:
            bossDamage += statvalue;
          case StatType.ignoreDefense:
            // TODO: fix this calculation
            ignoreDefense += statvalue;
          case StatType.critDamage:
            criticalDamage += statvalue;
          case StatType.critRate:
            criticalRate += statvalue;
          case StatType.mesosObtained:
            mesosObtained += statvalue;
          case StatType.itemDropRate:
            itemDropRate += statvalue;
          case StatType.hpRecovery:
            hpRecovery += statvalue;
          case StatType.skillCooldown:
            skillCooldown += statvalue;
          case StatType.skill:
            // TODO: add skill stuff here
          default:
            return;
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

  PotentialModule({
    this.mainPotential,
    this.mainPotentialLine1,
    this.mainPotentialLine2,
    this.mainPotentialLine3,
    this.bonusPotential,
    this.bonusPotentialLine1,
    this.bonusPotentialLine2,
    this.bonusPotentialLine3,
    this.str = 0,
    this.dex = 0,
    this.int = 0,
    this.luk = 0,
    this.allStats = 0,
    this.hp = 0,
    this.mp = 0,
    this.speed = 0,
    this.jump = 0,
    this.defense = 0,
    this.attackPower = 0,
    this.mattack = 0,
    this.strPercentage = 0,
    this.dexPercentage = 0,
    this.intPercentage = 0,
    this.lukPercentage = 0,
    this.allStatsPercentage = 0,
    this.hpPercentage = 0,
    this.mpPercentage = 0,
    this.defensePercentage = 0,
    this.attackPercentage = 0,
    this.mattackPercentage = 0,
    this.damage = 0,
    this.bossDamage = 0,
    this.ignoreDefense = 0,
    this.criticalDamage = 0,
    this.criticalRate = 0,
    this.mesosObtained = 0,
    this.itemDropRate = 0,
    this.hpRecovery = 0,
    this.skillCooldown = 0,
  });

  PotentialModule copyWith({
    PotentialTier? mainPotential,
    PotentialLine? mainPotentialLine1,
    PotentialLine? mainPotentialLine2,
    PotentialLine? mainPotentialLine3,
    PotentialTier? bonusPotential,
    PotentialLine? bonusPotentialLine1,
    PotentialLine? bonusPotentialLine2,
    PotentialLine? bonusPotentialLine3,
    num? str,
    num? dex,
    num? int,
    num? luk,
    num? allStats,
    num? hp,
    num? mp,
    num? speed,
    num? jump,
    num? defense,
    num? attackPower,
    num? mattack,
    num? strPercentage,
    num? dexPercentage,
    num? intPercentage,
    num? lukPercentage,
    num? allStatsPercentage,
    num? hpPercentage,
    num? mpPercentage,
    num? defensePercentage,
    num? attackPercentage,
    num? mattackPercentage,
    num? damage,
    num? bossDamage,
    num? ignoreDefense,
    num? criticalDamage,
    num? criticalRate,
    num? mesosObtained,
    num? itemDropRate,
    num? hpRecovery,
    num? skillCooldown,
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
      str: str ?? this.str,
      dex: dex ?? this.dex,
      int: int ?? this.int,
      luk: luk ?? this.luk,
      allStats: allStats ?? this.allStats,
      hp: hp ?? this.hp,
      mp: mp ?? this.mp,
      speed: speed ?? this.speed,
      jump: jump ?? this.jump,
      defense: defense ?? this.defense,
      attackPower: attackPower ?? this.attackPower,
      mattack: mattack ?? this.mattack,
      strPercentage: strPercentage ?? this.strPercentage,
      dexPercentage: dexPercentage ?? this.dexPercentage,
      intPercentage: intPercentage ?? this.intPercentage,
      lukPercentage: lukPercentage ?? this.lukPercentage,
      allStatsPercentage: allStatsPercentage ?? this.allStatsPercentage,
      hpPercentage: hpPercentage ?? this.hpPercentage,
      mpPercentage: mpPercentage ?? this.mpPercentage,
      defensePercentage: defensePercentage ?? this.defensePercentage,
      attackPercentage: attackPercentage ?? this.attackPercentage,
      mattackPercentage: mattackPercentage ?? this.mattackPercentage,
      damage: damage ?? this.damage,
      bossDamage: bossDamage ?? this.bossDamage,
      ignoreDefense: ignoreDefense ?? this.ignoreDefense,
      criticalDamage: criticalDamage ?? this.criticalDamage,
      criticalRate: criticalRate ?? this.criticalRate,
      mesosObtained: mesosObtained ?? this.mesosObtained,
      itemDropRate: itemDropRate ?? this.itemDropRate,
      hpRecovery: hpRecovery ?? this.hpRecovery,
      skillCooldown: skillCooldown ?? this.skillCooldown,
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
      case EquipType.secondary:
      case EquipType.shield:
      case EquipType.katara:
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