import 'package:flutter/material.dart';
import 'package:maplestory_builder/constants/constants.dart';
import 'package:maplestory_builder/modules/utilities/widgets.dart';
import 'package:maplestory_builder/providers/difference_provider.dart';
import 'package:maplestory_builder/providers/legion/legion_artifacts_provider.dart';
import 'package:provider/provider.dart';

class ArtifactCrystal extends StatelessWidget {
  final int artifactCrystalPosition;

  const ArtifactCrystal(
    {
      required this.artifactCrystalPosition,
      super.key
    }
  );

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 300,
      height: 280,
      padding: const EdgeInsets.all(2.5),
      child: Consumer<LegionArtifactProvider>(
        builder: (context, legionArtifactProvider, child) {
          return Container(
            decoration: BoxDecoration(
              border: Border.all(
                color: artifactCrystalPosition <= legionArtifactProvider.activeArtifactCount ? statColor : Colors.redAccent
              ),
              borderRadius: const BorderRadius.all(Radius.circular(10)),
            ),
            child: Column(
              children: [
                ArtifactCrystalLevelCell(artifactCrystalPosition: artifactCrystalPosition),
                Text(
                  "$artifactCrystalPosition"
                ),
              ]
            )
          );
        }
      ),
    );
  }
}

class ArtifactCrystalLevelCell extends StatelessWidget {
  final int artifactCrystalPosition;
  
  const ArtifactCrystalLevelCell(
    {
      required this.artifactCrystalPosition,
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
            width: 150,
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
            child: const Center(
              child: Text(
                "Artifact Crystal Level",
              ),
            )
          ),
          Container(
            height: 37,
            width: 110,
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
                  ArtifactCrystallevelButton(
                    artifactCrystalPosition: artifactCrystalPosition,
                    isSubtract: true,
                  ),
                  const Spacer(),
                  Selector<LegionArtifactProvider, int>(
                    selector: (_, legionArtifactsProvider) => legionArtifactsProvider.activeCrystalSet.getArtifactCrystal(artifactCrystalPosition).artifactCrystalLevel,
                    builder: (context, data, child) {
                      return Text(
                        "$data",
                      );
                    }
                  ),
                  const Spacer(),
                  ArtifactCrystallevelButton(
                    artifactCrystalPosition: artifactCrystalPosition
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

class ArtifactCrystallevelButton extends StatelessWidget {
  final int artifactCrystalPosition;
  final bool isSubtract;

  const ArtifactCrystallevelButton(
    {
      required this.artifactCrystalPosition,
      this.isSubtract = false,
      super.key
    }
  );

  _onHover(BuildContext context) {
    context.read<DifferenceCalculatorProvider>().modifyArtifactCrsytalLevel(artifactCrystalPosition, isSubtract);
  }

  @override
  Widget build(BuildContext context) {
    return MapleTooltip(
      tooltipWidgets: [
        Text('${isSubtract ? "Removes": "Adds"} 1 Artifact Crystal Level'),
        Consumer<DifferenceCalculatorProvider>(
          builder: (context, differenceCalculator, child) => differenceCalculator.differenceWidget
        ),
      ],
      onHoverFunction: _onHover,
      child: IconButton(
        iconSize: 12,
        onPressed: () {
          var legionArtifactProvider = context.read<LegionArtifactProvider>();
          var func = isSubtract ? legionArtifactProvider.subtractArtifactLevel : legionArtifactProvider.addArtifactLevel;
          func(artifactCrystalPosition);
        },
        icon: Icon(
          isSubtract ? Icons.keyboard_arrow_down : Icons.keyboard_arrow_up
        ),
      ),
    );
  }
}