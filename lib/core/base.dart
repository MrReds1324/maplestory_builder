class Base {
  final String name;
  var str = 0;
  var dex = 0;
  var int = 0;
  var luk = 0;
  var hp = 0;
  var mp = 0;
  var ignoreDefense = 0.0;
  var ignoreElementalDefense = 0.0;
  // https://strategywiki.org/wiki/MapleStory/Formulas#Final_Stats_Increase
  // Only the following actually give "final" stats
  // Hyper Stats (STR, DEX, INT, LUK only)
  // Arcane Symbols
  // Authentic Symbols
  // Inner Ability (STR, DEX, INT, LUK only)
  // Legion Attacker Effects
  var finalStr = 0;
  var finalDex = 0;
  var finalInt = 0;
  var finalLuk = 0;
  var finalHp = 0;
  var finalMp = 0;
  // https://strategywiki.org/wiki/MapleStory/Formulas#Final_Stats_Increase
  // Inner Ability Weapon ATT based on Level: +1 Final Weapon ATT every 10~16 character levels, rounded down
  // Inner Ability Magic ATT based on Level: +1 Final Magic ATT every 10~16 character levels, rounded down
  // Kanna's Elemental Blessing Beginner Skill: +1 Final Magic ATT every 700 final total MaxHP, rounded down (up to 500,000 Max HP = +714 final Magic ATT)
  // Monster Farm Luminous (Equilibrium): +1 Final ATT and Final Magic ATT every 20 character levels, rounded down
  var finalAttack = 0;
  var finalMAttack = 0;

  Base({
    required this.name,
    required this.str,
    required this.dex,
    required this.int,
    required this.luk,
  });
}