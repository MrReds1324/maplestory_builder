import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:maplestory_builder/constants/constants.dart';
import 'package:maplestory_builder/constants/equipment/set_effect_stats.dart';

final doubleRoundPercentFormater = NumberFormat('#####%');
final doubleRoundFormater = NumberFormat('#######');
final doublePercentFormater = NumberFormat('###0.00%');
final doubleFormater = NumberFormat('#######.00');
final rangeFormatter = NumberFormat('###,###,###,###,###');

String formatCharacterClassEnumName(CharacterClass characterClass) {
  return characterClass.name.replaceAll('_', " ").toUpperCase();
}

double calculteDifferencePercentage(num newValue, num originalValue) {
  return (newValue - originalValue) / originalValue;
}

Map<EquipSet, SetEffect> deepCopySetEffectsMap(Map<EquipSet, SetEffect> map) {
    Map<EquipSet, SetEffect> newMap = {};

    map.forEach((key, value) {
      newMap[key] = value.copyWith();
    });

    return newMap;
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
