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
    return const Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
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

class APStatCell extends StatelessWidget{
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
                  const Spacer(),
                  _getStatSelector(statType),
                  const Spacer(),
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

class StatTooltip extends StatelessWidget{
  final String label;
  final String tooltipMessage;

  const StatTooltip(
    {
      required this.label,
      required this.tooltipMessage,
      super.key
    }
  );

  @override
  Widget build(BuildContext context){
    return Tooltip(
      richMessage: WidgetSpan(
        alignment: PlaceholderAlignment.baseline,
        baseline: TextBaseline.alphabetic,
        child: Container(
          padding: const EdgeInsets.all(5),
          constraints: const BoxConstraints(maxWidth: 400),
          child: Column(
            children: [
              Text(label, style: Theme.of(context).textTheme.headlineSmall),
              Text(tooltipMessage),
            ],
          ),
        ),
      ),
      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.white70,
        ),
        color: Colors.black87,
        borderRadius: const BorderRadius.all(
          Radius.circular(4)),
      ),
      waitDuration: const Duration(milliseconds: 350),
      child: Text(
        label,
        textAlign: TextAlign.center,
      ),
    );
  }
}

class StatValueTooltip extends StatelessWidget{
  final String label;
  final String tooltipMessage;

  const StatValueTooltip(
    {
      required this.label,
      required this.tooltipMessage,
      super.key
    }
  );

  @override
  Widget build(BuildContext context){
    return Tooltip(
      richMessage: WidgetSpan(
        alignment: PlaceholderAlignment.baseline,
        baseline: TextBaseline.alphabetic,
        child: Container(
          padding: const EdgeInsets.all(5),
          constraints: const BoxConstraints(maxWidth: 400),
          child: Column(
            children: [
              Text(tooltipMessage),
            ],
          ),
        ),
      ),
      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.white70,
        ),
        color: Colors.black87,
        borderRadius: const BorderRadius.all(
          Radius.circular(4)),
      ),
      waitDuration: const Duration(milliseconds: 350),
      child: Text(
        label,
        textAlign: TextAlign.center,
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
          return StatValueTooltip(
            label: doubleRoundFormater.format(min(500000, totalHp)),
            tooltipMessage: doubleRoundFormater.format(totalHp),
          );
        }
      );
    case StatType.mp:
      return Selector<CharacterModel, double>(
        selector: (_, character) => character.totalMp,
        builder: (context, totalMp, child) {
          return StatValueTooltip(
            label: doubleRoundFormater.format(min(500000, totalMp)),
            tooltipMessage: doubleRoundFormater.format(totalMp),
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
          return StatValueTooltip(
            label: doubleRoundPercentFormater.format(min(totalCritRate, 1)),
            tooltipMessage: doubleRoundPercentFormater.format(totalCritRate),
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

StatTooltip _getStatTooltip(StatType statType) {
  switch(statType) {
    case StatType.str:
      return const StatTooltip(
        label: 'STR',
        tooltipMessage: 'STR increases the attack strength of Warriors and some Pirates',
      );
    case StatType.dex:
      return const StatTooltip(
        label: 'DEX',
        tooltipMessage: 'DEX increases the attack strength of Bowmen and some Pirates',
      );
    case StatType.int:
      return const StatTooltip(
        label: 'INT',
        tooltipMessage: 'INT increases the attack strength of Magicians',
      );
    case StatType.luk:
      return const StatTooltip(
        label: 'LUK',
        tooltipMessage: 'LUK increases the attack strength of Thieves',
      );
    case StatType.hp:
      return const StatTooltip(
        label: 'HP',
        tooltipMessage: 'HP increases the attack strength of Demon Avenger. Max HP cap is 500,000.',
      );
    case StatType.mp:
      return const StatTooltip(
        label: 'MP',
        tooltipMessage: 'Required for many skills. Max MP cap is 500,000.',
      );
    case StatType.damage:
      return const StatTooltip(
        label: 'Damage',
        tooltipMessage: 'The Damage multiplier used to calculate your Damage Range. Determined by the total combined Damage of your skills and equipment. Values that only apply to specific skills are not included in this calculation.',
      );
    case StatType.bossDamage:
      return const StatTooltip(
        label: 'Boss Damage',
        tooltipMessage: 'The higher your Boss Damage, the greater your damage against Boss monsters. This value does not affect normal Damage. Determined by the total combined Damage of your skills and equipment. Values that only apply to specific skills are not included in this calculation.',
      );
    case StatType.finalDamage:
      return const StatTooltip(
        label: 'Final Damage',
        tooltipMessage: 'The damage multiplier that increases your total Damage Range. Determined by multiplying the Final Damage of all your skills.',
      );
    case StatType.buffDuration:
      return const StatTooltip(
        label: 'Buff Duration',
        tooltipMessage: 'The higher the Buff Duration, the longer buffs will last. Does not apply to certain skills. Determined bt the total combined Buff Duration value of all your skills and equipment. Values that only apply to the duration of specific skills are not included in this calculation.',
      );
    case StatType.ignoreDefense:
      return const StatTooltip(
        label: 'Ignore Defense',
        tooltipMessage: 'The higher your Ignore Enemy Defense value the better your attacks penetrate enemy defenses. Determined by multiplying the Ignore Defense values of all your skills and equipment. Values that only apply to specific skills are not included in this calculation. Applies up to 100%.',
      );
    case StatType.itemDropRate:
      return const StatTooltip(
        label: 'Item Drop Rate',
        tooltipMessage: 'The higher the Item Drop Rate, the more likely that items will drop from defeated monsters. All values are summed to determin the final value. Item Drop Rates can increase, in total, up to 400%. Consumable Items, with the exception of the Wealth Acquisition Potion, can only increase the value by up to 100%. Item potential can increase the value by up to 200%. Does not apply to certain items. Effects that only apply to specific items is not included in the calculation.',
      );
    case StatType.critRate:
      return const StatTooltip(
        label: 'Critical Rate',
        tooltipMessage: 'Your chance of performing a Critical Attack. You can enhance this value with skills or items.',
      );
    case StatType.mesosObtained:
      return const StatTooltip(
        label: 'Mesos Obtained',
        tooltipMessage: 'The higher the Mesos Obtained, the more Mesos monsters drop when defeated. The final value is determined by multiplying the basic obtainable Mesos by any Wealth Acquisition Potion value and Reboot passive value, then by additionally multiplying the sum of the remaining values. Additive values can combine to increase the value by up to 300%. Consumable items, with the exception of the Wealth Acquisition Potion, can only increase the value by up to 100%. Item potential can increase the value by up to 100%.',
      );
    case StatType.critDamage:
      return const StatTooltip(
        label: 'Critical Damage',
        tooltipMessage: 'The higher your Critical Damage, the more damage your Critical attacks inflict. This value is added to your base Critical Damage multiplier of 20-50%. This value does not affect normal Damage. You can increase this value with skills or items.',
      );
    case StatType.attackSpeed:
      return const StatTooltip(
        label: 'Attack Speed',
        tooltipMessage: 'Displays the current character\'s Attack Speed. Attack Speed +1 is the slowest while +8 is the soft limit and +10 is the hard limit. It increases with the equipped weapon\'s Attack Speed, skills, consumables, and Inner Ability. However Magician jobs are not affected by the weapon\'s Attack Speed, innately starting with +4.',
      );
    case StatType.attack:
      return const StatTooltip(
        label: 'Attack Power',
        tooltipMessage: 'Displays the current character\'s Attack Power. The final value is determined by the Attack Power sum and Attack Power % increase multiplication. However Pipsqueak Luminous (Equilibrium) from Monster Life and the Attack Power increase per level stat from Inner Ability are excluded from the multiplication.',
      );
    case StatType.mattack:
      return const StatTooltip(
        label: 'Magic Attack',
        tooltipMessage: 'Displays the current character\'s Magic Attack. The final value is determined by the Magic Attack sum and the Magic Attack % increase multiplication. However Pipsqueak Luminous (Equilibrium) from Monster Life and the Magic Attack increase per level stat from Inner Ability are excluded from the multiplication.',
      );
    case StatType.statusResistance:
      return const StatTooltip(
        label: 'Status Resistance',
        tooltipMessage: 'Your Abnormal Status Resistance determines the amout of Abnormal Statuses affect you. Higher values result in shorter durations. You can increase this value with skills or items.',
      );
    case StatType.knockbackResistance:
      return const StatTooltip(
        label: 'Knockback Resistance',
        tooltipMessage: 'Your chance to resist being pushed back by monster attacks. You can increase this value with skills.',
      );
    case StatType.defense:
      return const StatTooltip(
        label: 'Defense',
        tooltipMessage: 'The higher your Defense, the less damage you take from enemies. Some enemy attacks can pierce through Defense. Determined by adding the total combined defense of your equipment to your base Defense.',
      );
    case StatType.starForce:
      return const StatTooltip(
        label: 'Star Force',
        tooltipMessage: 'In Star Force areas, if you have less Star Force than the monsters do, you\'ll deal less damage to them. When you have more Star Force than a monster, you can attack through that monster\'s shield. Can be increased by equipping items with Star Force enhancement. Doubled for Overall equipment.',
      );
    case StatType.speed:
      return const StatTooltip(
        label: 'Speed',
        tooltipMessage: 'Your movement speed. Can be increased to a max of 140% normally. Skills and equipment can boost this even further. Can be increased to 190% while riding a mount.',
      );
    case StatType.arcaneForce:
      return const StatTooltip(
        label: 'Arcane Force',
        tooltipMessage: 'In Arcane River areas, if you have less Arcane Force than the monsters do, you\'ll deal less damage to them. When you have more Arcane Force than a monster, you can attack through that monster\'s shield. Can be increased by obtaining and enhancing Arcane Symbols, and Hyper Stats.',
      );
    case StatType.jump:
      return const StatTooltip(
        label: 'Jump',
        tooltipMessage: 'How you can jump. Can be increased to a max of 123%. Skills and equipment can be used to increase or decrease your Jump.',
      );
    case StatType.sacredPower:
      return const StatTooltip(
        label: 'Sacred Power',
        tooltipMessage: 'In Grandis areas, if you have less Sacred Power than the monsters do, you\'ll deal less damage to them. When you have more Sacred Power than a monster, you can attack through that monster\'s shield. Can be increased by obtaining and enhancing Sacred Symbols.',
      );
    default:
      throw Exception("StatTooltip not Implemented for statType $statType");
  }
}

StatTooltip _getRangeTooltip(RangeType rangeType) {
  switch(rangeType) {
    case RangeType.damageRange:
      return const StatTooltip(
        label: 'Damage Range',
        tooltipMessage: 'Your actual damage range, accountig for both Damage and Final Damage. For Wand, Staff, Shining Rod, Fan, Psy-Limiter, or Lucent Guantlet weapons, this is calculated using Magic Attack. For all other weapons, your damage is calculated using Attack Power.',
      );
    case RangeType.bossDamageRange:
      return const StatTooltip(
        label: 'Boss Damage Range',
        tooltipMessage: 'Your actual damage range against bosses, accountig for Damage, Boss Damage, and Final Damage. For Wand, Staff, Shining Rod, Fan, Psy-Limiter, or Lucent Guantlet weapons, this is calculated using Magic Attack. For all other weapons, your damage is calculated using Attack Power.',
      );
    case RangeType.effectiveDamageRange:
      return const StatTooltip(
        label: 'Damage Range',
        tooltipMessage: 'Your actual damage range, accountig for Damage, Final Damage, Critical Damage, and Critcal Rate. For Wand, Staff, Shining Rod, Fan, Psy-Limiter, or Lucent Guantlet weapons, this is calculated using Magic Attack. For all other weapons, your damage is calculated using Attack Power.',
      );
    case RangeType.effectiveBossDamageRange:
      return const StatTooltip(
        label: 'Boss Damage Range',
        tooltipMessage: 'Your actual damage range against bosses, accountig for Damage, Boss Damage, Final Damage, Critical Damage, Critical Rate, Ignore Defense, and Ignore Elemental Resistance. For Wand, Staff, Shining Rod, Fan, Psy-Limiter, or Lucent Guantlet weapons, this is calculated using Magic Attack. For all other weapons, your damage is calculated using Attack Power.',
      );
    default:
      throw Exception("Tooltip not Implemented for rangeType $rangeType");
  }
}