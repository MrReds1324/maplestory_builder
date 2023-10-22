import 'package:maplestory_builder/constants/constants.dart';

class TweakModule {

  Map<StatType, int> moduleStats;

  TweakModule({
    Map<StatType, int>? moduleStats,
  }) : moduleStats = moduleStats ?? {};

  TweakModule copyWith({
    Map<StatType, int>? moduleStats,
  }) {
    return TweakModule(
      moduleStats: moduleStats ?? this.moduleStats,
    );
  }

  int get(StatType statType) {
    return moduleStats[statType] ?? 0;
  }

  void updateTweakStat(StatType statType, int value) {
    moduleStats[statType] = value;
  }

}
