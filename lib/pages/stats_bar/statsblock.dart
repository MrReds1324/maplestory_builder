import 'package:flutter/material.dart';
import 'package:maplestory_builder/constants/character/classes.dart';
import 'package:maplestory_builder/modules/utilities/widgets.dart';
import 'package:maplestory_builder/providers/character/ap_stats_provider.dart';
import 'package:maplestory_builder/providers/calculator_provider.dart';
import 'package:maplestory_builder/providers/character/character_provider.dart';
import 'package:maplestory_builder/providers/difference_provider.dart';
import 'package:maplestory_builder/providers/character/hyper_stats_provider.dart';
import 'package:provider/provider.dart';
import 'package:maplestory_builder/modules/utilities/utilities.dart';
import 'package:maplestory_builder/constants/constants.dart';
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
          _APCell(),
          _IGNCell(),
          _ClassCell(),
          _LevelCell(),
          _APStatCell(statType: StatType.hp),
          _APStatCell(statType: StatType.mp),
          _APStatCell(statType: StatType.str),
          _APStatCell(statType: StatType.dex),
          _APStatCell(statType: StatType.int),
          _APStatCell(statType: StatType.luk),
          _RangeStatCell(
            rangeType: RangeType.damageRange,
          ),
          _RangeStatCell(
            rangeType: RangeType.bossDamageRange,
          ),
          Row(
            children: [
              _StatCell(
                statType: StatType.damage,
              ),
              _StatCell(
                statType: StatType.bossDamage,
              ),
            ]
          ),
          Row(
            children: [
              _StatCell(
                statType: StatType.finalDamage,
              ),
              _StatCell(
                statType: StatType.buffDuration,
              ),
            ]
          ),
          Row(
            children: [
              _StatCell(
                statType: StatType.ignoreDefense,
              ),
              _StatCell(
                statType: StatType.itemDropRate,
              ),
            ]
          ),
          Row(
            children: [
              _StatCell(
                statType: StatType.critRate,
              ),
              _StatCell(
                statType: StatType.mesosObtained,
              ),
            ]
          ),
          Row(
            children: [
              _StatCell(
                statType: StatType.critDamage,
              ),
              _StatCell(
                statType: StatType.attackSpeed,
              ),
            ]
          ),
          Row(
            children: [
              _StatCell(
                statType: StatType.attack,
              ),
              _StatCell(
                statType: StatType.mattack,
              ),
            ]
          ),
          Row(
            children: [
              _StatCell(
                statType: StatType.statusResistance,
              ),
              _StatCell(
                statType: StatType.knockbackResistance,
              ),
            ]
          ),
          Row(
            children: [
              _StatCell(
                statType: StatType.defense,
              ),
              _StatCell(
                statType: StatType.starForce,
              ),
            ]
          ),
          Row(
            children: [
              _StatCell(
                statType: StatType.speed,
              ),
              _StatCell(
                statType: StatType.arcaneForce,
              ),
            ]
          ),
          Row(
            children: [
              _StatCell(
                statType: StatType.jump,
              ),
              _StatCell(
                statType: StatType.sacredPower,
              ),
            ]
          ),
        ],
      ),
    );
  }
}

class _StatCell extends StatelessWidget{
  final StatType statType;

  const _StatCell({
    required this.statType,
  });

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
            child: Center(
              child: _getStatSelector(statType)
            )
          )
        ],
      ),
    );
  }
}

class _RangeStatCell extends StatelessWidget{
  final RangeType rangeType;

  const _RangeStatCell({
    required this.rangeType,
  });

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

class _IGNCell extends StatelessWidget {
  
  const _IGNCell();

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
            child: TextField(
              style: Theme.of(context).textTheme.bodyMedium,
              controller: context.read<CharacterProvider>().textController,
              onChanged: (value) => context.read<CharacterProvider>().characterName = value,
              decoration: const InputDecoration(
                isDense: true
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _LevelCell extends StatelessWidget {
  
  const _LevelCell();

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
            child: Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  const _LevelButton(
                    isLarge: true,
                    isSubtract: true,
                  ),
                  const _LevelButton(
                    isSubtract: true,
                  ),
                  const Spacer(),
                  Selector<CharacterProvider, int>(
                    selector: (_, calculatorProvider) => calculatorProvider.characterLevel,
                    builder: (context, characterLevel, child) {
                      return Text('$characterLevel');
                    }
                  ),
                  const Spacer(),
                  const _LevelButton(
                  ),
                  const _LevelButton(
                    isLarge: true,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _ClassCell extends StatelessWidget {
  
  const _ClassCell();

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
                'Class',
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
            child: Selector<CharacterProvider, CharacterClass>(
              selector: (_, characterProvider) => characterProvider.characterClass,
              builder: (context, characterClass, child) {
                return DropdownButtonHideUnderline(
                  child: DropdownButton(
                    value: characterClass,
                    onChanged: (CharacterClass? newValue) {
                      if (newValue != null) {
                        context.read<CharacterProvider>().updateCharacterClass(newValue);
                      }
                    },
                    items: CharacterClass.values.map((CharacterClass value) {
                      return DropdownMenuItem(
                        value: value,
                        child: Text(value.formattedName),
                      );
                    }).toList(),
                  ),
                );
              }
            ),
          ),
        ],
      ),
    );
  }
}

class _APCell extends StatelessWidget {

  const _APCell();

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
        child: Selector<CalculatorProvider, (int, int, int, int)>(
            selector: (_, calculatorProvider) => (
              calculatorProvider.apStatsProvider.assignedAP, 
              calculatorProvider.apStatsProvider.totalAvailableAP,
              calculatorProvider.hyperStatsProvider.activeHyperStat.totalAssignedHyperStats,
              calculatorProvider.hyperStatsProvider.totalAvailableHyperStats
              ),
            builder: (context, data, child) {
              return Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Selector<CalculatorProvider, (int, int)>(
                    selector: (_, calculatorProvider) => (
                      calculatorProvider.apStatsProvider.assignedAP, 
                      calculatorProvider.apStatsProvider.totalAvailableAP,
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
                  Selector<HyperStatsProvider, (int, int)>(
                    selector: (_, hyperStatsProvider) => (
                      hyperStatsProvider.activeHyperStat.totalAssignedHyperStats, 
                      hyperStatsProvider.totalAvailableHyperStats,
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

class _APStatCell extends StatelessWidget {
  final StatType statType;

const _APStatCell({
    required this.statType,
  });

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
                  _APStatButton(
                    statType: statType, 
                    isLarge: true,
                    isSubtract: true,
                  ),
                  _APStatButton(
                    statType: statType, 
                    isSubtract: true,
                  ),
                  const Spacer(),
                  _getStatSelector(statType),
                  const Spacer(),
                  _APStatButton(
                    statType: statType, 
                  ),
                  _APStatButton(
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

class _APStatButton extends StatelessWidget {
  final StatType statType;
  final bool isLarge;
  final bool isSubtract;

  const _APStatButton({
    required this.statType,
    this.isLarge = false,
    this.isSubtract = false,
  });

  void _onHover(BuildContext context){
    context.read<DifferenceCalculatorProvider>().modifyApToStat(isLarge ? 50 : 1, statType, isSubtract);
  }

  @override
  Widget build(BuildContext context) {
    return MapleTooltip(
      tooltipWidgets: [
        Text('${isSubtract ? "Removes": "Adds"} ${isLarge ? 50 : 1} Ability Points ${isSubtract ? "from" : "to"} ${statType.formattedName}'),
        Selector<DifferenceCalculatorProvider, Widget>(
          selector: (_, differenceCalculatorProvider) => differenceCalculatorProvider.differenceWidget,
          builder: (context, widget, child) {
            return widget;
          }
        ),
      ],
      onHoverFunction: _onHover,
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

class _LevelButton extends StatelessWidget {
  final bool isLarge;
  final bool isSubtract;

  const _LevelButton({
    this.isLarge = false,
    this.isSubtract = false,
  });

  void _onHover(BuildContext context){
    context.read<DifferenceCalculatorProvider>().modifyLevel(isLarge ? 10 : 1, isSubtract);
  }

  @override
  Widget build(BuildContext context) {
    return MapleTooltip(
      tooltipWidgets: [
        Text('${isSubtract ? "Removes": "Adds"} ${isLarge ? 10 : 1} ${StatType.level.formattedName}s'),
        Selector<DifferenceCalculatorProvider, Widget>(
          selector: (_, differenceCalculatorProvider) => differenceCalculatorProvider.differenceWidget,
          builder: (context, widget, child) {
            return widget;
          }
        ),
      ],
      onHoverFunction: _onHover,
      child: IconButton(
        iconSize: 12,
        onPressed: () {
          var characterProvider = context.read<CharacterProvider>();
          var func = isSubtract ? characterProvider.subtractLevels : characterProvider.addLevels;
          func(isLarge ? 10 : 1);
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
    case StatType.dex:
    case StatType.int:
    case StatType.luk:
      return Selector<CalculatorProvider, (num, num)>(
        selector: (_, calculatorProvider) => (calculatorProvider.totalStats[statType]!, calculatorProvider.apStatsProvider.apStats[statType]!),
        builder: (context, value, child) {
          var diff = value.$1 - value.$2;
          return Text('${doubleRoundFormater.format(value.$1)} (${value.$2} + ${doubleRoundFormater.format(diff)})');
        }
      );
    case StatType.hp:
    case StatType.mp:
      return Selector<CalculatorProvider, num>(
        selector: (_, calculatorProvider) => calculatorProvider.totalStats[statType]!,
        builder: (context, value, child) {
          return MapleTooltip(
            label: doubleRoundFormater.format(min(500000, value)),
            tooltipWidgets: [Text(doubleRoundFormater.format(value))],
          );
        }
      );
    case StatType.critRate:
      return Selector<CalculatorProvider, num>(
        selector: (_, calculatorProvider) => calculatorProvider.totalStats[statType]!,
        builder: (context, totalCritRate, child) {
          return MapleTooltip(
            label: doubleRoundPercentFormater.format(min(totalCritRate, 1)),
            tooltipWidgets: [Text(doubleRoundPercentFormater.format(totalCritRate))],
          );
        }
      );
    case StatType.attackSpeed:
      return Selector<CalculatorProvider, num>(
        selector: (_, calculatorProvider) => calculatorProvider.totalStats[statType]!,
        builder: (context, totalAttackSpeed, child) {
          return Text('$totalAttackSpeed Level');
        }
      );
    case StatType.speed:
    case StatType.jump:
      return Selector<CalculatorProvider, num>(
        selector: (_, calculatorProvider) => calculatorProvider.totalStats[statType]!,
        builder: (context, value, child) {
          return Text("$value%");
        }
      );
    case StatType.statusResistance:
      return Selector<CalculatorProvider, num>(
        selector: (_, calculatorProvider) => calculatorProvider.totalStats[statType]!,
        builder: (context, statusResistance, child) {
          return MapleTooltip(
            label: "$statusResistance",
            tooltipWidgets: [Text("${doubleRoundPercentFormater.format(calculateStatusResistanceReduction(statusResistance))} reduction of status effects")],
          );
        }
      );
    case StatType.critDamage:
    case StatType.finalDamage:
    case StatType.damage:
    case StatType.bossDamage:
    case StatType.ignoreDefense:
      return Selector<CalculatorProvider, num>(
        selector: (_, calculatorProvider) => calculatorProvider.totalStats[statType]!,
        builder: (context, value, child) {
          return Text('${statType.isPercentage ? doublePercentFormater.format(value) : value}');
        }
      );
    default:
      return Selector<CalculatorProvider, num>(
        selector: (_, calculatorProvider) => calculatorProvider.totalStats[statType]!,
        builder: (context, value, child) {
          return Text('${statType.isPercentage ? doubleRoundPercentFormater.format(value) : value}');
        }
      );
  }
}

Selector _getRangeSelector(RangeType rangeType, {bool isLower = false}) {
  switch(rangeType){
    case RangeType.damageRange:
      if (!isLower){
        return Selector<CalculatorProvider, double>(
          selector: (_, calculatorProvider) => calculatorProvider.upperDamageRange,
          builder: (context, upperDamageRange, child) {
            return Text(rangeFormatter.format(upperDamageRange));
          }
        );
      }
      else {
        return Selector<CalculatorProvider, (double, num)>(
          selector: (_, calculatorProvider) => (calculatorProvider.upperDamageRange, calculatorProvider.totalStats[StatType.mastery]!),
          builder: (context, data, child) {
            return Text(rangeFormatter.format(data.$1 * data.$2));
          }
        );
      }
    case RangeType.bossDamageRange:
      if (!isLower){
        return Selector<CalculatorProvider, double>(
          selector: (_, calculatorProvider) => calculatorProvider.upperBossDamangeRange,
          builder: (context, upperDamageRange, child) {
            return Text(rangeFormatter.format(upperDamageRange));
          }
        );
      }
      else {
        return Selector<CalculatorProvider, (double, num)>(
          selector: (_, calculatorProvider) => (calculatorProvider.upperBossDamangeRange, calculatorProvider.totalStats[StatType.mastery]!),
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