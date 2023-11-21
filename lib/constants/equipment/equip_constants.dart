import 'package:maplestory_builder/constants/character/classes.dart';
import 'package:maplestory_builder/constants/constants.dart';
import 'package:maplestory_builder/constants/equipment/flame_stats.dart';
import 'package:maplestory_builder/constants/equipment/potential_stats.dart';
import 'package:maplestory_builder/constants/equipment/starforce_stats.dart';

// Cannot store EquipSet here or we get a recursive compile time constant erro
enum EquipName {
  // Superior Gollux Items
  superiorGolluxRing(formattedName: "Superior Gollux Ring", equipType: EquipType.ring, flameCategory: FlameCategory.none, maxScrollsSlots: 8, isUniqueItem: true, itemLevel: 150, baseStats: {StatType.allStats: 10, StatType.hp: 250, StatType.mp: 250, StatType.attack: 8, StatType.mattack: 8, StatType.defense: 150, StatType.speed: 10}),
  superiorGolluxPendant(formattedName: "Superior Gollux Pendant", equipType: EquipType.pendant, flameCategory: FlameCategory.nonAdvantaged, maxScrollsSlots: 8, itemLevel: 150, baseStats: {StatType.allStats: 28, StatType.hp: 300, StatType.mp: 300, StatType.attack: 5, StatType.mattack: 5, StatType.defense: 100}),
  superiorGolluxBelt(formattedName: "Superior Gollux Belt", equipType: EquipType.belt, flameCategory: FlameCategory.nonAdvantaged, maxScrollsSlots: 5, itemLevel: 150, baseStats: {StatType.allStats: 60, StatType.hp: 200, StatType.mp: 200, StatType.attack: 35, StatType.mattack: 35, StatType.defense: 100}),
  superiorGolluxEarrings(formattedName: "Superior Gollux Earrings", equipType: EquipType.earrings, flameCategory: FlameCategory.nonAdvantaged, maxScrollsSlots: 9, itemLevel: 150, baseStats: {StatType.allStats: 15, StatType.hp: 150, StatType.mp: 150, StatType.attack: 10, StatType.mattack: 10, StatType.defense: 100}),
  // Dawn Boss Set Items
  dawnGuardianAngelRing(formattedName: "Dawn Guardian Angel Ring", equipType: EquipType.ring, flameCategory: FlameCategory.none, maxScrollsSlots: 4, isUniqueItem: true, itemLevel: 160, baseStats: {StatType.allStats: 5, StatType.hp: 200, StatType.mp: 200, StatType.attack: 2, StatType.mattack: 2}),
  twilightMark(formattedName: "Twilight Mark", equipType: EquipType.face, maxScrollsSlots: 8, itemLevel: 140, baseStats: {StatType.allStats: 5, StatType.attack: 5, StatType.mattack: 5, StatType.defense: 100}),
  estellaEarrings(formattedName: "Estella Earrings", equipType: EquipType.earrings, maxScrollsSlots: 5, itemLevel: 160, baseStats: {StatType.allStats: 7, StatType.hp: 300, StatType.mp: 300, StatType.attack: 2, StatType.mattack: 2, StatType.defense: 100}),
  daybreakPendant(formattedName: "Daybreak Pendant", equipType: EquipType.pendant, maxScrollsSlots: 7, isUniqueItem: true, itemLevel: 140, baseStats: {StatType.allStats: 8, StatType.hpPercentage: 0.05, StatType.attack: 2, StatType.mattack: 2, StatType.defense: 100}),
  // Eternal Bowman Set Items
  eternalArcherHat(formattedName: "Eternal Archer Hat", equipType: EquipType.hat, classType: ClassType.bowman, maxScrollsSlots: 13, itemLevel: 250, baseStats: {StatType.str: 80, StatType.dex: 80, StatType.attack: 10, StatType.defense: 750, StatType.ignoreDefense: 0.15}),
  eternalArcherHood(formattedName: "Eternal Archer Hood", equipType: EquipType.top, classType: ClassType.bowman, maxScrollsSlots: 9, itemLevel: 250, baseStats: {StatType.str: 50, StatType.dex: 50, StatType.attack: 6, StatType.defense: 325, StatType.ignoreDefense: 0.05}),
  eternalArcherPants(formattedName: "Eternal Archer Pants", equipType: EquipType.bottom, classType: ClassType.bowman, maxScrollsSlots: 9, itemLevel: 250, baseStats: {StatType.str: 50, StatType.dex: 50, StatType.attack: 6, StatType.defense: 325, StatType.ignoreDefense: 0.05}),
  eternalArcherShoulder(formattedName: "Eternal Archer Shoulder", equipType: EquipType.shoulder, classType: ClassType.bowman, maxScrollsSlots: 3, flameCategory: FlameCategory.none, itemLevel: 250, baseStats: {StatType.allStats: 51, StatType.attack: 28, StatType.mattack: 28, StatType.defense: 450}),
  // Genesis Weapons
  genesisCrossbow(formattedName: "Genesis Crossbow", equipType: EquipType.weapon, classType: ClassType.bowman, isLuckyItem: true, itemLevel: 200, starForceCategory: StarForceCategory.static, baseStats: {StatType.attackSpeed: attackSpeedNormal6, StatType.str: 150, StatType.dex: 150, StatType.attack: 326, StatType.speed: 19, StatType.bossDamage: 0.3, StatType.ignoreDefense: 0.2}),
  // Arcane Bowman Set Items
  arcaneUmbraArcherHat(formattedName: "Arcane Umbra Archer Hat", equipType: EquipType.hat, classType: ClassType.bowman, maxScrollsSlots: 13, itemLevel: 200, baseStats: {StatType.str: 65, StatType.dex: 65, StatType.attack: 7, StatType.defense: 600, StatType.ignoreDefense: 0.15}),
  arcaneUmbraArcherSuit(formattedName: "Arcane Umbra Archer Suit", equipType: EquipType.overall, classType: ClassType.bowman, maxScrollsSlots: 14, itemLevel: 200, baseStats: {StatType.str: 85, StatType.dex: 85, StatType.attack: 9, StatType.defense: 500, StatType.ignoreDefense: 0.1}),
  arcaneUmbraArcherShoes(formattedName: "Arcane Umbra Archer Shoes", equipType: EquipType.shoes, classType: ClassType.bowman, maxScrollsSlots: 9, itemLevel: 200, baseStats: {StatType.str: 40, StatType.dex: 40, StatType.attack: 9, StatType.defense: 250, StatType.speed: 10, StatType.jump: 7}),
  arcaneUmbraArcherGloves(formattedName: "Arcane Umbra Archer Gloves", equipType: EquipType.gloves, classType: ClassType.bowman, maxScrollsSlots: 9, itemLevel: 200, baseStats: {StatType.str: 40, StatType.dex: 40, StatType.allStats: 9, StatType.defense: 250}),
  arcaneUmbraArcherCape(formattedName: "Arcane Umbra Archer Cape", equipType: EquipType.cape, classType: ClassType.bowman, maxScrollsSlots: 9, itemLevel: 200, baseStats: {StatType.allStats: 35, StatType.attack: 6, StatType.mattack: 6, StatType.defense: 450}),
  arcaneUmbraArcherShoulder(formattedName: "Arcane Umbra Archer Shoulder", equipType: EquipType.shoulder, classType: ClassType.bowman, flameCategory: FlameCategory.none, maxScrollsSlots: 3, itemLevel: 200, baseStats: {StatType.allStats: 35, StatType.attack: 20, StatType.mattack: 20, StatType.defense: 300}),
  // Arcane Weapons
  arcaneUmbraCrossbow(formattedName: "Arcane Umbra Archer Crossbow", equipType: EquipType.weapon, classType: ClassType.bowman, maxScrollsSlots: 10, itemLevel: 200, baseStats: {StatType.attackSpeed: attackSpeedNormal6, StatType.str: 100, StatType.dex: 100, StatType.attack: 283, StatType.speed: 19, StatType.bossDamage: 0.3, StatType.ignoreDefense: 0.2}),
  // Pitched Boss Set Items
  blackHeart(formattedName: "Black Heart", equipType: EquipType.heart, itemLevel: 120, flameCategory: FlameCategory.none, potentialCategory: PotentialCategory.static, baseStats: {StatType.allStats: 10, StatType.hp: 100, StatType.attack: 77, StatType.mattack: 77}),
  berserked(formattedName: "Berserked", equipType: EquipType.face, itemLevel: 160, maxScrollsSlots: 7, baseStats: {StatType.allStats: 10, StatType.attack: 10, StatType.mattack: 10, StatType.defense: 200}),
  magicEyepatch(formattedName: "Magic Eyepatch", equipType: EquipType.eye, itemLevel: 160, maxScrollsSlots: 5, baseStats: {StatType.allStats: 15, StatType.attack: 3, StatType.mattack: 3, StatType.defense: 300}),
  sourceOfSuffering(formattedName: "Source of Suffering", equipType: EquipType.pendant, itemLevel: 160, maxScrollsSlots: 7, baseStats: {StatType.allStats: 10, StatType.hpPercentage: 0.05, StatType.attack: 3, StatType.mattack: 3, StatType.defense: 200}),
  cursedRedSpellbook(formattedName: "Cursed Red Spellbook", equipType: EquipType.pocket, itemLevel: 160, starForceCategory: StarForceCategory.none, potentialCategory: PotentialCategory.none, baseStats: {StatType.allStats: 10, StatType.str: 10, StatType.attack: 10, StatType.mattack: 10, StatType.hp: 100, StatType.mp: 100}),
  cursedGreenSpellbook(formattedName: "Cursed Green Spellbook", equipType: EquipType.pocket, itemLevel: 160, starForceCategory: StarForceCategory.none, potentialCategory: PotentialCategory.none, baseStats: {StatType.allStats: 10, StatType.dex: 10, StatType.attack: 10, StatType.mattack: 10, StatType.hp: 100, StatType.mp: 100}),
  cursedBlueSpellbook(formattedName: "Cursed Blue Spellbook", equipType: EquipType.pocket, itemLevel: 160, starForceCategory: StarForceCategory.none, potentialCategory: PotentialCategory.none, baseStats: {StatType.allStats: 10, StatType.int: 10, StatType.attack: 10, StatType.mattack: 10, StatType.hp: 100, StatType.mp: 100}),
  cursedYellowSpellbook(formattedName: "Cursed Yellow Spellbook", equipType: EquipType.pocket, itemLevel: 160, starForceCategory: StarForceCategory.none, potentialCategory: PotentialCategory.none, baseStats: {StatType.allStats: 10, StatType.luk: 10, StatType.attack: 10, StatType.mattack: 10, StatType.hp: 100, StatType.mp: 100}),
  commandingForceEarring(formattedName: "Commanding Force Earrings", equipType: EquipType.earrings, itemLevel: 200, maxScrollsSlots: 8, baseStats: {StatType.allStats: 7, StatType.attack: 5, StatType.mattack: 5, StatType.hp: 500, StatType.mp: 500, StatType.defense: 100}),
  endlessTerror(formattedName: "Endless Terror", equipType: EquipType.ring, itemLevel: 200, maxScrollsSlots: 4, baseStats: {StatType.allStats: 5, StatType.attack: 4, StatType.mattack: 4, StatType.hp: 250, StatType.mp: 250}),
  dreamyBelt(formattedName: "Dreamy Belt", equipType: EquipType.belt, itemLevel: 200, maxScrollsSlots: 5, baseStats: {StatType.allStats: 50, StatType.attack: 6, StatType.mattack: 6, StatType.hp: 150, StatType.mp: 150, StatType.defense: 150}),
  genesisBadge(formattedName: "Genesis Badge", equipType: EquipType.badge, itemLevel: 200, starForceCategory: StarForceCategory.none, potentialCategory: PotentialCategory.none, flameCategory: FlameCategory.none, baseStats: {StatType.allStats: 15, StatType.attack: 10, StatType.mattack: 10, StatType.speed: 10, StatType.jump: 10}),
  mitrasRageWarrior(formattedName: "Mitra's Rage: Warrior", equipType: EquipType.emblem, classType: ClassType.warrior, itemLevel: 200, starForceCategory: StarForceCategory.none, potentialCategory: PotentialCategory.none, flameCategory: FlameCategory.none, baseStats: {StatType.str: 40, StatType.dex: 40, StatType.attack: 5, StatType.mattack: 5, StatType.hp: 700}),
  mitrasRageBowman(formattedName: "Mitra's Rage: Bowman", equipType: EquipType.emblem, classType: ClassType.bowman, itemLevel: 200, starForceCategory: StarForceCategory.none, potentialCategory: PotentialCategory.none, flameCategory: FlameCategory.none, baseStats: {StatType.str: 40, StatType.dex: 40, StatType.attack: 5, StatType.mattack: 5}),
  mitrasRagePirate(formattedName: "Mitra's Rage: Pirate", equipType: EquipType.emblem, classType: ClassType.pirate, itemLevel: 200, starForceCategory: StarForceCategory.none, potentialCategory: PotentialCategory.none, flameCategory: FlameCategory.none, baseStats: {StatType.str: 40, StatType.dex: 40, StatType.attack: 5, StatType.mattack: 5}),
  mitrasRageMagician(formattedName: "Mitra's Rage: Magician", equipType: EquipType.emblem, classType: ClassType.magician, itemLevel: 200, starForceCategory: StarForceCategory.none, potentialCategory: PotentialCategory.none, flameCategory: FlameCategory.none, baseStats: {StatType.int: 40, StatType.luk: 40, StatType.attack: 5, StatType.mattack: 5}),
  mitrasRageThief(formattedName: "Mitra's Rage: Thief", equipType: EquipType.emblem, classType: ClassType.thief, itemLevel: 200, starForceCategory: StarForceCategory.none, potentialCategory: PotentialCategory.none, flameCategory: FlameCategory.none, baseStats: {StatType.dex: 40, StatType.luk: 40, StatType.attack: 5, StatType.mattack: 5}),
;

  const EquipName({
    required this.formattedName,
    required this.equipType,
    this.classType = ClassType.all,
    this.flameCategory = FlameCategory.advantaged,
    this.potentialCategory = PotentialCategory.player,
    this.starForceCategory = StarForceCategory.player,
    this.isUniqueItem = false,
    this.isLuckyItem = false,
    this.itemLevel = 0,
    this.maxScrollsSlots = 0,
    this.baseStats = const {},
  });

  final String formattedName;
  final EquipType equipType;
  final ClassType classType;
  final FlameCategory flameCategory;
  final PotentialCategory potentialCategory;
  final StarForceCategory starForceCategory;
  final bool isUniqueItem;
  final bool isLuckyItem;
  final int itemLevel;
  final int maxScrollsSlots;
  final Map<StatType, num> baseStats;
}