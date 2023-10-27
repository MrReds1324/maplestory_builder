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
  arcaneUmbraArcherHat(formattedName: "Arcane Umbra Archer Hat", equipType: EquipType.hat, classType: ClassType.bowman, itemLevel: 200),
  arcaneUmbraArcherSuit(formattedName: "Arcane Umbra Archer Suit", equipType: EquipType.overall, classType: ClassType.bowman, itemLevel: 200),
  arcaneUmbraArcherShoes(formattedName: "Arcane Umbra Archer Shoes", equipType: EquipType.shoes, classType: ClassType.bowman, itemLevel: 200),
  arcaneUmbraArcherGloves(formattedName: "Arcane Umbra Archer Gloves", equipType: EquipType.gloves, classType: ClassType.bowman, itemLevel: 200),
  arcaneUmbraArcherCape(formattedName: "Arcane Umbra Archer Cape", equipType: EquipType.cape, classType: ClassType.bowman, itemLevel: 200),
  arcaneUmbraArcherShoulder(formattedName: "Arcane Umbra Archer Shoulder", equipType: EquipType.shoulder, classType: ClassType.bowman, flameCategory: FlameCategory.none, itemLevel: 200),
  // Arcane Weapons
  arcaneUmbraCrossbow(formattedName: "Arcane Umbra Archer Crossbow", equipType: EquipType.weapon, classType: ClassType.bowman, itemLevel: 200),
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