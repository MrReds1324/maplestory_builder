import 'package:flutter/material.dart';
import 'package:maplestory_builder/constants/constants.dart';
import 'package:maplestory_builder/modules/utilities/hover_tooltip.dart';

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
          constraints: BoxConstraints(maxWidth: maxWidth != null ? (maxWidth! + 8) : 400.0, maxHeight: 550),
          child: SingleChildScrollView(
            padding: const EdgeInsets.only(right: 8, left: 5, top: 5, bottom: 5),
            child: Column(
              children: tooltipTitle.isNotEmpty ? <Widget>[
                Text(tooltipTitle, style: Theme.of(context).textTheme.headlineSmall)
              ] + tooltipWidgets : tooltipWidgets
            ),
          )
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
      showDuration: Duration.zero,
      child: child ?? Text(label ?? '', textAlign: TextAlign.center,),
    );
  }
}

class HorizontalLine extends StatelessWidget {
  final EdgeInsets? padding;
  
  const HorizontalLine({this.padding, super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 1,
      child: Padding(
        padding: padding ?? const EdgeInsets.only(left: 10),
          child: Container(
          height: 2,
          color: statColor,
        ),
      ),
    );
  }
}