import 'package:flutter/material.dart';
import 'package:maplestory_builder/constants/constants.dart';
import 'package:maplestory_builder/constants/equipment/starforce_stats.dart';
import 'package:maplestory_builder/modules/equipment/equips.dart';

class StarForceModule {
  int possibleStars = 0;
  int currentStars = 0;

  Map<StatType, num> moduleStats;

  StarForceModule({
    required this.possibleStars,
    this.currentStars = 0,
    Map<StatType, num>? moduleStats
  }) : moduleStats = moduleStats ?? {};

  StarForceModule copyWith({
    int? possibleStars,
    int? currentStars,
    Map<StatType, num>? moduleStats,
  }) {
    return StarForceModule(
      possibleStars: possibleStars ?? this.possibleStars, 
      currentStars: currentStars ?? this.currentStars,
      moduleStats: moduleStats ?? Map<StatType, num>.from(this.moduleStats),
    );
  }

  num get(StatType statType) {
    return moduleStats[statType] ?? 0;
  }
  
  void updateStarforce(Equip targetEquip, num newStarValue) {
    currentStars = newStarValue.toInt();
    moduleStats = {};

    void updateStatValue(num statValue){
      switch(targetEquip.equipName.classType){
        case ClassType.all:
          moduleStats[StatType.str] = (moduleStats[StatType.str] ?? 0) + statValue;
          moduleStats[StatType.dex] = (moduleStats[StatType.dex] ?? 0) + statValue;
          moduleStats[StatType.int] = (moduleStats[StatType.int] ?? 0) + statValue;
          moduleStats[StatType.luk] = (moduleStats[StatType.luk] ?? 0) + statValue;
        case ClassType.bowman:
        case ClassType.warrior:
        case ClassType.pirate:
          moduleStats[StatType.str] = (moduleStats[StatType.str] ?? 0) + statValue;
          moduleStats[StatType.dex] = (moduleStats[StatType.dex] ?? 0) + statValue;
        case ClassType.magician:
          moduleStats[StatType.int] = (moduleStats[StatType.int] ?? 0) + statValue;
          moduleStats[StatType.luk] = (moduleStats[StatType.luk] ?? 0) + statValue;
        case ClassType.thief:
          moduleStats[StatType.luk] = (moduleStats[StatType.luk] ?? 0) + statValue;
          moduleStats[StatType.dex] = (moduleStats[StatType.dex] ?? 0) + statValue;
      }
    }

    void updateNonWepDefense(num star) {
      var defense = targetEquip.get(StatType.defense);
      for (var i = 0; i < currentStars; i++){
        defense = (defense * 1.05001).ceil();
      }
      moduleStats[StatType.defense] = defense - targetEquip.get(StatType.defense);
    }

    void updateWepAttValue(num attValue, num star){
      num wepAttEarlyStar(num startAtt, num star){
        if (star > 15) {
          star = 15;
        }

        var earlyStarAtt = startAtt;
        for (var i = 0; i < star; i++){
          earlyStarAtt = (earlyStarAtt * 1.02001).ceil();
        }
        return earlyStarAtt - startAtt;
      }
      
      switch(targetEquip.equipName.classType) {
        case ClassType.all:
          moduleStats[StatType.attack] = attValue + wepAttEarlyStar(targetEquip.get(StatType.attack), star);
          moduleStats[StatType.mattack] = attValue + wepAttEarlyStar(targetEquip.get(StatType.mattack), star);
        case ClassType.bowman:
        case ClassType.warrior:
        case ClassType.pirate:
        case ClassType.thief:
          moduleStats[StatType.attack] = attValue + wepAttEarlyStar(targetEquip.get(StatType.attack), star);
        case ClassType.magician:
          moduleStats[StatType.mattack] = attValue + wepAttEarlyStar(targetEquip.get(StatType.mattack), star);
      }
    }

    void updateAttValue(num attValue) {
      moduleStats[StatType.attack] = attValue;
      moduleStats[StatType.mattack] = attValue;
    }

    void updateBonusStars(num star, {num gloveAtt = 0}) {
      var idx = 0;
      if (targetEquip.equipName.itemLevel < 138) {
        idx = INDEX_128;
      }
      else if (targetEquip.equipName.itemLevel < 150) {
        idx = INDEX_138;
      }
      else if (targetEquip.equipName.itemLevel < 160) {
        idx = INDEX_150;
      }
      else if (targetEquip.equipName.itemLevel < 200) {
        idx = INDEX_160;
      }
      else if (targetEquip.equipName.itemLevel < 250) {
        idx = INDEX_200;
      }
      else {
        idx = INDEX_250;
      }
      updateStatValue(40 + starForceStats[star]![idx]);
      if (targetEquip.equipName.equipType == EquipType.weapon || targetEquip.equipName.equipType == EquipType.katara) {
        updateWepAttValue(starForceWepAtt[star]![idx], star);
      }
      else if (targetEquip.equipName.equipType != EquipType.badge) {
        updateAttValue(gloveAtt + starForceNonWepAtt[star]![idx]);
      }
    }

    if (currentStars == 0){
      updateStatValue(0);
    }
    else if (currentStars == 1) {
      updateStatValue(2);
      if (hpCategory.contains(targetEquip.equipName.equipType)) {
        moduleStats[StatType.hp] = 5;
      }

      if (targetEquip.equipName.equipType == EquipType.weapon || targetEquip.equipName.equipType == EquipType.katara) {
        moduleStats[StatType.mp] = 5;
        updateWepAttValue(0, currentStars);
      }
      else {
        updateNonWepDefense(currentStars);
      }
    }
    else if (currentStars == 2) {
      updateStatValue(4);
      if (hpCategory.contains(targetEquip.equipName.equipType)) {
        moduleStats[StatType.hp] = 10;
      }

      if (targetEquip.equipName.equipType == EquipType.weapon || targetEquip.equipName.equipType == EquipType.katara) {
        moduleStats[StatType.mp] = 10;
        updateWepAttValue(0, currentStars);
      }
      else {
        updateNonWepDefense(currentStars);
      }
    }
    else if (currentStars == 3) {
      updateStatValue(6);
      if (hpCategory.contains(targetEquip.equipName.equipType)) {
        moduleStats[StatType.hp] = 15;
      }

      if (targetEquip.equipName.equipType == EquipType.weapon || targetEquip.equipName.equipType == EquipType.katara) {
        moduleStats[StatType.mp] = 15;
        updateWepAttValue(0, currentStars);
      }
      else {
        if (targetEquip.equipName.equipType == EquipType.shoes) {
          moduleStats[StatType.speed] = 1;
          moduleStats[StatType.jump] = 1;
        }
        updateNonWepDefense(currentStars);
      }
    }
    else if (currentStars == 4) {
      updateStatValue(8);
      if (hpCategory.contains(targetEquip.equipName.equipType)) {
        moduleStats[StatType.hp] = 25;
      }

      if (targetEquip.equipName.equipType == EquipType.weapon || targetEquip.equipName.equipType == EquipType.katara) {
        moduleStats[StatType.mp] = 25;
        updateWepAttValue(0, currentStars);
      }
      else {
        if (targetEquip.equipName.equipType == EquipType.shoes) {
          moduleStats[StatType.speed] = 2;
          moduleStats[StatType.jump] = 2;
        }
        else if (targetEquip.equipName.equipType == EquipType.gloves) {
          updateAttValue(0);
        }
        updateNonWepDefense(currentStars);
      }
    }
    else if (currentStars == 5) {
      updateStatValue(10);

      if (hpCategory.contains(targetEquip.equipName.equipType)) {
        moduleStats[StatType.hp] = 35;
      }

      if (targetEquip.equipName.equipType == EquipType.weapon || targetEquip.equipName.equipType == EquipType.katara) {
        moduleStats[StatType.mp] = 35;
        updateWepAttValue(0, currentStars);
      }
      else {
        if (targetEquip.equipName.equipType == EquipType.shoes) {
          moduleStats[StatType.speed] = 3;
          moduleStats[StatType.jump] = 3;
        }
        else if (targetEquip.equipName.equipType == EquipType.gloves) {
          updateAttValue(1);
        }
        updateNonWepDefense(currentStars);
      }
    }
    else if (currentStars == 6) {
      updateStatValue(13);
      if (hpCategory.contains(targetEquip.equipName.equipType)) {
        moduleStats[StatType.hp] = 50;
      }
      
      if (targetEquip.equipName.equipType == EquipType.weapon || targetEquip.equipName.equipType == EquipType.katara) {
        moduleStats[StatType.mp] = 50;
        updateWepAttValue(0, currentStars);
      }
      else {
        if (targetEquip.equipName.equipType == EquipType.shoes) {
          moduleStats[StatType.speed] = 4;
          moduleStats[StatType.jump] = 4;
        }
        else if (targetEquip.equipName.equipType == EquipType.gloves) {
          updateAttValue(1);
        }
        updateNonWepDefense(currentStars);
      }
    }
    else if (currentStars == 7) {
      updateStatValue(16);
      if (hpCategory.contains(targetEquip.equipName.equipType)) {
        moduleStats[StatType.hp] = 65;
      }

      if (targetEquip.equipName.equipType == EquipType.weapon || targetEquip.equipName.equipType == EquipType.katara) {
        moduleStats[StatType.mp] = 65;
        updateWepAttValue(0, currentStars);
      }
      else {
        if (targetEquip.equipName.equipType == EquipType.shoes) {
          moduleStats[StatType.speed] = 5;
          moduleStats[StatType.jump] = 5;
        }
        else if (targetEquip.equipName.equipType == EquipType.gloves) {
          updateAttValue(2);
        }
        updateNonWepDefense(currentStars);
      }
    }
    else if (currentStars == 8) {
      updateStatValue(29);
      if (hpCategory.contains(targetEquip.equipName.equipType)) {
        moduleStats[StatType.hp] = 85;
      }
      
      if (targetEquip.equipName.equipType == EquipType.weapon || targetEquip.equipName.equipType == EquipType.katara) {
        moduleStats[StatType.mp] = 85;
        updateWepAttValue(0, currentStars);
      }
      else {
        if (targetEquip.equipName.equipType == EquipType.shoes) {
          moduleStats[StatType.speed] = 6;
          moduleStats[StatType.jump] = 6;
        }
        else if (targetEquip.equipName.equipType == EquipType.gloves) {
          updateAttValue(2);
        }
        updateNonWepDefense(currentStars);
      }
    }
    else if (currentStars == 9) {
      updateStatValue(22);
      if (hpCategory.contains(targetEquip.equipName.equipType)) {
        moduleStats[StatType.hp] = 105;
      }

      if (targetEquip.equipName.equipType == EquipType.weapon || targetEquip.equipName.equipType == EquipType.katara) {
        moduleStats[StatType.mp] = 105;
        updateWepAttValue(0, currentStars);
      }
      else {
        if (targetEquip.equipName.equipType == EquipType.shoes) {
          moduleStats[StatType.speed] = 7;
          moduleStats[StatType.jump] = 7;
        }
        else if (targetEquip.equipName.equipType == EquipType.gloves) {
          updateAttValue(3);
        }
        updateNonWepDefense(currentStars);
      }
    }
    else if (currentStars == 10) {
      updateStatValue(25);
      if (hpCategory.contains(targetEquip.equipName.equipType)) {
        moduleStats[StatType.hp] = 130;
      }

      if (targetEquip.equipName.equipType == EquipType.weapon || targetEquip.equipName.equipType == EquipType.katara) {
        moduleStats[StatType.mp] = 130;
        updateWepAttValue(0, currentStars);
      }
      else {
        if (targetEquip.equipName.equipType == EquipType.shoes) {
          moduleStats[StatType.speed] = 8;
          moduleStats[StatType.jump] = 8;
        }
        else if (targetEquip.equipName.equipType == EquipType.gloves) {
          updateAttValue(3);
        }
        updateNonWepDefense(currentStars);
      }
    }
    else if (currentStars == 11) {
      updateStatValue(28);
      if (hpCategory.contains(targetEquip.equipName.equipType)) {
        moduleStats[StatType.hp] = 155;
      }

      if (targetEquip.equipName.equipType == EquipType.weapon || targetEquip.equipName.equipType == EquipType.katara) {
        moduleStats[StatType.mp] = 155;
        updateWepAttValue(0, currentStars);
      }
      else {
        if (targetEquip.equipName.equipType == EquipType.shoes) {
          moduleStats[StatType.speed] = 10;
          moduleStats[StatType.jump] = 10;
        }
        else if (targetEquip.equipName.equipType == EquipType.gloves) {
          updateAttValue(4);
        }
        updateNonWepDefense(currentStars);
      }
    }
    else if (currentStars == 12) {
      updateStatValue(31);
      if (hpCategory.contains(targetEquip.equipName.equipType)) {
        moduleStats[StatType.hp] = 180;
      }

      if (targetEquip.equipName.equipType == EquipType.weapon || targetEquip.equipName.equipType == EquipType.katara) {
        moduleStats[StatType.mp] = 180;
        updateWepAttValue(0, currentStars);
      }
      else {
        if (targetEquip.equipName.equipType == EquipType.shoes) {
          moduleStats[StatType.speed] = 12;
          moduleStats[StatType.jump] = 12;
        }
        else if (targetEquip.equipName.equipType == EquipType.gloves) {
          updateAttValue(4);
        }
        updateNonWepDefense(currentStars);
      }
    }
    else if (currentStars == 13) {
      updateStatValue(34);
      if (hpCategory.contains(targetEquip.equipName.equipType)) {
        moduleStats[StatType.hp] = 205;
      }

      if (targetEquip.equipName.equipType == EquipType.weapon || targetEquip.equipName.equipType == EquipType.katara) {
        moduleStats[StatType.mp] = 205;
        updateWepAttValue(0, currentStars);
      }
      else {
        if (targetEquip.equipName.equipType == EquipType.shoes) {
          moduleStats[StatType.speed] = 14;
          moduleStats[StatType.jump] = 14;
        }
        else if (targetEquip.equipName.equipType == EquipType.gloves) {
          updateAttValue(5);
        }
        updateNonWepDefense(currentStars);
      }
    }
    else if (currentStars == 14) {
      updateStatValue(37);
      if (hpCategory.contains(targetEquip.equipName.equipType)) {
        moduleStats[StatType.hp] = 230;
      }

      if (targetEquip.equipName.equipType == EquipType.weapon || targetEquip.equipName.equipType == EquipType.katara) {
        moduleStats[StatType.mp] = 230;
        updateWepAttValue(0, currentStars);
      }
      else {
        if (targetEquip.equipName.equipType == EquipType.shoes) {
          moduleStats[StatType.speed] = 16;
          moduleStats[StatType.jump] = 16;
        }
        else if (targetEquip.equipName.equipType == EquipType.gloves) {
          updateAttValue(6);
        }
        updateNonWepDefense(currentStars);
      }
    }
    else if (currentStars == 15) {
      updateStatValue(40);
      if (hpCategory.contains(targetEquip.equipName.equipType)) {
        moduleStats[StatType.hp] = 255;
      }

      if (targetEquip.equipName.equipType == EquipType.weapon || targetEquip.equipName.equipType == EquipType.katara) {
        moduleStats[StatType.mp] = 255;
        updateWepAttValue(0, currentStars);
      }
      else {
        if (targetEquip.equipName.equipType == EquipType.shoes) {
          moduleStats[StatType.speed] = 18;
          moduleStats[StatType.jump] = 18;
        }
        if (targetEquip.equipName.equipType == EquipType.gloves) {
          updateAttValue(7);
        }
        else {
          updateAttValue(0);
        }
        updateNonWepDefense(currentStars);
      }
    }
    else {
      if (hpCategory.contains(targetEquip.equipName.equipType)) {
        moduleStats[StatType.hp] = 255;
      }
      if (targetEquip.equipName.equipType == EquipType.weapon || targetEquip.equipName.equipType == EquipType.katara){
        moduleStats[StatType.mp] = 255;
        updateBonusStars(currentStars);
      }
      else {
        if (targetEquip.equipName.equipType == EquipType.shoes) {
          moduleStats[StatType.speed] = 18;
          moduleStats[StatType.jump] = 18;
        }
        if (targetEquip.equipName.equipType == EquipType.gloves) {
          updateBonusStars(currentStars, gloveAtt: 7);
        } 
        else {
          updateBonusStars(currentStars);
        }
        updateNonWepDefense(currentStars);
      }
    }
  }

  Column buildStarForceWidget() {
    Row buildStarGroup(List<Icon> starGroup){
      return Row(
        mainAxisSize: MainAxisSize.min,
        children: starGroup
      );
    }
    
    var unstarred = possibleStars - currentStars.toInt();
    var currentStarGroup = <Icon>[];
    var firstColumnChildren = <Row>[];
    var secondColumnChildren = <Row>[];

    for (var i = 0; i < currentStars.toInt(); i++){
      currentStarGroup.add(filledStar);

      if (currentStarGroup.length == 5) {
        if (firstColumnChildren.length < 3){
          firstColumnChildren.add(buildStarGroup(currentStarGroup));
        }
        else {
          secondColumnChildren.add(buildStarGroup(currentStarGroup));
        }
        currentStarGroup = <Icon>[];
      }
    }

    for (var i = 0; i < unstarred; i++){
      currentStarGroup.add(emptyStar);

      if (currentStarGroup.length == 5) {
        if (firstColumnChildren.length < 3){
          firstColumnChildren.add(buildStarGroup(currentStarGroup));
        }
        else {
          secondColumnChildren.add(buildStarGroup(currentStarGroup));
        }
        currentStarGroup = <Icon>[];
      }
    }

    if (currentStarGroup.isNotEmpty) {
      if (firstColumnChildren.length < 3){
        firstColumnChildren.add(buildStarGroup(currentStarGroup));
      }
      else {
        secondColumnChildren.add(buildStarGroup(currentStarGroup));
      }
    }

    var firstColumn = Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: firstColumnChildren
    );

    var secondColumn = Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: secondColumnChildren
    );
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
        children: [firstColumn, secondColumn],
    );
  }
}

// 0~94	5
// 95~107	8
// 108~117	10
// 118~127	15
// 128~137	20
// 138 and above	25
double getStarforceLimit(num itemLevel) {
  if (itemLevel <= 94) {
    return 5;
  }
  else if (itemLevel <= 107) {
    return 8;
  }
  else if (itemLevel <= 117) {
    return 10;
  }
  else if (itemLevel <= 127) {
    return 15;
  }
  else if (itemLevel <= 137) {
    return 20;
  }
  else {
    return 25;
  }
}