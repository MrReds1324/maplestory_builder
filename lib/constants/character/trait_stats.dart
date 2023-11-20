import 'package:maplestory_builder/constants/constants.dart';

enum TraitName {
  ambition(formattedName: "Ambition", traitEffect: ambitionEffects),
  empathy(formattedName: "Empathy", traitEffect: empathyEffects),
  insight(formattedName: "Insight", traitEffect: insightEffects),
  willpower(formattedName: "Willpower", traitEffect: willpowerEffects),
  diligence(formattedName: "Diligence", traitEffect: diligenceEffects),
  charm(formattedName: "Charm", traitEffect: charmEffects),
  ;

  const TraitName({
    required this.formattedName,
    required this.traitEffect,
  });

  final String formattedName;
  final Map<StatType, (num, int)> traitEffect;
}

// Declare the bonus stats from traits, they increase either every 5 or 10 levels
const Map<StatType, (num, int)> ambitionEffects = {
  StatType.ignoreDefense: (0.005, 5),
};

const Map<StatType, (num, int)> empathyEffects = {
  StatType.mp: (100, 5),
  StatType.buffDuration: (0.01, 10),
};

const Map<StatType, (num, int)> insightEffects = {
  StatType.ignoreElementalDefense: (0.005, 10),
};

const Map<StatType, (num, int)> willpowerEffects = {
  StatType.hp: (100, 5),
  StatType.defense: (5, 5),
  StatType.statusResistance: (1, 5)
};

const Map<StatType, (num, int)> diligenceEffects = {
};

const Map<StatType, (num, int)> charmEffects = {
};