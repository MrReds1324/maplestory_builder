import 'package:flutter/material.dart';
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
  }) : diffCharacterModel = mainCharacterModel.copyWith();


  DifferenceCalculatorProvider update(EquipEditingProvider equipEditingProvider, CharacterProvider characterProvider) {
    // last editing equip counter matches the update counter then means the character provider has updated, trigger an update
    // mainly used for editing equip update
    if (equipEditingProvider.updateCounter == lastEditingEquipCounter) {
      diffCharacterModel = mainCharacterModel.copyWith();
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
    
    createText(diffCharacterModel.totalAttackSpeed, mainCharacterModel.totalAttackSpeed, statType: StatType.attackSpeed);

    createText(diffCharacterModel.totalStr, mainCharacterModel.totalStr, statType: StatType.str);
    createText(diffCharacterModel.strPercentage, mainCharacterModel.strPercentage, statType: StatType.strPercentage);
    createText(diffCharacterModel.flatStr, mainCharacterModel.flatStr, statType: StatType.finalStr);

    createText(diffCharacterModel.totalDex, mainCharacterModel.totalDex, statType: StatType.dex);
    createText(diffCharacterModel.dexPercentage, mainCharacterModel.dexPercentage, statType: StatType.dexPercentage);
    createText(diffCharacterModel.flatDex, mainCharacterModel.flatDex, statType: StatType.finalDex);

    createText(diffCharacterModel.totalInt, mainCharacterModel.totalInt, statType: StatType.int);
    createText(diffCharacterModel.intPercentage, mainCharacterModel.intPercentage, statType: StatType.intPercentage);
    createText(diffCharacterModel.flatInt, mainCharacterModel.flatInt, statType: StatType.finalInt);

    createText(diffCharacterModel.totalLuk, mainCharacterModel.totalLuk, statType: StatType.luk);
    createText(diffCharacterModel.lukPercentage, mainCharacterModel.lukPercentage, statType: StatType.lukPercentage);
    createText(diffCharacterModel.flatLuk, mainCharacterModel.flatLuk, statType: StatType.finalLuk);

    createText(diffCharacterModel.totalHp, mainCharacterModel.totalHp, statType: StatType.hp);
    createText(diffCharacterModel.hpPercentage, mainCharacterModel.hpPercentage, statType: StatType.hpPercentage);
    createText(diffCharacterModel.flatHp, mainCharacterModel.flatHp, statType: StatType.finalHp);

    createText(diffCharacterModel.totalMp, mainCharacterModel.totalMp, statType: StatType.mp);
    createText(diffCharacterModel.mpPercentage, mainCharacterModel.mpPercentage, statType: StatType.mpPercentage);
    createText(diffCharacterModel.flatMP, mainCharacterModel.flatMP, statType: StatType.finalMp);

    createText(diffCharacterModel.totalAttack, mainCharacterModel.totalAttack, statType: StatType.attack);
    createText(diffCharacterModel.attackPercentage, mainCharacterModel.attackPercentage, statType: StatType.attackPercentage);
    createText(diffCharacterModel.flatAttack, mainCharacterModel.flatAttack, statType: StatType.finalAttack);

    createText(diffCharacterModel.totalMAttack, mainCharacterModel.totalMAttack, statType: StatType.mattack);
    createText(diffCharacterModel.mattackPercentage, mainCharacterModel.mattackPercentage, statType: StatType.mattackPercentage);
    createText(diffCharacterModel.flatMAttack, mainCharacterModel.flatMAttack, statType: StatType.finalMAttack);

    createText(diffCharacterModel.totalDefense, mainCharacterModel.totalDefense, statType: StatType.defense);
    createText(diffCharacterModel.defensePercentage, mainCharacterModel.defensePercentage, statType: StatType.defensePercentage);
    createText(diffCharacterModel.totalDamage, mainCharacterModel.totalDamage, statType: StatType.damage);
    createText(diffCharacterModel.totalBossDamage, mainCharacterModel.totalBossDamage, statType: StatType.bossDamage);
    createText(diffCharacterModel.totalDamageNormalMobs, mainCharacterModel.totalDamageNormalMobs, statType: StatType.damageNormalMobs);
    createText(diffCharacterModel.totalIgnoreDefense, mainCharacterModel.totalIgnoreDefense, statType: StatType.ignoreDefense);
    createText(diffCharacterModel.totalElementalIgnoreDefense, mainCharacterModel.totalElementalIgnoreDefense, statType: StatType.ignoreElementalDefense);
    createText(diffCharacterModel.totalSpeed, mainCharacterModel.totalSpeed, statType: StatType.speed);
    createText(diffCharacterModel.totalJump, mainCharacterModel.totalJump, statType: StatType.jump);
    createText(diffCharacterModel.totalStarForce, mainCharacterModel.totalStarForce, statType: StatType.starForce);
    createText(diffCharacterModel.totalArcaneForce, mainCharacterModel.totalArcaneForce, statType: StatType.arcaneForce);
    createText(diffCharacterModel.totalSacredPower, mainCharacterModel.totalSacredPower, statType: StatType.sacredPower);
    createText(diffCharacterModel.totalCritDamage, mainCharacterModel.totalCritDamage, statType: StatType.critDamage);
    createText(diffCharacterModel.totalCritRate, mainCharacterModel.totalCritRate, statType: StatType.critRate);
    createText(diffCharacterModel.totalItemDropRate, mainCharacterModel.totalItemDropRate, statType: StatType.itemDropRate);
    createText(diffCharacterModel.totalMesosObtained, mainCharacterModel.totalMesosObtained, statType: StatType.mesosObtained);
    createText(diffCharacterModel.totalHpRecovery, mainCharacterModel.totalHpRecovery, statType: StatType.hpRecovery);
    createText(diffCharacterModel.totalSkillCooldown, mainCharacterModel.totalSkillCooldown, statType: StatType.skillCooldown);
    createText(diffCharacterModel.totalSkillCooldownPercentage, mainCharacterModel.totalSkillCooldownPercentage, statType: StatType.skillCooldownPercentage);

    if (calculationType == CalculationType.compareEquipmentSet) {
      compareEquipSets();

      if (textList.length > 1) {
        differenceWidget = Column(children: textList + editingWidgets);
      }
      else {
        differenceWidget = Column(children: <Widget>[noDifferenceEquip] + editingWidgets);
      }
    }
    else if (calculationType == CalculationType.compareEquipment) {
      if (textList.length > 1) {
        return Column(children: editingWidgets + textList);
      }
      else {
        return Column(children: editingWidgets + [noDifferenceEquip]);
      }
    }
    else if (calculationType == CalculationType.compareStats) {
      if (textList.length > 1) {
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

  void subtractApToStat(int apAmount, StatType statType) {
    // Save a reference to the apStatsModule, then replace the target with a copy for destructive calculations
    var tempApStats = diffCharacterModel.apStatsProvider;
    diffCharacterModel.apStatsProvider = tempApStats.copyWith();
    diffCharacterModel.apStatsProvider.subtractApToStat(apAmount, statType);
    diffCharacterModel.calculateEverything();
    updateDifferenceText();
    diffCharacterModel.apStatsProvider = tempApStats;
  }

  void addApToStat(int apAmount, StatType statType) {
    // Save a reference to the apStatsModule, then replace the target with a copy for destructive calculations
    var tempApStats = diffCharacterModel.apStatsProvider;
    diffCharacterModel.apStatsProvider = tempApStats.copyWith();
    diffCharacterModel.apStatsProvider.addApToStat(apAmount, statType);
    diffCharacterModel.calculateEverything();
    updateDifferenceText();
    diffCharacterModel.apStatsProvider = tempApStats;
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

  void addHyperStats(int possibleLevelsToAdd, StatType statType) {
    // Save a reference to the apStatsModule, then replace the target with a copy for destructive calculations
    var tempHyperStats = diffCharacterModel.hyperStatsProvider;
    diffCharacterModel.hyperStatsProvider = tempHyperStats.copyWith();
    diffCharacterModel.hyperStatsProvider.addHyperStats(possibleLevelsToAdd, statType);
    diffCharacterModel.calculateEverything();
    updateDifferenceText();
    diffCharacterModel.hyperStatsProvider = tempHyperStats;
  }

  void subtractHyperStats(int possibleLevelsToSubtract, StatType statType) { 
    // Save a reference to the apStatsModule, then replace the target with a copy for destructive calculations
    var tempHyperStats = diffCharacterModel.hyperStatsProvider;
    diffCharacterModel.hyperStatsProvider = tempHyperStats.copyWith();
    diffCharacterModel.hyperStatsProvider.subtractHyperStats(possibleLevelsToSubtract, statType);
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

}

const Text noDifferenceEquip = Text(
  "NO DIFFERENCE IN EQUIPMENT",
  style: TextStyle(color: Colors.greenAccent),
);

const Text noDifferenceStat = Text(
  "NO DIFFERENCE IN STATS",
  style: TextStyle(color: Colors.greenAccent),
);