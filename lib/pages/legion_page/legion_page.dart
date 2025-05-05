import 'package:flutter/material.dart';
import 'package:maplestory_builder/constants/constants.dart';
import 'package:maplestory_builder/modules/utilities/widgets.dart';
import 'package:maplestory_builder/pages/legion_page/legion_characters.dart';
import 'package:maplestory_builder/pages/legion_page/legion_stats.dart';
import 'package:maplestory_builder/providers/difference_provider.dart';
import 'package:maplestory_builder/providers/legion/legion_stats_provider.dart';
import 'package:provider/provider.dart';

class LegionPage extends StatelessWidget {
  const LegionPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: DEFAULT_COLOR),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: Column(children: [
        Text("Legion Board & Characters",
            style: Theme.of(context).textTheme.headlineLarge),
        SetSelectButtonRow<LegionStatsProvider>(
          onHoverFunction:
              context.read<DifferenceCalculatorProvider>().compareLegionSets,
          onPressed: (int setPosition) =>
              context.read<LegionStatsProvider>().changeActiveSet(setPosition),
          selectorFunction:
              (BuildContext context, LegionStatsProvider legionStatsProvider) =>
                  legionStatsProvider.activeSetNumber,
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
      ]),
    );
  }
}
