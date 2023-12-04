import 'dart:math';

import 'package:intl/intl.dart';
import 'package:maplestory_builder/constants/constants.dart';
import 'package:maplestory_builder/constants/equipment/equip_constants.dart';
import 'package:maplestory_builder/constants/equipment/scroll_stats.dart';
import 'package:maplestory_builder/constants/equipment/set_effect_stats.dart';
import 'package:maplestory_builder/modules/equipment/equip_sets_mod.dart';
import 'package:maplestory_builder/providers/character/inner_ability_provider.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

final doubleRoundPercentFormater = NumberFormat('#####%');
final doubleRoundFormater = NumberFormat('#######');
final doublePercentFormater = NumberFormat('###0.00%');
final doubleFormater = NumberFormat('#######.00');
final rangeFormatter = NumberFormat('###,###,###,###,###');

double calculteDifferencePercentage(num newValue, num originalValue) {
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

Map<K, V> mapDeepCopy<K,V>(Map map){
  Map<K,V> newMap = <K,V>{};

  map.forEach((key, value){
    newMap[key] =
      value is Map ? mapDeepCopy(value) :
      value is List ? listDeepCopy(value) :
      value is Set ? setDeepCopy(value) :
      value?.copyWith();
  });

  return newMap;
}

List<T> listDeepCopy<T>(List list){
  List<T> newList = <T>[];

  list.forEach((value) {
    newList.add(
      value is Map ? mapDeepCopy(value) :
      value is List ? listDeepCopy(value) :
      value is Set ? setDeepCopy(value) :
      value.copyWith()
    );
  });

  return newList;
}

Set<T> setDeepCopy<T>(Set s){
  Set<T> newSet = Set<T>();

  s.forEach((value) {
    newSet.add(
      value is Map ? mapDeepCopy(value) :
      value is List ? listDeepCopy(value) :
      value is Set ? setDeepCopy(value) :
      value.copyWith()
    );
  });

  return newSet;
}

Map<EquipType, Set<EquipName>> deepCopyEquippedEquips(Map<EquipType, Set<EquipName>> map) {
  Map<EquipType, Set<EquipName>> newMap = {};

    map.forEach((key, value) {
      newMap[key] = Set.of(value);
    });

    return newMap;
}

List<AbstractScroll> deepCopyScrollsList(List<AbstractScroll> list) {
    List<AbstractScroll> newList = [];

    for (AbstractScroll baseScroll in list) {
      if (baseScroll is SavedScroll) {
        newList.add(baseScroll.copyWith());
      }
      else if (baseScroll is SavedScrolledRange) {
        newList.add(baseScroll.copyWith());
      }
    }

    return newList;
}

Map<int, InnerAbilityLine> deepCopyInnerAbilityMap(Map<int, InnerAbilityLine> innerAbilityLines) {
  Map<int, InnerAbilityLine> newMap = {};
  
  for (MapEntry<int, InnerAbilityLine> mapEntry in innerAbilityLines.entries) {
    newMap.addAll({mapEntry.key: mapEntry.value.copyWith()});
  }

  return newMap;
}


// All of this is so that we can create our own extended change notifier proxies that include more values than just 6... Who knows if this is a good idea
class _ChangeNotifierProvider<T extends ChangeNotifier?>
    extends ListenableProvider<T> {
  /// Creates a [ChangeNotifier] using `create` and automatically
  /// disposes it when [ChangeNotifierProvider] is removed from the widget tree.
  ///
  /// `create` must not be `null`.
  _ChangeNotifierProvider({
    Key? key,
    required Create<T> create,
    bool? lazy,
    TransitionBuilder? builder,
    Widget? child,
  }) : super(
          key: key,
          create: create,
          dispose: _dispose,
          lazy: lazy,
          builder: builder,
          child: child,
        );

  /// Provides an existing [ChangeNotifier].
  // ignore: unused_element
  _ChangeNotifierProvider.value({
    Key? key,
    required T value,
    TransitionBuilder? builder,
    Widget? child,
  }) : super.value(
          key: key,
          builder: builder,
          value: value,
          child: child,
        );

  static void _dispose(BuildContext context, ChangeNotifier? notifier) {
    notifier?.dispose();
  }
}

// ignore: public_member_api_docs
typedef ProxyProviderBuilder7<T, T2, T3, T4, T5, T6, T7, T8, R> = R Function(
  BuildContext context,
  T value,
  T2 value2,
  T3 value3,
  T4 value4,
  T5 value5,
  T6 value6,
  T7 value7,
  T8 value8,
  R? previous,
);

/// {@macro provider.listenableproxyprovider}
class _ListenableProxyProvider7<T, T2, T3, T4, T5, T6, T7, T8, R extends Listenable?>
    extends ListenableProxyProvider0<R> {
  /// Initializes [key] for subclasses.
  _ListenableProxyProvider7({
    Key? key,
    Create<R>? create,
    required ProxyProviderBuilder7<T, T2, T3, T4, T5, T6, T7, T8, R> update,
    Dispose<R>? dispose,
    bool? lazy,
    TransitionBuilder? builder,
    Widget? child,
  }) : super(
          key: key,
          create: create,
          lazy: lazy,
          builder: builder,
          update: (context, previous) => update(
            context,
            Provider.of(context),
            Provider.of(context),
            Provider.of(context),
            Provider.of(context),
            Provider.of(context),
            Provider.of(context),
            Provider.of(context),
            Provider.of(context),
            previous,
          ),
          dispose: dispose,
          child: child,
        );
}

/// {@macro provider.changenotifierproxyprovider}
class ChangeNotifierProxyProvider8<T, T2, T3, T4, T5, T6, T7, T8, R extends ChangeNotifier?>
    extends _ListenableProxyProvider7<T, T2, T3, T4, T5, T6, T7, T8, R> {
  /// Initializes [key] for subclasses.
  ChangeNotifierProxyProvider8({
    Key? key,
    required Create<R> create,
    required ProxyProviderBuilder7<T, T2, T3, T4, T5, T6, T7, T8, R> update,
    bool? lazy,
    TransitionBuilder? builder,
    Widget? child,
  }) : super(
          key: key,
          create: create,
          update: update,
          dispose: _ChangeNotifierProvider._dispose,
          lazy: lazy,
          builder: builder,
          child: child,
        );
}