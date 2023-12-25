import 'package:maplestory_builder/constants/constants.dart';
import 'package:maplestory_builder/constants/familiars/potential_stats.dart';
import 'package:maplestory_builder/modules/base.dart';

class Familiar implements Copyable {
  
  FamiliarPotentialTier? potentialTier;
  Map<int, FamiliarPotentialLine> potentials;
  int familiarHash;

  Familiar({
    this.potentialTier,
    Map<int, FamiliarPotentialLine>? potentials,
    Map<StatType, num>? moduleStats,
    this.familiarHash = -1
  }): potentials = potentials ?? {
    1: FamiliarPotentialLine(),
    2: FamiliarPotentialLine()
  };

  @override
  Familiar copyWith({
    int? familiarHash
  }) {
    return Familiar(
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