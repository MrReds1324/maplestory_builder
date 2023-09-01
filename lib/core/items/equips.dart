// ignore_for_file: avoid_types_as_parameter_names

import 'package:flutter/material.dart';
import 'package:maplestory_builder/core/constants.dart';
import 'package:maplestory_builder/core/base.dart';
import 'package:maplestory_builder/core/constants/flame_stats.dart';
import 'package:maplestory_builder/core/items/flames.dart';
import 'package:maplestory_builder/core/items/starforce.dart';
import 'package:maplestory_builder/modules/utilities.dart';
import 'dart:math';

class Equip extends Base {
  final EquipType equipType;
  final ClassType classType;
  bool canStar = true;
  bool canFlame = true;
  bool isFlameAdvantaged = true;
  bool equipped = false;
  StarForceModule? starForceModule;
  FlameModule? flameModule;
  num equipHash = -1;

  Equip({
    required super.name,
    required this.equipType,
    this.classType = ClassType.all,
    this.canStar = true,
    this.canFlame = true,
    this.isFlameAdvantaged = true,
    super.itemLevel = 0,
    super.str = 0,
    super.dex = 0,
    super.int = 0,
    super.luk = 0,
    super.hp = 0,
    super.mp = 0,
    super.attackPower = 0,
    super.mattack = 0,
    super.defense = 0,
    super.speed = 0,
    super.jump = 0,
    super.ignoreDefense = 0.0,
    super.bossDamage = 0.0,
    super.damage = 0.0,
    super.damageNormalMobs = 0.0,
    super.attackSpeed = 0,
    super.ignoreElementalDefense = 0.0,
    super.finalStr = 0,
    super.finalDex = 0,
    super.finalInt = 0,
    super.finalLuk = 0,
    super.finalHp = 0,
    super.finalMp = 0,
    super.finalAttack = 0,
    super.finalMAttack = 0,
    this.starForceModule,
    this.equipHash = -1,
  }){
    if (starForceModule != null) {
      starForceModule = starForceModule;
    }
    else if (canStar) {
      starForceModule = StarForceModule(possibleStars: getStarforceLimit(itemLevel));
    }
    else {
      starForceModule = null;
    }

    if (flameModule != null) {
      flameModule = flameModule;
    }
    else if (noFlameCategory.contains(equipType)){
      flameModule = null;
    }
    else if (canFlame) {
      flameModule = FlameModule();
    }
    else {
      starForceModule = null;
    }
  }

  void updateStarforce(num newStarValue) {
    starForceModule?.updateStarforce(this, newStarValue);
  }

  void updateFlame(int flamePosition, {FlameType? flameType, FlameTier? flameTier, isUpdatingTier=false}) {
    flameModule?.updateFlame(this, flamePosition, flameType: flameType, flameTier: flameTier, isUpdatingTier: isUpdatingTier);
  }

  Map<StatType, num> calculateStats() {
    return <StatType, num>{
      StatType.attackSpeed: attackSpeed,
      StatType.str: str + (starForceModule?.str ?? 0) + (flameModule?.str ?? 0),
      StatType.dex: dex + (starForceModule?.dex ?? 0) + (flameModule?.dex ?? 0),
      StatType.int: this.int + (starForceModule?.int ?? 0) + (flameModule?.int ?? 0),
      StatType.luk: luk + (starForceModule?.luk ?? 0) + (flameModule?.luk ?? 0),
      StatType.hp: hp + (starForceModule?.hp ?? 0) + (flameModule?.hp ?? 0),
      StatType.mp: mp + (starForceModule?.mp ?? 0) + (flameModule?.mp ?? 0),
      StatType.attack: attackPower + (starForceModule?.attackPower ?? 0) + (flameModule?.attackPower ?? 0),
      StatType.mattack: mattack + (starForceModule?.mattack ?? 0) + (flameModule?.mattack ?? 0),
      StatType.defense: defense + (starForceModule?.defense ?? 0) + (flameModule?.defense ?? 0),
      StatType.starForce: starForceModule?.currentStars ?? 0,
      StatType.ignoreDefense: ignoreDefense,
      StatType.speed: speed + (starForceModule?.speed ?? 0) + (flameModule?.speed ?? 0),
      StatType.jump: jump + (starForceModule?.jump ?? 0) + (flameModule?.jump ?? 0),
      StatType.bossDamage: bossDamage,
      StatType.damage: damage,
      StatType.damageNormalMobs: damageNormalMobs,
      StatType.ignoreElementalDefense: ignoreElementalDefense,
      StatType.finalStr: finalStr,
      StatType.finalDex: finalDex,
      StatType.finalInt: finalInt,
      StatType.finalLuk: finalLuk,
      StatType.finalHp: finalHp,
      StatType.finalMp: finalMp,
      StatType.finalAttack: finalAttack,
      StatType.finalMAttack: finalMAttack,
      StatType.allStatsPercentage: allStatsPercentage + (flameModule?.allStatsPercentage ?? 0),
    };
  }

  Equip copyWith({
    String? name,
    EquipType? equipType,
    ClassType? classType,
    bool? canStar,
    bool? canFlame,
    bool? isFlameAdvantaged,
    num? itemLevel,
    num? str,
    num? dex,
    num? int,
    num? luk,
    num? hp,
    num? mp,
    num? attackPower,
    num? mattack,
    num? defense,
    num? speed,
    num? jump,
    double? ignoreDefense,
    double? bossDamage,
    double? damage,
    double? damageNormalMobs,
    num? attackSpeed,
    double? ignoreElementalDefense,
    int? finalStr,
    int? finalDex,
    int? finalInt,
    int? finalLuk,
    int? finalHp,
    int? finalMp,
    int? finalAttack,
    int? finalMAttack,
    StarForceModule? starForceModule,
    num? equipHash,
  }) {
    return Equip(
      name: name ?? this.name,
      equipType: equipType ?? this.equipType,
      classType: classType ?? this.classType,
      canStar: canStar ?? this.canStar,
      canFlame: canFlame ?? this.canFlame,
      isFlameAdvantaged: isFlameAdvantaged ?? this.isFlameAdvantaged,
      itemLevel: itemLevel ?? this.itemLevel,
      str: str ?? this.str,
      dex: dex ?? this.dex,
      int: int ?? this.int,
      luk: luk ?? this.luk,
      hp: hp ?? this.hp,
      mp: mp ?? this.mp,
      attackPower: attackPower ?? this.attackPower,
      mattack: mattack ?? this.mattack,
      defense: defense ?? this.defense,
      speed: speed ?? this.speed,
      jump: jump ?? this.jump,
      ignoreDefense: ignoreDefense ?? this.ignoreDefense,
      bossDamage: bossDamage ?? this.bossDamage,
      damage: damage ?? this.damage,
      damageNormalMobs: damageNormalMobs ?? this.damageNormalMobs,
      attackSpeed: attackSpeed?? this.attackSpeed,
      ignoreElementalDefense: ignoreElementalDefense ?? this.ignoreElementalDefense,
      finalStr: finalStr ?? this.finalStr,
      finalDex: finalDex ?? this.finalDex,
      finalInt: finalInt ?? this.finalInt,
      finalLuk: finalLuk ?? this.finalLuk,
      finalHp: finalHp ?? this.finalHp,
      finalMp: finalMp ?? this.finalMp,
      finalAttack: finalAttack ?? this.finalAttack,
      finalMAttack: finalMAttack ?? this.finalMAttack,
      starForceModule: starForceModule ?? this.starForceModule?.copyWith(),
      equipHash: equipHash ?? this.equipHash,
    );
  }

  Container createEquipContainer(BuildContext context, {bool includeName = false}){
    return Container(
      width: 300,
      padding: const EdgeInsets.all(2.5),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          includeName ? Text(name) : const SizedBox.shrink(),
          __createTextLine(context, StatType.starForce),
          Text(name, style: Theme.of(context).textTheme.headlineSmall),
          __createTextLine(context, StatType.level),
          __createTextLine(context, StatType.attackSpeed),
          __createTextLine(context, StatType.str),
          __createTextLine(context, StatType.dex),
          __createTextLine(context, StatType.int),
          __createTextLine(context, StatType.luk),
          __createTextLine(context, StatType.hp),
          __createTextLine(context, StatType.mp),
          __createTextLine(context, StatType.attack),
          __createTextLine(context, StatType.mattack),
          __createTextLine(context, StatType.defense),
          __createTextLine(context, StatType.bossDamage),
          __createTextLine(context, StatType.speed),
          __createTextLine(context, StatType.jump),
          __createTextLine(context, StatType.ignoreDefense),
          __createTextLine(context, StatType.damage),
          __createTextLine(context, StatType.allStatsPercentage),
          __createTextLine(context, StatType.damageNormalMobs),
          __createTextLine(context, StatType.ignoreElementalDefense),
          __createTextLine(context, StatType.finalStr),
          __createTextLine(context, StatType.finalDex),
          __createTextLine(context, StatType.finalInt),
          __createTextLine(context, StatType.finalLuk),
          __createTextLine(context, StatType.finalHp),
          __createTextLine(context, StatType.finalMp),
          __createTextLine(context, StatType.finalAttack),
          __createTextLine(context, StatType.finalMAttack),
        ],
      )
    );
  }

  Widget __createTextLine(BuildContext context, StatType statType) {
    var isPercentage = false;
    num totalStat = 0;
    num baseStat = 0;
    num starForceStat = 0;
    num scrollStat = 0;
    num flameStat = 0;

    switch(statType){
      case StatType.starForce:
        return starForceModule?.buildStarForceWidget() ?? const SizedBox.shrink();
      case StatType.level:
        List<TextSpan> levelText = [];
        if ((flameModule?.levelReduction ?? 0) > 0) {
          levelText.add(
            TextSpan(
              text: "Required Level: ${max(itemLevel - (flameModule?.levelReduction ?? 0), 0).toInt()}",
              style: const TextStyle(color: starColor)
            )
          );
          levelText.add(
            TextSpan(
              text: "($itemLevel",
            )
          );
          levelText.add(
            TextSpan(
              text: "-${flameModule?.levelReduction.toInt() ?? 0}",
              style: const TextStyle(color: starColor)
            )
          );
          levelText.add(
            const TextSpan(
              text: ")",
            )
          );
        }
        else {
          levelText.add(
            TextSpan(
              text: "Required Level: $itemLevel",
              style: const TextStyle(color: starColor)
            )
          );
        }
        return RichText(
          text: TextSpan(
            style: DefaultTextStyle.of(context).style,
            children: levelText,
          ),
        );
      case StatType.str:
        baseStat = str;
        starForceStat = starForceModule?.str ?? 0;
        flameStat = flameModule?.str ?? 0;
      case StatType.dex:
        baseStat = dex;
        starForceStat = starForceModule?.dex ?? 0;
        flameStat = flameModule?.dex ?? 0;
      case StatType.int:
        baseStat = this.int;
        starForceStat = starForceModule?.int ?? 0;
        flameStat = flameModule?.int ?? 0;
      case StatType.luk:
        baseStat = luk;
        starForceStat = starForceModule?.luk ?? 0;
        flameStat = flameModule?.luk ?? 0;
      case StatType.hp:
        baseStat = hp;
        starForceStat = starForceModule?.hp ?? 0;
        flameStat = flameModule?.hp ?? 0;
      case StatType.mp:
        baseStat = mp;
        starForceStat = starForceModule?.mp ?? 0;
        flameStat = flameModule?.mp ?? 0;
      case StatType.attack:
        baseStat = attackPower;
        starForceStat = starForceModule?.attackPower ?? 0;
        flameStat = flameModule?.attackPower ?? 0;
      case StatType.mattack:
        baseStat = mattack;
        starForceStat = starForceModule?.mattack ?? 0;
        flameStat = flameModule?.mattack ?? 0;
      case StatType.defense:
        baseStat = defense;
        starForceStat = starForceModule?.defense ?? 0;
        flameStat = flameModule?.defense ?? 0;
      case StatType.bossDamage:
        isPercentage = true;
        baseStat = bossDamage;
        flameStat = flameModule?.bossDamage ?? 0;
      case StatType.speed:
        baseStat = speed;
        flameStat = flameModule?.speed ?? 0;
      case StatType.jump:
        baseStat = jump;
        flameStat = flameModule?.jump ?? 0;
      case StatType.ignoreDefense:
        isPercentage = true;
        baseStat = ignoreDefense;
      case StatType.damage:
        isPercentage = true;
        baseStat = damage;
        flameStat = flameModule?.damage ?? 0;
      case StatType.allStatsPercentage:
        isPercentage = true;
        baseStat = allStatsPercentage;
        flameStat = flameModule?.allStatsPercentage ?? 0;
      case StatType.damageNormalMobs:
        isPercentage = true;
        baseStat = damageNormalMobs;
      case StatType.ignoreElementalDefense:
        isPercentage = true;
        baseStat = ignoreElementalDefense;
      case StatType.finalStr:
        baseStat = finalStr;
      case StatType.finalDex:
        baseStat = finalDex;
      case StatType.finalInt:
        baseStat = finalInt;
      case StatType.finalLuk:
        baseStat = finalLuk;
      case StatType.finalHp:
        baseStat = finalHp;
      case StatType.finalMp:
        baseStat = finalMp;
      case StatType.finalAttack:
        baseStat = finalAttack;
      case StatType.finalMAttack:
        baseStat = finalMAttack;
      default:
        baseStat = 0;
    }
    totalStat = baseStat + starForceStat + scrollStat + flameStat;
    
    if (totalStat > 0){
      List<TextSpan> childrenText = <TextSpan>[];

      if (totalStat > baseStat) {
        childrenText.add(
          TextSpan(
            text: "${formatStatTypeEnumName(statType)}: +${isPercentage ? doubleRoundPercentFormater.format(totalStat) : totalStat} ",
            style: const TextStyle(color: equipEnhancedColor)
          )
        );
        childrenText.add(TextSpan(text: "(${isPercentage ? doubleRoundPercentFormater.format(baseStat) : baseStat}",));
        if (flameStat > 0) {
          childrenText.add(
            TextSpan(
              text: " +${isPercentage ? doubleRoundPercentFormater.format(flameStat) : flameStat}",
              style: const TextStyle(color: equipFlameColor)
            )
          );
        }
        if (scrollStat > 0){
          childrenText.add(
            TextSpan(
              text: " +${isPercentage ? doubleRoundPercentFormater.format(scrollStat) : scrollStat}",
              style: const TextStyle(color: equipScrollColor)
            )
          );
        }
        if (starForceStat > 0) {
          childrenText.add(
            TextSpan(
              text: " +${isPercentage ? doubleRoundPercentFormater.format(starForceStat) : starForceStat}",
              style: const TextStyle(color: equipStarColor)
            )
          );
        }
        childrenText.add(const TextSpan(text: ")",));
      }
      else {
        childrenText.add(
          TextSpan(
            text: "${formatStatTypeEnumName(statType)}: +${isPercentage ? doubleRoundPercentFormater.format(totalStat) : totalStat}",
          )
        );
      }

      return RichText(
        text: TextSpan(
          style: DefaultTextStyle.of(context).style,
          children: childrenText
        ),
      );
    }
    else {
      return const SizedBox.shrink();
    }
  }

  @override
  operator ==(Object other){
    if (other is Equip){
      if (identical(this, other)){
        return true;
      }
      else if (other.equipHash == -1 || equipHash == -1) {
        return false;
      }
      else {
        return other.equipHash == other.equipHash;
      }
    }
    return false;
  }

  @override
  int get hashCode => equipHash == -1 ? super.hashCode : equipHash.toInt();
}




final List<Equip> equipList = [
  Equip(name: "Royal Ranger Beret", equipType: EquipType.hat, classType: ClassType.bowman, itemLevel: 150, str: 40, dex: 40, hp: 360, mp: 360, attackPower: 2, defense: 300, ignoreDefense: .1),
  Equip(name: "Sengoku Hakase Badge", equipType: EquipType.badge, itemLevel: 160, str: 10, dex: 10, int: 10, luk: 10, attackPower: 10, mattack: 10),
  Equip(name: "Superior Gollux Ring", equipType: EquipType.ring, itemLevel: 150, str: 10, dex: 10, int: 10, luk: 10, hp: 250, mp: 250, attackPower: 8, mattack: 8, defense: 150, speed: 10)
];