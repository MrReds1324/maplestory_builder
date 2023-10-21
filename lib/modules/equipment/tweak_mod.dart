import 'package:maplestory_builder/constants/constants.dart';

class TweakModule {

  Map<StatType, num> moduleStats;

  TweakModule({
    Map<StatType, num>? moduleStats,
  }) : moduleStats = moduleStats ?? {};

  TweakModule copyWith({
    Map<StatType, num>? moduleStats,
  }) {
    return TweakModule(
      moduleStats: moduleStats ?? this.moduleStats,
    );
  }

  num get(StatType statType) {
    return moduleStats[statType] ?? 0;
  }

  void updateTweakStat(StatType statType, int value) {
    moduleStats[statType] = value;
  }

}
