import 'package:maplestory_builder/constants/constants.dart';

enum LegionBlock {
  nothing(
    formattedName: "Nothing",
    legionEffect: (StatType.allStats, [0, 0, 0, 0, 0])
  ),
  adele(
    formattedName: "Adele", 
    legionEffect: (StatType.finalStr, [10, 20, 40, 80, 100])
  ),
  angelicBuster(
    formattedName: "Angelic Buster", 
    legionEffect: (StatType.finalDex, [10, 20, 40, 80, 100])
  ),
  aran(
    formattedName: "Aran", 
    legionEffect: (StatType.hp, [0, 0, 0, 0, 0])  // 70% chance to recover 2/4/6/8/10% hp
  ),
  ark(
    formattedName: "Ark", 
    legionEffect: (StatType.finalStr, [10, 20, 40, 80, 100])
  ),
  battleMage(
    formattedName: "Battle Mage", 
    legionEffect: (StatType.finalInt, [10, 20, 40, 80, 100])
  ),
  beastTamer(
    formattedName: "Beast Tamer", 
    legionEffect: (StatType.ignoreDefense, [0.01, 0.02, 0.03, 0.05, 0.06])
  ),
  bishop(
    formattedName: "Bishop", 
    legionEffect: (StatType.finalInt, [10, 20, 40, 80, 100])
  ),
  blaster(
    formattedName: "Blaster", 
    legionEffect: (StatType.ignoreDefense, [0.01, 0.02, 0.03, 0.05, 0.06])
  ),
  blazeWizard(
    formattedName: "Blaze Wizard", 
    legionEffect: (StatType.finalInt, [10, 20, 40, 80, 100])
  ),
  bowmaster(
    formattedName: "Bowmaster", 
    legionEffect: (StatType.finalDex, [10, 20, 40, 80, 100])
  ),
  buccaneer(
    formattedName: "Buccaneer", 
    legionEffect: (StatType.finalStr, [10, 20, 40, 80, 100])
  ),
  cadena(
    formattedName: "Cadena", 
    legionEffect: (StatType.finalLuk, [10, 20, 40, 80, 100])
  ),
  canoneer(
    formattedName: "Canoneer", 
    legionEffect: (StatType.finalStr, [10, 20, 40, 80, 100])
  ),
  corsair(
    formattedName: "Corsair", 
    legionEffect: (StatType.summonDuration, [0.04, 0.06, 0.08, 0.1, 0.12])
  ),
  darkKnight(
    formattedName: "Dark Knight", 
    legionEffect: (StatType.hpPercentage, [0.02, 0.03, 0.04, 0.05, 0.06])
  ),
  dawnWarrior(
    formattedName: "Dawn Warrior", 
    legionEffect: (StatType.finalHp, [250, 500, 1000, 2000, 2500])
  ),
  demonAvenger(
    formattedName: "Demon Avenger", 
    legionEffect: (StatType.bossDamage, [0.01, 0.02, 0.03, 0.05, 0.06])
  ),
  demonSlayer(
    formattedName: "Demon Slayer", 
    legionEffect: (StatType.statusResistance, [1, 2, 3, 4, 5])
  ),
  dualBlade(
    formattedName: "Dual Blade", 
    legionEffect: (StatType.finalLuk, [10, 20, 40, 80, 100])
  ),
  evan(
    formattedName: "Evan", 
    legionEffect: (StatType.mp, [0, 0, 0, 0, 0])  // 70% chance to recover 2/4/6/8/10% mp
  ),
  firePoisonMage(
    formattedName: "Fire Poison Mage", 
    legionEffect: (StatType.mpPercentage, [0.02, 0.03, 0.04, 0.05, 0.06])
  ),
  hayato(
    formattedName: "Hayato", 
    legionEffect: (StatType.critDamage, [0.01, 0.02, 0.03, 0.05, 0.06])
  ),
  hero(
    formattedName: "Hero", 
    legionEffect: (StatType.finalStr, [10, 20, 40, 80, 100])
  ),
  hoyoung(
    formattedName: "Hoyoung", 
    legionEffect: (StatType.finalLuk, [10, 20, 40, 80, 100])
  ),
  iceLightningMage(
    formattedName: "Ice Lightning Mage", 
    legionEffect: (StatType.finalInt, [10, 20, 40, 80, 100])
  ),
  illium(
    formattedName: "Illium", 
    legionEffect: (StatType.finalInt, [10, 20, 40, 80, 100])
  ),
  kain(
    formattedName: "Kain", 
    legionEffect: (StatType.finalDex, [10, 20, 40, 80, 100])
  ),
  kaiser(
    formattedName: "Kaiser", 
    legionEffect: (StatType.finalStr, [10, 20, 40, 80, 100])
  ),
  kanna(
    formattedName: "Kanna", 
    legionEffect: (StatType.bossDamage, [0.01, 0.02, 0.03, 0.05, 0.06])
  ),
  khali(
    formattedName: "Khali", 
    legionEffect: (StatType.finalLuk, [10, 20, 40, 80, 100])
  ),
  kinesis(
    formattedName: "Kinesis", 
    legionEffect: (StatType.finalInt, [10, 20, 40, 80, 100])
  ),
  lara(
    formattedName: "Lara", 
    legionEffect: (StatType.finalInt, [10, 20, 40, 80, 100])
  ),
  luminous(
    formattedName: "Luminous", 
    legionEffect: (StatType.finalInt, [10, 20, 40, 80, 100])
  ),
  marksman(
    formattedName: "Marksman", 
    legionEffect: (StatType.critRate, [0.01, 0.02, 0.03, 0.04, 0.05])
  ),
  mechanic(
    formattedName: "Mechanic", 
    legionEffect: (StatType.buffDuration, [0.05, 0.1, 0.15, 0.20, 0.25])
  ),
  mercedes(
    formattedName: "Mercedes", 
    legionEffect: (StatType.skillCooldownPercentage, [0.02, 0.03, 0.04, 0.05, 0.06])
  ),
  mihile(
    formattedName: "Mihile", 
    legionEffect: (StatType.finalHp, [250, 500, 1000, 2000, 2500])
  ),
  nightLord(
    formattedName: "Night Lord", 
    legionEffect: (StatType.critRate, [0.01, 0.02, 0.03, 0.04, 0.05])
  ),
  nightWalker(
    formattedName: "Night Walker", 
    legionEffect: (StatType.finalLuk, [10, 20, 40, 80, 100])
  ),
  paladin(
    formattedName: "Paladin", 
    legionEffect: (StatType.finalStr, [10, 20, 40, 80, 100])
  ),
  pathfinder(
    formattedName: "Pathfinder", 
    legionEffect: (StatType.finalDex, [10, 20, 40, 80, 100])
  ),
  phantom(
    formattedName: "Phantom", 
    legionEffect: (StatType.mesosObtained, [0.01, 0.02, 0.03, 0.04, 0.05])
  ),
  shade(
    formattedName: "Shade", 
    legionEffect: (StatType.critDamage, [0.01, 0.02, 0.03, 0.05, 0.06])
  ),
  shadower(
    formattedName: "Shadower", 
    legionEffect: (StatType.finalLuk, [10, 20, 40, 80, 100])
  ),
  thunderBreaker(
    formattedName: "Thunder Breaker", 
    legionEffect: (StatType.finalStr, [10, 20, 40, 80, 100])
  ),
  wildHunter(
    formattedName: "Wild Hunter", 
    legionEffect: (StatType.damage, [0.04, 0.08, 0.12, 0.16, 0.2])
  ),
  windArcher(
    formattedName: "Wind Archer", 
    legionEffect: (StatType.finalDex, [10, 20, 40, 80, 100])
  ),
  xenon(
    formattedName: "Xenon", 
    legionEffect: (StatType.finalStrDexLuk, [5, 10, 20, 40, 50])
  ),
  zero(
    formattedName: "Zero", 
    legionEffect: (StatType.expAdditional, [0.04, 0.06, 0.08, 0.1, 0.12])
  ),
  labServer(
    formattedName: "Lab Server",
    legionEffect: (StatType.attackMattack, [5, 10, 15, 20, 25])
  ),
  enhancedLabServer(
    formattedName: "Enhanced Lab Server",
    legionEffect: (StatType.attackMattack, [7, 14, 21, 28, 35])
  ),
  ;

  const LegionBlock({
    required this.formattedName,
    required this.legionEffect,
  });

  final String formattedName;
  final (StatType, List<num>) legionEffect;

  int? characterLevelToIndex(int characterLevel) {
    if (this == LegionBlock.zero) {
      if (130 <= characterLevel && characterLevel <= 159) {
        return 0;
      }
      else if (160 <= characterLevel && characterLevel <= 179) {
        return 1;
      }
      else if (180 <= characterLevel && characterLevel <= 199) {
        return 2;
      }
      else if (200 <= characterLevel && characterLevel <= 249) {
        return 3;
      }
      else if (250 <= characterLevel) {
        return 4;
      }
      else {
        return null;
      }
    }
    else {
      if (60 <= characterLevel && characterLevel <= 99) {
        return 0;
      }
      else if (100 <= characterLevel && characterLevel <= 139) {
        return 1;
      }
      else if (140 <= characterLevel && characterLevel <= 199) {
        return 2;
      }
      else if (200 <= characterLevel && characterLevel <= 249) {
        return 3;
      }
      else if (250 <= characterLevel) {
        return 4;
      }
      else {
        return null;
      }
    }
  }
}

enum LegionBoardRank {
  namelessLegionR1(
    formattedName: "Nameless Legion Rank I",
    totalLevel: 500,
    legionMembers: 9,
    outerRegionAmount: 0,
  ),
  namelessLegionR2(
    formattedName: "Nameless Legion Rank II",
    totalLevel: 1000,
    legionMembers: 10,
    outerRegionAmount: 0,
  ),
  namelessLegionR3(
    formattedName: "Nameless Legion Rank III",
    totalLevel: 1500,
    legionMembers: 11,
    outerRegionAmount: 0,
  ),
  namelessLegionR4(
    formattedName: "Nameless Legion Rank IV",
    totalLevel: 2000,
    legionMembers: 12,
    outerRegionAmount: 6,
  ),
  namelessLegionR5(
    formattedName: "Nameless Legion Rank V",
    totalLevel: 2500,
    legionMembers: 13,
    outerRegionAmount: 6,
  ),
  renownedLegionR1(
    formattedName: "Renowned Legion Rank I",
    totalLevel: 3000,
    legionMembers: 18,
    outerRegionAmount: 13,
  ),
  renownedLegionR2(
    formattedName: "Renowned Legion Rank II",
    totalLevel: 3500,
    legionMembers: 19,
    outerRegionAmount: 13,
  ),
  renownedLegionR3(
    formattedName: "Renowned Legion Rank III",
    totalLevel: 4000,
    legionMembers: 20,
    outerRegionAmount: 21,
  ),
  renownedLegionR4(
    formattedName: "Renowned Legion Rank IV",
    totalLevel: 4500,
    legionMembers: 21,
    outerRegionAmount: 21,
  ),
  renownedLegionR5(
    formattedName: "Renowned Legion Rank V",
    totalLevel: 5000,
    legionMembers: 22,
    outerRegionAmount: 30,
  ),
  heroicLegionR1(
    formattedName: "Heroic Legion Rank I",
    totalLevel: 5500,
    legionMembers: 27,
    outerRegionAmount: 30,
  ),
  heroicLegionR2(
    formattedName: "Heroic Legion Rank II",
    totalLevel: 6000,
    legionMembers: 28,
  ),
  heroicLegionR3(
    formattedName: "Heroic Legion Rank III",
    totalLevel: 6500,
    legionMembers: 29,
  ),
  heroicLegionR4(
    formattedName: "Heroic Legion Rank IV",
    totalLevel: 7000,
    legionMembers: 30,
  ),
  heroicLegionR5(
    formattedName: "Heroic Legion Rank V",
    totalLevel: 7500,
    legionMembers: 31,
  ),
  legendaryLegionR1(
    formattedName: "Legendary Legion Rank I",
    totalLevel: 8000,
    legionMembers: 36,
  ),
  legendaryLegionR2(
    formattedName: "Legendary Legion Rank II",
    totalLevel: 8500,
    legionMembers: 37,
  ),
  legendaryLegionR3(
    formattedName: "Legendary Legion Rank III",
    totalLevel: 9000,
    legionMembers: 38,
  ),
  legendaryLegionR4(
    formattedName: "Legendary Legion Rank IV",
    totalLevel: 9500,
    legionMembers: 39,
  ),
  legendaryLegionR5(
    formattedName: "Legendary Legion Rank V",
    totalLevel: 10000,
    legionMembers: 40,
  ),
  supremeLegionR1(
    formattedName: "Supreme Legion Rank I",
    totalLevel: 10500,
    legionMembers: 41,
  ),
  supremeLegionR2(
    formattedName: "Supreme Legion Rank II",
    totalLevel: 11000,
    legionMembers: 42,
  ),
  supremeLegionR3(
    formattedName: "Supreme Legion Rank III",
    totalLevel: 11500,
    legionMembers: 43,
  ),
  supremeLegionR4(
    formattedName: "Supreme Legion Rank IV",
    totalLevel: 12000,
    legionMembers: 44,
  ),
  supremeLegionR5(
    formattedName: "Supreme Legion Rank V",
    totalLevel: 12500,
    legionMembers: 45,
  ),
  ;

  const LegionBoardRank({
    required this.formattedName,
    required this.totalLevel,
    required this.legionMembers,
    this.outerRegionAmount = 40,
  });

  final String formattedName;
  final int totalLevel;
  final int legionMembers;
  final int outerRegionAmount;
  final int innerRegionAmount = 15;

  static LegionBoardRank? getLegionBoardRank(int totalCharacterLevels) {
    if (totalCharacterLevels < 500) {
      return null;
    }
    else {
      var levelToRank = (totalCharacterLevels ~/ 500) - 1;
      return LegionBoardRank.values[levelToRank];
    }
  }
}