import 'package:flutter/material.dart';
import 'package:maplestory_builder/providers/ap_stats_provider.dart';
import 'package:maplestory_builder/providers/character_provider.dart';
import 'package:maplestory_builder/providers/difference_provider.dart';
import 'package:provider/provider.dart';
import 'package:maplestory_builder/modules/utilities.dart';
import 'package:maplestory_builder/core/constants.dart';
import 'dart:math';

class StatTable extends StatelessWidget {
  const StatTable({super.key});

  @override
  Widget build(BuildContext context) {
    return const SingleChildScrollView(
      padding: EdgeInsets.symmetric(horizontal: 8),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          APCell(),
          IGNCell(),
          LevelCell(),
          APStatCell(statType: StatType.hp),
          APStatCell(statType: StatType.mp),
          APStatCell(statType: StatType.str),
          APStatCell(statType: StatType.dex),
          APStatCell(statType: StatType.int),
          APStatCell(statType: StatType.luk),
          RangeStatCell(
            rangeType: RangeType.damageRange,
          ),
          RangeStatCell(
            rangeType: RangeType.bossDamageRange,
          ),
          Row(
            children: [
              StatCell(
                statType: StatType.damage,
              ),
              StatCell(
                statType: StatType.bossDamage,
              ),
            ]
          ),
          Row(
            children: [
              StatCell(
                statType: StatType.finalDamage,
              ),
              StatCell(
                statType: StatType.buffDuration,
              ),
            ]
          ),
          Row(
            children: [
              StatCell(
                statType: StatType.ignoreDefense,
              ),
              StatCell(
                statType: StatType.itemDropRate,
              ),
            ]
          ),
          Row(
            children: [
              StatCell(
                statType: StatType.critRate,
              ),
              StatCell(
                statType: StatType.mesosObtained,
              ),
            ]
          ),
          Row(
            children: [
              StatCell(
                statType: StatType.critDamage,
              ),
              StatCell(
                statType: StatType.attackSpeed,
              ),
            ]
          ),
          Row(
            children: [
              StatCell(
                statType: StatType.attack,
              ),
              StatCell(
                statType: StatType.mattack,
              ),
            ]
          ),
          Row(
            children: [
              StatCell(
                statType: StatType.statusResistance,
              ),
              StatCell(
                statType: StatType.knockbackResistance,
              ),
            ]
          ),
          Row(
            children: [
              StatCell(
                statType: StatType.defense,
              ),
              StatCell(
                statType: StatType.starForce,
              ),
            ]
          ),
          Row(
            children: [
              StatCell(
                statType: StatType.speed,
              ),
              StatCell(
                statType: StatType.arcaneForce,
              ),
            ]
          ),
          Row(
            children: [
              StatCell(
                statType: StatType.jump,
              ),
              StatCell(
                statType: StatType.sacredPower,
              ),
            ]
          ),
        ],
      ),
    );
  }
}

class StatCell extends StatelessWidget{
  final StatType statType;

  const StatCell(
    {
      required this.statType,
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
            child: Center(
              child: _getStatTooltip(statType),
            ),
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
            child: Center(child: _getStatSelector(statType))
          )
        ],
      ),
    );
  }
}

class RangeStatCell extends StatelessWidget{
  final RangeType rangeType;

  const RangeStatCell(
    {
      required this.rangeType,
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
              child: _getRangeTooltip(rangeType),
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
                Center(child: _getRangeSelector(rangeType)),
                Center(child: _getRangeSelector(rangeType, isLower: true))
              ]
            ),
          ),
        ],
      ),
    );
  }
}

class IGNCell extends StatelessWidget {
  
  const IGNCell(
    {
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
            child: const Center(
              child: Text(
                'IGN',
                textAlign: TextAlign.center,
              ),
            ),
          ),
          Container(
            height: 37,
            width: 320,
            clipBehavior: Clip.hardEdge,
            padding: const EdgeInsets.all(5),
            decoration: BoxDecoration(
              border: Border.all(
                color: statColor
              ),
              borderRadius: const BorderRadius.only(
                topRight: Radius.circular(10),
                bottomRight: Radius.circular(10),
              ),
            ),
            child: Expanded(
              child: TextField(
                onChanged: (value) {
                  var character = context.read<CharacterProvider>();
                  character.characterName = value;
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class LevelCell extends StatelessWidget {
  
  const LevelCell(
    {
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
            child: const Center(
              child: Text(
                'Level',
                textAlign: TextAlign.center,
              ),
            ),
          ),
          Container(
            height: 37,
            width: 320,
            clipBehavior: Clip.hardEdge,
            padding: const EdgeInsets.all(5),
            decoration: BoxDecoration(
              border: Border.all(
                color: statColor
              ),
              borderRadius: const BorderRadius.only(
                topRight: Radius.circular(10),
                bottomRight: Radius.circular(10),
              ),
            ),
            child: Expanded(
              child: Selector<CharacterProvider, int>(
                selector: (_, character) => character.characterLevel,
                builder: (context, characterLevel, child) {
                  return DropdownButtonHideUnderline(
                    child: DropdownButton(
                      value: characterLevel,
                      onChanged: (newValue) {
                        if (newValue != null) {
                          var character = context.read<CharacterProvider>();
                          character.updateCharacterLevel(newValue);
                        }
                      },
                      items: List<int>.generate(301, (i) => i).map((value) {
                        return DropdownMenuItem(
                          value: value,
                          child: Text('$value'),
                        );
                      }).toList(),
                    ),
                  );
                }
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class APCell extends StatelessWidget {

  const APCell(
    {
      super.key
    }
  );

  @override
  Widget build(BuildContext context){
    return Container(
      padding: const EdgeInsets.all(2.5),
      child: Container(
        height: 37,
        width: 440,
        clipBehavior: Clip.hardEdge,
        padding: const EdgeInsets.symmetric(horizontal: 5),
        decoration: BoxDecoration(
          border: Border.all(
            color: statColor
          ),
          borderRadius: const BorderRadius.all(
            Radius.circular(10),
          ),
        ),
        child: Selector<CharacterProvider, (int, int, int, int)>(
            selector: (_, character) => (
              character.apStatsProvider.assignedAP, 
              character.apStatsProvider.totalAvailableAP,
              character.hyperStatsModule.assignedHyperStats,
              character.hyperStatsModule.totalAvailableHyperStats
              ),
            builder: (context, data, child) {
              return Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Selector<CharacterProvider, (int, int)>(
                    selector: (_, character) => (
                      character.apStatsProvider.assignedAP, 
                      character.apStatsProvider.totalAvailableAP,
                      ),
                    builder: (context, data, child) {
                      return Text(
                        '${data.$1}/${data.$2} Ability Points Used',
                        style: TextStyle(
                          color: data.$1 > data.$2 ?Colors.red: null,
                        ),
                      );
                    }
                  ),
                  Selector<CharacterProvider, (int, int)>(
                    selector: (_, character) => (
                      character.hyperStatsModule.assignedHyperStats, 
                      character.hyperStatsModule.totalAvailableHyperStats,
                      ),
                    builder: (context, data, child) {
                      return Text(
                        '${data.$1}/${data.$2} Hyper Stats Used',
                        style: TextStyle(
                          color: data.$1 > data.$2 ?Colors.red: null,
                        ),
                      );
                    }
                  ),
                ]
              );
            }
          ),
      ),
    );
  }
}

class APStatCell extends StatelessWidget {
  final StatType statType;

  const APStatCell(
    {
      required this.statType,
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
            child: Center(
              child: _getStatTooltip(statType),
            ),
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
                  APStatButton(
                    statType: statType, 
                    isLarge: true,
                    isSubtract: true,
                  ),
                  APStatButton(
                    statType: statType, 
                    isSubtract: true,
                  ),
                  const Spacer(),
                  _getStatSelector(statType),
                  const Spacer(),
                  APStatButton(
                    statType: statType, 
                  ),
                  APStatButton(
                    statType: statType, 
                    isLarge: true,
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

class APStatButton extends StatelessWidget {
  final StatType statType;
  final bool isLarge;
  final bool isSubtract;

  void onHover(BuildContext context){
    var differenceCalculator = context.read<DifferenceCalculatorProvider>();
    var func = isSubtract ? differenceCalculator.subtractApToStat : differenceCalculator.addApToStat;
    func(isLarge ? 50 : 1, statType);
  }

  const APStatButton(
    {
      required this.statType,
      this.isLarge = false,
      this.isSubtract = false,
      super.key
    }
  );

  @override
  Widget build(BuildContext context) {
    return MapleTooltip(
      tooltipWidgets: [
        Text('${isSubtract ? "Removes": "Adds"} ${isLarge ? 50 : 1} Ability Points ${isSubtract ? "from" : "to"} ${statType.name.toUpperCase()}'),
        Consumer<DifferenceCalculatorProvider>(
          builder: (context, differenceCalculator, child) =>  differenceCalculator.differenceWidget
        ),
      ],
      onHoverFunction: onHover,
      child: IconButton(
        iconSize: 12,
        onPressed: () {
          var apStatsProvider = context.read<APStatsProvider>();
          var func = isSubtract ? apStatsProvider.subtractApToStat : apStatsProvider.addApToStat;
          func(isLarge ? 50 : 1, statType);
        },
        icon: Icon(
          isSubtract ? 
          isLarge ? Icons.keyboard_double_arrow_down : Icons.keyboard_arrow_down : 
          isLarge ? Icons.keyboard_double_arrow_up : Icons.keyboard_arrow_up
        ),
      ),
    );
  }
}

Selector _getStatSelector(StatType statType) {
  switch(statType){
    case StatType.str:
      return Selector<CharacterProvider, (double, int)>(
        selector: (_, character) => (character.totalStr, character.apStatsProvider.apStr),
        builder: (context, data, child) {
          var diff = data.$1 - data.$2;
          return Text('${doubleRoundFormater.format(data.$1)} (${data.$2} + ${doubleRoundFormater.format(diff)})');
        }
      );
    case StatType.dex:
      return Selector<CharacterProvider, (double, int)>(
        selector: (_, character) => (character.totalDex, character.apStatsProvider.apDex),
        builder: (context, data, child) {
          var diff = data.$1 - data.$2;
          return Text('${doubleRoundFormater.format(data.$1)} (${data.$2} + ${doubleRoundFormater.format(diff)})');
        }
      );
    case StatType.int:
      return Selector<CharacterProvider, (double, int)>(
        selector: (_, character) => (character.totalInt, character.apStatsProvider.apInt),
        builder: (context, data, child) {
          var diff = data.$1 - data.$2;
          return Text('${doubleRoundFormater.format(data.$1)} (${data.$2} + ${doubleRoundFormater.format(diff)})');
        }
      );
    case StatType.luk:
      return Selector<CharacterProvider, (double, int)>(
        selector: (_, character) => (character.totalLuk, character.apStatsProvider.apLuk),
        builder: (context, data, child) {
          var diff = data.$1 - data.$2;
          return Text('${doubleRoundFormater.format(data.$1)} (${data.$2} + ${doubleRoundFormater.format(diff)})');
        }
      );
    case StatType.hp:
      return Selector<CharacterProvider, double>(
        selector: (_, character) => character.totalHp,
        builder: (context, totalHp, child) {
          return MapleTooltip(
            label: doubleRoundFormater.format(min(500000, totalHp)),
            tooltipWidgets: [Text(doubleRoundFormater.format(totalHp))],
          );
        }
      );
    case StatType.mp:
      return Selector<CharacterProvider, double>(
        selector: (_, character) => character.totalMp,
        builder: (context, totalMp, child) {
          return MapleTooltip(
            label: doubleRoundFormater.format(min(500000, totalMp)),
            tooltipWidgets: [Text(doubleRoundFormater.format(totalMp))],
          );
        }
      );
    case StatType.damage:
      return Selector<CharacterProvider, double>(
        selector: (_, character) => character.totalDamage,
        builder: (context, totalDamage, child) {
          return Text(doubleRoundPercentFormater.format(totalDamage));
        }
      );
    case StatType.bossDamage:
      return Selector<CharacterProvider, double>(
        selector: (_, character) => character.totalBossDamage,
        builder: (context, totalBossDmanage, child) {
          return Text(doubleRoundPercentFormater.format(totalBossDmanage));
        }
      );
    case StatType.finalDamage:
      return Selector<CharacterProvider, double>(
        selector: (_, character) => character.totalFinalDamage,
        builder: (context, totalFinalDamage, child) {
          return Text(doublePercentFormater.format(totalFinalDamage));
        }
      );
    case StatType.buffDuration:
      return Selector<CharacterProvider, double>(
        selector: (_, character) => character.totalBuffDuration,
        builder: (context, totalBuffDuration, child) {
          return Text(doubleRoundPercentFormater.format(totalBuffDuration));
        }
      );
    case StatType.ignoreDefense:
      return Selector<CharacterProvider, double>(
        selector: (_, character) => character.totalIgnoreDefense,
        builder: (context, totalIgnoreDefense, child) {
          return Text(doublePercentFormater.format(totalIgnoreDefense));
        }
      );
    case StatType.itemDropRate:
      return Selector<CharacterProvider, double>(
        selector: (_, character) => character.totalItemDropRate,
        builder: (context, totalItemDropRate, child) {
          return Text(doubleRoundPercentFormater.format(totalItemDropRate));
        }
      );
    case StatType.critRate:
      return Selector<CharacterProvider, double>(
        selector: (_, character) => character.totalCritRate,
        builder: (context, totalCritRate, child) {
          return MapleTooltip(
            label: doubleRoundPercentFormater.format(min(totalCritRate, 1)),
            tooltipWidgets: [Text(doubleRoundPercentFormater.format(totalCritRate))],
          );
        }
      );
    case StatType.mesosObtained:
      return Selector<CharacterProvider, double>(
        selector: (_, character) => character.totalMesosObtained,
        builder: (context, totalMesosObtained, child) {
          return Text(doubleRoundPercentFormater.format(totalMesosObtained));
        }
      );
    case StatType.critDamage:
      return Selector<CharacterProvider, double>(
        selector: (_, character) => character.totalCritDamage,
        builder: (context, totalCritDamage, child) {
          return Text(doublePercentFormater.format(totalCritDamage));
        }
      );
    case StatType.attackSpeed:
      return Selector<CharacterProvider, int>(
        selector: (_, character) => character.totalAttackSpeed,
        builder: (context, totalAttackSpeed, child) {
          return Text('$totalAttackSpeed Level');
        }
      );
    case StatType.attack:
      return Selector<CharacterProvider, double>(
        selector: (_, character) => character.totalAttack,
        builder: (context, totalAttack, child) {
          return Text(doubleRoundFormater.format(totalAttack));
        }
      );
    case StatType.mattack:
      return Selector<CharacterProvider, double>(
        selector: (_, character) => character.totalMAttack,
        builder: (context, totalMAttack, child) {
          return Text(doubleRoundFormater.format(totalMAttack));
        }
      );
    case StatType.statusResistance:
      return Selector<CharacterProvider, int>(
        selector: (_, character) => character.totalStatusResistance,
        builder: (context, totalStatusResistance, child) {
          return Text('$totalStatusResistance');
        }
      );
    case StatType.knockbackResistance:
      return Selector<CharacterProvider, double>(
        selector: (_, character) => character.totalKnockbackResistance,
        builder: (context, totalKnockbackResistance, child) {
          return Text(doubleRoundPercentFormater.format(totalKnockbackResistance));
        }
      );
    case StatType.defense:
      return Selector<CharacterProvider, double>(
        selector: (_, character) => character.totalDefense,
        builder: (context, totalDefense, child) {
          return Text(doubleRoundFormater.format(totalDefense));
        }
      );
    case StatType.starForce:
      return Selector<CharacterProvider, int>(
        selector: (_, character) => character.totalStarForce,
        builder: (context, totalStarForce, child) {
          return Text('$totalStarForce');
        }
      );
    case StatType.speed:
      return Selector<CharacterProvider, int>(
        selector: (_, character) => character.totalSpeed,
        builder: (context, totalSpeed, child) {
          return Text("$totalSpeed%");
        }
      );
    case StatType.arcaneForce:
      return Selector<CharacterProvider, int>(
        selector: (_, character) => character.totalArcaneForce,
        builder: (context, totalArcaneForce, child) {
          return Text('$totalArcaneForce');
        }
      );
    case StatType.jump:
      return Selector<CharacterProvider, int>(
        selector: (_, character) => character.totalJump,
        builder: (context, totalJump, child) {
          return Text("$totalJump%");
        }
      );
    case StatType.sacredPower:
      return Selector<CharacterProvider, int>(
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
        return Selector<CharacterProvider, double>(
          selector: (_, character) => character.upperDamageRange,
          builder: (context, upperDamageRange, child) {
            return Text(rangeFormatter.format(upperDamageRange));
          }
        );
      }
      else {
        return Selector<CharacterProvider, (double, double)>(
          selector: (_, character) => (character.upperDamageRange, character.totalMastery),
          builder: (context, data, child) {
            return Text(rangeFormatter.format(data.$1 * data.$2));
          }
        );
      }
    case RangeType.bossDamageRange:
      if (!isLower){
        return Selector<CharacterProvider, double>(
          selector: (_, character) => character.upperBossDamangeRange,
          builder: (context, upperDamageRange, child) {
            return Text(rangeFormatter.format(upperDamageRange));
          }
        );
      }
      else {
        return Selector<CharacterProvider, (double, double)>(
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

MapleTooltip _getStatTooltip(StatType statType) {
  return MapleTooltip(
    tooltipTitle: statType.formattedName,
    tooltipWidgets: [Text(statType.description)],
    label: statType.formattedName,
  );
}

MapleTooltip _getRangeTooltip(RangeType rangeType) {
  return MapleTooltip(
    tooltipTitle: rangeType.formattedName,
    tooltipWidgets: [Text(rangeType.description)],
    child: Text(
      rangeType.formattedName,
      textAlign: TextAlign.center,
    ), 
  );
}