
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
  num equipHash = -1;

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
    this.starForceMod,
    this.equipHash = -1,
  }){
    if (starForceMod != null) {
      starForceMod = starForceMod;
    }
    else if (canStar) {
      starForceMod = StarForceMod(possibleStars: getStarforceLimit(itemLevel));
    }
    else {
      starForceMod = null;
    }
  }

  void updateStarforce(num newStarValue) {
    starForceMod?.updateStarforce(this, newStarValue);
  }

  Map<StatType, num> calculateStats() {
    return <StatType, num>{
      StatType.attackSpeed: attackSpeed,
      StatType.str: str + (starForceMod?.str ?? 0),
      StatType.dex: dex + (starForceMod?.dex ?? 0),
      StatType.int: this.int + (starForceMod?.int ?? 0),
      StatType.luk: luk + (starForceMod?.luk ?? 0),
      StatType.hp: hp + (starForceMod?.hp ?? 0),
      StatType.mp: mp + (starForceMod?.mp ?? 0),
      StatType.attack: attackPower + (starForceMod?.attackPower ?? 0),
      StatType.mattack: mattack + (starForceMod?.mattack ?? 0),
      StatType.defense: defense + (starForceMod?.defense ?? 0),
      StatType.starForce: starForceMod?.currentStars ?? 0,
      StatType.ignoreDefense: ignoreDefense,
      StatType.speed: speed + (starForceMod?.speed ?? 0),
      StatType.jump: jump + (starForceMod?.jump ?? 0),
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
    };
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
    StarForceMod? starForceMod,
    num? equipHash,
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
      starForceMod: starForceMod ?? this.starForceMod?.copyWith(),
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
        return starForceMod?.buildStarForceWidget() ?? const SizedBox.shrink();
      case StatType.level:
        return RichText(
          text: TextSpan(
            style: DefaultTextStyle.of(context).style,
            children: <TextSpan>[
              TextSpan(
                text: "Required Level: $itemLevel",
                style: const TextStyle(color: starColor)
              )
            ]
          ),
        );
      case StatType.str:
        baseStat = str;
        starForceStat = starForceMod?.str ?? 0;
      case StatType.dex:
        baseStat = dex;
        starForceStat = starForceMod?.dex ?? 0;
      case StatType.int:
        baseStat = this.int;
        starForceStat = starForceMod?.int ?? 0;
      case StatType.luk:
        baseStat = luk;
        starForceStat = starForceMod?.luk ?? 0;
      case StatType.hp:
        baseStat = hp;
        starForceStat = starForceMod?.hp ?? 0;
      case StatType.mp:
        baseStat = mp;
        starForceStat = starForceMod?.mp ?? 0;
      case StatType.attack:
        baseStat = attackPower;
        starForceStat = starForceMod?.attackPower ?? 0;
      case StatType.mattack:
        baseStat = mattack;
        starForceStat = starForceMod?.mattack ?? 0;
      case StatType.defense:
        baseStat = defense;
        starForceStat = starForceMod?.defense ?? 0;
      case StatType.bossDamage:
        isPercentage = true;
        baseStat = bossDamage;
      case StatType.speed:
        baseStat = speed;
      case StatType.jump:
        baseStat = jump;
      case StatType.ignoreDefense:
        isPercentage = true;
        baseStat = ignoreDefense;
      case StatType.damage:
        isPercentage = true;
        baseStat = damage;
      case StatType.allStatsPercentage:
        isPercentage = true;
        baseStat = allStatsPercentage;
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