import 'package:flutter/material.dart';
import 'package:maplestory_builder/modules/character_provider.dart';
import 'package:maplestory_builder/modules/difference_provider.dart';
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
                  var character = context.read<CharacterModel>();
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
              child: Selector<CharacterModel, int>(
                selector: (_, character) => character.characterLevel,
                builder: (context, characterLevel, child) {
                  return DropdownButtonHideUnderline(
                    child: DropdownButton(
                      value: characterLevel,
                      onChanged: (newValue) {
                        if (newValue != null) {
                          var character = context.read<CharacterModel>();
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
        child: Selector<CharacterModel, (int, int, int, int)>(
            selector: (_, character) => (
              character.apStatsModule.assignedAP, 
              character.apStatsModule.totalAvailableAP,
              character.hyperStatsModule.assignedHyperStats,
              character.hyperStatsModule.totalAvailableHyperStats
              ),
            builder: (context, data, child) {
              return Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Selector<CharacterModel, (int, int)>(
                    selector: (_, character) => (
                      character.apStatsModule.assignedAP, 
                      character.apStatsModule.totalAvailableAP,
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
                  Selector<CharacterModel, (int, int)>(
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
    var differenceCalculator = context.read<DifferenceCalculator>();
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
        Consumer<DifferenceCalculator>(
          builder: (context, differenceCalculator, child) =>  differenceCalculator.differenceWidget
        ),
      ],
      onHoverFunction: onHover,
      child: IconButton(
        iconSize: 12,
        onPressed: () {
          var character = context.read<CharacterModel>();
          var func = isSubtract ? character.subtractApToStat : character.addApToStat;
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
      return Selector<CharacterModel, (double, int)>(
        selector: (_, character) => (character.totalStr, character.apStatsModule.apStr),
        builder: (context, data, child) {
          var diff = data.$1 - data.$2;
          return Text('${doubleRoundFormater.format(data.$1)} (${doubleRoundFormater.format(diff)} + ${data.$2})');
        }
      );
    case StatType.dex:
      return Selector<CharacterModel, (double, int)>(
        selector: (_, character) => (character.totalDex, character.apStatsModule.apDex),
        builder: (context, data, child) {
          var diff = data.$1 - data.$2;
          return Text('${doubleRoundFormater.format(data.$1)} (${doubleRoundFormater.format(diff)} + ${data.$2})');
        }
      );
    case StatType.int:
      return Selector<CharacterModel, (double, int)>(
        selector: (_, character) => (character.totalInt, character.apStatsModule.apInt),
        builder: (context, data, child) {
          var diff = data.$1 - data.$2;
          return Text('${doubleRoundFormater.format(data.$1)} (${doubleRoundFormater.format(diff)} + ${data.$2})');
        }
      );
    case StatType.luk:
      return Selector<CharacterModel, (double, int)>(
        selector: (_, character) => (character.totalLuk, character.apStatsModule.apLuk),
        builder: (context, data, child) {
          var diff = data.$1 - data.$2;
          return Text('${doubleRoundFormater.format(data.$1)} (${doubleRoundFormater.format(diff)} + ${data.$2})');
        }
      );
    case StatType.hp:
      return Selector<CharacterModel, double>(
        selector: (_, character) => character.totalHp,
        builder: (context, totalHp, child) {
          return MapleTooltip(
            label: doubleRoundFormater.format(min(500000, totalHp)),
            tooltipWidgets: [Text(doubleRoundFormater.format(totalHp))],
          );
        }
      );
    case StatType.mp:
      return Selector<CharacterModel, double>(
        selector: (_, character) => character.totalMp,
        builder: (context, totalMp, child) {
          return MapleTooltip(
            label: doubleRoundFormater.format(min(500000, totalMp)),
            tooltipWidgets: [Text(doubleRoundFormater.format(totalMp))],
          );
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
          return MapleTooltip(
            label: doubleRoundPercentFormater.format(min(totalCritRate, 1)),
            tooltipWidgets: [Text(doubleRoundPercentFormater.format(totalCritRate))],
          );
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

MapleTooltip _getStatTooltip(StatType statType) {
  var childAndTitle = formatStatTypeEnumName(statType);
  var tooltipMessage = '';
  
  switch(statType) {
    case StatType.str:
      tooltipMessage = 'STR increases the attack strength of Warriors and some Pirates';
    case StatType.dex:
      tooltipMessage = 'DEX increases the attack strength of Bowmen and some Pirates';
    case StatType.int:
      tooltipMessage = 'INT increases the attack strength of Magicians';
    case StatType.luk:
      tooltipMessage = 'LUK increases the attack strength of Thieves';
    case StatType.hp:
      tooltipMessage = 'HP increases the attack strength of Demon Avenger. Max HP cap is 500,000.';
    case StatType.mp:
      tooltipMessage = 'Required for many skills. Max MP cap is 500,000.';
    case StatType.damage:
      tooltipMessage = 'The Damage multiplier used to calculate your Damage Range. Determined by the total combined Damage of your skills and equipment. Values that only apply to specific skills are not included in this calculation.';
    case StatType.bossDamage:
      tooltipMessage = 'The higher your Boss Damage, the greater your damage against Boss monsters. This value does not affect normal Damage. Determined by the total combined Damage of your skills and equipment. Values that only apply to specific skills are not included in this calculation.';
    case StatType.finalDamage:
      tooltipMessage = 'The damage multiplier that increases your total Damage Range. Determined by multiplying the Final Damage of all your skills.';
    case StatType.buffDuration:
      tooltipMessage = 'The higher the Buff Duration, the longer buffs will last. Does not apply to certain skills. Determined bt the total combined Buff Duration value of all your skills and equipment. Values that only apply to the duration of specific skills are not included in this calculation.';
    case StatType.ignoreDefense:
      tooltipMessage = 'The higher your Ignore Enemy Defense value the better your attacks penetrate enemy defenses. Determined by multiplying the Ignore Defense values of all your skills and equipment. Values that only apply to specific skills are not included in this calculation. Applies up to 100%.';
    case StatType.itemDropRate:
      tooltipMessage = 'The higher the Item Drop Rate, the more likely that items will drop from defeated monsters. All values are summed to determin the final value. Item Drop Rates can increase, in total, up to 400%. Consumable Items, with the exception of the Wealth Acquisition Potion, can only increase the value by up to 100%. Item potential can increase the value by up to 200%. Does not apply to certain items. Effects that only apply to specific items is not included in the calculation.';
    case StatType.critRate:
      tooltipMessage = 'Your chance of performing a Critical Attack. You can enhance this value with skills or items.';
    case StatType.mesosObtained:
      tooltipMessage = 'The higher the Mesos Obtained, the more Mesos monsters drop when defeated. The final value is determined by multiplying the basic obtainable Mesos by any Wealth Acquisition Potion value and Reboot passive value, then by additionally multiplying the sum of the remaining values. Additive values can combine to increase the value by up to 300%. Consumable items, with the exception of the Wealth Acquisition Potion, can only increase the value by up to 100%. Item potential can increase the value by up to 100%.';
    case StatType.critDamage:
      tooltipMessage = 'The higher your Critical Damage, the more damage your Critical attacks inflict. This value is added to your base Critical Damage multiplier of 20-50%. This value does not affect normal Damage. You can increase this value with skills or items.';
    case StatType.attackSpeed:
      tooltipMessage = 'Displays the current character\'s Attack Speed. Attack Speed +1 is the slowest while +8 is the soft limit and +10 is the hard limit. It increases with the equipped weapon\'s Attack Speed, skills, consumables, and Inner Ability. However Magician jobs are not affected by the weapon\'s Attack Speed, innately starting with +4.';
    case StatType.attack:
      tooltipMessage = 'Displays the current character\'s Attack Power. The final value is determined by the Attack Power sum and Attack Power % increase multiplication. However Pipsqueak Luminous (Equilibrium) from Monster Life and the Attack Power increase per level stat from Inner Ability are excluded from the multiplication.';
    case StatType.mattack:
      tooltipMessage = 'Displays the current character\'s Magic Attack. The final value is determined by the Magic Attack sum and the Magic Attack % increase multiplication. However Pipsqueak Luminous (Equilibrium) from Monster Life and the Magic Attack increase per level stat from Inner Ability are excluded from the multiplication.';
    case StatType.statusResistance:
      tooltipMessage = 'Your Abnormal Status Resistance determines the amout of Abnormal Statuses affect you. Higher values result in shorter durations. You can increase this value with skills or items.';
    case StatType.knockbackResistance:
      tooltipMessage = 'Your chance to resist being pushed back by monster attacks. You can increase this value with skills.';
    case StatType.defense:
      tooltipMessage = 'The higher your Defense, the less damage you take from enemies. Some enemy attacks can pierce through Defense. Determined by adding the total combined defense of your equipment to your base Defense.';
    case StatType.starForce:
      tooltipMessage = 'In Star Force areas, if you have less Star Force than the monsters do, you\'ll deal less damage to them. When you have more Star Force than a monster, you can attack through that monster\'s shield. Can be increased by equipping items with Star Force enhancement. Doubled for Overall equipment.';
    case StatType.speed:
      tooltipMessage = 'Your movement speed. Can be increased to a max of 140% normally. Skills and equipment can boost this even further. Can be increased to 190% while riding a mount.';
    case StatType.arcaneForce:
      tooltipMessage = 'In Arcane River areas, if you have less Arcane Force than the monsters do, you\'ll deal less damage to them. When you have more Arcane Force than a monster, you can attack through that monster\'s shield. Can be increased by obtaining and enhancing Arcane Symbols, and Hyper Stats.';
    case StatType.jump:
      tooltipMessage = 'How you can jump. Can be increased to a max of 123%. Skills and equipment can be used to increase or decrease your Jump.';
    case StatType.sacredPower:
      tooltipMessage = 'In Grandis areas, if you have less Sacred Power than the monsters do, you\'ll deal less damage to them. When you have more Sacred Power than a monster, you can attack through that monster\'s shield. Can be increased by obtaining and enhancing Sacred Symbols.';
    default:
      throw Exception("MapleTooltip not Implemented for statType $statType");
  }

  return MapleTooltip(
    tooltipTitle: childAndTitle,
    tooltipWidgets: [Text(tooltipMessage)],
    label: childAndTitle,
  );
}

MapleTooltip _getRangeTooltip(RangeType rangeType) {
  var childAndTitle = formatRangeTypeEnumName(rangeType);
  var tooltipMessage = '';

  switch(rangeType) {
    case RangeType.damageRange:
      tooltipMessage = 'Your actual damage range, accountig for both Damage and Final Damage. For Wand, Staff, Shining Rod, Fan, Psy-Limiter, or Lucent Guantlet weapons, this is calculated using Magic Attack. For all other weapons, your damage is calculated using Attack Power.';
    case RangeType.bossDamageRange:
      tooltipMessage = 'Your actual damage range against bosses, accountig for Damage, Boss Damage, and Final Damage. For Wand, Staff, Shining Rod, Fan, Psy-Limiter, or Lucent Guantlet weapons, this is calculated using Magic Attack. For all other weapons, your damage is calculated using Attack Power.';
    case RangeType.effectiveDamageRange:
      tooltipMessage = 'Your actual damage range, accountig for Damage, Final Damage, Critical Damage, and Critcal Rate. For Wand, Staff, Shining Rod, Fan, Psy-Limiter, or Lucent Guantlet weapons, this is calculated using Magic Attack. For all other weapons, your damage is calculated using Attack Power.';
    case RangeType.effectiveBossDamageRange:
      tooltipMessage = 'Your actual damage range against bosses, accountig for Damage, Boss Damage, Final Damage, Critical Damage, Critical Rate, Ignore Defense, and Ignore Elemental Resistance. For Wand, Staff, Shining Rod, Fan, Psy-Limiter, or Lucent Guantlet weapons, this is calculated using Magic Attack. For all other weapons, your damage is calculated using Attack Power.';
    default:
      throw Exception("Tooltip not Implemented for rangeType $rangeType");
  }

  return MapleTooltip(
    tooltipTitle: childAndTitle,
    tooltipWidgets: [Text(tooltipMessage)],
    child: Text(
      childAndTitle,
      textAlign: TextAlign.center,
    ), 
  );
}