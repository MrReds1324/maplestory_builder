// ignore_for_file: constant_identifier_names

import 'package:maplestory_builder/constants/constants.dart';

enum TraitName {
  ambition(formattedName: "Ambition", traitEffect: TRAIT_AMBITION_EFFECTS),
  empathy(formattedName: "Empathy", traitEffect: TRAIT_EMPATHY_EFFECTS),
  insight(formattedName: "Insight", traitEffect: TRAIT_INSIGHT_EFFECTS),
  willpower(formattedName: "Willpower", traitEffect: TRAIT_WILLPOWER_EFFECTS),
  diligence(formattedName: "Diligence", traitEffect: TRAINT_DILLIGENCE_EFFECTS),
  charm(formattedName: "Charm", traitEffect: TRAIT_CHARM_EFFECTS),
  ;

  const TraitName({
    required this.formattedName,
    required this.traitEffect,
  });

  final String formattedName;
  final Map<StatType, (num, int)> traitEffect;
}

// Declare the bonus stats from traits, they increase either every 5 or 10 levels
const Map<StatType, (num, int)> TRAIT_AMBITION_EFFECTS = {
  StatType.ignoreDefense: (0.005, 5),
};

const Map<StatType, (num, int)> TRAIT_EMPATHY_EFFECTS = {
  StatType.mp: (100, 5),
  StatType.buffDuration: (0.01, 10),
};

const Map<StatType, (num, int)> TRAIT_INSIGHT_EFFECTS = {
  StatType.ignoreElementalDefense: (0.005, 10),
};

const Map<StatType, (num, int)> TRAIT_WILLPOWER_EFFECTS = {
  StatType.hp: (100, 5),
  StatType.defense: (5, 5),
  StatType.statusResistance: (1, 5)
};

const Map<StatType, (num, int)> TRAINT_DILLIGENCE_EFFECTS = {
};

const Map<StatType, (num, int)> TRAIT_CHARM_EFFECTS = {
};