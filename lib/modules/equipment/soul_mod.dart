import 'package:maplestory_builder/constants/constants.dart';
import 'package:maplestory_builder/constants/equipment/soul_stats.dart';
import 'package:maplestory_builder/modules/base.dart';

class SoulModule implements Copyable {
  SoulName? soulName;
  (StatType, num)? selectedSoulStat;

  SoulModule({this.soulName, this.selectedSoulStat});

  @override
  SoulModule copyWith({
    SoulName? soulName,
    (StatType, num)? selectedSoulStat,
  }) {
    return SoulModule(
        soulName: soulName ?? this.soulName,
        selectedSoulStat: selectedSoulStat ?? this.selectedSoulStat);
  }

  num get(StatType statType) {
    if (selectedSoulStat == null) {
      return 0;
    } else if (selectedSoulStat!.$1 == statType) {
      return selectedSoulStat!.$2;
    } else {
      return 0;
    }
  }

  void updateSoulName(SoulName? soulName) {
    if (soulName == this.soulName) {
      return;
    } else {
      this.soulName = soulName;
      selectedSoulStat = null;
    }
  }

  void updateSoulStat((StatType, num)? selectedSoulStat) {
    this.selectedSoulStat = selectedSoulStat;
  }
}
