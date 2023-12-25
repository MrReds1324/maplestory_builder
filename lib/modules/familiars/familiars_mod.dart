import 'package:maplestory_builder/constants/constants.dart';
import 'package:maplestory_builder/modules/base.dart';
import 'package:maplestory_builder/modules/familiars/familiar.dart';

class FamiliarModule implements Copyable {

  Map<int, int?> equippedFamiliars;
  Familiar? Function(int? equipHash) getFamiliarCallback;

  FamiliarModule({
    Map<int, int?>? equippedFamiliars,
    required this.getFamiliarCallback,
  }) :
    equippedFamiliars = equippedFamiliars ?? {};

  @override
  FamiliarModule copyWith({
    Map<int, int?>? equippedFamiliars,
    Familiar? Function(int?)? getFamiliarCallback,
  }) {
    return FamiliarModule(
      equippedFamiliars: equippedFamiliars ?? Map.from(this.equippedFamiliars),
      getFamiliarCallback: getFamiliarCallback ?? this.getFamiliarCallback
    );
  }

  void registerFamiliarCallback(Familiar? Function(int?) function) {
    getFamiliarCallback = function;
  }

  void equipFamiliar(Familiar? familiar, int familiarPosition) {
    equippedFamiliars[familiarPosition] = familiar?.familiarHash;
  }

  void deleteFamiliar(Familiar deletingFamiliar) {
    equippedFamiliars.forEach((key, value) {
      if (value == deletingFamiliar.familiarHash) {
        equippedFamiliars[key] = null;
      }
    });
  }

  List<Map<StatType, num>> calculateStats() {
    List<Map<StatType, num>> familiarStats = <Map<StatType, num>>[];

    for (int? familiarHash in equippedFamiliars.values) {
      var mapValue = getFamiliarCallback(familiarHash)?.calculateStats();
      if (mapValue != null) {
        familiarStats.add(mapValue);
      }
    }

    return familiarStats;
  }
}