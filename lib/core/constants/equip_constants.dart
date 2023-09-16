enum EquipName {
  superiorGolluxRing(formattedName: "Superior Gollux Ring"),
  superiorGolluxPendant(formattedName: "Superior Gollux Pendant"),
  superiorGolluxBelt(formattedName: "Superior Gollux Belt"),
  superiorGolluxEarrings(formattedName: "Superior Gollux Earrings"),
;

  const EquipName({
    required this.formattedName
  });

  final String formattedName;
}