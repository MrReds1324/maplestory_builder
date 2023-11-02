import 'package:maplestory_builder/constants/constants.dart';
import 'package:maplestory_builder/constants/equipment/equip_constants.dart';

enum PitchedBossUpgrade {
  gravityModule(
    formattedName: "Gravity Module", 
    upgradeStats: {
      StatType.allStats: 15,
      StatType.attack: 10,
      StatType.mattack: 10,
      StatType.hp: 750,
      StatType.mp: 750,
    },
    equipName: EquipName.berserked
  ),
  nightmareFragment(
    formattedName: "Nightmare Fragment", 
    upgradeStats: {
      StatType.allStats: 20,
      StatType.attack: 10,
      StatType.mattack: 10,
      StatType.hp: 1000,
      StatType.mp: 1000,
    },
    equipName: EquipName.dreamyBelt
  )
  ;

  const PitchedBossUpgrade({
    required this.formattedName,
    required this.upgradeStats,
    required this.equipName,
  });

  final String formattedName;
  final Map<StatType, int> upgradeStats;
  final EquipName equipName;
}

bool isEquipPitchBossUpgradeable(EquipName equipName) {
  for (PitchedBossUpgrade pitchedBossUpgrade in PitchedBossUpgrade.values) {
    if (pitchedBossUpgrade.equipName == equipName) {
      return true;
    }
  }

  return false;
}