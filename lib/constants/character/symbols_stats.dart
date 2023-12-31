// ignore_for_file: constant_identifier_names

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

  static const int MAX_LEVEL = 20;
  static const LEVEL_1_ARCANE_FORCE = 30;
  static const LEVEL_OTHER_ARCANE_FORCE = 10;
  // https://maplestory.fandom.com/wiki/Arcane_Symbol:_Vanishing_Journey
  static const Map<CharacterClass, Map<StatType, int>> LEVEL_1_STATS = {
    CharacterClass.beginner: {StatType.mainStat: 300}, // Note that this is not real - maps all other classes to their main stat value
    CharacterClass.xenon: {StatType.finalStrDexLuk: 144},
    CharacterClass.demonAvenger: {StatType.finalHp: 6300},
  };
  static const Map<CharacterClass, Map<StatType, int>> LEVEL_OTHER_STATS = {
    CharacterClass.beginner: {StatType.mainStat: 100}, // Note that this is not real - maps all other classes to their main stat value
    CharacterClass.xenon: {StatType.finalStrDexLuk: 48},
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

  static const int MAX_LEVEL = 11;
  static const int LEVEL_1_SACRED_POWER = 10;
  static const int LEVEL_OTHER_SACRED_POWER = 10;
  // https://maplestory.fandom.com/wiki/Sacred_Symbol:_Cernium
  static const Map<CharacterClass, Map<StatType, int>> LEVEL_1_STATS = {
    CharacterClass.beginner: {StatType.allStats: 500}, // Note that this is not real - maps all other classes to their main stat value
    CharacterClass.xenon: {StatType.finalStr: 240, StatType.finalDex: 240, StatType.finalLuk: 240},
    CharacterClass.demonAvenger: {StatType.finalHp: 10500},
  };
  static const Map<CharacterClass, Map<StatType, int>> LEVEL_OTHER_STATS = {
    CharacterClass.beginner: {StatType.allStats: 200}, // Note that this is not real - maps all other classes to their main stat value
    CharacterClass.xenon: {StatType.finalStr: 96, StatType.finalDex: 96, StatType.finalLuk: 96},
    CharacterClass.demonAvenger: {StatType.finalHp: 4200},
  };
}