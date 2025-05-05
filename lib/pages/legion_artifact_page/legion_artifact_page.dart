import 'package:flutter/material.dart';
import 'package:maplestory_builder/constants/constants.dart';
import 'package:maplestory_builder/modules/utilities/widgets.dart';
import 'package:maplestory_builder/pages/legion_artifact_page/legion_artifact.dart';
import 'package:maplestory_builder/providers/difference_provider.dart';
import 'package:maplestory_builder/providers/legion/legion_artifacts_provider.dart';
import 'package:provider/provider.dart';

class LegionArtifactPage extends StatelessWidget {
  const LegionArtifactPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: DEFAULT_COLOR),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: Column(children: [
        Text("Legion Artifact",
            style: Theme.of(context).textTheme.headlineLarge),
        SetSelectButtonRow<LegionArtifactProvider>(
          onHoverFunction: context
              .read<DifferenceCalculatorProvider>()
              .compareLegionArtifactSets,
          onPressed: (int setPosition) => context
              .read<LegionArtifactProvider>()
              .changeActiveSet(setPosition),
          selectorFunction: (BuildContext context,
                  LegionArtifactProvider legionArtifactProvider) =>
              legionArtifactProvider.activeSetNumber,
        ),
        const Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            ArtifactCrystalGrid(),
            LegionArtifactLevelWidget(),
          ],
        ),
      ]),
    );
  }
}
