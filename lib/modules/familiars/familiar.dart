import 'package:maplestory_builder/constants/constants.dart';
import 'package:maplestory_builder/constants/familiars/potential_stats.dart';
import 'package:maplestory_builder/modules/base.dart';

class Familiar implements Copyable {
  
  FamiliarPotentialTier? potentialTier;
  Map<int, FamiliarPotentialLine?> potentials;
  int familiarHash;

  Familiar({
    this.potentialTier,
    Map<int, FamiliarPotentialLine?>? potentials,
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
      potentials = {};
      potentialTier = familiarPotentialTier;
    }

    calculateStats();
  }

  void updatePotential(int potentialPosition, FamiliarPotential? familiarPotential, {bool isBonus=false}) {
    potentials[potentialPosition]!.familiarPotential = familiarPotential;

    calculateStats();
  }
}

class FamiliarPotentialLine implements Copyable {
  FamiliarPotential? familiarPotential;
  int familiarPotentialOffset;

  FamiliarPotentialLine({
    this.familiarPotential,
    this.familiarPotentialOffset = 0
  });

  @override
  FamiliarPotentialLine copyWith({
    FamiliarPotential? familiarPotential,
    int? familiarPotentialOffset
  }) {
    return FamiliarPotentialLine(
      familiarPotential: familiarPotential ?? this.familiarPotential,
      familiarPotentialOffset: familiarPotentialOffset ?? this.familiarPotentialOffset
    );
  }
}