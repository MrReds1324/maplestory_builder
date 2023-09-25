import 'package:maplestory_builder/constants/constants.dart';

class Base {
  Map<StatType, num> baseStats;
  final int itemLevel;
  // https://strategywiki.org/wiki/MapleStory/Formulas#Final_Stats_Increase
  // Only the following actually give "final" stats
  // Hyper Stats (STR, DEX, INT, LUK only)
  // Arcane Symbols
  // Authentic Symbols
  // Inner Ability (STR, DEX, INT, LUK only)
  // Legion Attacker Effects

  // https://strategywiki.org/wiki/MapleStory/Formulas#Final_Stats_Increase
  // Inner Ability Weapon ATT based on Level: +1 Final Weapon ATT every 10~16 character levels, rounded down
  // Inner Ability Magic ATT based on Level: +1 Final Magic ATT every 10~16 character levels, rounded down
  // Kanna's Elemental Blessing Beginner Skill: +1 Final Magic ATT every 700 final total MaxHP, rounded down (up to 500,000 Max HP = +714 final Magic ATT)
  // Monster Farm Luminous (Equilibrium): +1 Final ATT and Final Magic ATT every 20 character levels, rounded down

  Base({
    this.itemLevel = 0,
    Map<StatType, num>? baseStats,
  }): baseStats = baseStats ?? {};
}