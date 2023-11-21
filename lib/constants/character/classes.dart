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
    classType: ClassType.all
  ),
  adele(
    formattedName: "Adele", 
    classCategory: CharacterClassCategory.flora, 
    calculationStats: warriorStats, 
    classType: ClassType.warrior
  ),
  angelicBuster(
    formattedName: "Angelic Buster", 
    classCategory: CharacterClassCategory.nova, 
    calculationStats: pirateDexStats, 
    classType: ClassType.pirate
  ),
  aran(
    formattedName: "Aran", 
    classCategory: CharacterClassCategory.heroes, 
    calculationStats: warriorStats, 
    classType: ClassType.warrior
  ),
  ark(
    formattedName: "Ark", 
    classCategory: CharacterClassCategory.flora, 
    calculationStats: pirateStrStats, 
    classType: ClassType.pirate
  ),
  battleMage(
    formattedName: "Battle Mage", 
    classCategory: CharacterClassCategory.resistance, 
    calculationStats: magicianStats, 
    classType: ClassType.magician
  ),
  beastTamer(
    formattedName: "Beast Tamer", 
    classCategory: CharacterClassCategory.other, 
    calculationStats: magicianStats, 
    classType: ClassType.magician
  ),
  bishop(
    formattedName: "Bishop", 
    classCategory: CharacterClassCategory.explorers, 
    calculationStats: magicianStats, 
    classType: ClassType.magician
  ),
  blaster(
    formattedName: "Blaster", 
    classCategory: CharacterClassCategory.resistance, 
    calculationStats: warriorStats, 
    classType: ClassType.warrior
  ),
  blazeWizard(
    formattedName: "Blaze Wizard", 
    classCategory: CharacterClassCategory.cygnusKnights, 
    calculationStats: magicianStats, 
    classType: ClassType.magician
  ),
  bowmaster(
    formattedName: "Bowmaster", 
    classCategory: CharacterClassCategory.explorers, 
    calculationStats: bowmanStats, 
    classType: ClassType.bowman
  ),
  buccaneer(
    formattedName: "Buccaneer", 
    classCategory: CharacterClassCategory.explorers, 
    calculationStats: pirateStrStats, 
    classType: ClassType.pirate
  ),
  cadena(
    formattedName: "Cadena", 
    classCategory: CharacterClassCategory.nova, 
    calculationStats: shadowerDualBladeCadenaStats, 
    classType: ClassType.thief
  ),
  canoneer(
    formattedName: "Canoneer", 
    classCategory: CharacterClassCategory.explorers, 
    calculationStats: pirateStrStats, 
    classType: ClassType.pirate
  ),
  corsair(
    formattedName: "Corsair", 
    classCategory: CharacterClassCategory.explorers, 
    calculationStats: pirateDexStats, 
    classType: ClassType.pirate
  ),
  darkKnight(
    formattedName: "Dark Knight", 
    classCategory: CharacterClassCategory.explorers, 
    calculationStats: warriorStats, 
    classType: ClassType.warrior
  ),
  dawnWarrior(
    formattedName: "Dawn Warrior", 
    classCategory: CharacterClassCategory.cygnusKnights, 
    calculationStats: warriorStats, 
    classType: ClassType.warrior
  ),
  demonAvenger(
    formattedName: "Demon Avenger", 
    classCategory: CharacterClassCategory.resistance, 
    calculationStats: demonAvengerStats, 
    classType: ClassType.warrior
  ),
  demonSlayer(
    formattedName: "Demon Slayer", 
    classCategory: CharacterClassCategory.resistance, 
    calculationStats: warriorStats, 
    classType: ClassType.warrior
  ),
  dualBlade(
    formattedName: "Dual Blade", 
    classCategory: CharacterClassCategory.explorers, 
    calculationStats: shadowerDualBladeCadenaStats, 
    classType: ClassType.thief
  ),
  evan(
    formattedName: "Evan", 
    classCategory: CharacterClassCategory.heroes, 
    calculationStats: magicianStats, 
    classType: ClassType.magician
  ),
  firePoisonMage(
    formattedName: "Fire Poison Mage", 
    classCategory: CharacterClassCategory.explorers, 
    calculationStats: magicianStats, 
    classType: ClassType.magician
  ),
  hayato(
    formattedName: "Hayato", 
    classCategory: CharacterClassCategory.sengoku, 
    calculationStats: warriorStats, 
    classType: ClassType.warrior
  ),
  hero(
    formattedName: "Hero", 
    classCategory: CharacterClassCategory.explorers, 
    calculationStats: warriorStats, 
    classType: ClassType.warrior
  ),
  hoyoung(
    formattedName: "Hoyoung", 
    classCategory: CharacterClassCategory.anima, 
    calculationStats: thiefStats, 
    classType: ClassType.thief
  ),
  iceLightningMage(
    formattedName: "Ice Lightning Mage", 
    classCategory: CharacterClassCategory.explorers, 
    calculationStats: magicianStats, 
    classType: ClassType.magician
  ),
  illium(
    formattedName: "Illium", 
    classCategory: CharacterClassCategory.flora, 
    calculationStats: magicianStats, 
    classType: ClassType.magician
  ),
  kain(
    formattedName: "Kain", 
    classCategory: CharacterClassCategory.nova, 
    calculationStats: bowmanStats, 
    classType: ClassType.bowman
  ),
  kaiser(
    formattedName: "Kaiser", 
    classCategory: CharacterClassCategory.nova, 
    calculationStats: warriorStats, 
    classType: ClassType.warrior
  ),
  kanna(
    formattedName: "Kanna", 
    classCategory: CharacterClassCategory.sengoku, 
    calculationStats: magicianStats, 
    classType: ClassType.magician
  ),
  khali(
    formattedName: "Khali", 
    classCategory: CharacterClassCategory.flora, 
    calculationStats: thiefStats, 
    classType: ClassType.thief
  ),
  kinesis(
    formattedName: "Kinesis", 
    classCategory: CharacterClassCategory.other, 
    calculationStats: magicianStats, 
    classType: ClassType.magician
  ),
  lara(
    formattedName: "Lara", 
    classCategory: CharacterClassCategory.anima, 
    calculationStats: magicianStats, 
    classType: ClassType.magician
  ),
  luminous(
    formattedName: "Luminous", 
    classCategory: CharacterClassCategory.heroes, 
    calculationStats: magicianStats, 
    classType: ClassType.magician
  ),
  marksman(
    formattedName: "Marksman", 
    classCategory: CharacterClassCategory.explorers, 
    calculationStats: bowmanStats, 
    classType: ClassType.bowman
  ),
  mechanic(
    formattedName: "Mechanic", 
    classCategory: CharacterClassCategory.resistance, 
    calculationStats: pirateDexStats, 
    classType: ClassType.pirate
  ),
  mercedes(
    formattedName: "Mercedes", 
    classCategory: CharacterClassCategory.heroes, 
    calculationStats: bowmanStats, 
    classType: ClassType.bowman
  ),
  mihile(
    formattedName: "Mihile", 
    classCategory: CharacterClassCategory.cygnusKnights, 
    calculationStats: warriorStats, 
    classType: ClassType.warrior
  ),
  nightLord(
    formattedName: "Night Lord", 
    classCategory: CharacterClassCategory.explorers, 
    calculationStats: thiefStats, 
    classType: ClassType.thief
  ),
  nightWalker(
    formattedName: "Night Walker", 
    classCategory: CharacterClassCategory.cygnusKnights, 
    calculationStats: thiefStats, 
    classType: ClassType.thief
  ),
  paladin(
    formattedName: "Paladin", 
    classCategory: CharacterClassCategory.explorers, 
    calculationStats: warriorStats, 
    classType: ClassType.warrior
  ),
  pathfinder(
    formattedName: "Pathfinder", 
    classCategory: CharacterClassCategory.explorers, 
    calculationStats: bowmanStats, 
    classType: ClassType.bowman
  ),
  phantom(
    formattedName: "Phantom", 
    classCategory: CharacterClassCategory.heroes, 
    calculationStats: thiefStats, 
    classType: ClassType.thief
  ),
  shade(
    formattedName: "Shade", 
    classCategory: CharacterClassCategory.heroes, 
    calculationStats: pirateStrStats, 
    classType: ClassType.pirate
  ),
  shadower(
    formattedName: "Shadower", 
    classCategory: CharacterClassCategory.explorers, 
    calculationStats: shadowerDualBladeCadenaStats, 
    classType: ClassType.thief
  ),
  thunderBreaker(
    formattedName: "Thunder Breaker", 
    classCategory: CharacterClassCategory.cygnusKnights, 
    calculationStats: pirateStrStats, 
    classType: ClassType.pirate
  ),
  wildHunter(
    formattedName: "Wild Hunter", 
    classCategory: CharacterClassCategory.resistance, 
    calculationStats: bowmanStats, 
    classType: ClassType.bowman
  ),
  windArcher(
    formattedName: "Wind Archer", 
    classCategory: CharacterClassCategory.cygnusKnights, 
    calculationStats: bowmanStats, 
    classType: ClassType.bowman
  ),
  xenon(
    formattedName: "Xenon", 
    classCategory: CharacterClassCategory.resistance, 
    calculationStats: xenonStats, 
    classType: ClassType.xenon
  ),
  zero(
    formattedName: "Zero", 
    classCategory: CharacterClassCategory.other, 
    calculationStats: warriorStats, 
    classType: ClassType.warrior
  ),
  ;

  const CharacterClass({
    required this.formattedName,
    required this.classCategory,
    required this.calculationStats,
    required this.classType,
  });

  final String formattedName;
  final CharacterClassCategory classCategory;
  final Map<StatType, StatCategory> calculationStats;
  final ClassType classType;
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