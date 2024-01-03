import 'package:flutter/material.dart';
import 'package:maplestory_builder/constants/character/symbols_stats.dart';
import 'package:maplestory_builder/constants/character/trait_stats.dart';
import 'package:maplestory_builder/constants/constants.dart';
import 'package:maplestory_builder/constants/equipment/set_effect_stats.dart';
import 'package:maplestory_builder/modules/equipment/equipment_mod.dart';
import 'package:maplestory_builder/modules/equipment/equips.dart';
import 'package:maplestory_builder/modules/familiars/familiar.dart';
import 'package:maplestory_builder/modules/familiars/familiars_mod.dart';
import 'package:maplestory_builder/modules/hexa_stats.dart/hexa_stat.dart';
import 'package:maplestory_builder/modules/hexa_stats.dart/hexa_stats_mod.dart';
import 'package:maplestory_builder/providers/calculator_provider.dart';
import 'package:maplestory_builder/modules/utilities/utilities.dart';
import 'package:maplestory_builder/providers/equipment/equip_editing_provider.dart';
import 'package:maplestory_builder/providers/familiars/familiar_editing_provider.dart';
import 'package:maplestory_builder/providers/hexa_stats/hexa_stat_editing_provider.dart';

enum CalculationType {
  compareEquipment,
  compareEquipmentSet,
  compareFamiliar,
  compareHexaStat,
  compareStats,
  stats,
}

class DifferenceCalculatorProvider with ChangeNotifier {

  CalculatorProvider mainCalculatorProvider;
  CalculatorProvider diffCalculatorProvider;
  EquipEditingProvider equipEditingProvider;
  FamiliarEditingProvider familiarEditingProvider;
  HexaStatEditingProvider hexaStatEditingProvider;
  int lastEditingEquipCounter = 0;
  int lastEditingFamiliarCounter = 0;
  int lastEditingHexaStatCounter = 0;
  Widget differenceWidget = const SizedBox.shrink();

  DifferenceCalculatorProvider({
    required this.mainCalculatorProvider,
    required this.equipEditingProvider,
    required this.familiarEditingProvider,
    required this.hexaStatEditingProvider,
  }) : diffCalculatorProvider = mainCalculatorProvider.copyWith(
    characterProvider: mainCalculatorProvider.characterProvider,
    apStatsProvider: mainCalculatorProvider.apStatsProvider,
    innerAbilityProvider: mainCalculatorProvider.innerAbilityProvider,
    traitStatsProvider: mainCalculatorProvider.traitStatsProvider,
    hyperStatsProvider: mainCalculatorProvider.hyperStatsProvider,
    symbolStatsProvider: mainCalculatorProvider.symbolStatsProvider,
    equipsProvider: mainCalculatorProvider.equipsProvider,
    legionStatsProvider: mainCalculatorProvider.legionStatsProvider,
    legionArtifactProvider: mainCalculatorProvider.legionArtifactProvider,
    familiarsProvider: mainCalculatorProvider.familiarsProvider,
    hexaStatsProvider: mainCalculatorProvider.hexaStatsProvider,
    consumablesProvider: mainCalculatorProvider.consumablesProvider,
  );


  DifferenceCalculatorProvider update(
    CalculatorProvider calculatorProvider, 
    EquipEditingProvider equipEditingProvider, 
    FamiliarEditingProvider familiarEditingProvider,
    HexaStatEditingProvider hexaStatEditingProvider,
  ) {
    // last editing equip counter matches the update counter then means the character provider has updated, trigger an update
    // mainly used for editing equip update
    if (equipEditingProvider.updateCounter == lastEditingEquipCounter && familiarEditingProvider.updateCounter == lastEditingFamiliarCounter && hexaStatEditingProvider.updateCounter == lastEditingHexaStatCounter) {
      // Only trigger an update to redraw if we are actually editing an equip or familiar, otherwise its wasted cycles
      if (equipEditingProvider.updateCounter != 0 || familiarEditingProvider.updateCounter != 0 || hexaStatEditingProvider.updateCounter != 0) {
        notifyListeners();
      }
    }
    else {
      lastEditingEquipCounter = equipEditingProvider.updateCounter;
      lastEditingFamiliarCounter = familiarEditingProvider.updateCounter;
      lastEditingHexaStatCounter = hexaStatEditingProvider.updateCounter;
    }

    return this;
  }

  Widget updateDifferenceText({
    BuildContext? context, 
    Equip? replacingEquip, 
    Equip? comparingEquip,
    Familiar? replacingFamiliar, 
    Familiar? comparingFamiliar, 
    HexaStat? replacingHexaStat,
    HexaStat? comparingHexaStat,
    CalculationType calculationType = CalculationType.stats, 
    bool isDense = false
  }) {

    List<Widget> textList = [];
    List<Widget> editingWidgets = [];

    void createText(num newValue, num originalValue, {StatType? statType, RangeType? rangeType}) {
      assert(statType != null || rangeType != null, "Must provide statType or RangeType");
      var difference = newValue - originalValue;
      if (difference == 0) {
        return;
      }

      Text? text;
      if (statType != null){
        text = Text(
          '${difference < 0 ? "" : "+"}${statType.isPositive ? '' : ' -'}${statType.isPercentage ? doublePercentFormater.format(difference) : doubleRoundFormater.format(difference)} ${statType.formattedName} (${difference < 0 ? "" : "+"}${doublePercentFormater.format(calculteDifferencePercentage(newValue, originalValue))})',
          style: TextStyle(
            color: difference < 0 ?Colors.redAccent: Colors.greenAccent,
          ),
        );
      }
      if (rangeType != null) {
        text = Text(
          '${difference < 0 ? "" : "+"}${rangeFormatter.format(difference)} ${rangeType.formattedName} (${difference < 0 ? "" : "+"}${doublePercentFormater.format(calculteDifferencePercentage(newValue, originalValue))})',
          style: TextStyle(
            color: difference < 0 ?Colors.redAccent: Colors.greenAccent,
          ),
        );
      }

      if (text != null) {
        textList.add(text);
      }
    }

    void compareEquipSets({bool isComparingEquips = false, bool isComparingLuckyItem = false}) {
      // Compare the two Total Set Effects if two different equipment sets are being compared
      if (mainCalculatorProvider.equipsProvider.activeSetNumber != diffCalculatorProvider.equipsProvider.activeSetNumber || isComparingEquips) {
        var oldEquipSet = mainCalculatorProvider.equipsProvider.activeEquipSet.setEffectModule.getEquippedSetCounts();
        var newEquipSet = diffCalculatorProvider.equipsProvider.activeEquipSet.setEffectModule.getEquippedSetCounts();

        var allEquipSetNames = Set.from(oldEquipSet.keys.toList() + newEquipSet.keys.toList());
        for (EquipSet equipSet in allEquipSetNames) {
          if (isComparingLuckyItem && (comparingEquip?.equipSet == equipSet || replacingEquip?.equipSet == equipSet)) {
            continue;
          }

          var difference = (newEquipSet[equipSet] ?? 0) - (oldEquipSet[equipSet] ?? 0);

          if (isComparingEquips && difference == 0) {
            continue;
          }

          editingWidgets.add(
            Text(
              '${equipSet.formattedName}: ${difference > 0 ? "+" : ""}$difference items',
              style: TextStyle(
                color: difference < 0 ?Colors.redAccent: Colors.greenAccent,
              ),
            )
          );
        }
      }
    }

    if (calculationType == CalculationType.compareEquipment) {
      if (replacingEquip == null) {
        editingWidgets.add(
          const Text(
            "Equipping: ",
          )
        );
        if (!isDense) {
          editingWidgets.add(comparingEquip?.createSetEffectContainer(context!, isEquipComparing: true, isAdding: true) ?? const SizedBox.shrink());
        }
        else {
          compareEquipSets(isComparingEquips: true);
        }
      }
      else{
        editingWidgets.add(
          Text(
            "Replacing ${replacingEquip.equipName.formattedName}: "
          )
        );
        if (!isDense) {
          if (replacingEquip.equipName != comparingEquip?.equipName) {
            editingWidgets.add(comparingEquip?.createSetEffectContainer(context!, isEquipComparing: true, isAdding: true) ?? const SizedBox.shrink());
            editingWidgets.add(replacingEquip.createSetEffectContainer(context!, isEquipComparing: true, isRemoving: true));
          }
          else {
            editingWidgets.add(comparingEquip?.createSetEffectContainer(context!, isEquipComparing: true, isAdding: true) ?? const SizedBox.shrink());
          }

          if ((comparingEquip?.equipName.isLuckyItem ?? false) || (replacingEquip.equipName.isLuckyItem)) {
            compareEquipSets(isComparingEquips: true, isComparingLuckyItem: true);
          }
        }
        else {
          compareEquipSets(isComparingEquips: true);
        }
      }
    }
    else if (calculationType == CalculationType.compareFamiliar) {
      if (replacingFamiliar == null) {
        editingWidgets.add(
          const Text(
            "Activating: ",
          )
        );
      }
      else{
        editingWidgets.add(
          Text(
            "Replacing ${replacingFamiliar.familiarName}: "
          )
        );
      }
    }
    else if (calculationType == CalculationType.compareHexaStat) {
      if (replacingHexaStat == null) {
        editingWidgets.add(
          const Text(
            "Equipping: ",
          )
        );
      }
      else{
        editingWidgets.add(
          Text(
            "Replacing ${replacingHexaStat.hexaStatName}: "
          )
        );
      }
    }

    createText(diffCalculatorProvider.upperDamageRange, mainCalculatorProvider.upperDamageRange, rangeType: RangeType.damageRange);
    createText(diffCalculatorProvider.upperBossDamangeRange, mainCalculatorProvider.upperBossDamangeRange, rangeType: RangeType.bossDamageRange);
    
    for (StatType statType in comparisonStats) {
      createText(diffCalculatorProvider.totalStats[statType]!, mainCalculatorProvider.totalStats[statType]!, statType: statType);
    }

    if (calculationType == CalculationType.compareEquipmentSet) {
      compareEquipSets();

      if (textList.isNotEmpty) {
        differenceWidget = Column(children: textList + editingWidgets);
      }
      else {
        differenceWidget = Column(children: <Widget>[noDifferenceFamiliar] + editingWidgets);
      }
    }
    else if (calculationType == CalculationType.compareEquipment) {
      if (textList.isNotEmpty) {
        return Column(children: editingWidgets + textList);
      }
      else {
        return Column(children: editingWidgets + [noDifferenceEquip]);
      }
    }
    else if (calculationType == CalculationType.compareFamiliar) {
      if (textList.isNotEmpty) {
        return Column(children: editingWidgets + textList);
      }
      else {
        return Column(children: editingWidgets + [noDifferenceFamiliar]);
      }
    }
    else if (calculationType == CalculationType.compareHexaStat) {
      if (textList.isNotEmpty) {
        return Column(children: editingWidgets + textList);
      }
      else {
        return Column(children: editingWidgets + [noDifferenceHexaStat]);
      }
    }
    else if (calculationType == CalculationType.compareStats) {
      if (textList.isNotEmpty) {
        differenceWidget = Column(children: textList);
      }
      else {
        differenceWidget = noDifferenceStat;
      }
    }
    else {
      differenceWidget = Column(children: textList);
    }

    notifyListeners();
    return const SizedBox.shrink();
  }
  
  Widget? compareEquip(BuildContext context, Equip? compareEquip, {bool isEditing = false, bool isDense = true}) {
    Equip? tempEquip;
    Widget? widgetReturn;

    // Used for items that have multiple positions like totems, rings, etc
    List<Widget> widgetChildren = <Widget>[];
    bool hasEquipped = false;
    
    if (compareEquip != null) {
      // Used for items that are uniqueEquipped like Superior Gollux Items
      bool isUniqueItem = compareEquip.equipName.isUniqueItem;
      // Save a reference to the equipModule, then replace the target with a copy for destructive calculations
      var tempEquipProvider = diffCalculatorProvider.equipsProvider;
      diffCalculatorProvider.equipsProvider = tempEquipProvider.copyWith();
      EquipmentModule activeEquipmentModule = diffCalculatorProvider.equipsProvider.activeEquipSet;
      
      // Only need to do this if we are actually editing equips, otherwise we are comparing an already saved item
      if (isEditing) {
        // Need to register/overwrite the callback to our copied equips provider instance so we can appropriately reverse lookup the editing equip
        activeEquipmentModule.registerEquipCallback(diffCalculatorProvider.equipsProvider.getEquipCallback);

        diffCalculatorProvider.equipsProvider.allEquips[compareEquip.equipId] = compareEquip;
      }

      var uniqueItemPosition = activeEquipmentModule.getUniqueItemPosition(compareEquip.equipName, compareEquip.equipName.equipType);

      switch(compareEquip.equipName.equipType) {
        case EquipType.totem:
          for (int i = 1; i <=3; i++) {
            tempEquip = activeEquipmentModule.getSelectedEquip(EquipType.totem, equipPosition: i);
            if ((isUniqueItem && uniqueItemPosition == i) || (uniqueItemPosition == null && (!hasEquipped || tempEquip != null))) {
              if (tempEquip == null) {
                hasEquipped = true;
              }
              diffCalculatorProvider.equipsProvider.equipEquip(compareEquip, EquipType.totem, equipPosition: i, isCalculatingDifference: true);
              diffCalculatorProvider.calculateEverything(recalculateCache: true);
              widgetChildren.add(updateDifferenceText(context: context, replacingEquip: tempEquip, comparingEquip: compareEquip, calculationType: CalculationType.compareEquipment, isDense: isDense));
              diffCalculatorProvider.equipsProvider.equipEquip(tempEquip, EquipType.totem, equipPosition: i);
            }
          }

          widgetReturn = Column(children: widgetChildren);
        case EquipType.ring:
          for (int i = 1; i <=4; i++) {
            tempEquip = activeEquipmentModule.getSelectedEquip(EquipType.ring, equipPosition: i);
            if ((isUniqueItem && uniqueItemPosition == i) || (uniqueItemPosition == null && (!hasEquipped || tempEquip != null))) {
              if (tempEquip == null) {
                hasEquipped = true;
              }
              diffCalculatorProvider.equipsProvider.equipEquip(compareEquip, EquipType.ring, equipPosition: i, isCalculatingDifference: true);
              diffCalculatorProvider.calculateEverything(recalculateCache: true);
              widgetChildren.add(updateDifferenceText(context: context, replacingEquip: tempEquip, comparingEquip: compareEquip, calculationType: CalculationType.compareEquipment, isDense: isDense));
              diffCalculatorProvider.equipsProvider.equipEquip(tempEquip, EquipType.ring, equipPosition: i, isCalculatingDifference: true);
            }
          }

          widgetReturn = Column(children: widgetChildren);
        case EquipType.pendant:
          for (int i = 1; i <=2; i++) {
            tempEquip = activeEquipmentModule.getSelectedEquip(EquipType.pendant, equipPosition: i);
            if ((isUniqueItem && uniqueItemPosition == i) || (uniqueItemPosition == null && (!hasEquipped || tempEquip != null))) {
              if (tempEquip == null) {
                hasEquipped = true;
              }
              diffCalculatorProvider.equipsProvider.equipEquip(compareEquip, EquipType.pendant, equipPosition: i, isCalculatingDifference: true);
              diffCalculatorProvider.calculateEverything(recalculateCache: true);
              widgetChildren.add(updateDifferenceText(context: context, replacingEquip: tempEquip, comparingEquip: compareEquip, calculationType: CalculationType.compareEquipment, isDense: isDense));
              diffCalculatorProvider.equipsProvider.equipEquip(tempEquip, EquipType.pendant, equipPosition: i, isCalculatingDifference: true);
            }
          }

          widgetReturn = Column(children: widgetChildren);
        case EquipType.pet:
          for (int i = 1; i <=3; i++) {
            tempEquip = activeEquipmentModule.getSelectedEquip(EquipType.pet, equipPosition: i);
            if ((isUniqueItem && uniqueItemPosition == i) || (uniqueItemPosition == null && (!hasEquipped || tempEquip != null))) {
              if (tempEquip == null) {
                hasEquipped = true;
              }
              diffCalculatorProvider.equipsProvider.equipEquip(compareEquip, EquipType.pet, equipPosition: i, isCalculatingDifference: true);
              diffCalculatorProvider.calculateEverything(recalculateCache: true);
              widgetChildren.add(updateDifferenceText(context: context, replacingEquip: tempEquip, comparingEquip: compareEquip, calculationType: CalculationType.compareEquipment, isDense: isDense));
              diffCalculatorProvider.equipsProvider.equipEquip(tempEquip, EquipType.pet, equipPosition: i, isCalculatingDifference: true);
            }
          }

          widgetReturn = Column(children: widgetChildren);
        case EquipType.petEquip:
          for (int i = 1; i <=3; i++) {
            tempEquip = activeEquipmentModule.getSelectedEquip(EquipType.petEquip, equipPosition: i);
            if ((isUniqueItem && uniqueItemPosition == i) || (uniqueItemPosition == null && (!hasEquipped || tempEquip != null))) {
              if (tempEquip == null) {
                hasEquipped = true;
              }
              diffCalculatorProvider.equipsProvider.equipEquip(compareEquip, EquipType.petEquip, equipPosition: i, isCalculatingDifference: true);
              diffCalculatorProvider.calculateEverything(recalculateCache: true);
              widgetChildren.add(updateDifferenceText(context: context, replacingEquip: tempEquip, comparingEquip: compareEquip, calculationType: CalculationType.compareEquipment, isDense: isDense));
              diffCalculatorProvider.equipsProvider.equipEquip(tempEquip, EquipType.petEquip, equipPosition: i, isCalculatingDifference: true);
            }
          }

          widgetReturn = Column(children: widgetChildren);
        default:
          tempEquip = activeEquipmentModule.getSelectedEquip(compareEquip.equipName.equipType);
          diffCalculatorProvider.equipsProvider.equipEquip(compareEquip, compareEquip.equipName.equipType, isCalculatingDifference: true);
          diffCalculatorProvider.calculateEverything(recalculateCache: true);
          widgetReturn = updateDifferenceText(context: context, replacingEquip: tempEquip, comparingEquip: compareEquip, calculationType: CalculationType.compareEquipment, isDense: isDense);
      }

      diffCalculatorProvider.equipsProvider = tempEquipProvider;
    }

    if (isEditing) {
      return widgetReturn;
    }
    else {
      differenceWidget = widgetReturn ?? const SizedBox.shrink();
      notifyListeners();
      return null;
    }
  }

  Widget? compareEditingEquip(BuildContext context) {
    return compareEquip(context, equipEditingProvider.editingEquip, isEditing: true, isDense: false);
  }

  Widget? compareFamiliar(BuildContext context, Familiar? compareFamiliar, {bool isEditing = false, bool isDense = true}) {
    Widget? widgetReturn;

    List<Widget> widgetChildren = <Widget>[];
    bool hasEquipped = false;
    
    if (compareFamiliar != null) {
      // Save a reference to the familiar provider, then replace the target with a copy for destructive calculations
      var tempFamiliarsProvider = diffCalculatorProvider.familiarsProvider;
      diffCalculatorProvider.familiarsProvider = tempFamiliarsProvider.copyWith();
      FamiliarModule activeFamiliarModule = diffCalculatorProvider.familiarsProvider.activeFamiliarSet;
      
      // Only need to do this if we are actually editing familiars, otherwise we are comparing an already saved familiar
      if (isEditing) {
        // Need to register/overwrite the callback to our copied familiars provider instance so we can appropriately reverse lookup the editing fammiliar
        activeFamiliarModule.registerFamiliarCallback(diffCalculatorProvider.familiarsProvider.getFamiliarCallback);

        diffCalculatorProvider.familiarsProvider.allFamiliars[compareFamiliar.familiarId] = compareFamiliar;
      }

      var equippedFamiliarPosition = activeFamiliarModule.getFamiliarPosition(compareFamiliar.familiarId);

      for (int i = 1; i <=3; i++) {
        var tempFamiliar = activeFamiliarModule.getSelectedFamiliar(i);
        if ((equippedFamiliarPosition == i) || (equippedFamiliarPosition == null && (!hasEquipped || tempFamiliar != null))) {
          if (tempFamiliar == null) {
            hasEquipped = true;
          }
          diffCalculatorProvider.familiarsProvider.equipFamiliar(compareFamiliar, i);
          diffCalculatorProvider.calculateEverything(recalculateCache: true);
          widgetChildren.add(updateDifferenceText(context: context, replacingFamiliar: tempFamiliar, comparingFamiliar: compareFamiliar, calculationType: CalculationType.compareFamiliar, isDense: isDense));
          diffCalculatorProvider.familiarsProvider.equipFamiliar(tempFamiliar, i);
        }
      }

      widgetReturn = Column(children: widgetChildren);
      diffCalculatorProvider.familiarsProvider = tempFamiliarsProvider;
    }

    if (isEditing) {
      return widgetReturn;
    }
    else {
      differenceWidget = widgetReturn ?? const SizedBox.shrink();
      notifyListeners();
      return null;
    }
  }

  Widget? compareEditingFamiliar(BuildContext context) {
    return compareFamiliar(context, familiarEditingProvider.editingFamiliar, isEditing: true, isDense: false);
  }

  Widget? compareHexaStat(BuildContext context, HexaStat? compareHexaStat, {bool isEditing = false, bool isDense = true}) {
    Widget? widgetReturn;

    List<Widget> widgetChildren = <Widget>[];
    bool hasEquipped = false;
    
    if (compareHexaStat != null) {
      // Save a reference to the hexa stat provider, then replace the target with a copy for destructive calculations
      var tempHexaStatsProvider = diffCalculatorProvider.hexaStatsProvider;
      diffCalculatorProvider.hexaStatsProvider = tempHexaStatsProvider.copyWith();
      HexaStatsModule activeHexaStatsModule = diffCalculatorProvider.hexaStatsProvider.activeHexaStatsSet;
      
      // Only need to do this if we are actually editing familiars, otherwise we are comparing an already saved familiar
      if (isEditing) {
        // Need to register/overwrite the callback to our copied hexa stats provider instance so we can appropriately reverse lookup the editing hexa stat
        activeHexaStatsModule.registerHexaStatCallback(diffCalculatorProvider.hexaStatsProvider.getHexaStatsCallback);

        diffCalculatorProvider.hexaStatsProvider.allHexaStats[compareHexaStat.hexaStatId] = compareHexaStat;
      }

      var equippedHexaStatPosition = activeHexaStatsModule.getHexaStatPosition(compareHexaStat.hexaStatId);
      var duplicateMainStatPosition = activeHexaStatsModule.getHexaStatMainStatPosition(compareHexaStat);
      
      Set<int?> additionalStatReplacementPositions = {};
      bool doesNeedRemoving = false;
      bool canEquip = true;

      // Check the additional stats for going over the 2 limit max
      var additionalStatCount = activeHexaStatsModule.additionalStatCount;
      for (StatType? selectedAdditionalStat in [compareHexaStat.selectedStats[2], compareHexaStat.selectedStats[3]]) {
        if (additionalStatCount[selectedAdditionalStat] != null && additionalStatCount[selectedAdditionalStat]!.$1 >= 2) {
          if (additionalStatCount[selectedAdditionalStat]!.$1 > 2 && additionalStatCount[selectedAdditionalStat]!.$2.contains(equippedHexaStatPosition)) {
            doesNeedRemoving = true;
          }
          canEquip = false;
          additionalStatReplacementPositions.addAll(additionalStatCount[selectedAdditionalStat]!.$2);
        }
      }
      additionalStatReplacementPositions.remove(equippedHexaStatPosition);

      // If we have duplicated main stats  or gone over the additional stat limit then we have to unequip the one we are editing
      if ((duplicateMainStatPosition != null  || doesNeedRemoving) && equippedHexaStatPosition != null) {
        activeHexaStatsModule.equippedHexaStat[equippedHexaStatPosition] = null;
      }

      void swapAndCompare(HexaStat? tempHexaStat, int hexaStatPosition) {
        if (tempHexaStat == null) {
            hasEquipped = true;
          }
          diffCalculatorProvider.hexaStatsProvider.equipHexaStat(compareHexaStat, hexaStatPosition);
          diffCalculatorProvider.calculateEverything(recalculateCache: true);
          widgetChildren.add(updateDifferenceText(context: context, replacingHexaStat: tempHexaStat, comparingHexaStat: compareHexaStat, calculationType: CalculationType.compareHexaStat, isDense: isDense));
          diffCalculatorProvider.hexaStatsProvider.equipHexaStat(tempHexaStat, hexaStatPosition);
      }

      for (int i = 1; i <=6; i++) {
        var tempHexaStat = activeHexaStatsModule.getSelectedHexaStat(i);
        if (equippedHexaStatPosition == i || (duplicateMainStatPosition == i && additionalStatReplacementPositions.contains(duplicateMainStatPosition)) || (duplicateMainStatPosition == i && canEquip)) {
          swapAndCompare(tempHexaStat, i);
        }
        else if (equippedHexaStatPosition == null && duplicateMainStatPosition == null && canEquip && (!hasEquipped || tempHexaStat != null)) {
          swapAndCompare(tempHexaStat, i);
        }
      }

      widgetReturn = Column(
        children: widgetChildren.isEmpty ? [unableToEquipHexaStat] : widgetChildren
      );
      diffCalculatorProvider.hexaStatsProvider = tempHexaStatsProvider;
    }

    if (isEditing) {
      return widgetReturn;
    }
    else {
      differenceWidget = widgetReturn ?? const SizedBox.shrink();
      notifyListeners();
      return null;
    }
  }

  Widget? compareEditingHexaStat(BuildContext context) {
    return compareHexaStat(context, hexaStatEditingProvider.editingHexaStat, isEditing: true, isDense: false);
  } 

  // SET COMPARISON FUNCTIONS
  // ---------------------------------------------------------------------------------------------------------------------------------
  // ---------------------------------------------------------------------------------------------------------------------------------
  void compareEquipSets(BuildContext context, int newEquipSetNumber) {
    var tempEquipProvider = diffCalculatorProvider.equipsProvider;
    diffCalculatorProvider.equipsProvider = tempEquipProvider.copyWith();
    diffCalculatorProvider.equipsProvider.changeActiveSet(newEquipSetNumber);
    diffCalculatorProvider.calculateEverything(recalculateCache: true);
    updateDifferenceText(context: context, calculationType: CalculationType.compareEquipmentSet);

    // Reset the equips provider for the diff character model
    diffCalculatorProvider.equipsProvider = tempEquipProvider;
    notifyListeners();
  }

  void compareHyperStatsSets(BuildContext context, int newHyperStatSetNumber) {
    var tempHyperStatProvider = diffCalculatorProvider.hyperStatsProvider;
    diffCalculatorProvider.hyperStatsProvider = tempHyperStatProvider.copyWith();
    diffCalculatorProvider.hyperStatsProvider.changeActiveSet(newHyperStatSetNumber);
    diffCalculatorProvider.calculateEverything(recalculateCache: true);
    updateDifferenceText(context: context, calculationType: CalculationType.compareStats);

    // Reset the hyper stats provider for the diff character model
    diffCalculatorProvider.hyperStatsProvider = tempHyperStatProvider;
    notifyListeners();
  }

  void compareInnerAbilitySets(BuildContext context, int newInnerAbilitySetNumber) {
    var tempInnerAbilityProvider = diffCalculatorProvider.innerAbilityProvider;
    diffCalculatorProvider.innerAbilityProvider = tempInnerAbilityProvider.copyWith();
    diffCalculatorProvider.innerAbilityProvider.changeActiveSet(newInnerAbilitySetNumber);
    diffCalculatorProvider.calculateEverything(recalculateCache: true);
    updateDifferenceText(context: context, calculationType: CalculationType.compareStats);

    // Reset the inner ability provider for the diff character model
    diffCalculatorProvider.innerAbilityProvider = tempInnerAbilityProvider;
    notifyListeners();
  }

  void compareLegionSets(BuildContext context, int newLegionSetNumber) {
    var tempLegionStatsProvider = diffCalculatorProvider.legionStatsProvider;
    diffCalculatorProvider.legionStatsProvider = tempLegionStatsProvider.copyWith();
    diffCalculatorProvider.legionStatsProvider.changeActiveSet(newLegionSetNumber);
    diffCalculatorProvider.calculateEverything(recalculateCache: true);
    updateDifferenceText(context: context, calculationType: CalculationType.compareStats);

    // Reset the legion provider for the diff character model
    diffCalculatorProvider.legionStatsProvider = tempLegionStatsProvider;
    notifyListeners();
  }

  void compareLegionArtifactSets(BuildContext context, int newLegionSetNumber) {
    var tempLegionArtifactProvider = diffCalculatorProvider.legionArtifactProvider;
    diffCalculatorProvider.legionArtifactProvider = tempLegionArtifactProvider.copyWith();
    diffCalculatorProvider.legionArtifactProvider.changeActiveSet(newLegionSetNumber);
    diffCalculatorProvider.calculateEverything(recalculateCache: true);
    updateDifferenceText(context: context, calculationType: CalculationType.compareStats);

    // Reset the legion provider for the diff character model
    diffCalculatorProvider.legionArtifactProvider = tempLegionArtifactProvider;
    notifyListeners();
  }

void compareBadgeSets(BuildContext context, int newBadgeSetNumber) {
    var tempFamiliarsProvider = diffCalculatorProvider.familiarsProvider;
    diffCalculatorProvider.familiarsProvider = tempFamiliarsProvider.copyWith();
    diffCalculatorProvider.familiarsProvider.changeActiveBadgeSet(newBadgeSetNumber);
    diffCalculatorProvider.calculateEverything(recalculateCache: true);
    updateDifferenceText(context: context, calculationType: CalculationType.compareStats);

    // Reset the familiar stats provider for the diff character model
    diffCalculatorProvider.familiarsProvider = tempFamiliarsProvider;
    notifyListeners();
  }

  void compareFamiliarSets(BuildContext context, int newFamiliarSetNumber) {
    var tempFamiliarsProvider = diffCalculatorProvider.familiarsProvider;
    diffCalculatorProvider.familiarsProvider = tempFamiliarsProvider.copyWith();
    diffCalculatorProvider.familiarsProvider.changeActiveFamiliarSet(newFamiliarSetNumber);
    diffCalculatorProvider.calculateEverything(recalculateCache: true);
    updateDifferenceText(context: context, calculationType: CalculationType.compareStats);

    // Reset the familiar stats provider for the diff character model
    diffCalculatorProvider.familiarsProvider = tempFamiliarsProvider;
    notifyListeners();
  }

  void compareHexaStatSets(BuildContext context, int newHexaStatSetNumber) {
    var tempHexaStatsProvider = diffCalculatorProvider.hexaStatsProvider;
    diffCalculatorProvider.hexaStatsProvider = tempHexaStatsProvider.copyWith();
    diffCalculatorProvider.hexaStatsProvider.changeActiveSet(newHexaStatSetNumber);
    diffCalculatorProvider.calculateEverything(recalculateCache: true);
    updateDifferenceText(context: context, calculationType: CalculationType.compareStats);

    // Reset the hexa stats provider for the diff character model
    diffCalculatorProvider.hexaStatsProvider = tempHexaStatsProvider;
    notifyListeners();
  }

  void compareConsumablesSets(BuildContext context, int newConsumablesSetNumber) {
    var tempConsumablesProvider = diffCalculatorProvider.consumablesProvider;
    diffCalculatorProvider.consumablesProvider = tempConsumablesProvider.copyWith();
    diffCalculatorProvider.consumablesProvider.changeActiveSet(newConsumablesSetNumber);
    diffCalculatorProvider.calculateEverything(recalculateCache: true);
    updateDifferenceText(context: context, calculationType: CalculationType.compareStats);

    // Reset the consumables provider for the diff character model
    diffCalculatorProvider.consumablesProvider = tempConsumablesProvider;
    notifyListeners();
  }

  // ---------------------------------------------------------------------------------------------------------------------------------
  // ---------------------------------------------------------------------------------------------------------------------------------

  void modifyApToStat(int apAmount, StatType statType, bool isSubtract) {
    // Save a reference to the apStatsModule, then replace the target with a copy for destructive calculations
    var tempApStats = diffCalculatorProvider.apStatsProvider;
    diffCalculatorProvider.apStatsProvider = tempApStats.copyWith();
    if (isSubtract) {
      diffCalculatorProvider.apStatsProvider.subtractApToStat(apAmount, statType);
    }
    else {
      diffCalculatorProvider.apStatsProvider.addApToStat(apAmount, statType);
    }
    diffCalculatorProvider.calculateEverything();
    updateDifferenceText();
    diffCalculatorProvider.apStatsProvider = tempApStats;
  }

  void modifyHyperStats(int possibleLevelsToAddOrRemove, StatType statType, bool isSubtract) {
    var tempHyperStats = diffCalculatorProvider.hyperStatsProvider;
    diffCalculatorProvider.hyperStatsProvider = tempHyperStats.copyWith();
    if (isSubtract) {
      diffCalculatorProvider.hyperStatsProvider.subtractHyperStats(possibleLevelsToAddOrRemove, statType);
    }
    else {
      diffCalculatorProvider.hyperStatsProvider.addHyperStats(possibleLevelsToAddOrRemove, statType);
    }
    diffCalculatorProvider.calculateEverything();
    updateDifferenceText();
    diffCalculatorProvider.hyperStatsProvider = tempHyperStats;
  }

  void modifyArtifactCrsytalLevel(int artifactCrystalPosition, bool isSubtract) {
    var tempLegionArtifactProvider = diffCalculatorProvider.legionArtifactProvider;
    diffCalculatorProvider.legionArtifactProvider = tempLegionArtifactProvider.copyWith();
    if (isSubtract) {
      diffCalculatorProvider.legionArtifactProvider.subtractArtifactLevel(artifactCrystalPosition);
    }
    else {
      diffCalculatorProvider.legionArtifactProvider.addArtifactLevel(artifactCrystalPosition);
    }
    diffCalculatorProvider.calculateEverything();
    updateDifferenceText();
    diffCalculatorProvider.legionArtifactProvider = tempLegionArtifactProvider;
  }

  void modifyTraitLevels(int possibleLevelsToAddOrSubtract, TraitName traitName, bool isSubtract) {
    var tempTraitStatsProvider = diffCalculatorProvider.traitStatsProvider;
    diffCalculatorProvider.traitStatsProvider = tempTraitStatsProvider.copyWith();
    if (isSubtract) {
      
      diffCalculatorProvider.traitStatsProvider.subtractTraitLevels(possibleLevelsToAddOrSubtract, traitName);
    }
    else {
      diffCalculatorProvider.traitStatsProvider.addTraitLevels(possibleLevelsToAddOrSubtract, traitName);
    }
    diffCalculatorProvider.calculateEverything();
    updateDifferenceText();
    diffCalculatorProvider.traitStatsProvider = tempTraitStatsProvider;
  }

  void modifyArcaneLevels(int possibleLevelsToAddOrSubtract, ArcaneSymbol arcaneSymbol, bool isSubtract) {
    var tempSymbolStatsProvider = diffCalculatorProvider.symbolStatsProvider;
    diffCalculatorProvider.symbolStatsProvider = tempSymbolStatsProvider.copyWith();
    if (isSubtract) {
      diffCalculatorProvider.symbolStatsProvider.subtractArcaneLevels(possibleLevelsToAddOrSubtract, arcaneSymbol);
    }
    else {
      diffCalculatorProvider.symbolStatsProvider.addArcaneLevels(possibleLevelsToAddOrSubtract, arcaneSymbol);
    }
    diffCalculatorProvider.calculateEverything();
    updateDifferenceText();
    diffCalculatorProvider.symbolStatsProvider = tempSymbolStatsProvider;
  }

  void modifySacredLevels(int possibleLevelsToAddOrSubtract, SacredSymbol sacredSymbol, bool isSubtract) {
    var tempSymbolStatsProvider = diffCalculatorProvider.symbolStatsProvider;
    diffCalculatorProvider.symbolStatsProvider = tempSymbolStatsProvider.copyWith();
    if (isSubtract) {
      diffCalculatorProvider.symbolStatsProvider.subtractSacredLevels(possibleLevelsToAddOrSubtract, sacredSymbol);
    }
    else {
      diffCalculatorProvider.symbolStatsProvider.addSacredLevels(possibleLevelsToAddOrSubtract, sacredSymbol);
    }
    diffCalculatorProvider.calculateEverything();
    updateDifferenceText();
    diffCalculatorProvider.symbolStatsProvider = tempSymbolStatsProvider;
  }

  void modifyLegionBoardStatLevels(int possibleLevelsToAddOrSubtract, StatType statType, bool isSubtract, bool isOuterBoard) {
    var tempLegionStatsProvider = diffCalculatorProvider.legionStatsProvider;
    diffCalculatorProvider.legionStatsProvider = tempLegionStatsProvider.copyWith();
    if (isSubtract) {
      diffCalculatorProvider.legionStatsProvider.subtractLegionStatLevels(possibleLevelsToAddOrSubtract, statType, isOuterBoard: isOuterBoard);
    }
    else {
      diffCalculatorProvider.legionStatsProvider.addLegionStatLevels(possibleLevelsToAddOrSubtract, statType, isOuterBoard: isOuterBoard);
    }
    diffCalculatorProvider.calculateEverything();
    updateDifferenceText();
    diffCalculatorProvider.legionStatsProvider = tempLegionStatsProvider;
  }

  void modifyLevel(int levelsToAddOrSubtract, bool isSubtract) {
    var tempCharacterProvider = diffCalculatorProvider.characterProvider;
    diffCalculatorProvider.characterProvider = tempCharacterProvider.copyWith();
    if (isSubtract) {
      diffCalculatorProvider.characterProvider.subtractLevels(levelsToAddOrSubtract);
    }
    else {
      diffCalculatorProvider.characterProvider.addLevels(levelsToAddOrSubtract);
    }
    diffCalculatorProvider.calculateEverything();
    updateDifferenceText();
    diffCalculatorProvider.characterProvider = tempCharacterProvider;
  }
}

const Text noDifferenceEquip = Text(
  "NO DIFFERENCE IN EQUIPMENT",
  style: TextStyle(color: Colors.greenAccent),
);

const Text noDifferenceFamiliar = Text(
  "NO DIFFERENCE IN FAMILIAR",
  style: TextStyle(color: Colors.greenAccent),
);

const Text noDifferenceHexaStat= Text(
  "NO DIFFERENCE IN HEXA STAT",
  style: TextStyle(color: Colors.greenAccent),
);

const Text unableToEquipHexaStat = Text(
  "CANNOT CURRENTLY EQUIP THIS HEXA STAT",
  style: TextStyle(color: Colors.redAccent),
);

const Text noDifferenceStat = Text(
  "NO DIFFERENCE IN STATS",
  style: TextStyle(color: Colors.greenAccent),
);

const List<StatType> comparisonStats = [
  StatType.attackSpeed,
  StatType.str,
  StatType.strPercentage,
  StatType.finalStr,
  StatType.dex,
  StatType.dexPercentage,
  StatType.finalDex,
  StatType.int,
  StatType.intPercentage,
  StatType.finalInt,
  StatType.luk,
  StatType.lukPercentage,
  StatType.finalLuk,
  StatType.hp,
  StatType.hpPercentage,
  StatType.finalHp,
  StatType.mp,
  StatType.mpPercentage,
  StatType.finalMp,
  StatType.attack,
  StatType.attackPercentage,
  StatType.finalAttack,
  StatType.mattack,
  StatType.mattackPercentage,
  StatType.finalMAttack,
  StatType.defense,
  StatType.defensePercentage,
  StatType.damage,
  StatType.bossDamage,
  StatType.damageNormalMobs,
  StatType.ignoreDefense,
  StatType.ignoreElementalDefense,
  StatType.speed,
  StatType.jump,
  StatType.starForce,
  StatType.arcaneForce,
  StatType.sacredPower,
  StatType.critDamage,
  StatType.critRate,
  StatType.itemDropRate,
  StatType.mesosObtained,
  StatType.hpRecovery,
  StatType.skillCooldown,
  StatType.skillCooldownPercentage,
  StatType.statusResistance,
  StatType.buffDuration,
  StatType.summonDuration
];