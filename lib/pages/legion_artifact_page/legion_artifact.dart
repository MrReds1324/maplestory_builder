import 'package:flutter/material.dart';
import 'package:maplestory_builder/constants/constants.dart';
import 'package:maplestory_builder/modules/utilities/utilities.dart';
import 'package:maplestory_builder/modules/utilities/widgets.dart';
import 'package:maplestory_builder/pages/legion_artifact_page/legion_artifact_crystal.dart';
import 'package:maplestory_builder/providers/legion/legion_artifacts_provider.dart';
import 'package:provider/provider.dart';

class LegionArtifactLevelWidget extends StatelessWidget {
  const LegionArtifactLevelWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 463,
      padding: const EdgeInsets.all(5),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          const _ArtifactLevelCell(),
          Selector<LegionArtifactProvider, int>(
            selector: (_, legionArtifactProvider) => legionArtifactProvider.activeArtifactCount,
            builder: (context, data, child) {
              return Text(
                '$data Active Artifact Crystals',
              );
            }
          ),
          const _ArtifactCrystalStatsListView(),
        ],
      ),
    );
  }
}

class _ArtifactLevelCell extends StatelessWidget {

  const _ArtifactLevelCell();

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
              child: Text(
                "Artifact Level",
                style: Theme.of(context).textTheme.headlineSmall,
              ),
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
                  const _ArtifactlevelButton(
                    isLarge: true,
                    isSubtract: true,
                  ),
                  const _ArtifactlevelButton(
                    isSubtract: true,
                  ),
                  const Spacer(),
                  Selector<LegionArtifactProvider, int>(
                    selector: (_, legionArtifactsProvider) => legionArtifactsProvider.legionArtifactLevel,
                    builder: (context, data, child) {
                      return Text(
                        "$data",
                        style: Theme.of(context).textTheme.headlineSmall,
                      );
                    }
                  ),
                  const Spacer(),
                  const _ArtifactlevelButton(),
                  const _ArtifactlevelButton(
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

class _ArtifactlevelButton extends StatelessWidget {
  final bool isLarge;
  final bool isSubtract;

  const _ArtifactlevelButton({
    this.isLarge = false,
    this.isSubtract = false,
  });

  @override
  Widget build(BuildContext context) {
    return MapleTooltip(
      tooltipWidgets: [
        Text('${isSubtract ? "Removes": "Adds"} ${isLarge ? 5 : 1} Artifact Levels'),
      ],
      child: IconButton(
        iconSize: 12,
        onPressed: () {
          var legionArtifactProvider = context.read<LegionArtifactProvider>();
          var func = isSubtract ? legionArtifactProvider.subtractLegionArtifactLevels : legionArtifactProvider.addLegionArtifactLevels;
          func(isLarge ? 5 : 1);
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

class _ArtifactCrystalStatsListView extends StatelessWidget {

  const _ArtifactCrystalStatsListView();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          'Total Artifact Crystal Stats',
          style: Theme.of(context).textTheme.bodyLarge?.copyWith(decoration: TextDecoration.underline),
        ),
        Container(
          height: 757,
          width: 250,
          decoration: BoxDecoration(
            border: Border.all(
              color: statColor
            ),
            borderRadius: const BorderRadius.all(Radius.circular(10)),
          ),
          child: Consumer<LegionArtifactProvider>(
            builder: (context, legionArtifactProvider, child) {
              var selectedStats = legionArtifactProvider.calculateStats().entries.toList();
              return ListView.builder(
                padding: const EdgeInsets.only(right: 13),
                itemCount: selectedStats.length,
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Row(
                      children: [
                        SizedBox(
                          width: 100,
                          child: Text(
                            selectedStats[index].key.formattedName,
                            style: Theme.of(context).textTheme.bodyMedium,
                          ),
                        ),
                        const Spacer(),
                        Text(
                          "${selectedStats[index].key.isPositive ? '+' : ' -'}${selectedStats[index].key.isPercentage ? doublePercentFormater.format(selectedStats[index].value) : selectedStats[index].value}",
                          style: Theme.of(context).textTheme.bodyMedium
                        ) 
                      ]
                    ),
                  );
                },
              );
            }
          ),
        ),
      ]
    );
  }
}

class ArtifactCrystalGrid extends StatelessWidget {

  const ArtifactCrystalGrid(
    {
      super.key
    }
  );

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        Row(
          children: [
            ArtifactCrystalWidget(artifactCrystalPosition: 1),
            ArtifactCrystalWidget(artifactCrystalPosition: 2),
            ArtifactCrystalWidget(artifactCrystalPosition: 3),
          ],
        ),
        Row(
          children: [
            ArtifactCrystalWidget(artifactCrystalPosition: 4),
            ArtifactCrystalWidget(artifactCrystalPosition: 5),
            ArtifactCrystalWidget(artifactCrystalPosition: 6),
          ],
        ),
        Row(
          children: [
            ArtifactCrystalWidget(artifactCrystalPosition: 7),
            ArtifactCrystalWidget(artifactCrystalPosition: 8),
            ArtifactCrystalWidget(artifactCrystalPosition: 9),
          ],
        ),
      ]
    );
  }
}

