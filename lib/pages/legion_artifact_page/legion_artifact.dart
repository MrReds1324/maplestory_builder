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
    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: Container(
        width: 455,
        height: 382,
        padding: const EdgeInsets.all(5),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const ArtifactLevelCell(),
            Selector<LegionArtifactProvider, int>(
              selector: (_, legionArtifactProvider) => legionArtifactProvider.activeArtifactCount,
              builder: (context, data, child) {
                return Text(
                  '$data Active Artifact Crystals',
                );
              }
            ),
            const ArtifactCrystalStatsListView(),
          ],
        ),
      ),
    );
  }
}

class ArtifactLevelCell extends StatelessWidget {
  const ArtifactLevelCell(
    {
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
                  const ArtifactlevelButton(
                    isLarge: true,
                    isSubtract: true,
                  ),
                  const ArtifactlevelButton(
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
                  const ArtifactlevelButton(),
                  const ArtifactlevelButton(
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

class ArtifactlevelButton extends StatelessWidget {
  final bool isLarge;
  final bool isSubtract;

  const ArtifactlevelButton(
    {
      this.isLarge = false,
      this.isSubtract = false,
      super.key
    }
  );

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

class ArtifactCrystalStatsListView extends StatelessWidget {

  const ArtifactCrystalStatsListView(
    {
      super.key
    }
  );

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          'Total Artifact Crystal Stats',
          style: Theme.of(context).textTheme.bodyLarge?.copyWith(decoration: TextDecoration.underline),
        ),
        Container(
          height: 246,
          width: 440,
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
            ArtifactCrystal(artifactCrystalPosition: 1),
            ArtifactCrystal(artifactCrystalPosition: 2),
            ArtifactCrystal(artifactCrystalPosition: 3),
          ],
        ),
        Row(
          children: [
            ArtifactCrystal(artifactCrystalPosition: 4),
            ArtifactCrystal(artifactCrystalPosition: 5),
            ArtifactCrystal(artifactCrystalPosition: 6),
          ],
        ),
        Row(
          children: [
            ArtifactCrystal(artifactCrystalPosition: 7),
            ArtifactCrystal(artifactCrystalPosition: 8),
            ArtifactCrystal(artifactCrystalPosition: 9),
          ],
        ),
      ]
    );
  }
}

