import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:maplestory_builder/core/constants.dart';

final doubleRoundPercentFormater = NumberFormat('#####%');
final doubleRoundFormater = NumberFormat('#######');
final doublePercentFormater = NumberFormat('####.00%');
final doubleFormater = NumberFormat('#######.00');
final rangeFormatter = NumberFormat('###,###,###,###,###');

String formatCharacterClassEnumName(CharacterClass characterClass) {
  return characterClass.name.replaceAll('_', " ").toUpperCase();
}

String formatRangeTypeEnumName(RangeType rangeType) {
  switch(rangeType) {
    case RangeType.damageRange:
      return 'Damage Range';
    case RangeType.bossDamageRange:
      return 'Boss Damage Range';
    case RangeType.effectiveDamageRange:
      return 'Effective Damage Range';
    case RangeType.effectiveBossDamageRange:
      return 'Effective Boss Damage Range';
    default:
      throw Exception("Tooltip not Implemented for rangeType $rangeType");
  }
}

String formatStatTypeEnumName(StatType statType) {
  switch(statType) {
    case StatType.str:
    case StatType.dex:
    case StatType.int:
    case StatType.luk:
    case StatType.hp:
    case StatType.mp:
    case StatType.exp:
      return statType.name.toUpperCase();
    case StatType.arcaneForce:
      return "Arcane Force";
    case StatType.sacredPower:
      return "Sacred Power";
    case StatType.attack:
      return "Attack Power";
    case StatType.mattack:
      return "Magic Attack";
    case StatType.attackSpeed:
      return "Attack Speed";
    case StatType.bossDamage:
      return "Boss Damage";
    case StatType.buffDuration:
      return "Buff Duration";
    case StatType.critDamage:
      return "Critical Damage";
    case StatType.critRate:
      return "Critical Rate";
    case StatType.defense:
      return "Defense";
    case StatType.damage:
      return "Damage";
    case StatType.finalDamage:
      return "Final Damage";
    case StatType.finalHp:
      return "Flat HP";
    case StatType.finalMp:
      return "Flat MP";
    case StatType.finalStr:
      return "Flat STR";
    case StatType.finalDex:
      return "Flat DEX";
    case StatType.finalInt:
      return "Flat INT";
    case StatType.finalLuk:
      return "Flat LUK";
    case StatType.finalAttack:
      return "Flat Attack Power";
    case StatType.finalMAttack:
      return "Flat Magic Attack";
    case StatType.ignoreDefense:
      return "Ignore Defense";
    case StatType.ignoreElementalDefense:
      return "Ignore Elemental Defense";
    case StatType.itemDropRate:
      return "Item Drop Rate";
    case StatType.mesosObtained:
      return "Mesos Obtained";
    case StatType.jump:
      return "Jump";
    case StatType.knockbackResistance:
      return "Knockback Resistance";
    case StatType.speed:
      return "Speed";
    case StatType.starForce:
      return "Star Force";
    case StatType.statusResistance:
      return "Status Resistance";
    case StatType.level:
      return "Level";
    default:
      throw Exception("Unhandled formatted statType enum name: $statType");
  }
}

double calculteDifferencePercentage(num newValue, num originalValue) {
  return (newValue - originalValue) / originalValue;
}

class MapleTooltip extends StatelessWidget{
  final String tooltipTitle;
  final Widget? child;
  final String? label;
  final List<Widget> tooltipWidgets;
  final Function? onHoverFunction;
  final double? maxWidth;

  const MapleTooltip(
    {
      required this.tooltipWidgets,
      this.tooltipTitle = '',
      this.label,
      this.onHoverFunction,
      this.maxWidth,
      this.child,
      super.key
    }
  ) : assert((label == null) != (child == null), 'Either `label` or `child` must be specified');

  @override
  Widget build(BuildContext context){
    return OnHoverTooltip(
      richMessage: WidgetSpan(
        alignment: PlaceholderAlignment.baseline,
        baseline: TextBaseline.alphabetic,
        child: Container(
          padding: const EdgeInsets.all(5),
          constraints: BoxConstraints(maxWidth: maxWidth ?? 400.0),
          child: Column(
            children: tooltipTitle.isNotEmpty ? <Widget>[
              Text(tooltipTitle, style: Theme.of(context).textTheme.headlineSmall)
            ] + tooltipWidgets : tooltipWidgets
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
      onTriggered: onHoverFunction != null ? () {
        onHoverFunction?.call(context);
      } : null,
      waitDuration: const Duration(milliseconds: 350),
      child: child ?? Text(label ?? '', textAlign: TextAlign.center,),
    );
  }
}

class OnHoverTooltip extends Tooltip {

  const OnHoverTooltip({
    super.key,
    super.message,
    super.richMessage,
    super.height,
    super.padding,
    super.margin,
    super.verticalOffset,
    super.preferBelow,
    super.excludeFromSemantics,
    super.decoration,
    super.textStyle,
    super.textAlign,
    super.waitDuration,
    super.showDuration,
    super.triggerMode,
    super.enableFeedback,
    super.onTriggered,
    super.child,
  });

  @override
  OnHoverTooltipState createState() => OnHoverTooltipState();

}

// Extending the std lib Tooltip to call the onTriggered function when tooltip becomes visible on hover
class OnHoverTooltipState extends TooltipState {

  @override
  bool ensureTooltipVisible() {
    var change = super.ensureTooltipVisible();
    if (change){
      widget.onTriggered?.call();
    }
    return change;
  }
}
