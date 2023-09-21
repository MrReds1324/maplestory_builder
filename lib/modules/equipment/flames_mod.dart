// ignore_for_file: non_constant_identifier_names

import 'package:maplestory_builder/constants/constants.dart';
import 'package:maplestory_builder/constants/equipment/flame_stats.dart';
import 'package:maplestory_builder/modules/equipment/equips.dart';

class FlameModule {
  FlameLine? flameLine1;
  FlameLine? flameLine2;
  FlameLine? flameLine3;
  FlameLine? flameLine4;

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
  num allStatsPercentage = 0;
  num bossDamage = 0;
  num damage = 0;
  num levelReduction = 0;

  void updateFlame(Equip targetEquip, num flamePosition, {FlameType? flameType, FlameTier? flameTier, isUpdatingTier=false}) {
    str = 0;
    dex = 0;
    int = 0;
    luk = 0;
    hp = 0;
    mp = 0;
    speed = 0;
    jump = 0;
    defense = 0;
    attackPower = 0;
    mattack = 0;
    allStatsPercentage = 0;
    bossDamage = 0;
    damage = 0;
    levelReduction = 0;
    
    if (isUpdatingTier) {
      if (flamePosition == 1) {
        flameLine1?.flameTier = flameTier;
      }
      else if (flamePosition == 2) {
        flameLine2?.flameTier = flameTier;
      }
      else if (flamePosition == 3) {
        flameLine3?.flameTier = flameTier;
      }
      else {
        flameLine4?.flameTier = flameTier;
      }
    }
    else {
      if (flamePosition == 1) {
        flameLine1?.flameType = flameType;
      }
      else if (flamePosition == 2) {
        flameLine2?.flameType = flameType;
      }
      else if (flamePosition == 3) {
        flameLine3?.flameType = flameType;
      }
      else {
        flameLine4?.flameType = flameType;
      }
    }

    void calculateFlame(FlameLine? flameLine) {
      if (flameLine == null || flameLine.flameTier == null || flameLine.flameType == null) {
        return;
      }

      var flameLevelOffset = getFlameOffset(targetEquip.itemLevel);

      switch(flameLine.flameType) {
        case FlameType.str:
          str += singleStatFlame[flameLevelOffset][flameLine.flameTier!.index];
        case FlameType.dex:
          dex += singleStatFlame[flameLevelOffset][flameLine.flameTier!.index];
        case FlameType.int:
          int += singleStatFlame[flameLevelOffset][flameLine.flameTier!.index];
        case FlameType.luk:
          luk += singleStatFlame[flameLevelOffset][flameLine.flameTier!.index];
        case FlameType.strDex:
          var flameStat = doubleStatFlame[flameLevelOffset][flameLine.flameTier!.index];
          str += flameStat;
          dex += flameStat;
        case FlameType.strInt:
          var flameStat = doubleStatFlame[flameLevelOffset][flameLine.flameTier!.index];
          str += flameStat;
          int += flameStat;
        case FlameType.strLuk:
          var flameStat = doubleStatFlame[flameLevelOffset][flameLine.flameTier!.index];
          str += flameStat;
          luk += flameStat;
        case FlameType.dexInt:
          var flameStat = doubleStatFlame[flameLevelOffset][flameLine.flameTier!.index];
          dex += flameStat;
          int += flameStat;
        case FlameType.dexLuk:
          var flameStat = doubleStatFlame[flameLevelOffset][flameLine.flameTier!.index];
          dex += flameStat;
          luk += flameStat;
        case FlameType.intLuk:
          var flameStat = doubleStatFlame[flameLevelOffset][flameLine.flameTier!.index];
          int += flameStat;
          luk += flameStat;
        case FlameType.hp:
          hp = hpAndMpFlame[flameLevelOffset][flameLine.flameTier!.index];
        case FlameType.mp:
          mp = hpAndMpFlame[flameLevelOffset][flameLine.flameTier!.index];
        case FlameType.defense:
          defense = defenseFlame[flameLevelOffset][flameLine.flameTier!.index];
        case FlameType.attack:
          if (targetEquip.equipType == EquipType.weapon) {
            var tagetCalculation = targetEquip.attackPower;
            if (tagetCalculation == 0) {
              tagetCalculation = targetEquip.mattack;
            }

            if (targetEquip.isFlameAdvantaged) {
              attackPower = (tagetCalculation * wepAttAdvantagedFlame[flameLevelOffset][flameLine.flameTier!.index]).ceil();
            }
            else {
              attackPower = (tagetCalculation * wepAttFlame[flameLevelOffset][flameLine.flameTier!.index]).ceil();
            }
          }
          else {
            attackPower = nonWepAttFlame[flameLine.flameTier!.index];
          }
        case FlameType.mattack:
          if (targetEquip.equipType == EquipType.weapon) {
            var tagetCalculation = targetEquip.mattack;
            if (tagetCalculation == 0) {
              tagetCalculation = targetEquip.attackPower;
            }

            if (targetEquip.isFlameAdvantaged) {
              mattack = (tagetCalculation * wepAttAdvantagedFlame[flameLevelOffset][flameLine.flameTier!.index]).ceil();
            }
            else {
              mattack = (tagetCalculation * wepAttFlame[flameLevelOffset][flameLine.flameTier!.index]).ceil();
            }
          }
          else {
            mattack = nonWepAttFlame[flameLine.flameTier!.index];
          }
        case FlameType.speed:
          speed = speedAndJumpFlame[flameLine.flameTier!.index];
        case FlameType.jump:
          jump = speedAndJumpFlame[flameLine.flameTier!.index];
        case FlameType.allStats:
          allStatsPercentage = allStatsPercentageFlame[flameLine.flameTier!.index];
        case FlameType.bossDamage:
          bossDamage = bossDamageFlame[flameLine.flameTier!.index];
        case FlameType.damage:
          damage = damageFlame[flameLine.flameTier!.index];
        case FlameType.levelReduction:
          levelReduction = levelReductionFlame[flameLine.flameTier!.index];
        default:
          return;
      }
    }

    calculateFlame(flameLine1);
    calculateFlame(flameLine2);
    calculateFlame(flameLine3);
    calculateFlame(flameLine4);
  }

  FlameModule({
    this.flameLine1,
    this.flameLine2,
    this.flameLine3,
    this.flameLine4,
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
    this.allStatsPercentage = 0,
    this.bossDamage = 0,
    this.damage = 0,
    this.levelReduction = 0,
  }) {
    flameLine1 = flameLine1 ?? FlameLine();
    flameLine2 = flameLine2 ?? FlameLine();
    flameLine3 = flameLine3 ?? FlameLine();
    flameLine4 = flameLine4 ?? FlameLine();
  }

  FlameModule copyWith({
    FlameLine? flameLine1,
    FlameLine? flameLine2,
    FlameLine? flameLine3,
    FlameLine? flameLine4,
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
    num? allStatsPercentage,
    num? bossDamage,
    num? damage,
    num? levelReduction,
  }) {
    return FlameModule(
      flameLine1: flameLine1 ?? this.flameLine1?.copyWith(),
      flameLine2: flameLine2 ?? this.flameLine2?.copyWith(),
      flameLine3: flameLine3 ?? this.flameLine3?.copyWith(),
      flameLine4: flameLine4 ?? this.flameLine4?.copyWith(),
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
      allStatsPercentage: allStatsPercentage ?? this.allStatsPercentage,
      bossDamage: bossDamage ?? this.bossDamage,
      damage: damage ?? this.damage,
      levelReduction: levelReduction ?? this.levelReduction,
    );
  }
}

int getFlameOffset(num itemLevel) {
  return (itemLevel / 10).floor();
}

class FlameLine {
  FlameType? flameType;
  FlameTier? flameTier;

  FlameLine({
    this.flameType,
    this.flameTier,
  });

  FlameLine copyWith({
    FlameType? flameType,
    FlameTier? flameTier,
  }) {
    return FlameLine(
      flameType: flameType ?? this.flameType,
      flameTier: flameTier ?? this.flameTier,
    );
  }
}