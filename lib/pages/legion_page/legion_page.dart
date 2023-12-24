import 'package:flutter/material.dart';
import 'package:maplestory_builder/constants/constants.dart';
import 'package:maplestory_builder/modules/utilities/widgets.dart';
import 'package:maplestory_builder/pages/legion_page/legion_characters.dart';
import 'package:maplestory_builder/pages/legion_page/legion_stats.dart';
import 'package:maplestory_builder/providers/legion/legion_stats_provider.dart';
import 'package:maplestory_builder/providers/difference_provider.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:provider/provider.dart';

class LegionPage extends StatelessWidget {

  const LegionPage(
    {
      super.key
    }
  );

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(
          color: statColor
        ),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: Column(
        children: [
          Text(
            "Legion Board & Characters",
            style: Theme.of(context).textTheme.headlineLarge
          ),
          const Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              LegionStatSelectButton(legionStatPosition: 1),
              LegionStatSelectButton(legionStatPosition: 2),
              LegionStatSelectButton(legionStatPosition: 3),
              LegionStatSelectButton(legionStatPosition: 4),
              LegionStatSelectButton(legionStatPosition: 5),
            ]
          ),
          const Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              InnerLegionStatsTable(),
              OuterLegionStatsTable(),
              LegionRankWidget(),
            ],
          ),
          const PlacedCharacters(),
          const AvailableCharacters(),
        ]
      ),
    );
  }
}

class LegionStatSelectButton extends StatelessWidget {
  final int legionStatPosition;

  const LegionStatSelectButton({
    super.key, 
    required this.legionStatPosition
  });

  IconData _getIconData() {
    switch(legionStatPosition) {
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

  void _onHover(BuildContext context){
    context.read<DifferenceCalculatorProvider>().compareLegionSets(context, legionStatPosition);
  }

  @override
  Widget build(BuildContext context) {
    return MapleTooltip(
      tooltipWidgets: [
        Consumer<DifferenceCalculatorProvider>(
          builder: (context, differenceCalculator, child) => differenceCalculator.differenceWidget
        ),
      ],
      onHoverFunction: _onHover,
      child: IconButton(
        padding: const EdgeInsets.all(1),
        constraints: const BoxConstraints(),
        iconSize: 19,
        onPressed: () => context.read<LegionStatsProvider>().changeActiveSet(legionStatPosition), 
        icon: Consumer<LegionStatsProvider>(
          builder: (_, legionStatsProvider, __) {
            return Icon(
              _getIconData(),
              color: legionStatPosition == legionStatsProvider.activeSetNumber ? starColor : null,
            );
          }
        )
      )
    );
  }
}