
import 'package:flutter/material.dart';
import 'package:maplestory_builder/core/constants.dart';
import 'package:maplestory_builder/core/base.dart';
import 'package:maplestory_builder/core/items/starforce.dart';
import 'package:maplestory_builder/modules/utilities.dart';

class Equip extends Base {
  final EquipType equipType;
  final ClassType classType;
  bool canStar = true;
  bool equipped = false;
  StarForceMod? starForceMod;

  Equip({
    required super.name,
    required this.equipType,
    this.classType = ClassType.all,
    this.canStar = true,
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
  }){
    if (canStar) {
      starForceMod = StarForceMod(targetEquip: this);
    }
  }

  void updateStarforce(num newStarValue) {
    starForceMod?.updateStarforce(newStarValue);
  }

  Equip copyWith({
    String? name,
    EquipType? equipType,
    ClassType? classType,
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
  }) {
    return Equip(
      name: name ?? this.name,
      equipType: equipType ?? this.equipType,
      classType: classType ?? this.classType,
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
      case StatType.starForce:
        return starForceMod?.buildStarForceWidget() ?? const SizedBox.shrink();
      case StatType.level:
        return RichText(
          text: TextSpan(
            style: DefaultTextStyle.of(context).style,
            children: <TextSpan>[
              TextSpan(
                text: "Required Level: $itemLevel",
                style: const TextStyle(color: equipScrollColor)
              )
            ]
          ),
        );
      case StatType.str:
        baseStat = str;
        starForceStat = starForceMod?.str ?? 0;
        totalStat = str + starForceStat + scrollStat + flameStat;
      case StatType.dex:
        baseStat = dex;
        starForceStat = starForceMod?.dex ?? 0;
        totalStat = dex + starForceStat + scrollStat + flameStat;
      case StatType.int:
        baseStat = this.int;
        starForceStat = starForceMod?.int ?? 0;
        totalStat = this.int + starForceStat + scrollStat + flameStat;
      case StatType.luk:
        baseStat = luk;
        starForceStat = starForceMod?.luk ?? 0;
        totalStat = luk + starForceStat + scrollStat + flameStat;
      case StatType.hp:
        baseStat = hp;
        starForceStat = starForceMod?.hp ?? 0;
        totalStat = hp + starForceStat + scrollStat + flameStat;
      case StatType.mp:
        baseStat = mp;
        starForceStat = starForceMod?.mp ?? 0;
        totalStat = mp + starForceStat + scrollStat + flameStat;
      case StatType.attack:
        baseStat = attackPower;
        starForceStat = starForceMod?.attackPower ?? 0;
        totalStat = attackPower + starForceStat + scrollStat + flameStat;
      case StatType.mattack:
        baseStat = mattack;
        starForceStat = starForceMod?.mattack ?? 0;
        totalStat = mattack + starForceStat + scrollStat + flameStat;
      case StatType.defense:
        baseStat = defense;
        starForceStat = starForceMod?.defense ?? 0;
        totalStat = defense + starForceStat + scrollStat + flameStat;
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
  Equip(name: "Royal Ranger Beret", equipType: EquipType.hat, classType: ClassType.bowman, itemLevel: 150, str: 40, dex: 40, hp: 360, mp: 360, attackPower: 2, defense: 300, ignoreDefense: .1),
];