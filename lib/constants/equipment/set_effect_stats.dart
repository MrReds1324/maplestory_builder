import 'package:maplestory_builder/constants/constants.dart';
import 'package:maplestory_builder/constants/equipment/equip_constants.dart';
import 'package:maplestory_builder/modules/equipment/equip_sets_mod.dart';

enum EquipSet {
  superiorGollux(
    formattedName: "Superior Gollux Set", 
    requiredEquips: {
      EquipType.ring: SetEffectSlot(equipType: EquipType.ring, any: {EquipName.superiorGolluxRing}),
      EquipType.pendant: SetEffectSlot(equipType: EquipType.pendant, any: {EquipName.superiorGolluxPendant}),
      EquipType.belt: SetEffectSlot(equipType: EquipType.belt, any: {EquipName.superiorGolluxBelt}),
      EquipType.earrings: SetEffectSlot(equipType: EquipType.earrings, any: {EquipName.superiorGolluxEarrings}),
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
      EquipType.face: SetEffectSlot(equipType: EquipType.face, any: {EquipName.twilightMark}),
      EquipType.earrings: SetEffectSlot(equipType: EquipType.earrings, any: {EquipName.estellaEarrings}),
      EquipType.ring: SetEffectSlot(equipType: EquipType.ring, any: {EquipName.dawnGuardianAngelRing}),
      EquipType.pendant: SetEffectSlot(equipType: EquipType.pendant, any: {EquipName.daybreakPendant}),
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
      EquipType.hat: SetEffectSlot(equipType: EquipType.hat, any: {EquipName.eternalArcherHat}),
      EquipType.top: SetEffectSlot(equipType: EquipType.top, any: {EquipName.eternalArcherHood}),
      EquipType.bottom: SetEffectSlot(equipType: EquipType.bottom, any: {EquipName.eternalArcherPants}),
      EquipType.shoulder: SetEffectSlot(equipType: EquipType.shoulder, any: {EquipName.eternalArcherShoulder}),
      EquipType.weapon: SetEffectSlotSelectOne(equipType: EquipType.weapon, selectOne: {EquipName.genesisCrossbow}, selectString: "Genesis Weapon")
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
    requiredEquips: {
      EquipType.hat: SetEffectSlot(equipType: EquipType.hat, any: {EquipName.arcaneUmbraArcherHat}),
      EquipType.overall: SetEffectSlot(equipType: EquipType.overall, any: {EquipName.arcaneUmbraArcherSuit}),
      EquipType.shoes: SetEffectSlot(equipType: EquipType.shoes, any: {EquipName.arcaneUmbraArcherShoes}),
      EquipType.shoulder: SetEffectSlot(equipType: EquipType.shoulder, any: {EquipName.arcaneUmbraArcherShoulder}),
      EquipType.gloves: SetEffectSlot(equipType: EquipType.gloves, any: {EquipName.arcaneUmbraArcherGloves}),
      EquipType.cape: SetEffectSlot(equipType: EquipType.cape, any: {EquipName.arcaneUmbraArcherCape}),
      EquipType.weapon: SetEffectSlotSelectOne(equipType: EquipType.weapon, selectOne: {EquipName.arcaneUmbraCrossbow}, selectString: "Arcane Umbra Weapon"),
    }, 
    rawSetEffect: {
      2: {
        StatType.attack: 30,
        StatType.mattack: 30,
        StatType.bossDamage: 0.1,
      },
      3: {
        StatType.attack: 30,
        StatType.mattack: 30,
        StatType.defense: 400,
        StatType.ignoreDefense: 0.1,
      },
      4: {
        StatType.allStats: 50,
        StatType.attack: 35,
        StatType.mattack: 35,
        StatType.bossDamage: 0.1,
      },
      5: {
        StatType.hp: 2000,
        StatType.mp: 2000,
        StatType.attack: 40,
        StatType.mattack: 40,
        StatType.bossDamage: 0.1,
      },
      6: {
        StatType.hpPercentage: 0.3,
        StatType.mpPercentage: 0.3,
        StatType.attack: 30,
        StatType.mattack: 30,
      },
      7: {
        StatType.attack: 30,
        StatType.mattack: 30,
        StatType.ignoreDefense: 0.1,
      },
    }
  ),
  pitchedBoss(
    formattedName: "Pitched Boss Set",
    requiredEquips: {
      EquipType.heart: SetEffectSlot(equipType: EquipType.heart, any: {EquipName.blackHeart}),
      EquipType.face: SetEffectSlot(equipType: EquipType.face, any: {EquipName.berserked}),
      EquipType.eye: SetEffectSlot(equipType: EquipType.eye, any: {EquipName.magicEyepatch}),
      EquipType.pendant: SetEffectSlot(equipType: EquipType.pendant, any: {EquipName.sourceOfSuffering}),
      EquipType.pocket: SetEffectSlotSelectOne(equipType: EquipType.pocket, selectOne: {EquipName.cursedBlueSpellbook, EquipName.cursedGreenSpellbook,EquipName.cursedRedSpellbook,EquipName.cursedYellowSpellbook,}, selectString: "Cursed Spellbook"),
      EquipType.earrings: SetEffectSlot(equipType: EquipType.earrings, any: {EquipName.commandingForceEarring}),
      EquipType.ring: SetEffectSlot(equipType: EquipType.ring, any: {EquipName.endlessTerror}),
      EquipType.belt: SetEffectSlot(equipType: EquipType.belt, any: {EquipName.dreamyBelt}),
      EquipType.badge: SetEffectSlot(equipType: EquipType.badge, any: {EquipName.genesisBadge}),
      EquipType.emblem: SetEffectSlotSelectOne(equipType: EquipType.emblem, selectOne: {EquipName.mitrasRageWarrior, EquipName.mitrasRageBowman, EquipName.mitrasRagePirate, EquipName.mitrasRageMagician, EquipName.mitrasRageThief}, selectString: "Mitra's Rage")
    },
    rawSetEffect: {
      2: {
        StatType.allStats: 10,
        StatType.hp: 250,
        StatType.attack: 10,
        StatType.mattack: 10,
        StatType.bossDamage: 0.1
      },
      3: {
        StatType.allStats: 10,
        StatType.hp: 250,
        StatType.attack: 10,
        StatType.mattack: 10,
        StatType.defense: 250,
        StatType.ignoreDefense: 0.1
      },
      4: {
        StatType.allStats: 15,
        StatType.hp: 375,
        StatType.attack: 15,
        StatType.mattack: 15,
        StatType.critDamage: 0.05
      },
      5: {
        StatType.allStats: 15,
        StatType.hp: 375,
        StatType.attack: 15,
        StatType.mattack: 15,
        StatType.ignoreDefense: 0.1
      },
      6: {
        StatType.allStats: 15,
        StatType.hp: 375,
        StatType.attack: 15,
        StatType.mattack: 15,
        StatType.ignoreDefense: 0.1
      },
      7: {
        StatType.allStats: 15,
        StatType.hp: 375,
        StatType.attack: 15,
        StatType.mattack: 15,
        StatType.critDamage: 0.05
      },
      8: {
        StatType.allStats: 15,
        StatType.hp: 375,
        StatType.attack: 15,
        StatType.mattack: 15,
        StatType.bossDamage: 0.1
      },
      9: {
        StatType.allStats: 15,
        StatType.hp: 375,
        StatType.attack: 15,
        StatType.mattack: 15,
        StatType.critDamage: 0.05
      },
    }
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
