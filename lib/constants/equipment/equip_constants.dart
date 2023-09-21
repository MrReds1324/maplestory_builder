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
  daybreakPendant(formattedName: "Daybreak Pendant")
;

  const EquipName({
    required this.formattedName
  });

  final String formattedName;
}