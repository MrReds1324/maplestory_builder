import 'package:flutter/material.dart';
import 'package:maplestory_builder/constants/character/trait_stats.dart';
import 'package:maplestory_builder/constants/constants.dart';
import 'package:maplestory_builder/modules/utilities/widgets.dart';
import 'package:maplestory_builder/providers/character/trait_stats_provider.dart';
import 'package:maplestory_builder/providers/difference_provider.dart';
import 'package:provider/provider.dart';

class TraitStatsTable extends StatelessWidget {
  const TraitStatsTable({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 463,
      height: 298,
      padding: const EdgeInsets.all(5),
      child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        Text("Traits", style: Theme.of(context).textTheme.headlineMedium),
        const _TraitStatCell(traitName: TraitName.ambition),
        const _TraitStatCell(traitName: TraitName.empathy),
        const _TraitStatCell(traitName: TraitName.insight),
        const _TraitStatCell(traitName: TraitName.willpower),
        const _TraitStatCell(traitName: TraitName.diligence),
        const _TraitStatCell(traitName: TraitName.charm),
      ]),
    );
  }
}

class _TraitStatCell extends StatelessWidget {
  final TraitName traitName;

  const _TraitStatCell({
    required this.traitName,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(2.5),
      child: Row(
        children: <Widget>[
          Container(
              height: 37,
              width: 220,
              clipBehavior: Clip.hardEdge,
              padding: const EdgeInsets.symmetric(horizontal: 5),
              decoration: BoxDecoration(
                color: DEFAULT_COLOR,
                border: Border.all(color: DEFAULT_COLOR),
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(10),
                  bottomLeft: Radius.circular(10),
                ),
              ),
              child: Center(child: _getStatTooltip(traitName))),
          Container(
            height: 37,
            width: 220,
            clipBehavior: Clip.hardEdge,
            padding: const EdgeInsets.symmetric(horizontal: 5),
            decoration: BoxDecoration(
              border: Border.all(color: DEFAULT_COLOR),
              borderRadius: const BorderRadius.only(
                topRight: Radius.circular(10),
                bottomRight: Radius.circular(10),
              ),
            ),
            child: Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  _TraitStatButton(
                    traitName: traitName,
                    isLarge: true,
                    isSubtract: true,
                  ),
                  _TraitStatButton(
                    traitName: traitName,
                    isSubtract: true,
                  ),
                  const Spacer(),
                  _getStatSelector(traitName),
                  const Spacer(),
                  _TraitStatButton(
                    traitName: traitName,
                  ),
                  _TraitStatButton(
                    traitName: traitName,
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

class _TraitStatButton extends StatelessWidget {
  final TraitName traitName;
  final bool isLarge;
  final bool isSubtract;

  const _TraitStatButton({
    required this.traitName,
    this.isLarge = false,
    this.isSubtract = false,
  });

  void _onHover(BuildContext context) {
    context
        .read<DifferenceCalculatorProvider>()
        .modifyTraitLevels(isLarge ? 5 : 1, traitName, isSubtract);
  }

  @override
  Widget build(BuildContext context) {
    return MapleTooltip(
      tooltipWidgets: [
        Text(
            '${isSubtract ? "Removes" : "Adds"} ${isLarge ? 5 : 1} levels ${isSubtract ? "from" : "to"} ${traitName.formattedName}'),
        Selector<DifferenceCalculatorProvider, Widget>(
            selector: (_, differenceCalculatorProvider) =>
                differenceCalculatorProvider.differenceWidget,
            builder: (context, widget, child) {
              return widget;
            }),
      ],
      onHoverFunction: _onHover,
      child: IconButton(
        iconSize: 12,
        onPressed: () {
          var traitStatsProvider = context.read<TraitStatsProvider>();
          var func = isSubtract
              ? traitStatsProvider.subtractTraitLevels
              : traitStatsProvider.addTraitLevels;
          func(isLarge ? 5 : 1, traitName);
        },
        icon: Icon(isSubtract
            ? isLarge
                ? Icons.keyboard_double_arrow_down
                : Icons.keyboard_arrow_down
            : isLarge
                ? Icons.keyboard_double_arrow_up
                : Icons.keyboard_arrow_up),
      ),
    );
  }
}

Selector _getStatSelector(TraitName traitName) {
  return Selector<TraitStatsProvider, int>(
      selector: (_, traitStatsProvider) =>
          traitStatsProvider.traitLevels[traitName]!,
      builder: (context, data, child) {
        return Text('$data');
      });
}

MapleTooltip _getStatTooltip(TraitName traitName) {
  void onHover(BuildContext context) {
    context.read<TraitStatsProvider>().getHoverTooltipText(traitName);
  }

  return MapleTooltip(
    tooltipTitle: traitName.formattedName,
    tooltipWidgets: [
      Selector<TraitStatsProvider, Widget>(
          selector: (_, traitStatsProvider) => traitStatsProvider.hoverTooltip,
          builder: (context, data, child) {
            return data;
          })
    ],
    onHoverFunction: onHover,
    label: traitName.formattedName,
  );
}
