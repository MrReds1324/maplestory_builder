import 'package:maplestory_builder/constants/character/classes.dart';
import 'package:maplestory_builder/constants/constants.dart';

enum ArcaneSymbol {
  vanishingJourney(formattedName: "Vanishing Journey"),
  chuchuIsland(formattedName: "Chu Chu Island"),
  lachelein(formattedName: "Lachelein"),
  arcana(formattedName: "Arcana"),
  morass(formattedName: "Morass"),
  esfera(formattedName: "Esfera"),
  ;

  const ArcaneSymbol({
    required this.formattedName,
  });

  final String formattedName;

  static const level1ArcaneForce = 30;
  static const levelOtherArcaneForce = 10;
  // https://maplestory.fandom.com/wiki/Arcane_Symbol:_Vanishing_Journey
  static const Map<CharacterClass, Map<StatType, int>> level1Stats = {
    CharacterClass.beginner: {StatType.allStats: 300}, // Note that this is not real - maps all other classes to their main stat value
    CharacterClass.xenon: {StatType.finalStr: 144, StatType.finalDex: 144, StatType.finalLuk: 144},
    CharacterClass.demonAvenger: {StatType.finalHp: 6300},
  };
  static const Map<CharacterClass, Map<StatType, int>> levelOtherStats = {
    CharacterClass.beginner: {StatType.allStats: 100}, // Note that this is not real - maps all other classes to their main stat value
    CharacterClass.xenon: {StatType.finalStr: 48, StatType.finalDex: 48, StatType.finalLuk: 48},
    CharacterClass.demonAvenger: {StatType.finalHp: 2100},
  };
}


enum SacredSymbol {
  cernium(formattedName: "Cernium"),
  arcus(formattedName: "Arcus"),
  odium(formattedName: "Odium"),
  shangrila(formattedName: "Shangri-La"),
  arteria(formattedName: "Arteria"),
  carcion(formattedName: "Carcion"),
  ;

  const SacredSymbol({
    required this.formattedName,
  });

  final String formattedName;

  static const int level1SacredPower = 10;
  static const int levelOtherSacredPower = 10;
  // https://maplestory.fandom.com/wiki/Sacred_Symbol:_Cernium
  static const Map<CharacterClass, Map<StatType, int>> level1Stats = {
    CharacterClass.beginner: {StatType.allStats: 500}, // Note that this is not real - maps all other classes to their main stat value
    CharacterClass.xenon: {StatType.finalStr: 240, StatType.finalDex: 240, StatType.finalLuk: 240},
    CharacterClass.demonAvenger: {StatType.finalHp: 10500},
  };
  static const Map<CharacterClass, Map<StatType, int>> levelOtherStats = {
    CharacterClass.beginner: {StatType.allStats: 200}, // Note that this is not real - maps all other classes to their main stat value
    CharacterClass.xenon: {StatType.finalStr: 96, StatType.finalDex: 96, StatType.finalLuk: 96},
    CharacterClass.demonAvenger: {StatType.finalHp: 4200},
  };
}