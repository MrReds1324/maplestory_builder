import 'package:flutter/material.dart';
import 'package:maplestory_builder/constants/constants.dart';
import 'package:maplestory_builder/modules/utilities/hover_tooltip.dart';
import 'package:maplestory_builder/providers/difference_provider.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:provider/provider.dart';

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
          // Add 8 to the custom max width here to account for the scroll bar on the side
          constraints: BoxConstraints(maxWidth: maxWidth != null ? (maxWidth! + 8) : 400.0, maxHeight: 470),
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

class SetSelectButtonRow<P> extends StatelessWidget {
  
  final void Function(BuildContext, int) onHoverFunction;
  final void Function(int) onPressed;
  final int Function(BuildContext, P) selectorFunction;
  
  const SetSelectButtonRow({
    required this.onHoverFunction,
    required this.onPressed,
    required this.selectorFunction,
    super.key
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SetSelectButton<P>(
          setPosition: 1,
          onHoverFunction: onHoverFunction,
          onPressed: onPressed,
          selectorFunction: selectorFunction,
        ),
        SetSelectButton<P>(
          setPosition: 2,
          onHoverFunction: onHoverFunction,
          onPressed: onPressed,
          selectorFunction: selectorFunction,
        ),
        SetSelectButton<P>(
          setPosition: 3,
          onHoverFunction: onHoverFunction,
          onPressed: onPressed,
          selectorFunction: selectorFunction,
        ),
        SetSelectButton<P>(
          setPosition: 4,
          onHoverFunction: onHoverFunction,
          onPressed: onPressed,
          selectorFunction: selectorFunction,
        ),
        SetSelectButton<P>(
          setPosition: 5,
          onHoverFunction: onHoverFunction,
          onPressed: onPressed,
          selectorFunction: selectorFunction,
        ),
      ]
    );
  }
}

class SetSelectButton<P> extends StatelessWidget {
  final int setPosition;
  final void Function(BuildContext, int) onHoverFunction;
  final void Function(int) onPressed;
  final int Function(BuildContext, P) selectorFunction;

  const SetSelectButton({
    required this.setPosition,
    required this.onHoverFunction,
    required this.onPressed,
    required this.selectorFunction,
    super.key, 
  });

  Function _curriedOnHover(int setPosition) {
    return (BuildContext context) {
      return onHoverFunction(context, setPosition);
    };
  }

  IconData _getIconData() {
    switch(setPosition) {
      case 1:
        return MdiIcons.numeric1CircleOutline;
      case 2:
        return MdiIcons.numeric2CircleOutline;
      case 3:
        return MdiIcons.numeric3CircleOutline;
      case 4:
        return MdiIcons.numeric4CircleOutline;
      case 5:
        return MdiIcons.numeric5CircleOutline;
      default:
        return MdiIcons.exclamation;
    }
  }

  @override
  Widget build(BuildContext context) {
    return MapleTooltip(
      tooltipWidgets: [
        Selector<DifferenceCalculatorProvider, Widget>(
          selector: (_, differenceCalculatorProvider) => differenceCalculatorProvider.differenceWidget,
          builder: (context, widget, child) {
            return widget;
          }
        ),
      ],
      onHoverFunction: _curriedOnHover(setPosition),
      child: IconButton(
        padding: const EdgeInsets.all(1),
        constraints: const BoxConstraints(),
        iconSize: 19,
        onPressed: () => onPressed(setPosition), 
        icon: Selector<P, int>(
          selector: selectorFunction,
          builder: (context, selectedSetNumber, child) {
            return Icon(
              _getIconData(),
              color: setPosition == selectedSetNumber ? starColor : null,
            );
          }
        ),
      )
    );
  }
}