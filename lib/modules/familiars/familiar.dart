import 'package:flutter/material.dart';
import 'package:maplestory_builder/constants/constants.dart';
import 'package:maplestory_builder/constants/familiars/potential_stats.dart';
import 'package:maplestory_builder/modules/base.dart';
import 'package:maplestory_builder/modules/utilities/utilities.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class Familiar implements Copyable {
  
  FamiliarPotentialTier? potentialTier;
  Map<int, FamiliarPotentialLine> potentials;
  String familiarName;
  int familiarHash;

  Familiar({
    this.potentialTier,
    Map<int, FamiliarPotentialLine>? potentials,
    Map<StatType, num>? moduleStats,
    this.familiarName = "",
    this.familiarHash = -1
  }): potentials = potentials ?? {
    1: FamiliarPotentialLine(),
    2: FamiliarPotentialLine()
  };

  @override
  Familiar copyWith({
    FamiliarPotentialTier? potentialTier,
    Map<int, FamiliarPotentialLine>? potentials,
    String? familiarName,
    int? familiarHash,
  }) {
    return Familiar(
      potentialTier: potentialTier ?? this.potentialTier,
      potentials: potentials ?? mapDeepCopy(this.potentials),
      familiarName: familiarName ?? this.familiarName,
      familiarHash: familiarHash ?? this.familiarHash
    );
  }

  Map<StatType, num> calculateStats() {
    return {};
  }

  void updatePotentialTier(FamiliarPotentialTier? familiarPotentialTier) {
    if (potentialTier != familiarPotentialTier) {
      for (FamiliarPotentialLine potentialLine in potentials.values) {
        potentialLine.reset();
      }
      potentialTier = familiarPotentialTier;
    }

    calculateStats();
  }

  bool updatePotentialSelection(int potentialPosition, (FamiliarPotential, bool)? familiarPotentialSelection) {
    if (familiarPotentialSelection?.$1 == potentials[potentialPosition]?.familiarPotential) {
      return false;
    }

    var targetPotentialLine = potentials[potentialPosition]!; 
    targetPotentialLine.familiarPotential = familiarPotentialSelection?.$1;
    targetPotentialLine.isPrime = familiarPotentialSelection?.$2 ?? false;
    targetPotentialLine.familiarPotentialOffset = 0;

    calculateStats();
    return true;
  }

  void updatePotential(int potentialPosition, int familiarPotentialOffset) {
    potentials[potentialPosition]!.familiarPotentialOffset = familiarPotentialOffset;

    calculateStats();
  }

  List<(FamiliarPotential, bool)> getPotentialsList(int potentialPosition) {
    List<(FamiliarPotential, bool)> possibleSelection = [];
    var previousPotentialTier = potentialTier?.getPreviousTier();
    
    for (FamiliarPotential familiarPotential in FamiliarPotential.values) {
      if (familiarPotential.familiarPotentialTier == potentialTier) {
        possibleSelection.add((familiarPotential, true));
      }
      else if (potentialPosition == 2 && familiarPotential.familiarPotentialTier == previousPotentialTier) {
        possibleSelection.add((familiarPotential, false));
      }
    }

    return possibleSelection;
  }

  Widget createFamiliarContainer(BuildContext context, {bool isFamiliarEditing = false}) {
    return Container(
      width: 300,
      padding: const EdgeInsets.all(2.5),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
            child: Text(
              familiarName, 
              style: Theme.of(context).textTheme.headlineSmall,
            )
          ),
          Center(
            child: Icon(
              MdiIcons.cardAccountDetailsStar,
              size: 100,
              color: potentialTier?.color ?? Colors.redAccent,
            ),
          ),
          isFamiliarEditing ? const SizedBox.shrink() : _buildPotentialWidget(context),
        ],
      ),
    );
  }

  Widget _buildPotentialWidget(BuildContext context) {
    List<Widget> childrenWidgets = [];

    void addPotentialLine(FamiliarPotentialLine familiarPotentialLine) {
      if (familiarPotentialLine.familiarPotential != null) {
        var valueToDisplay = familiarPotentialLine.familiarPotential!.statValue[familiarPotentialLine.familiarPotentialOffset];
        var statType = familiarPotentialLine.familiarPotential!.statType;

        childrenWidgets.add(
          RichText(
            text: TextSpan(
              children: [
                TextSpan(
                  text: familiarPotentialLine.familiarPotential!.formattedName ?? "${statType.formattedName} +${statType.isPercentage ? doubleRoundPercentFormater.format(valueToDisplay) : valueToDisplay}",
                  style: Theme.of(context).textTheme.bodyMedium
                ),
                TextSpan(
                  text: familiarPotentialLine.isPrime ? "  (Prime)" : "",
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(color: starColor),
                ),
              ]
            )
          ),
        );
      }
    }

    if (potentialTier != null) {
      childrenWidgets.add(
        RichText(
          text: TextSpan(
            children: [
              TextSpan(
                text: "Potential (${potentialTier!.formattedName})",
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(color: potentialTier!.color)
              )
            ]
          )
        )
      );
      for (FamiliarPotentialLine familiarPotentialLine in potentials.values) {
        addPotentialLine(familiarPotentialLine);
      }
    }

    return Container(
      padding: const EdgeInsets.only(top: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: childrenWidgets
      ),
    );
  }
}

class FamiliarPotentialLine implements Copyable {
  FamiliarPotential? familiarPotential;
  int familiarPotentialOffset;
  bool isPrime;

  FamiliarPotentialLine({
    this.familiarPotential,
    this.familiarPotentialOffset = 0,
    this.isPrime = false
  });

  @override
  FamiliarPotentialLine copyWith({
    FamiliarPotential? familiarPotential,
    int? familiarPotentialOffset,
    bool? isPrime,
  }) {
    return FamiliarPotentialLine(
      familiarPotential: familiarPotential ?? this.familiarPotential,
      familiarPotentialOffset: familiarPotentialOffset ?? this.familiarPotentialOffset,
      isPrime: isPrime ?? this.isPrime,
    );
  }

  void reset() {
    familiarPotential = null;
    isPrime = false;
    familiarPotentialOffset = 0;
  }
}