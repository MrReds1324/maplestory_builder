import 'package:maplestory_builder/constants/constants.dart';
import 'package:maplestory_builder/constants/equipment/equip_constants.dart';

enum PitchedBossUpgrade {
  gravityModule(
      formattedName: "Gravity Module",
      upgradeStats: {
        StatType.allStats: 15,
        StatType.attackMattack: 10,
        StatType.hpMp: 750,
      },
      equipName: EquipName.berserked),
  nightmareFragment(
      formattedName: "Nightmare Fragment",
      upgradeStats: {
        StatType.allStats: 20,
        StatType.attackMattack: 10,
        StatType.hpMp: 1000,
      },
      equipName: EquipName.dreamyBelt);

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
