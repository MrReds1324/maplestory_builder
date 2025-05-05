// ignore_for_file: constant_identifier_names

import 'package:flutter/material.dart';
import 'package:maplestory_builder/constants/character/classes.dart';
import 'package:maplestory_builder/constants/constants.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

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
    CharacterClass.beginner: {StatType.mainStat: 300},
    // Note that this is not real - maps all other classes to their main stat value
    CharacterClass.xenon: {StatType.finalStrDexLuk: 144},
    CharacterClass.demonAvenger: {StatType.finalHp: 6300},
  };
  static const Map<CharacterClass, Map<StatType, int>> LEVEL_OTHER_STATS = {
    CharacterClass.beginner: {StatType.mainStat: 100},
    // Note that this is not real - maps all other classes to their main stat value
    CharacterClass.xenon: {StatType.finalStrDexLuk: 48},
    CharacterClass.demonAvenger: {StatType.finalHp: 2100},
  };

  Image getAssetImage() {
    String imageIndex;
    switch (this) {
      case ArcaneSymbol.vanishingJourney:
        imageIndex = "1";
      case ArcaneSymbol.chuchuIsland:
        imageIndex = "2";
      case ArcaneSymbol.lachelein:
        imageIndex = "3";
      case ArcaneSymbol.arcana:
        imageIndex = "4";
      case ArcaneSymbol.morass:
        imageIndex = "5";
      case ArcaneSymbol.esfera:
        imageIndex = "6";
    }
    return Image(
        image: AssetImage('assets/images/arcane_symbols/$imageIndex.png'),
        height: 34,
        width: 34,
        errorBuilder: (ctx, error, stackTrace) => Icon(
              MdiIcons.circle,
              size: 30,
            ));
  }
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
    CharacterClass.beginner: {StatType.mainStat: 500},
    // Note that this is not real - maps all other classes to their main stat value
    CharacterClass.xenon: {
      StatType.finalStr: 240,
      StatType.finalDex: 240,
      StatType.finalLuk: 240
    },
    CharacterClass.demonAvenger: {StatType.finalHp: 10500},
  };
  static const Map<CharacterClass, Map<StatType, int>> LEVEL_OTHER_STATS = {
    CharacterClass.beginner: {StatType.mainStat: 200},
    // Note that this is not real - maps all other classes to their main stat value
    CharacterClass.xenon: {
      StatType.finalStr: 96,
      StatType.finalDex: 96,
      StatType.finalLuk: 96
    },
    CharacterClass.demonAvenger: {StatType.finalHp: 4200},
  };

  Image getAssetImage() {
    String imageIndex;
    switch (this) {
      case SacredSymbol.cernium:
        imageIndex = "1";
      case SacredSymbol.arcus:
        imageIndex = "2";
      case SacredSymbol.odium:
        imageIndex = "3";
      case SacredSymbol.shangrila:
        imageIndex = "4";
      case SacredSymbol.arteria:
        imageIndex = "5";
      case SacredSymbol.carcion:
        imageIndex = "6";
    }
    return Image(
        image: AssetImage('assets/images/sacred_symbols/$imageIndex.png'),
        height: 34,
        width: 34,
        errorBuilder: (ctx, error, stackTrace) => Icon(
              MdiIcons.circle,
              size: 30,
            ));
  }
}

enum GrandSacredSymbol {
  tallahart(formattedName: "Tallahart"),
  ;

  const GrandSacredSymbol({
    required this.formattedName,
  });

  final String formattedName;

  static const int MAX_LEVEL = 11;
  static const int LEVEL_1_SACRED_POWER = 10;
  static const int LEVEL_OTHER_SACRED_POWER = 10;

  // https://maplestorywiki.net/w/Grand_Sacred_Symbol:_Tallahart
  static const Map<StatType, num> LEVEL_1_STATS = {
    StatType.expAdditional: 0.1,
    StatType.mesosObtained: 0.05,
    StatType.itemDropRate: 0.05,
  };
  static const Map<StatType, num> LEVEL_OTHER_STATS = {
    StatType.expAdditional: 0.04,
    StatType.mesosObtained: 0.01,
    StatType.itemDropRate: 0.01,
  };

  Image getAssetImage() {
    String imageIndex;
    switch (this) {
      case GrandSacredSymbol.tallahart:
        imageIndex = "7";
    }
    return Image(
        image: AssetImage('assets/images/sacred_symbols/$imageIndex.png'),
        height: 34,
        width: 34,
        errorBuilder: (ctx, error, stackTrace) => Icon(
              MdiIcons.circle,
              size: 30,
            ));
  }
}
