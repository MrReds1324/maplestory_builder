enum EquipName {
  // Superior Gollux Items
  superiorGolluxRing(formattedName: "Superior Gollux Ring"),
  superiorGolluxPendant(formattedName: "Superior Gollux Pendant"),
  superiorGolluxBelt(formattedName: "Superior Gollux Belt"),
  superiorGolluxEarrings(formattedName: "Superior Gollux Earrings"),
  // Dawn Boss Set Items
  dawnGuardianAngelRing(formattedName: "Dawn Guardian Angel Ring"),
  twilightMark(formattedName: "Twilight Mark"),
  estellaEarrings(formattedName: "Estella Earrings"),
  daybreakPendant(formattedName: "Daybreak Pendant"),
  // Eternal Bowman Set Items
  eternalArcherHat(formattedName: "Eternal Archer Hat"),
  eternalArcherHood(formattedName: "Eternal Archer Hood"),
  eternalArcherPants(formattedName: "Eternal Archer Pants"),
  eternalArcherShoulder(formattedName: "Eternal Archer Shoulder"),
  // Genesis Weapons
  genesisCrossbow(formattedName: "Genesis Crossbow"),
  // Arcane Bowman Set Items
  arcaneUmbraArcherHat(formattedName: "Arcane Umbra Archer Hat"),
  arcaneUmbraArcherSuit(formattedName: "Arcane Umbra Archer Suit"),
  arcaneUmbraArcherShoes(formattedName: "Arcane Umbra Archer Shoes"),
  arcaneUmbraArcherGloves(formattedName: "Arcane Umbra Archer Gloves"),
  arcaneUmbraArcherCape(formattedName: "Arcane Umbra Archer Cape"),
  arcaneUmbraArcherShoulder(formattedName: "Arcane Umbra Archer Shoulder"),
  // Arcane Weapons
  arcaneUmbraArcherCrossbow(formattedName: "Arcane Umbra Archer Shoulder"),
;

  const EquipName({
    required this.formattedName
  });

  final String formattedName;
}