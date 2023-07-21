import 'package:flutter/material.dart';
import 'package:maplestory_builder/modules/character_provider.dart';
import 'package:provider/provider.dart';
import 'package:maplestory_builder/modules/utilities.dart';
import 'package:maplestory_builder/core/constants.dart';
import 'dart:math';

const statColor = Color.fromARGB(255, 105, 105, 105);
const apColor = Colors.green;

class StatTable extends StatelessWidget {
  const StatTable({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const APStatCell(label: 'STR'),
        RangeStatCell(
          label: "Damage Range",
          upperValue: _getRangeSelector(RangeType.damageRange),
          lowerValue: _getRangeSelector(RangeType.damageRange, isLower: true),
        ),
        RangeStatCell(
          label: "Boss Damage Range",
          upperValue: _getRangeSelector(RangeType.bossDamageRange),
          lowerValue: _getRangeSelector(RangeType.bossDamageRange, isLower: true),
        ),
        Row(
          children: [
            StatCell(
              label: 'Damage',
              value: _getStatSelector(StatType.damage),
            ),
            StatCell(
              label: 'Boss Damage',
              value: _getStatSelector(StatType.bossDamage),
            ),
          ]
        ),
        Row(
          children: [
            StatCell(
              label: 'Final Damage',
              value: _getStatSelector(StatType.finalDamage),
            ),
            StatCell(
              label: 'Buff Duration',
              value: _getStatSelector(StatType.buffDuration),
            ),
          ]
        ),
        Row(
          children: [
            StatCell(
              label: 'Ignore Defense',
              value: _getStatSelector(StatType.ignoreDefense),
            ),
            StatCell(
              label: 'Item Drop Rate',
              value: _getStatSelector(StatType.itemDropRate),
            ),
          ]
        ),
        Row(
          children: [
            StatCell(
              label: 'Critical Rate',
              value: _getStatSelector(StatType.critRate),
            ),
            StatCell(
              label: 'Mesos Obtained',
              value: _getStatSelector(StatType.mesosObtained),
            ),
          ]
        ),
        Row(
          children: [
            StatCell(
              label: 'Critical Damage',
              value: _getStatSelector(StatType.critDamage),
            ),
            StatCell(
              label: 'Attack Speed',
              value: _getStatSelector(StatType.attackSpeed),
            ),
          ]
        ),
        Row(
          children: [
            StatCell(
              label: 'Attack Power',
              value: _getStatSelector(StatType.attack)
            ),
            StatCell(
              label: 'Magic Attack',
              value: _getStatSelector(StatType.mattack),
            ),
          ]
        ),
        Row(
          children: [
            StatCell(
              label: 'Status Resistance',
              value: _getStatSelector(StatType.statusResistance),
            ),
            StatCell(
              label: 'Knockback Resistance',
              value: _getStatSelector(StatType.knockbackResistance),
            ),
          ]
        ),
        Row(
          children: [
            StatCell(
              label: 'Defense',
              value: _getStatSelector(StatType.defense),
            ),
            StatCell(
              label: 'Star Force',
              value: _getStatSelector(StatType.starForce),
            ),
          ]
        ),
        Row(
          children: [
            StatCell(
              label: 'Speed',
              value: _getStatSelector(StatType.speed),
            ),
            StatCell(
              label: 'Arcane Force',
              value: _getStatSelector(StatType.arcaneForce),
            ),
          ]
        ),
        Row(
          children: [
            StatCell(
              label: 'Jump',
              value: _getStatSelector(StatType.jump),
            ),
            StatCell(
              label: 'Sacred Power',
              value: _getStatSelector(StatType.sacredPower),
            ),
          ]
        ),
      ],
    );
  }
}

class StatCell extends StatelessWidget{
  final String label;
  final Widget value;

  const StatCell(
    {
      required this.label,
      required this.value,
      super.key
    }
  );

  @override
  Widget build(BuildContext context){
    return Container(
      padding: const EdgeInsets.all(2.5),
      child: Row(
        children: <Widget>[
          Container(
            height: 37,
            width: 120,
            clipBehavior: Clip.hardEdge,
            padding: const EdgeInsets.symmetric(horizontal: 5),
            decoration: BoxDecoration(
              color: statColor,
              border: Border.all(
                color: statColor
              ),
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(10),
                bottomLeft: Radius.circular(10),
              ),
            ),
            child: Center(child: Text(
                label,
                textAlign: TextAlign.center,
              )
            )
          ),
          Container(
            height: 37,
            width: 97.5,
            clipBehavior: Clip.hardEdge,
            padding: const EdgeInsets.symmetric(horizontal: 5),
            decoration: BoxDecoration(
              border: Border.all(
                color: statColor
              ),
              borderRadius: const BorderRadius.only(
                topRight: Radius.circular(10),
                bottomRight: Radius.circular(10),
              ),
            ),
            child: Center(child: value)
          )
        ],
      ),
    );
  }
}

class RangeStatCell extends StatelessWidget{
  final String label;
  final Selector upperValue;
  final Selector lowerValue;

  const RangeStatCell(
    {
      required this.label,
      required this.upperValue,
      required this.lowerValue,
      super.key
    }
  );

  @override
  Widget build(BuildContext context){
    return Container(
      padding: const EdgeInsets.all(2.5),
      child: Row(
        children: <Widget>[
          Container(
            height: 40,
            width: 120,
            clipBehavior: Clip.hardEdge,
            padding: const EdgeInsets.symmetric(horizontal: 5),
            decoration: BoxDecoration(
              color: statColor,
              border: Border.all(
                color: statColor
              ),
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(10),
                bottomLeft: Radius.circular(10),
              ),
            ),
            child: Center(
              child: Text(
                label,
                textAlign: TextAlign.center,
              ),
            ),
          ),
          Container(
            height: 40,
            width: 320,
            clipBehavior: Clip.hardEdge,
            padding: const EdgeInsets.symmetric(horizontal: 5),
            decoration: BoxDecoration(
              border: Border.all(
                color: statColor
              ),
              borderRadius: const BorderRadius.only(
                topRight: Radius.circular(10),
                bottomRight: Radius.circular(10),
              ),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Center(child: upperValue),
                Center(child: lowerValue)
              ]
            ),
          ),
        ],
      ),
    );
  }
}

class APStatCell extends StatelessWidget{
  final String label;
  final Text value;

  const APStatCell(
    {
      required this.label,
      this.value = const Text('999999 (999999 + 999999)'),
      super.key
    }
  );

  @override
  Widget build(BuildContext context){
    return Container(
      padding: const EdgeInsets.all(2.5),
      child: Row(
        children: <Widget>[
          Container(
            height: 37,
            width: 120,
            clipBehavior: Clip.hardEdge,
            padding: const EdgeInsets.symmetric(horizontal: 5),
            decoration: BoxDecoration(
              color: apColor,
              border: Border.all(
                color: statColor
              ),
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(10),
                bottomLeft: Radius.circular(10),
              ),
            ),
            child: Center(child: Text(
                label,
                textAlign: TextAlign.center,
              )
            )
          ),
          Container(
            height: 37,
            width: 320,
            clipBehavior: Clip.hardEdge,
            padding: const EdgeInsets.symmetric(horizontal: 5),
            decoration: BoxDecoration(
              border: Border.all(
                color: statColor
              ),
              borderRadius: const BorderRadius.only(
                topRight: Radius.circular(10),
                bottomRight: Radius.circular(10),
              ),
            ),
            child: Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  IconButton(
                    iconSize: 12,
                    onPressed: () {}, 
                    icon: const Icon(Icons.keyboard_double_arrow_down),
                  ),
                  IconButton(
                    iconSize: 12,
                    onPressed: () {}, 
                    icon: const Icon(Icons.keyboard_arrow_down),
                  ),
                  value,
                  IconButton(
                    iconSize: 12,
                    onPressed: () {}, 
                    icon: const Icon(Icons.keyboard_arrow_up),
                  ),
                  IconButton(
                    iconSize: 12,
                    onPressed: () {}, 
                    icon: const Icon(Icons.keyboard_double_arrow_up),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}

Selector _getStatSelector(StatType statType) {
  switch(statType){
    case StatType.str:
      return Selector<CharacterModel, (double, int)>(
        selector: (_, character) => (character.totalStr, character.apSTR),
        builder: (context, data, child) {
          var diff = data.$1 - data.$2;
          return Text('${doubleRoundFormater.format(data.$1)} (${doubleRoundFormater.format(diff)} + ${data.$2})');
        }
      );
    case StatType.dex:
      return Selector<CharacterModel, (double, int)>(
        selector: (_, character) => (character.totalDex, character.apDex),
        builder: (context, data, child) {
          var diff = data.$1 - data.$2;
          return Text('${doubleRoundFormater.format(data.$1)} (${doubleRoundFormater.format(diff)} + ${data.$2})');
        }
      );
    case StatType.int:
      return Selector<CharacterModel, (double, int)>(
        selector: (_, character) => (character.totalInt, character.apInt),
        builder: (context, data, child) {
          var diff = data.$1 - data.$2;
          return Text('${doubleRoundFormater.format(data.$1)} (${doubleRoundFormater.format(diff)} + ${data.$2})');
        }
      );
    case StatType.luk:
      return Selector<CharacterModel, (double, int)>(
        selector: (_, character) => (character.totalLuk, character.apLuk),
        builder: (context, data, child) {
          var diff = data.$1 - data.$2;
          return Text('${doubleRoundFormater.format(data.$1)} (${doubleRoundFormater.format(diff)} + ${data.$2})');
        }
      );
    case StatType.hp:
      return Selector<CharacterModel, double>(
        selector: (_, character) => character.totalHp,
        builder: (context, totalHp, child) {
          return Text(doubleRoundFormater.format(min(500000, totalHp)));
        }
      );
    case StatType.mp:
      return Selector<CharacterModel, double>(
        selector: (_, character) => character.totalMp,
        builder: (context, totalMp, child) {
          return Text(doubleRoundFormater.format(min(500000, totalMp)));
        }
      );
    case StatType.damage:
      return Selector<CharacterModel, double>(
        selector: (_, character) => character.totalDamage,
        builder: (context, totalDamage, child) {
          return Text(doubleRoundPercentFormater.format(totalDamage));
        }
      );
    case StatType.bossDamage:
      return Selector<CharacterModel, double>(
        selector: (_, character) => character.totalBossDmanage,
        builder: (context, totalBossDmanage, child) {
          return Text(doubleRoundPercentFormater.format(totalBossDmanage));
        }
      );
    case StatType.finalDamage:
      return Selector<CharacterModel, double>(
        selector: (_, character) => character.totalFinalDamage,
        builder: (context, totalFinalDamage, child) {
          return Text(doublePercentFormater.format(totalFinalDamage));
        }
      );
    case StatType.buffDuration:
      return Selector<CharacterModel, double>(
        selector: (_, character) => character.totalBuffDuration,
        builder: (context, totalBuffDuration, child) {
          return Text(doubleRoundPercentFormater.format(totalBuffDuration));
        }
      );
    case StatType.ignoreDefense:
      return Selector<CharacterModel, double>(
        selector: (_, character) => character.totalIgnoreDefense,
        builder: (context, totalIgnoreDefense, child) {
          return Text(doublePercentFormater.format(totalIgnoreDefense));
        }
      );
    case StatType.itemDropRate:
      return Selector<CharacterModel, double>(
        selector: (_, character) => character.totalItemDropRate,
        builder: (context, totalItemDropRate, child) {
          return Text(doubleRoundPercentFormater.format(totalItemDropRate));
        }
      );
    case StatType.critRate:
      return Selector<CharacterModel, double>(
        selector: (_, character) => character.totalCritRate,
        builder: (context, totalCritRate, child) {
          return Text(doubleRoundPercentFormater.format(totalCritRate));
        }
      );
    case StatType.mesosObtained:
      return Selector<CharacterModel, double>(
        selector: (_, character) => character.totalMesosObtained,
        builder: (context, totalMesosObtained, child) {
          return Text(doubleRoundPercentFormater.format(totalMesosObtained));
        }
      );
    case StatType.critDamage:
      return Selector<CharacterModel, double>(
        selector: (_, character) => character.totalCritDamage,
        builder: (context, totalCritDamage, child) {
          return Text(doublePercentFormater.format(totalCritDamage));
        }
      );
    case StatType.attackSpeed:
      return Selector<CharacterModel, int>(
        selector: (_, character) => character.totalAttackSpeed,
        builder: (context, totalAttackSpeed, child) {
          return Text('$totalAttackSpeed Level');
        }
      );
    case StatType.attack:
      return Selector<CharacterModel, double>(
        selector: (_, character) => character.totalAttack,
        builder: (context, totalAttack, child) {
          return Text(doubleRoundFormater.format(totalAttack));
        }
      );
    case StatType.mattack:
      return Selector<CharacterModel, double>(
        selector: (_, character) => character.totalMAttack,
        builder: (context, totalMAttack, child) {
          return Text(doubleRoundFormater.format(totalMAttack));
        }
      );
    case StatType.statusResistance:
      return Selector<CharacterModel, int>(
        selector: (_, character) => character.totalStatusResistance,
        builder: (context, totalStatusResistance, child) {
          return Text('$totalStatusResistance');
        }
      );
    case StatType.knockbackResistance:
      return Selector<CharacterModel, double>(
        selector: (_, character) => character.totalKnockbackResistance,
        builder: (context, totalKnockbackResistance, child) {
          return Text(doubleRoundPercentFormater.format(totalKnockbackResistance));
        }
      );
    case StatType.defense:
      return Selector<CharacterModel, double>(
        selector: (_, character) => character.totalDefense,
        builder: (context, totalDefense, child) {
          return Text(doubleRoundFormater.format(totalDefense));
        }
      );
    case StatType.starForce:
      return Selector<CharacterModel, int>(
        selector: (_, character) => character.totalStarForce,
        builder: (context, totalStarForce, child) {
          return Text('$totalStarForce');
        }
      );
    case StatType.speed:
      return Selector<CharacterModel, double>(
        selector: (_, character) => character.totalSpeed,
        builder: (context, totalSpeed, child) {
          return Text(doubleRoundPercentFormater.format(totalSpeed));
        }
      );
    case StatType.arcaneForce:
      return Selector<CharacterModel, int>(
        selector: (_, character) => character.totalArcaneForce,
        builder: (context, totalArcaneForce, child) {
          return Text('$totalArcaneForce');
        }
      );
    case StatType.jump:
      return Selector<CharacterModel, double>(
        selector: (_, character) => character.totalJump,
        builder: (context, totalJump, child) {
          return Text(doubleRoundPercentFormater.format(totalJump));
        }
      );
    case StatType.sacredPower:
      return Selector<CharacterModel, int>(
        selector: (_, character) => character.totalSacredPower,
        builder: (context, totalSacredPower, child) {
          return Text('$totalSacredPower');
        }
      );
    default:
      throw Exception("Selector not Implemented for statType $statType");
  }
}

Selector _getRangeSelector(RangeType rangeType, {bool isLower = false}) {
  switch(rangeType){
    case RangeType.damageRange:
      if (!isLower){
        return Selector<CharacterModel, double>(
          selector: (_, character) => character.upperDamageRange,
          builder: (context, upperDamageRange, child) {
            return Text(rangeFormatter.format(upperDamageRange));
          }
        );
      }
      else {
        return Selector<CharacterModel, (double, double)>(
          selector: (_, character) => (character.upperDamageRange, character.totalMastery),
          builder: (context, data, child) {
            return Text(rangeFormatter.format(data.$1 * data.$2));
          }
        );
      }
    case RangeType.bossDamageRange:
      if (!isLower){
        return Selector<CharacterModel, double>(
          selector: (_, character) => character.upperBossDamangeRange,
          builder: (context, upperDamageRange, child) {
            return Text(rangeFormatter.format(upperDamageRange));
          }
        );
      }
      else {
        return Selector<CharacterModel, (double, double)>(
          selector: (_, character) => (character.upperBossDamangeRange, character.totalMastery),
          builder: (context, data, child) {
            return Text(rangeFormatter.format(data.$1 * data.$2));
          }
        );
      }
    default:
      throw Exception("Selector not Implemented for rangeType $rangeType");
  }
}