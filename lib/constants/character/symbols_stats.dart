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

  static const level1SacredPower = 10;
  static const levelOtherSacredPower = 10;
}