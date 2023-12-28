import 'package:flutter/material.dart';
import 'package:maplestory_builder/constants/character/hyper_stats.dart';
import 'package:maplestory_builder/constants/constants.dart';
import 'package:maplestory_builder/modules/utilities/widgets.dart';
import 'package:maplestory_builder/providers/difference_provider.dart';
import 'package:maplestory_builder/providers/character/hyper_stats_provider.dart';
import 'package:provider/provider.dart';

class HyperStatTable extends StatelessWidget {
  const HyperStatTable({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 463,
      height: 781,
      padding: const EdgeInsets.all(5),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "Hyper Stats",
            style: Theme.of(context).textTheme.headlineMedium
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SetSelectButtonRow<HyperStatsProvider>(
                onHoverFunction: context.read<DifferenceCalculatorProvider>().compareHyperStatsSets,
                onPressed: (int setPosition) => context.read<HyperStatsProvider>().changeActiveSet(setPosition),
                selectorFunction: (BuildContext context, HyperStatsProvider hyperStatsprovider) => hyperStatsprovider.activeSetNumber,
              ),
              SizedBox.fromSize(size: const Size(50, 0)),
              Selector<HyperStatsProvider, (int, int)>(
                selector: (_, hyperStatsProvider) => (hyperStatsProvider.activeHyperStat.totalAssignedHyperStats, hyperStatsProvider.totalAvailableHyperStats),
                builder: (context, data, child) {
                  return Text(
                    '${data.$1}/${data.$2} Hyper Stats Used',
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(color: data.$1 > data.$2 ?Colors.red: null)
                  );
                }
              ),
            ]
          ),
          const HyperStatCell(statType: StatType.str),
          const HyperStatCell(statType: StatType.dex),
          const HyperStatCell(statType: StatType.int),
          const HyperStatCell(statType: StatType.luk),
          const HyperStatCell(statType: StatType.hp),
          const HyperStatCell(statType: StatType.mp),          
          const HyperStatCell(statType: StatType.specialMana),          
          const HyperStatCell(statType: StatType.critRate),          
          const HyperStatCell(statType: StatType.critDamage),
          const HyperStatCell(statType: StatType.ignoreDefense),
          const HyperStatCell(statType: StatType.damage),
          const HyperStatCell(statType: StatType.bossDamage),          
          const HyperStatCell(statType: StatType.damageNormalMobs),
          const HyperStatCell(statType: StatType.statusResistance),
          const HyperStatCell(statType: StatType.attackMattack),
          const HyperStatCell(statType: StatType.exp),
          const HyperStatCell(statType: StatType.arcaneForce),
        ]
      ),
    );
  }
}

class HyperStatCell extends StatelessWidget {
  final StatType statType;

  const HyperStatCell(
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
                  HyperStatButton(
                    statType: statType, 
                    isLarge: true,
                    isSubtract: true,
                  ),
                  HyperStatButton(
                    statType: statType, 
                    isSubtract: true,
                  ),
                  const Spacer(),
                  _getStatSelector(statType),
                  const Spacer(),
                  HyperStatButton(
                    statType: statType, 
                  ),
                  HyperStatButton(
                    statType: statType, 
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

class HyperStatButton extends StatelessWidget {
  final StatType statType;
  final bool isLarge;
  final bool isSubtract;

  const HyperStatButton(
    {
      required this.statType,
      this.isLarge = false,
      this.isSubtract = false,
      super.key
    }
  );

  void _onHover(BuildContext context) {
    context.read<DifferenceCalculatorProvider>().modifyHyperStats(isLarge ? 5 : 1, statType, isSubtract);
  }

  @override
  Widget build(BuildContext context) {
    return MapleTooltip(
      tooltipWidgets: [
        Text('${isSubtract ? "Removes": "Adds"} ${isLarge ? 5 : 1} Hyper Stat Levels ${isSubtract ? "from" : "to"} ${statType.formattedName}'),
        Selector<DifferenceCalculatorProvider, Widget>(
          selector: (_, differenceCalculatorProvider) => differenceCalculatorProvider.differenceWidget,
          builder: (context, widget, child) {
            return widget;
          }
        ),
      ],
      onHoverFunction: _onHover,
      child: IconButton(
        iconSize: 12,
        onPressed: () {
          var hyperStatsProvider = context.read<HyperStatsProvider>();
          var func = isSubtract ? hyperStatsProvider.subtractHyperStats : hyperStatsProvider.addHyperStats;
          func(isLarge ? 5 : 1, statType);
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

Selector _getStatSelector(StatType statType) {
  return Selector<HyperStatsProvider, int>(
    selector: (_, hyperStatsProvider) => hyperStatsProvider.activeHyperStat.assignedHyperStats[statType]!,
    builder: (context, data, child) {
      return Text('$data');
    }
  );
}

MapleTooltip _getStatTooltip(StatType statType) {

  void onHover(BuildContext context) {
    context.read<HyperStatsProvider>().getHoverTooltipText(statType);
  }

  return MapleTooltip(
    tooltipTitle: "${statType.formattedName} (Max Level: ${hyperStatsValues[statType]!.length - 1})",
    tooltipWidgets: [
      Selector<HyperStatsProvider, Widget>(
        selector: (_, hyperStatsProvider) => hyperStatsProvider.hoverTooltip,
        builder: (context, data, child) {
          return data;
        }
      )
    ],
    onHoverFunction: onHover,
    label: statType.formattedName,
  );
}