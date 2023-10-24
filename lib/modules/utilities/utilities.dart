import 'package:intl/intl.dart';
import 'package:maplestory_builder/constants/constants.dart';
import 'package:maplestory_builder/constants/equipment/scroll_stats.dart';
import 'package:maplestory_builder/constants/equipment/set_effect_stats.dart';

final doubleRoundPercentFormater = NumberFormat('#####%');
final doubleRoundFormater = NumberFormat('#######');
final doublePercentFormater = NumberFormat('###0.00%');
final doubleFormater = NumberFormat('#######.00');
final rangeFormatter = NumberFormat('###,###,###,###,###');

String formatCharacterClassEnumName(CharacterClass characterClass) {
  return characterClass.name.replaceAll('_', " ").toUpperCase();
}

double calculteDifferencePercentage(num newValue, num originalValue) {
  return (newValue - originalValue) / originalValue;
}

Map<EquipSet, SetEffect> deepCopySetEffectsMap(Map<EquipSet, SetEffect> map) {
    Map<EquipSet, SetEffect> newMap = {};

    map.forEach((key, value) {
      newMap[key] = value.copyWith();
    });

    return newMap;
}

List<BaseScroll> deepCopyScrollsList(List<BaseScroll> list) {
    List<BaseScroll> newList = [];

    for (BaseScroll baseScroll in list) {
      if (baseScroll is SavedScroll) {
        newList.add(baseScroll.copyWith());
      }
      else if (baseScroll is SavedScrolledRange) {
        newList.add(baseScroll.copyWith());
      }
    }

    return newList;
}
