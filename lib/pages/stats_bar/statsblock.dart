import 'package:flutter/material.dart';
import 'package:maplestory_builder/modules/character_provider.dart';
import 'package:provider/provider.dart';
import 'package:intl/intl.dart';

const defaultColor = Color.fromARGB(255, 105, 105, 105);
final doubleRoundPercentFormater = NumberFormat('#####%');
final doublePercentFormater = NumberFormat('####.00%');
final rangeFormatter = NumberFormat('###,###,###,###,###');

class StatTable extends StatelessWidget {
  const StatTable({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        RangeStatCell(
          label: "Damage Range",
          upperValue: Consumer<CharacterModel>(
            builder: (context, character, child) {
              return Text(rangeFormatter.format(character.upperDamageRange));
            }
          ),
          lowerValue: Consumer<CharacterModel>(
            builder: (context, character, child) {
              return Text(rangeFormatter.format(character.upperDamageRange * character.totalMastery));
            }
          ),
        ),
        RangeStatCell(
          label: "Boss Damage Range",
          upperValue: Consumer<CharacterModel>(
            builder: (context, character, child) {
              return Text(rangeFormatter.format(character.upperBossDamangeRange));
            }
          ),
          lowerValue: Consumer<CharacterModel>(
            builder: (context, character, child) {
              return Text(rangeFormatter.format(character.upperBossDamangeRange * character.totalMastery));
            }
          ),
        ),
        Row(
          children: [
            StatCell(
              label: 'Damage',
              value: Consumer<CharacterModel>(
                builder: (context, character, child) {
                  return Text(doubleRoundPercentFormater.format(character.totalDamage));
                }
              ),
            ),
            StatCell(
              label: 'Boss Damage',
              value: Consumer<CharacterModel>(
                builder: (context, character, child) {
                  return Text(doubleRoundPercentFormater.format(character.totalBossDmanage));
                }
              ),
            ),
          ]
        ),
        Row(
          children: [
            StatCell(
              label: 'Final Damage',
              value: Consumer<CharacterModel>(
                builder: (context, character, child) {
                  return Text(doublePercentFormater.format(character.totalFinalDamage));
                }
              ),
            ),
            StatCell(
              label: 'Buff Duration',
              value: Consumer<CharacterModel>(
                builder: (context, character, child) {
                  return Text(doubleRoundPercentFormater.format(character.totalBuffDuration));
                }
              ),
            ),
          ]
        ),
        Row(
          children: [
            StatCell(
              label: 'Ignore Defense',
              value: Consumer<CharacterModel>(
                builder: (context, character, child) {
                  return Text(doublePercentFormater.format(character.totalIgnoreDefense));
                }
              ),
            ),
            StatCell(
              label: 'Item Drop Rate',
              value: Consumer<CharacterModel>(
                builder: (context, character, child) {
                  return Text(doubleRoundPercentFormater.format(character.totalItemDropRate));
                }
              ),
            ),
          ]
        ),
        Row(
          children: [
            StatCell(
              label: 'Critical Rate',
              value: Consumer<CharacterModel>(
                builder: (context, character, child) {
                  return Text(doubleRoundPercentFormater.format(character.totalCritRate));
                }
              ),
            ),
            StatCell(
              label: 'Mesos Obtained',
              value: Consumer<CharacterModel>(
                builder: (context, character, child) {
                  return Text(doubleRoundPercentFormater.format(character.totalMesosObtained));
                }
              ),
            ),
          ]
        ),
        Row(
          children: [
            StatCell(
              label: 'Critical Damage',
              value: Consumer<CharacterModel>(
                builder: (context, character, child) {
                  return Text(doublePercentFormater.format(character.totalCritDamage));
                }
              ),
            ),
            StatCell(
              label: 'Attack Speed',
              value: Consumer<CharacterModel>(
                builder: (context, character, child) {
                  return Text('${character.totalAttackSpeed} Level');
                }
              ),
            ),
          ]
        ),
        Row(
          children: [
            StatCell(
              label: 'Attack Power',
              value: Consumer<CharacterModel>(
                builder: (context, character, child) {
                  return Text('${character.totalAttack}');
                }
              ),
            ),
            StatCell(
              label: 'Magic Attack',
              value: Consumer<CharacterModel>(
                builder: (context, character, child) {
                  return Text('${character.totalMAttack}');
                }
              ),
            ),
          ]
        ),
        Row(
          children: [
            StatCell(
              label: 'Status Resistance',
              value: Consumer<CharacterModel>(
                builder: (context, character, child) {
                  return Text('${character.totalStatusResistance}');
                }
              ),
            ),
            StatCell(
              label: 'Knockback Resistance',
              value: Consumer<CharacterModel>(
                builder: (context, character, child) {
                  return Text(doubleRoundPercentFormater.format(character.totalKnockbackResistance));
                }
              ),
            ),
          ]
        ),
        Row(
          children: [
            StatCell(
              label: 'Defense',
              value: Consumer<CharacterModel>(
                builder: (context, character, child) {
                  return Text('${character.totalDefense}');
                }
              ),
            ),
            StatCell(
              label: 'Star Force',
              value: Consumer<CharacterModel>(
                builder: (context, character, child) {
                  return Text('${character.totalStarForce}');
                }
              ),
            ),
          ]
        ),
        Row(
          children: [
            StatCell(
              label: 'Speed',
              value: Consumer<CharacterModel>(
                builder: (context, character, child) {
                  return Text(doubleRoundPercentFormater.format(character.totalSpeed));
                }
              ),
            ),
            StatCell(
              label: 'Arcane Force',
              value: Consumer<CharacterModel>(
                builder: (context, character, child) {
                  return Text('${character.totalArcaneForce}');
                }
              ),
            ),
          ]
        ),
        Row(
          children: [
            StatCell(
              label: 'Jump',
              value: Consumer<CharacterModel>(
                builder: (context, character, child) {
                  return Text(doubleRoundPercentFormater.format(character.totalJump));
                }
              ),
            ),
            StatCell(
              label: 'Sacred Power',
              value: Consumer<CharacterModel>(
                builder: (context, character, child) {
                  return Text('${character.totalSacredPower}');
                }
              ),
            ),
          ]
        ),
      ],
    );
  }
}

class StatCell extends StatelessWidget{
  final Color color;
  final String label;
  final Consumer value;

  const StatCell(
    {
      required this.label,
      required this.value,
      this.color = defaultColor,
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
              color: color,
              border: Border.all(
                color: defaultColor
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
            width: 60,
            clipBehavior: Clip.hardEdge,
            padding: const EdgeInsets.symmetric(horizontal: 5),
            decoration: BoxDecoration(
              border: Border.all(
                color: defaultColor
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
  final Color color;
  final String label;
  final Consumer upperValue;
  final Consumer lowerValue;

  const RangeStatCell(
    {
      required this.label,
      required this.upperValue,
      required this.lowerValue,
      this.color = defaultColor,
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
              color: color,
              border: Border.all(
                color: defaultColor
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
            width: 245,
            clipBehavior: Clip.hardEdge,
            padding: const EdgeInsets.symmetric(horizontal: 5),
            decoration: BoxDecoration(
              border: Border.all(
                color: defaultColor
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
            )
          )
        ],
      ),
    );
  }
}