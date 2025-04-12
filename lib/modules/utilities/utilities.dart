import 'dart:math';

import 'package:intl/intl.dart';
import 'package:maplestory_builder/constants/constants.dart';
import 'package:maplestory_builder/constants/equipment/equip_constants.dart';
import 'package:maplestory_builder/constants/equipment/set_effect_stats.dart';
import 'package:maplestory_builder/modules/base.dart';
import 'package:maplestory_builder/modules/equipment/equip_sets_mod.dart';

final doubleRoundPercentFormater = NumberFormat('#####%');
final doubleRoundFormater = NumberFormat('#######');
final doublePercentFormater = NumberFormat('###0.00%');
final doubleFormater = NumberFormat('#######.00');
final rangeFormatter = NumberFormat('###,###,###,###,###');

double calculateRelativeChangePercentage(num newValue, num originalValue) {
  return (newValue - originalValue) / originalValue;
}

StatType? determinePrimaryStat(Map<StatType, StatCategory> statMap) {
  // Note this does not work with xenons because they have multiple primary stats
  for (MapEntry<StatType, StatCategory> statEntry in statMap.entries) {
    if (statEntry.value == StatCategory.primary) {
      return statEntry.key;
    }
  }
  return null;
}

List<StatType> determineAllPrimaryStat(Map<StatType, StatCategory> statMap) {
  List<StatType> returnValue = [];
  for (MapEntry<StatType, StatCategory> statEntry in statMap.entries) {
    if (statEntry.value == StatCategory.primary) {
      returnValue.add(statEntry.key);
    }
  }
  return returnValue;
}

List<StatType> determineAllSecondaryStat(Map<StatType, StatCategory> statMap) {
  List<StatType> returnValue = [];
  for (MapEntry<StatType, StatCategory> statEntry in statMap.entries) {
    if (statEntry.value == StatCategory.secondary) {
      returnValue.add(statEntry.key);
    }
  }
  return returnValue;
}

double calculateStatusResistanceReduction(num statusResistanceValue) {
  // Taken from https://strategywiki.org/wiki/MapleStory/Formulas#Abnormal_Status_Resistance
  if (statusResistanceValue == 0) {
    return 0;
  }
  else {
    return (28 * (log(statusResistanceValue) / ln10) + 1).floor() / 100;
  }
}

num calculateIgnoreDefenseFromList(List<num> ignoreDefenseValues) {
  num originalValue = 1;
  for (num addValue in ignoreDefenseValues) {
    originalValue = originalValue * (1 - addValue);
  }
  return 1 - originalValue;
}

num calculateIgnoreDefense(num originalValue, num addValue) {
  return 1 - ((1 - originalValue) * (1 - addValue));
}

Map<EquipSet, SetEffect> deepCopySetEffectsMap(Map<EquipSet, SetEffect> map) {
    Map<EquipSet, SetEffect> newMap = {};

    map.forEach((key, value) {
      newMap[key] = value.copyWith();
    });

    return newMap;
}

Map<K, V> mapDeepCopy<K,V>(Map<K, V> map){
  Map<K,V> newMap = <K,V>{};

  map.forEach((key, value){
    newMap[key] =
      value is Copyable ? value.copyWith() :
      value;
  });

  return newMap;
}

List<T> listDeepCopy<T>(List<T> list){
  List<T> newList = <T>[];

  for (var value in list) {
    newList.add(
      value is Copyable ? value.copyWith() :
      value
    );
  }

  return newList;
}

Set<T> setDeepCopy<T>(Set<T> s){
  Set<T> newSet = <T>{};

  for (var value in s) {
    newSet.add(
      value is Copyable ? value.copyWith() :
      value
    );
  }

  return newSet;
}

Map<EquipType, Set<EquipName>> deepCopyEquippedEquips(Map<EquipType, Set<EquipName>> map) {
  Map<EquipType, Set<EquipName>> newMap = {};

    map.forEach((key, value) {
      newMap[key] = Set.of(value);
    });

    return newMap;
}
