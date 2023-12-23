import 'package:maplestory_builder/constants/legion/legion_stats.dart';
import 'package:maplestory_builder/constants/constants.dart';

enum ClassType {
  all(formattedName: "All"),
  warrior(formattedName: "Warrior"),
  magician(formattedName: "Magician"),
  bowman(formattedName: "Bowman"),
  thief(formattedName: "Thief"),
  pirate(formattedName: "Pirate"),
  xenon(formattedName: "Pirate & Thief");

  const ClassType({
    required this.formattedName
  });

  final String formattedName;
}

enum CharacterClass {
  beginner(
    formattedName: "Beginner", 
    classCategory: CharacterClassCategory.beginner, 
    calculationStats: {StatType.str: StatCategory.primary}, 
    classType: ClassType.all,
    legionBlock: LegionBlock.nothing,
  ),
  adele(
    formattedName: "Adele", 
    classCategory: CharacterClassCategory.flora, 
    calculationStats: warriorStats, 
    classType: ClassType.warrior,
    legionBlock: LegionBlock.adele,
  ),
  angelicBuster(
    formattedName: "Angelic Buster", 
    classCategory: CharacterClassCategory.nova, 
    calculationStats: pirateDexStats, 
    classType: ClassType.pirate,
    legionBlock: LegionBlock.angelicBuster,
  ),
  aran(
    formattedName: "Aran", 
    classCategory: CharacterClassCategory.heroes, 
    calculationStats: warriorStats, 
    classType: ClassType.warrior,
    legionBlock: LegionBlock.aran,
  ),
  ark(
    formattedName: "Ark", 
    classCategory: CharacterClassCategory.flora, 
    calculationStats: pirateStrStats, 
    classType: ClassType.pirate,
    legionBlock: LegionBlock.ark,
  ),
  battleMage(
    formattedName: "Battle Mage", 
    classCategory: CharacterClassCategory.resistance, 
    calculationStats: magicianStats, 
    classType: ClassType.magician,
    legionBlock: LegionBlock.battleMage,
  ),
  beastTamer(
    formattedName: "Beast Tamer", 
    classCategory: CharacterClassCategory.other, 
    calculationStats: magicianStats, 
    classType: ClassType.magician,
    legionBlock: LegionBlock.beastTamer,
  ),
  bishop(
    formattedName: "Bishop", 
    classCategory: CharacterClassCategory.explorers, 
    calculationStats: magicianStats, 
    classType: ClassType.magician,
    legionBlock: LegionBlock.bishop,
  ),
  blaster(
    formattedName: "Blaster", 
    classCategory: CharacterClassCategory.resistance, 
    calculationStats: warriorStats, 
    classType: ClassType.warrior,
    legionBlock: LegionBlock.blaster,
  ),
  blazeWizard(
    formattedName: "Blaze Wizard", 
    classCategory: CharacterClassCategory.cygnusKnights, 
    calculationStats: magicianStats, 
    classType: ClassType.magician,
    legionBlock: LegionBlock.blazeWizard,
  ),
  bowmaster(
    formattedName: "Bowmaster", 
    classCategory: CharacterClassCategory.explorers, 
    calculationStats: bowmanStats, 
    classType: ClassType.bowman,
    legionBlock: LegionBlock.bowmaster,
  ),
  buccaneer(
    formattedName: "Buccaneer", 
    classCategory: CharacterClassCategory.explorers, 
    calculationStats: pirateStrStats, 
    classType: ClassType.pirate,
    legionBlock: LegionBlock.buccaneer,
  ),
  cadena(
    formattedName: "Cadena", 
    classCategory: CharacterClassCategory.nova, 
    calculationStats: shadowerDualBladeCadenaStats, 
    classType: ClassType.thief,
    legionBlock: LegionBlock.cadena,
  ),
  canoneer(
    formattedName: "Canoneer", 
    classCategory: CharacterClassCategory.explorers, 
    calculationStats: pirateStrStats, 
    classType: ClassType.pirate,
    legionBlock: LegionBlock.canoneer,
  ),
  corsair(
    formattedName: "Corsair", 
    classCategory: CharacterClassCategory.explorers, 
    calculationStats: pirateDexStats, 
    classType: ClassType.pirate,
    legionBlock: LegionBlock.corsair,
  ),
  darkKnight(
    formattedName: "Dark Knight", 
    classCategory: CharacterClassCategory.explorers, 
    calculationStats: warriorStats, 
    classType: ClassType.warrior,
    legionBlock: LegionBlock.darkKnight,
  ),
  dawnWarrior(
    formattedName: "Dawn Warrior", 
    classCategory: CharacterClassCategory.cygnusKnights, 
    calculationStats: warriorStats, 
    classType: ClassType.warrior,
    legionBlock: LegionBlock.dawnWarrior,
  ),
  demonAvenger(
    formattedName: "Demon Avenger", 
    classCategory: CharacterClassCategory.resistance, 
    calculationStats: demonAvengerStats, 
    classType: ClassType.warrior,
    legionBlock: LegionBlock.demonAvenger,
  ),
  demonSlayer(
    formattedName: "Demon Slayer", 
    classCategory: CharacterClassCategory.resistance, 
    calculationStats: warriorStats, 
    classType: ClassType.warrior,
    legionBlock: LegionBlock.demonSlayer,
  ),
  dualBlade(
    formattedName: "Dual Blade", 
    classCategory: CharacterClassCategory.explorers, 
    calculationStats: shadowerDualBladeCadenaStats, 
    classType: ClassType.thief,
    legionBlock: LegionBlock.dualBlade,
  ),
  evan(
    formattedName: "Evan", 
    classCategory: CharacterClassCategory.heroes, 
    calculationStats: magicianStats, 
    classType: ClassType.magician,
    legionBlock: LegionBlock.evan,
  ),
  firePoisonMage(
    formattedName: "Fire Poison Mage", 
    classCategory: CharacterClassCategory.explorers, 
    calculationStats: magicianStats, 
    classType: ClassType.magician,
    legionBlock: LegionBlock.firePoisonMage,
  ),
  hayato(
    formattedName: "Hayato", 
    classCategory: CharacterClassCategory.sengoku, 
    calculationStats: warriorStats, 
    classType: ClassType.warrior,
    legionBlock: LegionBlock.hayato,
  ),
  hero(
    formattedName: "Hero", 
    classCategory: CharacterClassCategory.explorers, 
    calculationStats: warriorStats, 
    classType: ClassType.warrior,
    legionBlock: LegionBlock.hero,
  ),
  hoyoung(
    formattedName: "Hoyoung", 
    classCategory: CharacterClassCategory.anima, 
    calculationStats: thiefStats, 
    classType: ClassType.thief,
    legionBlock: LegionBlock.hoyoung,
  ),
  iceLightningMage(
    formattedName: "Ice Lightning Mage", 
    classCategory: CharacterClassCategory.explorers, 
    calculationStats: magicianStats, 
    classType: ClassType.magician,
    legionBlock: LegionBlock.iceLightningMage,
  ),
  illium(
    formattedName: "Illium", 
    classCategory: CharacterClassCategory.flora, 
    calculationStats: magicianStats, 
    classType: ClassType.magician,
    legionBlock: LegionBlock.illium,
  ),
  kain(
    formattedName: "Kain", 
    classCategory: CharacterClassCategory.nova, 
    calculationStats: bowmanStats, 
    classType: ClassType.bowman,
    legionBlock: LegionBlock.kain,
  ),
  kaiser(
    formattedName: "Kaiser", 
    classCategory: CharacterClassCategory.nova, 
    calculationStats: warriorStats, 
    classType: ClassType.warrior,
    legionBlock: LegionBlock.kaiser,
  ),
  kanna(
    formattedName: "Kanna", 
    classCategory: CharacterClassCategory.sengoku, 
    calculationStats: magicianStats, 
    classType: ClassType.magician,
    legionBlock: LegionBlock.kanna,
  ),
  khali(
    formattedName: "Khali", 
    classCategory: CharacterClassCategory.flora, 
    calculationStats: thiefStats, 
    classType: ClassType.thief,
    legionBlock: LegionBlock.khali,
  ),
  kinesis(
    formattedName: "Kinesis", 
    classCategory: CharacterClassCategory.other, 
    calculationStats: magicianStats, 
    classType: ClassType.magician,
    legionBlock: LegionBlock.kinesis,
  ),
  lara(
    formattedName: "Lara", 
    classCategory: CharacterClassCategory.anima, 
    calculationStats: magicianStats, 
    classType: ClassType.magician,
    legionBlock: LegionBlock.lara,
  ),
  luminous(
    formattedName: "Luminous", 
    classCategory: CharacterClassCategory.heroes, 
    calculationStats: magicianStats, 
    classType: ClassType.magician,
    legionBlock: LegionBlock.luminous,
  ),
  marksman(
    formattedName: "Marksman", 
    classCategory: CharacterClassCategory.explorers, 
    calculationStats: bowmanStats, 
    classType: ClassType.bowman,
    legionBlock: LegionBlock.marksman,
  ),
  mechanic(
    formattedName: "Mechanic", 
    classCategory: CharacterClassCategory.resistance, 
    calculationStats: pirateDexStats, 
    classType: ClassType.pirate,
    legionBlock: LegionBlock.mechanic,
  ),
  mercedes(
    formattedName: "Mercedes", 
    classCategory: CharacterClassCategory.heroes, 
    calculationStats: bowmanStats, 
    classType: ClassType.bowman,
    legionBlock: LegionBlock.mercedes,
  ),
  mihile(
    formattedName: "Mihile", 
    classCategory: CharacterClassCategory.cygnusKnights, 
    calculationStats: warriorStats, 
    classType: ClassType.warrior,
    legionBlock: LegionBlock.mihile,
  ),
  nightLord(
    formattedName: "Night Lord", 
    classCategory: CharacterClassCategory.explorers, 
    calculationStats: thiefStats, 
    classType: ClassType.thief,
    legionBlock: LegionBlock.nightLord,
  ),
  nightWalker(
    formattedName: "Night Walker", 
    classCategory: CharacterClassCategory.cygnusKnights, 
    calculationStats: thiefStats, 
    classType: ClassType.thief,
    legionBlock: LegionBlock.nightWalker,
  ),
  paladin(
    formattedName: "Paladin", 
    classCategory: CharacterClassCategory.explorers, 
    calculationStats: warriorStats, 
    classType: ClassType.warrior,
    legionBlock: LegionBlock.paladin,
  ),
  pathfinder(
    formattedName: "Pathfinder", 
    classCategory: CharacterClassCategory.explorers, 
    calculationStats: bowmanStats, 
    classType: ClassType.bowman,
    legionBlock: LegionBlock.pathfinder,
  ),
  phantom(
    formattedName: "Phantom", 
    classCategory: CharacterClassCategory.heroes, 
    calculationStats: thiefStats, 
    classType: ClassType.thief,
    legionBlock: LegionBlock.phantom,
  ),
  shade(
    formattedName: "Shade", 
    classCategory: CharacterClassCategory.heroes, 
    calculationStats: pirateStrStats, 
    classType: ClassType.pirate,
    legionBlock: LegionBlock.shade,
  ),
  shadower(
    formattedName: "Shadower", 
    classCategory: CharacterClassCategory.explorers, 
    calculationStats: shadowerDualBladeCadenaStats, 
    classType: ClassType.thief,
    legionBlock: LegionBlock.shadower,
  ),
  thunderBreaker(
    formattedName: "Thunder Breaker", 
    classCategory: CharacterClassCategory.cygnusKnights, 
    calculationStats: pirateStrStats, 
    classType: ClassType.pirate,
    legionBlock: LegionBlock.thunderBreaker,
  ),
  wildHunter(
    formattedName: "Wild Hunter", 
    classCategory: CharacterClassCategory.resistance, 
    calculationStats: bowmanStats, 
    classType: ClassType.bowman,
    legionBlock: LegionBlock.wildHunter,
  ),
  windArcher(
    formattedName: "Wind Archer", 
    classCategory: CharacterClassCategory.cygnusKnights, 
    calculationStats: bowmanStats, 
    classType: ClassType.bowman,
    legionBlock: LegionBlock.windArcher,
  ),
  xenon(
    formattedName: "Xenon", 
    classCategory: CharacterClassCategory.resistance, 
    calculationStats: xenonStats, 
    classType: ClassType.xenon,
    legionBlock: LegionBlock.xenon,
  ),
  zero(
    formattedName: "Zero", 
    classCategory: CharacterClassCategory.other, 
    calculationStats: warriorStats, 
    classType: ClassType.warrior,
    legionBlock: LegionBlock.zero,
  ),
  ;

  const CharacterClass({
    required this.formattedName,
    required this.classCategory,
    required this.calculationStats,
    required this.classType,
    required this.legionBlock,
  });

  final String formattedName;
  final CharacterClassCategory classCategory;
  final Map<StatType, StatCategory> calculationStats;
  final ClassType classType;
  final LegionBlock legionBlock;
}

enum CharacterClassCategory {
  anima(formattedName: "Anima"),
  beginner(formattedName: "Beginner"),
  cygnusKnights(formattedName: "Cygnus Knights"),
  explorers(formattedName: "Explorers"),
  flora(formattedName: "Flora"),
  heroes(formattedName: "Heroes"),
  nova(formattedName: "Nova"),
  other(formattedName: "Other"),
  resistance(formattedName: "Resistance"),
  sengoku(formattedName: "Sengoku"),
  ;

  const CharacterClassCategory({
    required this.formattedName,
  });

  final String formattedName;
}

// Define stat mappings for the basic set of classes
// Calculation Stats taken from https://strategywiki.org/wiki/MapleStory/Formulas#Stat_Value
const Map<StatType, StatCategory> warriorStats = {
  StatType.str: StatCategory.primary,
  StatType.dex: StatCategory.secondary,
};
const Map<StatType, StatCategory> demonAvengerStats = {
  StatType.hp: StatCategory.primary,
  StatType.str: StatCategory.secondary,
};
const Map<StatType, StatCategory> bowmanStats = {
  StatType.dex: StatCategory.primary,
  StatType.str: StatCategory.secondary,
};
const Map<StatType, StatCategory> magicianStats = {
  StatType.int: StatCategory.primary,
  StatType.luk: StatCategory.secondary,
};
const Map<StatType, StatCategory> thiefStats = {
  StatType.luk: StatCategory.primary,
  StatType.dex: StatCategory.secondary,
};
const Map<StatType, StatCategory> shadowerDualBladeCadenaStats = {
  StatType.luk: StatCategory.primary,
  StatType.str: StatCategory.secondary,
  StatType.dex: StatCategory.secondary,
};
const Map<StatType, StatCategory> pirateDexStats = {
  StatType.dex: StatCategory.primary,
  StatType.str: StatCategory.secondary,
};
const Map<StatType, StatCategory> pirateStrStats = {
  StatType.str: StatCategory.primary,
  StatType.dex: StatCategory.secondary,
};
const Map<StatType, StatCategory> xenonStats = {
  StatType.str: StatCategory.primary,
  StatType.dex: StatCategory.primary,
  StatType.luk: StatCategory.primary
};