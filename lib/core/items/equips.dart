
import 'package:flutter/material.dart';
import 'package:maplestory_builder/core/constants.dart';
import 'package:maplestory_builder/core/base.dart';
import 'package:maplestory_builder/modules/utilities.dart';

class Equip extends Base {
  final EquipType equipType;
  final ClassType classType;
  bool equipped = false;

  Equip({
    required super.name,
    required this.equipType,
    this.classType = ClassType.all,
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
    super.ignoreElementalDefense = 0.0,
    super.finalStr = 0,
    super.finalDex = 0,
    super.finalInt = 0,
    super.finalLuk = 0,
    super.finalHp = 0,
    super.finalMp = 0,
    super.finalAttack = 0,
    super.finalMAttack = 0,
  });

  Equip copyWith({
    String? name,
    EquipType? equipType,
    ClassType? classType,
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
    double? ignoreElementalDefense,
    int? finalStr,
    int? finalDex,
    int? finalInt,
    int? finalLuk,
    int? finalHp,
    int? finalMp,
    int? finalAttack,
    int? finalMAttack,
  }) {
    return Equip(
      name: name ?? this.name,
      equipType: equipType ?? this.equipType,
      classType: classType ?? this.classType,
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
      ignoreElementalDefense: ignoreElementalDefense ?? this.ignoreElementalDefense,
      finalStr: finalStr ?? this.finalStr,
      finalDex: finalDex ?? this.finalDex,
      finalInt: finalInt ?? this.finalInt,
      finalLuk: finalLuk ?? this.finalLuk,
      finalHp: finalHp ?? this.finalHp,
      finalMp: finalMp ?? this.finalMp,
      finalAttack: finalAttack ?? this.finalAttack,
      finalMAttack: finalMAttack ?? this.finalMAttack,
    );
  }

  Container createEquipContainer(BuildContext context, {bool includeName = false}){
    return Container(
      padding: const EdgeInsets.all(2.5),
      decoration: BoxDecoration(
        border: Border.all(color: statColor),
        borderRadius: const BorderRadius.all(Radius.circular(5))
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          includeName ? Text(name) : const SizedBox.shrink(),
          __createTextLine(context, StatType.str),
          __createTextLine(context, StatType.dex),
          __createTextLine(context, StatType.int),
          __createTextLine(context, StatType.luk),
          __createTextLine(context, StatType.hp),
          __createTextLine(context, StatType.mp),
          __createTextLine(context, StatType.attack),
          __createTextLine(context, StatType.mattack),
          __createTextLine(context, StatType.defense),
          __createTextLine(context, StatType.ignoreDefense),
          __createTextLine(context, StatType.allStatsPercentage),
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
      case StatType.str:
        baseStat = str;
        totalStat = str;
      case StatType.dex:
        baseStat = dex;
        totalStat = dex ;
      case StatType.int:
        baseStat = this.int;
        totalStat = this.int ;
      case StatType.luk:
        baseStat = luk;
        totalStat = luk;
      case StatType.hp:
        baseStat = hp;
        totalStat = hp;
      case StatType.mp:
        baseStat = mp;
        totalStat = mp;
      case StatType.attack:
        baseStat = attackPower;
        totalStat = attackPower;
      case StatType.mattack:
        baseStat = mattack;
        totalStat = mattack;
      case StatType.defense:
        baseStat = defense;
        totalStat = defense;
      case StatType.ignoreDefense:
        isPercentage = true;
        baseStat = ignoreDefense;
        totalStat = ignoreDefense;
      case StatType.allStatsPercentage:
        isPercentage = true;
      default:
        totalStat = 0;
    }
    
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
              style: const TextStyle(color: equipEnhancedColor)
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
}



final List<Equip> equipList = [
  Equip(name: "Royal Ranger Beret", equipType: EquipType.hat, classType: ClassType.bowman, str: 40, dex: 40, hp: 360, mp: 360, attackPower: 2, defense: 300, ignoreDefense: .1),
  Equip(name: "Royal Warrior Helm", equipType: EquipType.hat, classType: ClassType.warrior, str: 40, dex: 40, int: 0, luk: 0),
  Equip(name: "TEST", equipType: EquipType.belt, str: 40, dex: 40, int: 0, luk: 0),
  Equip(name: "Royal Ranger Beret", equipType: EquipType.hat, classType: ClassType.bowman, str: 40, dex: 40, int: 0, luk: 0),
  Equip(name: "Royal Warrior Helm", equipType: EquipType.hat, classType: ClassType.warrior, str: 40, dex: 40, int: 0, luk: 0),
  Equip(name: "TEST", equipType: EquipType.belt, str: 40, dex: 40, int: 0, luk: 0),
  Equip(name: "Royal Ranger Beret", equipType: EquipType.hat, classType: ClassType.bowman, str: 40, dex: 40, int: 0, luk: 0),
  Equip(name: "Royal Warrior Helm", equipType: EquipType.hat, classType: ClassType.warrior, str: 40, dex: 40, int: 0, luk: 0),
  Equip(name: "TEST", equipType: EquipType.belt, str: 40, dex: 40, int: 0, luk: 0)
];