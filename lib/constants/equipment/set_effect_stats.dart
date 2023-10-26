import 'package:maplestory_builder/constants/constants.dart';
import 'package:maplestory_builder/constants/equipment/equip_constants.dart';
import 'package:maplestory_builder/modules/equipment/equip_sets_mod.dart';

enum EquipSet {
  superiorGollux(
    formattedName: "Superior Gollux Set", 
    requiredEquips: {
      EquipType.ring: SetEffectSlot(any: {EquipName.superiorGolluxRing}),
      EquipType.pendant: SetEffectSlot(any: {EquipName.superiorGolluxPendant}),
      EquipType.belt: SetEffectSlot(any: {EquipName.superiorGolluxBelt}),
      EquipType.earrings: SetEffectSlot(any: {EquipName.superiorGolluxEarrings}),
    },
    rawSetEffect: {
      2: {
        StatType.allStats: 20,
        StatType.hp: 1500,
        StatType.mp: 1500
      },
      3: {
        StatType.hpPercentage: 0.13,
        StatType.mpPercentage: 0.13,
        StatType.attack: 35,
        StatType.mattack: 35
      },
      4: {
        StatType.bossDamage: 0.3,
        StatType.ignoreDefense: 0.3,
      },
    }
  ),
  dawnBossSet(
    formattedName: "Dawn Boss Set",
    requiredEquips: {
      EquipType.face: SetEffectSlot(any: {EquipName.twilightMark}),
      EquipType.earrings: SetEffectSlot(any: {EquipName.estellaEarrings}),
      EquipType.ring: SetEffectSlot(any: {EquipName.dawnGuardianAngelRing}),
      EquipType.pendant: SetEffectSlot(any: {EquipName.daybreakPendant}),
    }, 
    rawSetEffect: {
      2: {
        StatType.allStats: 10,
        StatType.hp: 250,
        StatType.attack: 10,
        StatType.mattack: 10,
        StatType.bossDamage: 0.1,
      },
      3: {
        StatType.allStats: 10,
        StatType.hp: 250,
        StatType.attack: 10,
        StatType.mattack: 10,
      },
      4: {
        StatType.allStats: 10,
        StatType.hp: 250,
        StatType.attack: 10,
        StatType.mattack: 10,
        StatType.defense: 100,
        StatType.ignoreDefense: 0.1,
      },
    }
  ),
  eternalSetBowman(
    formattedName: "Eternal Set (Bowman)", 
    requiredEquips: {
      EquipType.hat: SetEffectSlot(any: {EquipName.eternalArcherHat}),
      EquipType.top: SetEffectSlot(any: {EquipName.eternalArcherHood}),
      EquipType.bottom: SetEffectSlot(any: {EquipName.eternalArcherPants}),
      EquipType.shoulder: SetEffectSlot(any: {EquipName.eternalArcherShoulder}),
      EquipType.weapon: SetEffectSlotChooseOne(chooseOne: {EquipName.genesisCrossbow}, choosingName: "Genesis")
    }, 
    rawSetEffect: {
      2: {
        StatType.hp: 2500,
        StatType.mp: 2500,
        StatType.attack: 40,
        StatType.mattack: 40,
        StatType.bossDamage: 0.1
      },
      3: {
        StatType.allStats: 50,
        StatType.attack: 40,
        StatType.mattack: 40,
        StatType.defense: 600,
        StatType.bossDamage: 0.1
      },
      4: {
        StatType.hpPercentage: 0.15,
        StatType.mpPercentage: 0.15,
        StatType.attack: 40,
        StatType.mattack: 40,
        StatType.bossDamage: 0.1
      },
      5: {
        StatType.attack: 40,
        StatType.mattack: 40,
        StatType.ignoreDefense: 0.2
      }
    }
  ),
  arcaneSetBowman(
    formattedName: "Arcane Umbra Set (Bowman)", 
    requiredEquips: {}, 
    rawSetEffect: {}
  ),
  ;

  const EquipSet({
    required this.formattedName,
    required this.requiredEquips,
    required this.rawSetEffect,
  });

  final String formattedName;
  final Map<EquipType, AbstractSetEffectSlot> requiredEquips;
  final Map<int, Map<StatType, num>> rawSetEffect;
}
