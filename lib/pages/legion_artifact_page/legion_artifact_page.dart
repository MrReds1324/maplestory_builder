import 'package:flutter/material.dart';
import 'package:maplestory_builder/constants/constants.dart';
import 'package:maplestory_builder/modules/utilities/widgets.dart';
import 'package:maplestory_builder/providers/difference_provider.dart';
import 'package:maplestory_builder/providers/legion/legion_artifacts_provider.dart';
import 'package:maplestory_builder/pages/legion_artifact_page/legion_artifact.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:provider/provider.dart';

class LegionArtifactPage extends StatelessWidget {

  const LegionArtifactPage(
    
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
            "Legion Artifact",
            style: Theme.of(context).textTheme.headlineLarge
          ),
          const Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              LegionArtifactsSelectButton(legionArtifactPosition: 1),
              LegionArtifactsSelectButton(legionArtifactPosition: 2),
              LegionArtifactsSelectButton(legionArtifactPosition: 3),
              LegionArtifactsSelectButton(legionArtifactPosition: 4),
              LegionArtifactsSelectButton(legionArtifactPosition: 5),
            ]
          ),
          const Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ArtifactCrystalGrid(),
              LegionArtifactLevelWidget(),
            ],
          ),
        ]
      ),
    );
  }
}

class LegionArtifactsSelectButton extends StatelessWidget {
  final int legionArtifactPosition;

  const LegionArtifactsSelectButton({
    super.key, 
    required this.legionArtifactPosition
  });

  IconData _getIconData() {
    switch(legionArtifactPosition) {
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

  void _onHover(BuildContext context) {
    context.read<DifferenceCalculatorProvider>().compareLegionArtifactSets(context, legionArtifactPosition);
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
        onPressed: () => context.read<LegionArtifactProvider>().changeActiveSet(legionArtifactPosition), 
        icon: Consumer<LegionArtifactProvider>(
          builder: (_, legionStatsProvider, __) {
            return Icon(
              _getIconData(),
              color: legionArtifactPosition == legionStatsProvider.activeSetNumber ? starColor : null,
            );
          }
        )
      )
    );
  }
}