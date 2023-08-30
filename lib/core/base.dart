class Base {
  final String name;
  num itemLevel = 0;
  num str = 0;
  num dex = 0;
  num int = 0;
  num luk = 0;
  num hp = 0;
  num mp = 0;
  num attackPower = 0;
  num mattack = 0;
  num defense = 0;
  num speed = 0;
  num jump = 0;
  double ignoreDefense = 0.0;
  double ignoreElementalDefense = 0.0;
  double damage = 0.0;
  double bossDamage = 0.0;
  double damageNormalMobs = 0.0;
  num attackSpeed = 0;
  // https://strategywiki.org/wiki/MapleStory/Formulas#Final_Stats_Increase
  // Only the following actually give "final" stats
  // Hyper Stats (STR, DEX, INT, LUK only)
  // Arcane Symbols
  // Authentic Symbols
  // Inner Ability (STR, DEX, INT, LUK only)
  // Legion Attacker Effects
  num finalStr = 0;
  num finalDex = 0;
  num finalInt = 0;
  num finalLuk = 0;
  num finalHp = 0;
  num finalMp = 0;
  // https://strategywiki.org/wiki/MapleStory/Formulas#Final_Stats_Increase
  // Inner Ability Weapon ATT based on Level: +1 Final Weapon ATT every 10~16 character levels, rounded down
  // Inner Ability Magic ATT based on Level: +1 Final Magic ATT every 10~16 character levels, rounded down
  // Kanna's Elemental Blessing Beginner Skill: +1 Final Magic ATT every 700 final total MaxHP, rounded down (up to 500,000 Max HP = +714 final Magic ATT)
  // Monster Farm Luminous (Equilibrium): +1 Final ATT and Final Magic ATT every 20 character levels, rounded down
  num finalAttack = 0;
  num finalMAttack = 0;
  // Percentage Stats to facilitate flames and potentials
  double allStatsPercentage = 0.0;
  double strPercentage = 0.0;
  double dexPercentage = 0.0;
  double intPercentage = 0.0;
  double lukPercentage = 0.0;

  Base({
    required this.name,
    this.itemLevel = 0,
    this.str = 0,
    this.dex = 0,
    this.int = 0,
    this.luk = 0,
    this.hp = 0,
    this.mp = 0,
    this.attackPower = 0,
    this.mattack = 0,
    this.defense = 0,
    this.speed = 0,
    this.jump = 0,
    this.ignoreDefense = 0.0,
    this.bossDamage = 0.0,
    this.damage = 0.0,
    this.damageNormalMobs = 0.0,
    this.attackSpeed = 0,
    this.ignoreElementalDefense = 0.0,
    this.finalStr = 0,
    this.finalDex = 0,
    this.finalInt = 0,
    this.finalLuk = 0,
    this.finalHp = 0,
    this.finalMp = 0,
    this.finalAttack = 0,
    this.finalMAttack = 0,
  });
}