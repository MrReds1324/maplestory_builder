import 'package:flutter/material.dart';
import 'package:maplestory_builder/constants/character/trait_stats.dart';
import 'package:maplestory_builder/constants/constants.dart';
import 'package:maplestory_builder/modules/utilities/widgets.dart';
import 'package:maplestory_builder/providers/difference_provider.dart';
import 'package:maplestory_builder/providers/trait_stats_provider.dart';
import 'package:provider/provider.dart';

class TraitStatsTable extends StatelessWidget {
  const TraitStatsTable({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: Container(
        width: 455,
        height: 781,
        padding: const EdgeInsets.all(5),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Traits",
              style: Theme.of(context).textTheme.headlineMedium
            ),
            const TraitStatCell(traitName: TraitName.ambition),
            const TraitStatCell(traitName: TraitName.empathy),
            const TraitStatCell(traitName: TraitName.insight),
            const TraitStatCell(traitName: TraitName.willpower),
            const TraitStatCell(traitName: TraitName.diligence),
            const TraitStatCell(traitName: TraitName.charm),          
          ]
        ),
      ),
    );
  }
}

class TraitStatCell extends StatelessWidget {
  final TraitName traitName;

  const TraitStatCell(
    {
      required this.traitName,
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
            width: 220,
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
              child: _getStatTooltip(traitName)
            )
          ),
          Container(
            height: 37,
            width: 220,
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
                  TraitStatButton(
                    traitName: traitName, 
                    isLarge: true,
                    isSubtract: true,
                  ),
                  TraitStatButton(
                    traitName: traitName, 
                    isSubtract: true,
                  ),
                  const Spacer(),
                  _getStatSelector(traitName),
                  const Spacer(),
                  TraitStatButton(
                    traitName: traitName, 
                  ),
                  TraitStatButton(
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

class TraitStatButton extends StatelessWidget {
  final TraitName traitName;
  final bool isLarge;
  final bool isSubtract;

  const TraitStatButton(
    {
      required this.traitName,
      this.isLarge = false,
      this.isSubtract = false,
      super.key
    }
  );

  void _onHover(BuildContext context){
    var differenceCalculator = context.read<DifferenceCalculatorProvider>();
    var func = isSubtract ? differenceCalculator.subtractTraitLevels : differenceCalculator.addTraitLevels;
    func(isLarge ? 5 : 1, traitName);
  }

  @override
  Widget build(BuildContext context) {
    return MapleTooltip(
      tooltipWidgets: [
        Text('${isSubtract ? "Removes": "Adds"} ${isLarge ? 5 : 1} levels ${isSubtract ? "from" : "to"} ${traitName.formattedName}'),
        Consumer<DifferenceCalculatorProvider>(
          builder: (context, differenceCalculator, child) => differenceCalculator.differenceWidget
        ),
      ],
      onHoverFunction: _onHover,
      child: IconButton(
        iconSize: 12,
        onPressed: () {
          var traitStatsProvider = context.read<TraitStatsProvider>();
          var func = isSubtract ? traitStatsProvider.subtractTraitLevels : traitStatsProvider.addTraitLevels;
          func(isLarge ? 5 : 1, traitName);
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

Selector _getStatSelector(TraitName traitName) {
  return Selector<TraitStatsProvider, int>(
    selector: (_, traitStatsProvider) => traitStatsProvider.traitLevels[traitName]!,
    builder: (context, data, child) {
      return Text('$data');
    }
  );
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
        }
      )
    ],
    onHoverFunction: onHover,
    label: traitName.formattedName,
  );
}