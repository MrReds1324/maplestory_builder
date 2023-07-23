import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

final doubleRoundPercentFormater = NumberFormat('#####%');
final doubleRoundFormater = NumberFormat('#######');
final doublePercentFormater = NumberFormat('####.00%');
final doubleFormater = NumberFormat('#######.00');
final rangeFormatter = NumberFormat('###,###,###,###,###');

String formatCharacterClassEnumName(String nameValue) {
  return nameValue.replaceAll('_', nameValue).toUpperCase();
}

class MapleTooltip extends StatelessWidget{
  final String tooltipTitle;
  final Widget? child;
  final String? label;
  final List<Widget> tooltipWidgets;

  const MapleTooltip(
    {
      required this.tooltipWidgets,
      this.tooltipTitle = '',
      this.label,
      this.child,
      super.key
    }
  ) : assert((label == null) != (child == null), 'Either `label` or `child` must be specified');

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
      waitDuration: const Duration(milliseconds: 350),
      child: child ?? Text(label ?? '', textAlign: TextAlign.center,),
    );
  }
}