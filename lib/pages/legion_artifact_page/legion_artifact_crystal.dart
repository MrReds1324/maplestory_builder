import 'package:flutter/material.dart';
import 'package:maplestory_builder/constants/constants.dart';
import 'package:maplestory_builder/constants/legion/legion_artifat_stats.dart';
import 'package:maplestory_builder/modules/legion/legion_artifact_mod.dart';
import 'package:maplestory_builder/modules/utilities/widgets.dart';
import 'package:maplestory_builder/providers/difference_provider.dart';
import 'package:maplestory_builder/providers/legion/legion_artifacts_provider.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:provider/provider.dart';

class ArtifactCrystalWidget extends StatelessWidget {
  final int artifactCrystalPosition;

  const ArtifactCrystalWidget(
    {
      required this.artifactCrystalPosition,
      super.key
    }
  );

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 300,
      height: 283,
      padding: const EdgeInsets.all(2.5),
      child: Consumer<LegionArtifactProvider>(
        builder: (context, legionArtifactProvider, child) {
          return Container(
            decoration: BoxDecoration(
              border: Border.all(
                color: artifactCrystalPosition <= legionArtifactProvider.activeArtifactCount ? DEFAULT_COLOR : Colors.redAccent
              ),
              borderRadius: const BorderRadius.all(Radius.circular(10)),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                _ArtifactCrystalLevelCell(artifactCrystalPosition: artifactCrystalPosition),
                Icon(
                  MdiIcons.accountBox,
                  size: 145,
                ),
                _ArtifactCrystalStatDropdown(
                  artifactCrystalPosition: artifactCrystalPosition,
                  statPosition: 1,
                ),
                _ArtifactCrystalStatDropdown(
                  artifactCrystalPosition: artifactCrystalPosition,
                  statPosition: 2,
                ),
                _ArtifactCrystalStatDropdown(
                  artifactCrystalPosition: artifactCrystalPosition,
                  statPosition: 3,
                ),
              ]
            )
          );
        }
      ),
    );
  }
}

class _ArtifactCrystalLevelCell extends StatelessWidget {
  final int artifactCrystalPosition;
  
  const _ArtifactCrystalLevelCell({
    required this.artifactCrystalPosition,
  });

  @override
  Widget build(BuildContext context){
    return Container(
      padding: const EdgeInsets.all(2.5),
      child: SizedBox(
        width: 160,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            _ArtifactCrystallevelButton(
              artifactCrystalPosition: artifactCrystalPosition,
              isSubtract: true,
            ),
            const Spacer(),
            Selector<LegionArtifactProvider, int>(
              selector: (_, legionArtifactsProvider) => legionArtifactsProvider.activeCrystalSet.getArtifactCrystal(artifactCrystalPosition).artifactCrystalLevel,
              builder: (context, data, child) {
                return context.read<LegionArtifactProvider>().activeCrystalSet.getArtifactCrystal(artifactCrystalPosition).buildLevelWidget(context);
              }
            ),
            const Spacer(),
            _ArtifactCrystallevelButton(
              artifactCrystalPosition: artifactCrystalPosition
            ),
          ],
        ),
      ),
    );
  }
}

class _ArtifactCrystallevelButton extends StatelessWidget {
  final int artifactCrystalPosition;
  final bool isSubtract;

  const _ArtifactCrystallevelButton({
    required this.artifactCrystalPosition,
    this.isSubtract = false,
  });

  _onHover(BuildContext context) {
    context.read<DifferenceCalculatorProvider>().modifyArtifactCrsytalLevel(artifactCrystalPosition, isSubtract);
  }

  @override
  Widget build(BuildContext context) {
    return MapleTooltip(
      tooltipWidgets: [
        Text('${isSubtract ? "Removes": "Adds"} 1 Artifact Crystal Level'),
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

class _ArtifactCrystalStatDropdown extends StatelessWidget {
  final int artifactCrystalPosition;
  final int statPosition;

  const _ArtifactCrystalStatDropdown({
    required this.artifactCrystalPosition,
    required this.statPosition,
  });

  List<DropdownMenuItem> getDropdownStatsList(BuildContext context, ArtifactCrystal artifactCrystal) {
    List<DropdownMenuItem<StatType>> dropdownItems = [
      // Always add a default null selector to the list
      DropdownMenuItem(
        value: null,
        child: Text(
          'None',
          style: Theme.of(context).textTheme.bodyMedium
        ),
      )
    ];

    List<StatType> filteredList = <StatType>[];
    // We can only have one of the flame types per equip, filter out any ones already used here
    statFilterLoop:
    for(StatType statType in ARTIFACT_STAT_INCREMENTS.keys) { 
      // Stops us from being able to select multiple of a single stat
      for (MapEntry<int, StatType?> editingStats in artifactCrystal.artifactCrystalStats.entries) {
        if (editingStats.key == statPosition) {
          continue;
        }
        else if (statType == editingStats.value) {
          continue statFilterLoop;
        }
      }
      
      filteredList.add(statType);
    }

    dropdownItems.addAll(
      filteredList.map((value) {
        return DropdownMenuItem(
          value: value,
          child: Text(
            value.formattedName,
            style: Theme.of(context).textTheme.bodyMedium
          ),
        );
      }).toList()
    );

    return dropdownItems;
  }

  StatType? getSelectedStat(ArtifactCrystal artifactCrystal) {
    return artifactCrystal.artifactCrystalStats[statPosition];
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text("Stat $statPosition: "),
        SizedBox(
          width: 200,
          child: Consumer<LegionArtifactProvider>(
            builder: (context, legionArtifactProvider, child) {
              return DropdownButton(
                alignment: AlignmentDirectional.center,
                isDense: true,
                isExpanded: true,
                value: getSelectedStat(legionArtifactProvider.activeCrystalSet.getArtifactCrystal(artifactCrystalPosition)),
                onChanged: (newValue) {
                  legionArtifactProvider.updateArtifactStat(artifactCrystalPosition, statPosition, newValue);
                },
                items: getDropdownStatsList(context, legionArtifactProvider.activeCrystalSet.getArtifactCrystal(artifactCrystalPosition))
              );
            }
          ),
        ),
      ]
    );
  }
}