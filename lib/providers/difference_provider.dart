import 'package:flutter/material.dart';
import 'package:maplestory_builder/constants/character/symbols_stats.dart';
import 'package:maplestory_builder/constants/character/trait_stats.dart';
import 'package:maplestory_builder/constants/constants.dart';
import 'package:maplestory_builder/constants/equipment/set_effect_stats.dart';
import 'package:maplestory_builder/modules/equipment/equipment_mod.dart';
import 'package:maplestory_builder/modules/equipment/equips.dart';
import 'package:maplestory_builder/providers/character_provider.dart';
import 'package:maplestory_builder/modules/utilities/utilities.dart';
import 'package:maplestory_builder/providers/equip_editing_provider.dart';

enum CalculationType {
  compareEquipment,
  compareEquipmentSet,
  stats,
  compareStats,
}

class DifferenceCalculatorProvider with ChangeNotifier {

  CharacterProvider mainCharacterModel;
  CharacterProvider diffCharacterModel;
  EquipEditingProvider equipEditingProvider;
  int lastEditingEquipCounter = 0;
  Widget differenceWidget = const SizedBox.shrink();

  DifferenceCalculatorProvider({
    required this.equipEditingProvider,
    required this.mainCharacterModel,
  }) : diffCharacterModel = mainCharacterModel.copyWith(
    apStatsProvider: mainCharacterModel.apStatsProvider,
    traitStatsProvider: mainCharacterModel.traitStatsProvider,
    hyperStatsProvider: mainCharacterModel.hyperStatsProvider,
    equipsProvider: mainCharacterModel.equipsProvider,
  );


  DifferenceCalculatorProvider update(EquipEditingProvider equipEditingProvider, CharacterProvider characterProvider) {
    // last editing equip counter matches the update counter then means the character provider has updated, trigger an update
    // mainly used for editing equip update
    if (equipEditingProvider.updateCounter == lastEditingEquipCounter) {
      diffCharacterModel = mainCharacterModel.copyWith(
        apStatsProvider: mainCharacterModel.apStatsProvider,
        traitStatsProvider: mainCharacterModel.traitStatsProvider,
        hyperStatsProvider: mainCharacterModel.hyperStatsProvider,
        equipsProvider: mainCharacterModel.equipsProvider,
      );
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
      if (mainCharacterModel.equipsProvider.activeSetNumber != diffCharacterModel.equipsProvider.activeSetNumber || isComparingEquips) {
        var oldEquipSet = mainCharacterModel.equipsProvider.activeEquipSet.setEffectModule.getEquippedSetCounts();
        var newEquipSet = diffCharacterModel.equipsProvider.activeEquipSet.setEffectModule.getEquippedSetCounts();

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

    createText(diffCharacterModel.upperDamageRange, mainCharacterModel.upperDamageRange, rangeType: RangeType.damageRange);
    createText(diffCharacterModel.upperBossDamangeRange, mainCharacterModel.upperBossDamangeRange, rangeType: RangeType.bossDamageRange);
    
    for (StatType statType in comparisonStats) {
      createText(diffCharacterModel.totalStats[statType]!, mainCharacterModel.totalStats[statType]!, statType: statType);
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

  Widget? compareEditingEquip(BuildContext context) {
    return compareEquip(context, equipEditingProvider.editingEquip, isEditing: true, isDense: false);
  }

  void compareEquipSets(BuildContext context, int newEquipSetPosition) {
    var tempEquipProvider = diffCharacterModel.equipsProvider;
    diffCharacterModel.equipsProvider = tempEquipProvider.copyWith();
    diffCharacterModel.equipsProvider.changeActiveSet(newEquipSetPosition);
    diffCharacterModel.calculateEverything(recalculateCache: true);
    updateDifferenceText(context: context, calculationType: CalculationType.compareEquipmentSet);

    // Reset the equips provider for the diff character model
    diffCharacterModel.equipsProvider = tempEquipProvider;
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
      var tempEquipProvider = diffCharacterModel.equipsProvider;
      diffCharacterModel.equipsProvider = tempEquipProvider.copyWith();
      EquipmentModule activeEquipmentModule = diffCharacterModel.equipsProvider.activeEquipSet;
      
      // Only need to do this if we are actually editing equips, otherwise we are comparing an already saved item
      if (isEditing) {
        // Need to register/overwrite the callback to our copied equips provider instance so we can appropriately reverse lookup the editing equip
        activeEquipmentModule.registerEquipCallback(diffCharacterModel.equipsProvider.getEquipCallback);

        diffCharacterModel.equipsProvider.allEquips[compareEquip.equipHash] = compareEquip;
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
              diffCharacterModel.equipsProvider.equipEquip(compareEquip, EquipType.totem, equipPosition: i, isCalculatingDifference: true);
              diffCharacterModel.calculateEverything(recalculateCache: true);
              widgetChildren.add(updateDifferenceText(context: context, replacing: tempEquip, comparingEquip: compareEquip, calculationType: CalculationType.compareEquipment, isDense: isDense));
              diffCharacterModel.equipsProvider.equipEquip(tempEquip, EquipType.totem, equipPosition: 1);
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
              diffCharacterModel.equipsProvider.equipEquip(compareEquip, EquipType.ring, equipPosition: i, isCalculatingDifference: true);
              diffCharacterModel.calculateEverything(recalculateCache: true);
              widgetChildren.add(updateDifferenceText(context: context, replacing: tempEquip, comparingEquip: compareEquip, calculationType: CalculationType.compareEquipment, isDense: isDense));
              diffCharacterModel.equipsProvider.equipEquip(tempEquip, EquipType.ring, equipPosition: 1, isCalculatingDifference: true);
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
              diffCharacterModel.equipsProvider.equipEquip(compareEquip, EquipType.pendant, equipPosition: i, isCalculatingDifference: true);
              diffCharacterModel.calculateEverything(recalculateCache: true);
              widgetChildren.add(updateDifferenceText(context: context, replacing: tempEquip, comparingEquip: compareEquip, calculationType: CalculationType.compareEquipment, isDense: isDense));
              diffCharacterModel.equipsProvider.equipEquip(tempEquip, EquipType.pendant, equipPosition: i, isCalculatingDifference: true);
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
              diffCharacterModel.equipsProvider.equipEquip(compareEquip, EquipType.pet, equipPosition: i, isCalculatingDifference: true);
              diffCharacterModel.calculateEverything(recalculateCache: true);
              widgetChildren.add(updateDifferenceText(context: context, replacing: tempEquip, comparingEquip: compareEquip, calculationType: CalculationType.compareEquipment, isDense: isDense));
              diffCharacterModel.equipsProvider.equipEquip(tempEquip, EquipType.pet, equipPosition: i, isCalculatingDifference: true);
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
              diffCharacterModel.equipsProvider.equipEquip(compareEquip, EquipType.petEquip, equipPosition: i, isCalculatingDifference: true);
              diffCharacterModel.calculateEverything(recalculateCache: true);
              widgetChildren.add(updateDifferenceText(context: context, replacing: tempEquip, comparingEquip: compareEquip, calculationType: CalculationType.compareEquipment, isDense: isDense));
              diffCharacterModel.equipsProvider.equipEquip(tempEquip, EquipType.petEquip, equipPosition: i, isCalculatingDifference: true);
            }
          }

          widgetReturn = Column(children: widgetChildren);
        default:
          tempEquip = activeEquipmentModule.getSelectedEquip(compareEquip.equipName.equipType);
          diffCharacterModel.equipsProvider.equipEquip(compareEquip, compareEquip.equipName.equipType, isCalculatingDifference: true);
          diffCharacterModel.calculateEverything(recalculateCache: true);
          widgetReturn = updateDifferenceText(context: context, replacing: tempEquip, comparingEquip: compareEquip, calculationType: CalculationType.compareEquipment, isDense: isDense);
      }

      diffCharacterModel.equipsProvider = tempEquipProvider;
    }

    if (isEditing) {
      return widgetReturn;
    }
    else {
      differenceWidget = widgetReturn!;
      notifyListeners();
      return null;
    }
  }

  void modifyApToStat(int apAmount, StatType statType, bool isSubtract) {
    // Save a reference to the apStatsModule, then replace the target with a copy for destructive calculations
    var tempApStats = diffCharacterModel.apStatsProvider;
    diffCharacterModel.apStatsProvider = tempApStats.copyWith();
    if (isSubtract) {
      diffCharacterModel.apStatsProvider.subtractApToStat(apAmount, statType);
    }
    else {
      diffCharacterModel.apStatsProvider.addApToStat(apAmount, statType);
    }
    diffCharacterModel.calculateEverything();
    updateDifferenceText();
    diffCharacterModel.apStatsProvider = tempApStats;
  }

  void modifyHyperStats(int possibleLevelsToAddOrRemove, StatType statType, bool isSubtract) {
    var tempHyperStats = diffCharacterModel.hyperStatsProvider;
    diffCharacterModel.hyperStatsProvider = tempHyperStats.copyWith();
    if (isSubtract) {
      diffCharacterModel.hyperStatsProvider.subtractHyperStats(possibleLevelsToAddOrRemove, statType);
    }
    else {
      diffCharacterModel.hyperStatsProvider.addHyperStats(possibleLevelsToAddOrRemove, statType);
    }
    diffCharacterModel.calculateEverything();
    updateDifferenceText();
    diffCharacterModel.hyperStatsProvider = tempHyperStats;
  }

  void compareHyperStats(BuildContext context, int newHyperStatPosition) {
    var tempHyperStatProvider = diffCharacterModel.hyperStatsProvider;
    diffCharacterModel.hyperStatsProvider = tempHyperStatProvider.copyWith();
    diffCharacterModel.hyperStatsProvider.changeActiveSet(newHyperStatPosition);
    diffCharacterModel.calculateEverything(recalculateCache: true);
    updateDifferenceText(context: context, calculationType: CalculationType.compareStats);

    // Reset the equips provider for the diff character model
    diffCharacterModel.hyperStatsProvider = tempHyperStatProvider;
    notifyListeners();
  }  

  void modifyTraitLevels(int possibleLevelsToAddOrSubtract, TraitName traitName, bool isSubtract) {
    var tempTraitStatsProvider = diffCharacterModel.traitStatsProvider;
    diffCharacterModel.traitStatsProvider = tempTraitStatsProvider.copyWith();
    if (isSubtract) {
      
      diffCharacterModel.traitStatsProvider.subtractTraitLevels(possibleLevelsToAddOrSubtract, traitName);
    }
    else {
      diffCharacterModel.traitStatsProvider.addTraitLevels(possibleLevelsToAddOrSubtract, traitName);
    }
    diffCharacterModel.calculateEverything();
    updateDifferenceText();
    diffCharacterModel.traitStatsProvider = tempTraitStatsProvider;
  }

  void modifyArcaneLevels(int possibleLevelsToAddOrSubtract, ArcaneSymbol arcaneSymbol, bool isSubtract) {
    var tempSymbolStatsProvider = diffCharacterModel.traitStatsProvider;
    // diffCharacterModel.traitStatsProvider = tempSymbolStatsProvider.copyWith();
    // if (isSubtract) {
    //   diffCharacterModel.traitStatsProvider.subtractArcaneLevels(possibleLevelsToAddOrSubtract, arcaneSymbol);
    // }
    // else {
    //   diffCharacterModel.traitStatsProvider.addArcaneLevels(possibleLevelsToAddOrSubtract, arcaneSymbol);
    // }
    diffCharacterModel.calculateEverything();
    updateDifferenceText();
    diffCharacterModel.traitStatsProvider = tempSymbolStatsProvider;
  }

  void modifySacredLevels(int possibleLevelsToAddOrSubtract, SacredSymbol sacredSymbol, bool isSubtract) {
    var tempSymbolStatsProvider = diffCharacterModel.traitStatsProvider;
    // diffCharacterModel.traitStatsProvider = tempSymbolStatsProvider.copyWith();
    // if (isSubtract) {
    //   diffCharacterModel.traitStatsProvider.subtractSacredLevels(possibleLevelsToAddOrSubtract, sacredSymbol);
    // }
    // else {
    //   diffCharacterModel.traitStatsProvider.addSacredLevels(possibleLevelsToAddOrSubtract, sacredSymbol);
    // }
    diffCharacterModel.calculateEverything();
    updateDifferenceText();
    diffCharacterModel.traitStatsProvider = tempSymbolStatsProvider;
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
  StatType.buffDuration
];