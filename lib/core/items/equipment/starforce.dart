import 'package:flutter/material.dart';
import 'package:maplestory_builder/core/constants.dart';
import 'package:maplestory_builder/core/constants/equipment/starforce_stats.dart';
import 'package:maplestory_builder/core/items/equipment/equips.dart';

class StarForceModule {
  num possibleStars = 0;
  num currentStars = 0;

  num str = 0;
  num dex = 0;
  num int = 0;
  num luk = 0;
  num hp = 0;
  num mp = 0;
  num speed = 0;
  num jump = 0;
  num defense = 0;
  num attackPower = 0;
  num mattack = 0;

  StarForceModule({
    required this.possibleStars,
    this.currentStars = 0,
    this.str = 0,
    this.dex = 0,
    this.int = 0,
    this.luk = 0,
    this.hp = 0,
    this.mp = 0,
    this.speed = 0,
    this.jump = 0,
    this.defense = 0,
    this.attackPower = 0,
    this.mattack = 0,
  });
  
  void updateStarforce(Equip targetEquip, num newStarValue) {
    currentStars = newStarValue.toInt();

    void updateStatValue(num statValue){
      switch(targetEquip.classType){
        case ClassType.all:
          str = statValue;
          dex = statValue;
          int = statValue;
          luk = statValue;
        case ClassType.bowman:
        case ClassType.warrior:
        case ClassType.pirate:
          str = statValue;
          dex = statValue;
        case ClassType.magician:
          int = statValue;
          luk = statValue;
        case ClassType.thief:
          luk = statValue;
          dex = statValue;
      }
    }

    void updateNonWepDefense(num star) {
      defense = targetEquip.defense;
      for (var i = 0; i < currentStars; i++){
        defense = (defense * 1.05001).ceil();
      }
      defense = defense - targetEquip.defense;
    }

    void updateWepAttValue(num attValue, num star){
      num wepAttEarlyStar(num star, num startAtt){
        if (star > 15) {
          star = 15;
        }

        var earlyStarAtt = startAtt;
        for (var i = 0; i < currentStars; i++){
          earlyStarAtt = (earlyStarAtt * 1.02001).ceil();
        }
        return earlyStarAtt - startAtt;
      }
      

      switch(targetEquip.classType) {
        case ClassType.all:
          attackPower = attValue + wepAttEarlyStar(targetEquip.attackPower, star);
          mattack = attValue + wepAttEarlyStar(targetEquip.mattack, star);
        case ClassType.bowman:
        case ClassType.warrior:
        case ClassType.pirate:
        case ClassType.thief:
          attackPower = attValue + wepAttEarlyStar(targetEquip.attackPower, star);
        case ClassType.magician:
          mattack = attValue + wepAttEarlyStar(targetEquip.mattack, star);
      }
    }

    void updateAttValue(num attValue) {
      attackPower = attValue;
      mattack = attValue;
    }

    void updateBonusStars(num star, {num gloveAtt = 0}) {
      var idx = 0;
      if (targetEquip.itemLevel < 138) {
        idx = INDEX_128;
      }
      else if (targetEquip.itemLevel < 150) {
        idx = INDEX_138;
      }
      else if (targetEquip.itemLevel < 160) {
        idx = INDEX_150;
      }
      else if (targetEquip.itemLevel < 200) {
        idx = INDEX_160;
      }
      else if (targetEquip.itemLevel < 250) {
        idx = INDEX_200;
      }
      else {
        idx = INDEX_250;
      }
      updateStatValue(40 + starForceStats[star]![idx]);
      if (targetEquip.equipType == EquipType.weapon || targetEquip.equipType == EquipType.katara) {
        updateWepAttValue(starForceWepAtt[star]![idx], star);
      }
      else if (targetEquip.equipType != EquipType.badge) {
        updateAttValue(gloveAtt + starForceNonWepAtt[star]![idx]);
      }
    }

    if (currentStars == 0){
      updateStatValue(0);
      hp = 0;
      mp = 0;
      speed = 0;
      jump = 0;
      defense = 0;
      attackPower = 0;
      mattack = 0;
    }
    else if (currentStars == 1) {
      updateStatValue(2);
      if (hpCategory.contains(targetEquip.equipType)) {
        hp = 5;
      }

      if (targetEquip.equipType == EquipType.weapon || targetEquip.equipType == EquipType.katara) {
        mp = 5;
        updateWepAttValue(0, currentStars);
      }
      else {
        updateNonWepDefense(currentStars);
      }
    }
    else if (currentStars == 2) {
      updateStatValue(4);
      if (hpCategory.contains(targetEquip.equipType)) {
        hp = 10;
      }

      if (targetEquip.equipType == EquipType.weapon || targetEquip.equipType == EquipType.katara) {
        mp = 10;
        updateWepAttValue(0, currentStars);
      }
      else {
        if (targetEquip.equipType == EquipType.shoes) {
          speed = 0;
          jump = 0;
        }
        updateNonWepDefense(currentStars);
      }
    }
    else if (currentStars == 3) {
      updateStatValue(6);
      if (hpCategory.contains(targetEquip.equipType)) {
        hp = 15;
      }

      if (targetEquip.equipType == EquipType.weapon || targetEquip.equipType == EquipType.katara) {
        mp = 15;
        updateWepAttValue(0, currentStars);
      }
      else {
        if (targetEquip.equipType == EquipType.shoes) {
          speed = 1;
          jump = 1;
        }
        updateNonWepDefense(currentStars);
      }
    }
    else if (currentStars == 4) {
      updateStatValue(8);
      if (hpCategory.contains(targetEquip.equipType)) {
        hp = 25;
      }

      if (targetEquip.equipType == EquipType.weapon || targetEquip.equipType == EquipType.katara) {
        mp = 25;
        updateWepAttValue(0, currentStars);
      }
      else {
        if (targetEquip.equipType == EquipType.shoes) {
          speed = 2;
          jump = 2;
        }
        else if (targetEquip.equipType == EquipType.gloves) {
          updateAttValue(0);
        }
        updateNonWepDefense(currentStars);
      }
    }
    else if (currentStars == 5) {
      updateStatValue(10);

      if (hpCategory.contains(targetEquip.equipType)) {
        hp = 35;
      }

      if (targetEquip.equipType == EquipType.weapon || targetEquip.equipType == EquipType.katara) {
        mp = 35;
        updateWepAttValue(0, currentStars);
      }
      else {
        if (targetEquip.equipType == EquipType.shoes) {
          speed = 3;
          jump = 3;
        }
        else if (targetEquip.equipType == EquipType.gloves) {
          updateAttValue(1);
        }
        updateNonWepDefense(currentStars);
      }
    }
    else if (currentStars == 6) {
      updateStatValue(13);
      if (hpCategory.contains(targetEquip.equipType)) {
        hp = 50;
      }
      
      if (targetEquip.equipType == EquipType.weapon || targetEquip.equipType == EquipType.katara) {
        mp = 50;
        updateWepAttValue(0, currentStars);
      }
      else {
        if (targetEquip.equipType == EquipType.shoes) {
          speed = 4;
          jump = 4;
        }
        else if (targetEquip.equipType == EquipType.gloves) {
          updateAttValue(1);
        }
        updateNonWepDefense(currentStars);
      }
    }
    else if (currentStars == 7) {
      updateStatValue(16);
      if (hpCategory.contains(targetEquip.equipType)) {
        hp = 65;
      }

      if (targetEquip.equipType == EquipType.weapon || targetEquip.equipType == EquipType.katara) {
        mp = 65;
        updateWepAttValue(0, currentStars);
      }
      else {
        if (targetEquip.equipType == EquipType.shoes) {
          speed = 5;
          jump = 5;
        }
        else if (targetEquip.equipType == EquipType.gloves) {
          updateAttValue(2);
        }
        updateNonWepDefense(currentStars);
      }
    }
    else if (currentStars == 8) {
      updateStatValue(29);
      if (hpCategory.contains(targetEquip.equipType)) {
        hp = 85;
      }
      
      if (targetEquip.equipType == EquipType.weapon || targetEquip.equipType == EquipType.katara) {
        mp = 85;
        updateWepAttValue(0, currentStars);
      }
      else {
        if (targetEquip.equipType == EquipType.shoes) {
          speed = 6;
          jump = 6;
        }
        else if (targetEquip.equipType == EquipType.gloves) {
          updateAttValue(2);
        }
        updateNonWepDefense(currentStars);
      }
    }
    else if (currentStars == 9) {
      updateStatValue(22);
      if (hpCategory.contains(targetEquip.equipType)) {
        hp = 105;
      }

      if (targetEquip.equipType == EquipType.weapon || targetEquip.equipType == EquipType.katara) {
        mp = 105;
        updateWepAttValue(0, currentStars);
      }
      else {
        if (targetEquip.equipType == EquipType.shoes) {
          speed = 7;
          jump = 7;
        }
        else if (targetEquip.equipType == EquipType.gloves) {
          updateAttValue(3);
        }
        updateNonWepDefense(currentStars);
      }
    }
    else if (currentStars == 10) {
      updateStatValue(25);
      if (hpCategory.contains(targetEquip.equipType)) {
        hp = 130;
      }

      if (targetEquip.equipType == EquipType.weapon || targetEquip.equipType == EquipType.katara) {
        mp = 130;
        updateWepAttValue(0, currentStars);
      }
      else {
        if (targetEquip.equipType == EquipType.shoes) {
          speed = 8;
          jump = 8;
        }
        else if (targetEquip.equipType == EquipType.gloves) {
          updateAttValue(3);
        }
        updateNonWepDefense(currentStars);
      }
    }
    else if (currentStars == 11) {
      updateStatValue(28);
      if (hpCategory.contains(targetEquip.equipType)) {
        hp = 155;
      }

      if (targetEquip.equipType == EquipType.weapon || targetEquip.equipType == EquipType.katara) {
        mp = 155;
        updateWepAttValue(0, currentStars);
      }
      else {
        if (targetEquip.equipType == EquipType.shoes) {
          speed = 10;
          jump = 10;
        }
        else if (targetEquip.equipType == EquipType.gloves) {
          updateAttValue(4);
        }
        updateNonWepDefense(currentStars);
      }
    }
    else if (currentStars == 12) {
      updateStatValue(31);
      if (hpCategory.contains(targetEquip.equipType)) {
        hp = 180;
      }

      if (targetEquip.equipType == EquipType.weapon || targetEquip.equipType == EquipType.katara) {
        mp = 180;
        updateWepAttValue(0, currentStars);
      }
      else {
        if (targetEquip.equipType == EquipType.shoes) {
          speed = 12;
          jump = 12;
        }
        else if (targetEquip.equipType == EquipType.gloves) {
          updateAttValue(4);
        }
        updateNonWepDefense(currentStars);
      }
    }
    else if (currentStars == 13) {
      updateStatValue(34);
      if (hpCategory.contains(targetEquip.equipType)) {
        hp = 205;
      }

      if (targetEquip.equipType == EquipType.weapon || targetEquip.equipType == EquipType.katara) {
        mp = 205;
        updateWepAttValue(0, currentStars);
      }
      else {
        if (targetEquip.equipType == EquipType.shoes) {
          speed = 14;
          jump = 14;
        }
        else if (targetEquip.equipType == EquipType.gloves) {
          updateAttValue(5);
        }
        updateNonWepDefense(currentStars);
      }
    }
    else if (currentStars == 14) {
      updateStatValue(37);
      if (hpCategory.contains(targetEquip.equipType)) {
        hp = 230;
      }

      if (targetEquip.equipType == EquipType.weapon || targetEquip.equipType == EquipType.katara) {
        mp = 230;
        updateWepAttValue(0, currentStars);
      }
      else {
        if (targetEquip.equipType == EquipType.shoes) {
          speed = 16;
          jump = 16;
        }
        else if (targetEquip.equipType == EquipType.gloves) {
          updateAttValue(6);
        }
        updateNonWepDefense(currentStars);
      }
    }
    else if (currentStars == 15) {
      updateStatValue(40);
      if (hpCategory.contains(targetEquip.equipType)) {
        hp = 255;
      }

      if (targetEquip.equipType == EquipType.weapon || targetEquip.equipType == EquipType.katara) {
        mp = 255;
        updateWepAttValue(0, currentStars);
      }
      else {
        if (targetEquip.equipType == EquipType.shoes) {
          speed = 18;
          jump = 18;
        }
        if (targetEquip.equipType == EquipType.gloves) {
          updateAttValue(7);
        }
        else {
          updateAttValue(0);
        }
        updateNonWepDefense(currentStars);
      }
    }
    else {
      if (hpCategory.contains(targetEquip.equipType)) {
        hp = 255;
      }
      if (targetEquip.equipType == EquipType.weapon || targetEquip.equipType == EquipType.katara){
        mp = 255;
        updateBonusStars(currentStars);
      }
      else {
        if (targetEquip.equipType == EquipType.shoes) {
          speed = 18;
          jump = 18;
        }
        if (targetEquip.equipType == EquipType.gloves) {
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

  StarForceModule copyWith({
    num? possibleStars,
    num? currentStars,
    num? str,
    num? dex,
    num? int,
    num? luk,
    num? hp,
    num? mp,
    num? speed,
    num? jump,
    num? defense,
    num? attackPower,
    num? mattack,
  }) {
    return StarForceModule(
      possibleStars: possibleStars ?? this.possibleStars, 
      currentStars: currentStars ?? this.currentStars,
      str: str ?? this.str,
      dex: dex ?? this.dex,
      int: int ?? this.int,
      luk: luk ?? this.luk,
      hp: hp ?? this.hp,
      mp: mp ?? this.mp,
      speed: speed ?? this.speed,
      jump: jump ?? this.jump,
      defense: defense ?? this.defense,
      attackPower: attackPower ?? this.attackPower,
      mattack: mattack ?? this.mattack,
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