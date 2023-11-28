import 'package:flutter/material.dart';
import 'package:maplestory_builder/constants/constants.dart';
import 'package:maplestory_builder/modules/utilities/widgets.dart';
import 'package:maplestory_builder/providers/legion/legion_stats_provider.dart';
import 'package:maplestory_builder/providers/difference_provider.dart';
import 'package:provider/provider.dart';

class InnerLegionStatsTable extends StatelessWidget {
  const InnerLegionStatsTable({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: Container(
        width: 455,
        height: 382,
        padding: const EdgeInsets.all(5),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Inner Legion Board Stats",
              style: Theme.of(context).textTheme.headlineMedium
            ),
            const LegionStatCell(statType: StatType.attack),
            const LegionStatCell(statType: StatType.mattack),
            const LegionStatCell(statType: StatType.str),
            const LegionStatCell(statType: StatType.dex),
            const LegionStatCell(statType: StatType.int),
            const LegionStatCell(statType: StatType.luk),
            const LegionStatCell(statType: StatType.hp),
            const LegionStatCell(statType: StatType.mp),        
          ]
        ),
      ),
    );
  }
}

class OuterLegionStatsTable extends StatelessWidget {
  const OuterLegionStatsTable({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: Container(
        width: 455,
        height: 382,
        padding: const EdgeInsets.all(5),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Outer Legion Board Stats",
              style: Theme.of(context).textTheme.headlineMedium
            ),
            const LegionStatCell(statType: StatType.critDamage, isOuterBoard: true),
            const LegionStatCell(statType: StatType.bossDamage, isOuterBoard: true),
            const LegionStatCell(statType: StatType.ignoreDefense, isOuterBoard: true),
            const LegionStatCell(statType: StatType.critRate, isOuterBoard: true),
            const LegionStatCell(statType: StatType.buffDuration, isOuterBoard: true),
            const LegionStatCell(statType: StatType.damageNormalMobs, isOuterBoard: true),
            const LegionStatCell(statType: StatType.statusResistance, isOuterBoard: true),
            const LegionStatCell(statType: StatType.expAdditional, isOuterBoard: true),           
          ]
        ),
      ),
    );
  }
}

class LegionStatCell extends StatelessWidget {
  final StatType statType;
  final bool isOuterBoard;

  const LegionStatCell(
    {
      required this.statType,
      this.isOuterBoard = false,
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
              child: _getStatTooltip(statType)
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
                  LegionStatButton(
                    statType: statType, 
                    isLarge: true,
                    isSubtract: true,
                    isOuterBoard: isOuterBoard,
                  ),
                  LegionStatButton(
                    statType: statType, 
                    isSubtract: true,
                    isOuterBoard: isOuterBoard,
                  ),
                  const Spacer(),
                  Selector<LegionStatsProvider, int>(
                    selector: (_, legionStatsProvider) => legionStatsProvider.activeLegionSet.legionBoardStatLevels[statType]!,
                    builder: (context, data, child) {
                      return Text('$data');
                    }
                  ),
                  const Spacer(),
                  LegionStatButton(
                    statType: statType, 
                    isOuterBoard: isOuterBoard,
                  ),
                  LegionStatButton(
                    statType: statType, 
                    isLarge: true,
                    isOuterBoard: isOuterBoard,
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

class LegionStatButton extends StatelessWidget {
  final StatType statType;
  final bool isLarge;
  final bool isSubtract;
  final bool isOuterBoard;

  const LegionStatButton(
    {
      required this.statType,
      this.isLarge = false,
      this.isSubtract = false,
      this.isOuterBoard = false,
      super.key
    }
  );

  void _onHover(BuildContext context) {
    // TODO: add this to main/diff calculators
    // context.read<DifferenceCalculatorProvider>().modifyArcaneLevels(isLarge ? 5 : 1, statType, isSubtract);
  }

  @override
  Widget build(BuildContext context) {
    return MapleTooltip(
      tooltipWidgets: [
        Text('${isSubtract ? "Removes": "Adds"} ${isLarge ? 5 : 1} levels ${isSubtract ? "from" : "to"} ${statType.formattedName}'),
        Consumer<DifferenceCalculatorProvider>(
          builder: (context, differenceCalculator, child) => differenceCalculator.differenceWidget
        ),
      ],
      onHoverFunction: _onHover,
      child: IconButton(
        iconSize: 12,
        onPressed: () {
          var traitStatsProvider = context.read<LegionStatsProvider>();
          var func = isSubtract ? traitStatsProvider.subtractLegionStatLevels : traitStatsProvider.addLegionStatLevels;
          func(isLarge ? 5 : 1, statType, isOuterBoard: isOuterBoard);
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


MapleTooltip _getStatTooltip(StatType statType) {

  void onHover(BuildContext context) {
    context.read<LegionStatsProvider>().activeLegionSet.getHoverStatTooltipText(statType);
  }

  return MapleTooltip(
    tooltipTitle: statType.formattedName,
    tooltipWidgets: [
      Selector<LegionStatsProvider, Widget>(
        selector: (_, legionStatsProvider) => legionStatsProvider.activeLegionSet.hoverTooltip,
        builder: (context, data, child) {
          return data;
        }
      )
    ],
    onHoverFunction: onHover,
    label: statType.formattedName
  );
}