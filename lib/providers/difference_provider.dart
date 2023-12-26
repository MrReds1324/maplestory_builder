import 'package:flutter/material.dart';
import 'package:maplestory_builder/constants/character/symbols_stats.dart';
import 'package:maplestory_builder/constants/character/trait_stats.dart';
import 'package:maplestory_builder/constants/constants.dart';
import 'package:maplestory_builder/constants/equipment/set_effect_stats.dart';
import 'package:maplestory_builder/modules/equipment/equipment_mod.dart';
import 'package:maplestory_builder/modules/equipment/equips.dart';
import 'package:maplestory_builder/providers/calculator_provider.dart';
import 'package:maplestory_builder/modules/utilities/utilities.dart';
import 'package:maplestory_builder/providers/equipment/equip_editing_provider.dart';

enum CalculationType {
  compareEquipment,
  compareEquipmentSet,
  stats,
  compareStats,
}

class DifferenceCalculatorProvider with ChangeNotifier {

  CalculatorProvider mainCalculatorProvider;
  CalculatorProvider diffCalculatorProvider;
  EquipEditingProvider equipEditingProvider;
  int lastEditingEquipCounter = 0;
  int lastLegionEditingEquipCounter = 0;
  Widget differenceWidget = const SizedBox.shrink();

  DifferenceCalculatorProvider({
    required this.equipEditingProvider,
    required this.mainCalculatorProvider,
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
  );


  DifferenceCalculatorProvider update(EquipEditingProvider equipEditingProvider, CalculatorProvider calculatorProvider) {
    // last editing equip counter matches the update counter then means the character provider has updated, trigger an update
    // mainly used for editing equip update
    if (equipEditingProvider.updateCounter == lastEditingEquipCounter) {
      // Only trigger an update to redraw if we are actually editing an equip, otherwise its wasted cycles
      if (equipEditingProvider.updateCounter != 0) {
        notifyListeners();
      }
    }
    else {
      lastEditingEquipCounter = equipEditingProvider.updateCounter;
    }

    return this;
  }

  Widget updateDifferenceText({
    BuildContext? context, 
    Equip? replacing, 
    Equip? comparingEquip, 
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
          if (isComparingLuckyItem && (comparingEquip?.equipSet == equipSet || replacing?.equipSet == equipSet)) {
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
      if (replacing == null) {
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
            "Replacing ${replacing.equipName.formattedName}: "
          )
        );
        if (!isDense) {
          if (replacing.equipName != comparingEquip?.equipName) {
            editingWidgets.add(comparingEquip?.createSetEffectContainer(context!, isEquipComparing: true, isAdding: true) ?? const SizedBox.shrink());
            editingWidgets.add(replacing.createSetEffectContainer(context!, isEquipComparing: true, isRemoving: true));
          }
          else {
            editingWidgets.add(comparingEquip?.createSetEffectContainer(context!, isEquipComparing: true, isAdding: true) ?? const SizedBox.shrink());
          }

          if ((comparingEquip?.equipName.isLuckyItem ?? false) || (replacing.equipName.isLuckyItem)) {
            compareEquipSets(isComparingEquips: true, isComparingLuckyItem: true);
          }
        }
        else {
          compareEquipSets(isComparingEquips: true);
        }
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
        differenceWidget = Column(children: <Widget>[noDifferenceEquip] + editingWidgets);
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

  Widget? compareEditingFamiliar(BuildContext context) {
    return compareEquip(context, equipEditingProvider.editingEquip, isEditing: true, isDense: false);
  }

  void compareEquipSets(BuildContext context, int newEquipSetPosition) {
    var tempEquipProvider = diffCalculatorProvider.equipsProvider;
    diffCalculatorProvider.equipsProvider = tempEquipProvider.copyWith();
    diffCalculatorProvider.equipsProvider.changeActiveSet(newEquipSetPosition);
    diffCalculatorProvider.calculateEverything(recalculateCache: true);
    updateDifferenceText(context: context, calculationType: CalculationType.compareEquipmentSet);

    // Reset the equips provider for the diff character model
    diffCalculatorProvider.equipsProvider = tempEquipProvider;
    notifyListeners();
  }
  
  Widget? compareEquip(BuildContext context, Equip? compareEquip, {bool isEditing = false, bool isDense = true}){
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

        diffCalculatorProvider.equipsProvider.allEquips[compareEquip.equipHash] = compareEquip;
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
              widgetChildren.add(updateDifferenceText(context: context, replacing: tempEquip, comparingEquip: compareEquip, calculationType: CalculationType.compareEquipment, isDense: isDense));
              diffCalculatorProvider.equipsProvider.equipEquip(tempEquip, EquipType.totem, equipPosition: 1);
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
              widgetChildren.add(updateDifferenceText(context: context, replacing: tempEquip, comparingEquip: compareEquip, calculationType: CalculationType.compareEquipment, isDense: isDense));
              diffCalculatorProvider.equipsProvider.equipEquip(tempEquip, EquipType.ring, equipPosition: 1, isCalculatingDifference: true);
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
              widgetChildren.add(updateDifferenceText(context: context, replacing: tempEquip, comparingEquip: compareEquip, calculationType: CalculationType.compareEquipment, isDense: isDense));
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
              widgetChildren.add(updateDifferenceText(context: context, replacing: tempEquip, comparingEquip: compareEquip, calculationType: CalculationType.compareEquipment, isDense: isDense));
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
              widgetChildren.add(updateDifferenceText(context: context, replacing: tempEquip, comparingEquip: compareEquip, calculationType: CalculationType.compareEquipment, isDense: isDense));
              diffCalculatorProvider.equipsProvider.equipEquip(tempEquip, EquipType.petEquip, equipPosition: i, isCalculatingDifference: true);
            }
          }

          widgetReturn = Column(children: widgetChildren);
        default:
          tempEquip = activeEquipmentModule.getSelectedEquip(compareEquip.equipName.equipType);
          diffCalculatorProvider.equipsProvider.equipEquip(compareEquip, compareEquip.equipName.equipType, isCalculatingDifference: true);
          diffCalculatorProvider.calculateEverything(recalculateCache: true);
          widgetReturn = updateDifferenceText(context: context, replacing: tempEquip, comparingEquip: compareEquip, calculationType: CalculationType.compareEquipment, isDense: isDense);
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

  void compareHyperStats(BuildContext context, int newHyperStatPosition) {
    var tempHyperStatProvider = diffCalculatorProvider.hyperStatsProvider;
    diffCalculatorProvider.hyperStatsProvider = tempHyperStatProvider.copyWith();
    diffCalculatorProvider.hyperStatsProvider.changeActiveSet(newHyperStatPosition);
    diffCalculatorProvider.calculateEverything(recalculateCache: true);
    updateDifferenceText(context: context, calculationType: CalculationType.compareStats);

    // Reset the hyper stats provider for the diff character model
    diffCalculatorProvider.hyperStatsProvider = tempHyperStatProvider;
    notifyListeners();
  }

  void compareInnerAbility(BuildContext context, int newInnerAbilityPosition) {
    var tempInnerAbilityProvider = diffCalculatorProvider.innerAbilityProvider;
    diffCalculatorProvider.innerAbilityProvider = tempInnerAbilityProvider.copyWith();
    diffCalculatorProvider.innerAbilityProvider.changeActiveSet(newInnerAbilityPosition);
    diffCalculatorProvider.calculateEverything(recalculateCache: true);
    updateDifferenceText(context: context, calculationType: CalculationType.compareStats);

    // Reset the inner ability provider for the diff character model
    diffCalculatorProvider.innerAbilityProvider = tempInnerAbilityProvider;
    notifyListeners();
  }

  void compareLegionSets(BuildContext context, int newLegionSetPosition) {
    var tempLegionStatsProvider = diffCalculatorProvider.legionStatsProvider;
    diffCalculatorProvider.legionStatsProvider = tempLegionStatsProvider.copyWith();
    diffCalculatorProvider.legionStatsProvider.changeActiveSet(newLegionSetPosition);
    diffCalculatorProvider.calculateEverything(recalculateCache: true);
    updateDifferenceText(context: context, calculationType: CalculationType.compareStats);

    // Reset the legion provider for the diff character model
    diffCalculatorProvider.legionStatsProvider = tempLegionStatsProvider;
    notifyListeners();
  }

  void compareLegionArtifactSets(BuildContext context, int newLegionSetPosition) {
    var tempLegionArtifactProvider = diffCalculatorProvider.legionArtifactProvider;
    diffCalculatorProvider.legionArtifactProvider = tempLegionArtifactProvider.copyWith();
    diffCalculatorProvider.legionArtifactProvider.changeActiveSet(newLegionSetPosition);
    diffCalculatorProvider.calculateEverything(recalculateCache: true);
    updateDifferenceText(context: context, calculationType: CalculationType.compareStats);

    // Reset the legion provider for the diff character model
    diffCalculatorProvider.legionArtifactProvider = tempLegionArtifactProvider;
    notifyListeners();
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