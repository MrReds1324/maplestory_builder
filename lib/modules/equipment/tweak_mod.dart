import 'package:maplestory_builder/constants/constants.dart';
import 'package:maplestory_builder/modules/base.dart';

class TweakModule implements Copyable {

  Map<StatType, int> moduleStats;

  TweakModule({
    Map<StatType, int>? moduleStats,
  }) : moduleStats = moduleStats ?? {};

  @override
  TweakModule copyWith({
    Map<StatType, int>? moduleStats,
  }) {
    return TweakModule(
      moduleStats: moduleStats ?? Map.from(this.moduleStats),
    );
  }

  int get(StatType statType) {
    return moduleStats[statType] ?? 0;
  }

  void updateTweakStat(StatType statType, int value) {
    moduleStats[statType] = value;
  }

}
