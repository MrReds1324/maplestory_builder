import 'package:flutter/material.dart';
import 'package:maplestory_builder/constants/character/inner_ability_stats.dart';
import 'package:maplestory_builder/constants/constants.dart';
import 'package:maplestory_builder/modules/utilities/utilities.dart';

class InnerAbilityProvider with ChangeNotifier {

  // TODO - requires skills to know if "debuff" is applied for conditional boss damage
  int activeSetNumber = 1;
  late Map<int, InnerAbilityContainer> innerAbilitySets; 
  late InnerAbilityContainer activeInnerAbility;

  Widget hoverTooltip = const SizedBox.shrink();

  InnerAbilityProvider({
    this.activeSetNumber = 1,
    InnerAbilityContainer? activeInnerAbility,
    Map<int, InnerAbilityContainer>? innerAbilitySets,
  }) { 
    this.innerAbilitySets = innerAbilitySets ?? {
      1: InnerAbilityContainer(),
      2: InnerAbilityContainer(),
      3: InnerAbilityContainer(),
      4: InnerAbilityContainer(),
      5: InnerAbilityContainer(),
    };
    this.activeInnerAbility = activeInnerAbility ?? this.innerAbilitySets[activeSetNumber]!;
  }

  InnerAbilityProvider copyWith({
    
    int? activeSetNumber,
    InnerAbilityContainer? activeInnerAbility,
    Map<int, InnerAbilityContainer>? innerAbilitySets,
  }) {
    return InnerAbilityProvider(
      activeSetNumber: activeSetNumber ?? this.activeSetNumber,
      activeInnerAbility: activeInnerAbility ?? this.activeInnerAbility,
      innerAbilitySets: innerAbilitySets ?? Map.of(this.innerAbilitySets),
    );
  }

  InnerAbilityProvider update() {
    return this;
  }

  Map<StatType, num> calculateStats({bool isDebuffActive = false}) {
    Map<StatType, num> returnValue = {};

    for (InnerAbilityLine innerAbilityLine in activeInnerAbility.assignedInnerAbility.values) {
      var innerAbilityLineStat = innerAbilityLine.calculateStatValue();
      switch (innerAbilityLine.innerAbility) {
        case null:
          continue;
        case InnerAbility.damageToMobsInflictedWithStatus:
          if (!isDebuffActive) {
            continue;
          }
          if (innerAbilityLineStat.$1 != null) {
            returnValue[innerAbilityLineStat.$1!] = innerAbilityLineStat.$2;
          }
        default:
          if (innerAbilityLineStat.$1 != null) {
            returnValue[innerAbilityLineStat.$1!] = innerAbilityLineStat.$2;
          }
      }
    }

    return returnValue;
  }

  void updateInnerAbility(int innerAbilityPosition, InnerAbility? innerAbility) {
    var targetInnerAbilityLine = activeInnerAbility.assignedInnerAbility[innerAbilityPosition]!;

    if (targetInnerAbilityLine.innerAbility == innerAbility) {
      return;
    }
    else {
      targetInnerAbilityLine.innerAbility = innerAbility;
      targetInnerAbilityLine.selectedRange = 0;
      notifyListeners();
    }
  }

  void updateInnerAbilityValue(int innerAbilityPosition, int selectedRange) {
    var targetInnerAbilityLine = activeInnerAbility.assignedInnerAbility[innerAbilityPosition]!;
    targetInnerAbilityLine.selectedRange = selectedRange;
    notifyListeners();
  }

  void changeActiveSet(int innerAbilityPosition) {
    activeSetNumber = innerAbilityPosition;
    activeInnerAbility = innerAbilitySets[innerAbilityPosition]!;

    notifyListeners();
  }

  void getHoverTooltipText(int innerAbilityPosition) {
    Widget? statDescription;
    Widget? currentLevelText;
    
    var selectedInnerAbilityLine = activeInnerAbility.assignedInnerAbility[innerAbilityPosition]!;
    var currentLevelValues = selectedInnerAbilityLine.calculateStatValue();
    var statType = currentLevelValues.$1;
    var statValue = currentLevelValues.$2;

    statDescription = selectedInnerAbilityLine.innerAbility?.description != null ? Text(selectedInnerAbilityLine.innerAbility!.description) : const SizedBox.shrink();
    currentLevelText = Text("${statType?.formattedName ?? 'Nothing'}: ${(statType?.isPositive ?? true) ? '+' : ' -'}${(statType?.isPercentage ?? false) ? doublePercentFormater.format(statValue) : statValue}");

    hoverTooltip = Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        statDescription,
        currentLevelText,
      ],
    );
  }
}

class InnerAbilityContainer {
  late Map<int, InnerAbilityLine> assignedInnerAbility;

  InnerAbilityContainer({
    Map<int, InnerAbilityLine>? assignedInnerAbility,
  }) {
    this.assignedInnerAbility = assignedInnerAbility ?? {
      1: InnerAbilityLine(),
      2: InnerAbilityLine(),
      3: InnerAbilityLine(),
    };
  }

  InnerAbilityContainer copyWith({
    Map<int, InnerAbilityLine>? assignedInnerAbility,
  }) {
    return InnerAbilityContainer(
      assignedInnerAbility: assignedInnerAbility ?? deepCopyInnerAbilityMap(this.assignedInnerAbility)
    );
  }
}

class InnerAbilityLine {
  InnerAbility? innerAbility;
  int selectedRange = 0;

  InnerAbilityLine({
    this.innerAbility,
    this.selectedRange = 0,
  });

  InnerAbilityLine copyWith({
    InnerAbility? innerAbility,
    int? selectedRange,
  }) {
    return InnerAbilityLine(
      innerAbility: innerAbility ?? this.innerAbility,
      selectedRange: selectedRange ?? this.selectedRange,
    );
  }

  (StatType?, num) calculateStatValue() {
    return (innerAbility?.targetStat, innerAbility?.statValues[selectedRange] ?? 0);
  }

  Color getRankColor() {
    var abilityStatValue = innerAbility?.statValues[selectedRange];
    if (abilityStatValue != null) {
      var abilityRank = innerAbility?.determineInnerAbilityRank(abilityStatValue);
      switch(abilityRank) {
        case InnerAbilityRank.legendary:
          return legendaryPotentialColor;
        case InnerAbilityRank.unique:
          return uniquePotentialColor;
        case InnerAbilityRank.epic:
          return epicPotentialColor;
        case InnerAbilityRank.rare:
          return rarePotentialColor;
        default:
          return statColor;
      }
    }
    else {
      return statColor;
    }
  }

  String getSliderLabel() {
    if (innerAbility != null) {
      return "${innerAbility!.targetStat.formattedName}: ${innerAbility!.targetStat.isPositive ? '+' : '-'}${innerAbility!.targetStat.isPercentage ? doublePercentFormater.format(calculateStatValue().$2) : calculateStatValue().$2}";
      
    }
    else {
      return 'None';
    }
  }
}