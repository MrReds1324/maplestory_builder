import 'package:flutter/material.dart';
import 'package:maplestory_builder/core/constants.dart';
import 'package:maplestory_builder/core/items/equipment/equips.dart';
import 'package:maplestory_builder/providers/character_provider.dart';
import 'package:maplestory_builder/modules/utilities.dart';
import 'package:maplestory_builder/providers/equip_editing_provider.dart';

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
    apStatsModule: mainCharacterModel.apStatsModule,
    equipsProvider: mainCharacterModel.equipsProvider,
    hyperStatsModule: mainCharacterModel.hyperStatsModule,
  );


  DifferenceCalculatorProvider update(EquipEditingProvider equipEditingProvider, CharacterProvider characterProvider) {
    // last editing equip counter matches the update counter then means the character provider has updated, trigger an update
    // mainly used for editing equip update
    if (equipEditingProvider.updateCounter == lastEditingEquipCounter) {
      // Only trigger an update if we are actually editing an equip, otherwise its wasted cycles
      if (equipEditingProvider.updateCounter != 0) {
        notifyListeners();
      }
    }
    else {
      lastEditingEquipCounter = equipEditingProvider.updateCounter;
    }

    return this;
  }

  Widget updateDifferenceText({BuildContext? context, bool isEquipEditing=false, Equip? replacing}){
    var textList = <Widget>[];

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

    List<Widget> editingWidgets = [];

    if (isEquipEditing){
      if (replacing == null) {
        editingWidgets.add(
          const Text(
            "Equipping: ",
          )
        );
        editingWidgets.add(equipEditingProvider.editingEquip?.createSetEffectContainer(context!, isEquipEditing: true, isAdding: true) ?? const SizedBox.shrink());
      }
      else{
        editingWidgets.add(
          Text(
            "Replacing ${replacing.equipName.formattedName}: "
          )
        );
        if (replacing.equipName != equipEditingProvider.editingEquip?.equipName) {
          editingWidgets.add(equipEditingProvider.editingEquip?.createSetEffectContainer(context!, isEquipEditing: true, isAdding: true) ?? const SizedBox.shrink());
          editingWidgets.add(replacing.createSetEffectContainer(context!, isEquipEditing: true, isRemoving: true));
        }
        else {
          editingWidgets.add(equipEditingProvider.editingEquip?.createSetEffectContainer(context!, isEquipEditing: true, isAdding: true) ?? const SizedBox.shrink());
        }
      }
    }

    createText(diffCharacterModel.upperDamageRange, mainCharacterModel.upperDamageRange, rangeType: RangeType.damageRange);
    createText(diffCharacterModel.upperBossDamangeRange, mainCharacterModel.upperBossDamangeRange, rangeType: RangeType.bossDamageRange);
    
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

    if (isEquipEditing) {
      if (textList.length > 1) {
        return Column(children: editingWidgets + textList);
      }
      else {
        return Column(children: editingWidgets + [noDifferenceEquip]);
      }
    }
    differenceWidget = Column(children: textList);
    notifyListeners();
    return const SizedBox.shrink();
  }

  void subtractApToStat(int apAmount, StatType statType) {
    // Save a reference to the apStatsModule, then replace the target with a copy for destructive calculations
    var tempApStats = diffCharacterModel.apStatsModule;
    diffCharacterModel.apStatsModule = tempApStats.copyWith();
    diffCharacterModel.apStatsModule.subtractApToStat(apAmount, statType);
    diffCharacterModel.calculateEverything();
    updateDifferenceText();
    diffCharacterModel.apStatsModule = tempApStats;
  }

  void addApToStat(int apAmount, StatType statType) {
    // Save a reference to the apStatsModule, then replace the target with a copy for destructive calculations
    var tempApStats = diffCharacterModel.apStatsModule;
    diffCharacterModel.apStatsModule = tempApStats.copyWith();
    diffCharacterModel.apStatsModule.addApToStat(apAmount, statType);
    diffCharacterModel.calculateEverything();
    updateDifferenceText();
    diffCharacterModel.apStatsModule = tempApStats;
  }

  Widget? compareEditingEquip(BuildContext context){
    Equip? tempEquip;
    Widget? widgetReturn;
    // Used for items that are uniqueEquipped like Superior Gollux Items
    bool isUniqueItem = equipEditingProvider.editingEquip?.isUniqueItem ?? false;
    // Used for items that have multiple positions like totems, rings, etc
    List<Widget> widgetChildren = <Widget>[];
    bool hasEquipped = false;
    // Save a reference to the equipModule, then replace the target with a copy for destructive calculations
    var equipModule = diffCharacterModel.equipsProvider;
    diffCharacterModel.equipsProvider = equipModule.copyWith();

    int? getUniqueItemPosition(List<Equip?> positionedEquips) {
      if (equipEditingProvider.editingEquip?.isUniqueItem ?? false) {
        for(var i = 0; i < positionedEquips.length; i++){
          if (positionedEquips[i]?.equipName == equipEditingProvider.editingEquip?.equipName) {
            return i + 1;
          }
        }
      }
      return null;
    }

    switch(equipEditingProvider.editingEquip?.equipType){
      case EquipType.totem:
        var uniqueItemPosition = getUniqueItemPosition([mainCharacterModel.equipsProvider.totem1, mainCharacterModel.equipsProvider.totem2, mainCharacterModel.equipsProvider.totem3]);

        tempEquip = diffCharacterModel.equipsProvider.totem1;
        if (tempEquip == null) {
          hasEquipped = true;
        }
        if ((isUniqueItem && uniqueItemPosition == 1) || uniqueItemPosition == null) {
          diffCharacterModel.equipsProvider.equipEquip(equipEditingProvider.editingEquip, EquipType.totem, equipPosition: 1, isCalculatingDifference: true);
          diffCharacterModel.calculateEverything(recalculateCache: true);
          widgetChildren.add(updateDifferenceText(context: context, isEquipEditing: true, replacing: tempEquip));
          diffCharacterModel.equipsProvider.equipEquip(tempEquip, EquipType.totem, equipPosition: 1);
        }

        tempEquip = diffCharacterModel.equipsProvider.totem2;
        if ((isUniqueItem && uniqueItemPosition == 2) || (uniqueItemPosition == null && (!hasEquipped || tempEquip != null))) {
          if (tempEquip == null) {
            hasEquipped = true;
          }
          diffCharacterModel.equipsProvider.equipEquip(equipEditingProvider.editingEquip, EquipType.totem, equipPosition: 2, isCalculatingDifference: true);
          diffCharacterModel.calculateEverything(recalculateCache: true);
          widgetChildren.add(updateDifferenceText(context: context, isEquipEditing: true, replacing: tempEquip));
          diffCharacterModel.equipsProvider.equipEquip(tempEquip, EquipType.totem, equipPosition: 2);
        }

        tempEquip = diffCharacterModel.equipsProvider.totem3;
        if ((isUniqueItem && uniqueItemPosition == 3) || (uniqueItemPosition == null && (!hasEquipped || tempEquip != null))) {
          diffCharacterModel.equipsProvider.equipEquip(equipEditingProvider.editingEquip, EquipType.totem, equipPosition: 3, isCalculatingDifference: true);
          diffCharacterModel.calculateEverything(recalculateCache: true);
          widgetChildren.add(updateDifferenceText(context: context, isEquipEditing: true, replacing: tempEquip));
          diffCharacterModel.equipsProvider.equipEquip(tempEquip, EquipType.totem, equipPosition: 3);
        }

        widgetReturn = Column(children: widgetChildren);
      case EquipType.ring:
        var uniqueItemPosition = getUniqueItemPosition([mainCharacterModel.equipsProvider.ring1, mainCharacterModel.equipsProvider.ring2, mainCharacterModel.equipsProvider.ring3, mainCharacterModel.equipsProvider.ring4]);

        tempEquip = diffCharacterModel.equipsProvider.ring1;
        if (tempEquip == null) {
          hasEquipped = true;
        }
        if ((isUniqueItem && uniqueItemPosition == 1) || uniqueItemPosition == null) {
          diffCharacterModel.equipsProvider.equipEquip(equipEditingProvider.editingEquip, EquipType.ring, equipPosition: 1, isCalculatingDifference: true);
          diffCharacterModel.calculateEverything(recalculateCache: true);
          widgetChildren.add(updateDifferenceText(context: context, isEquipEditing: true, replacing: tempEquip));
          diffCharacterModel.equipsProvider.equipEquip(tempEquip, EquipType.ring, equipPosition: 1, isCalculatingDifference: true);
        }

        tempEquip = diffCharacterModel.equipsProvider.ring2;
        if ((isUniqueItem && uniqueItemPosition == 2) || (uniqueItemPosition == null && (!hasEquipped || tempEquip != null))) {
          if (tempEquip == null) {
            hasEquipped = true;
          }
          diffCharacterModel.equipsProvider.equipEquip(equipEditingProvider.editingEquip, EquipType.ring, equipPosition: 2, isCalculatingDifference: true);
          diffCharacterModel.calculateEverything(recalculateCache: true);
          widgetChildren.add(updateDifferenceText(context: context, isEquipEditing: true, replacing: tempEquip));
          diffCharacterModel.equipsProvider.equipEquip(tempEquip, EquipType.ring, equipPosition: 2, isCalculatingDifference: true);
        }

        tempEquip = diffCharacterModel.equipsProvider.ring3;
        if ((isUniqueItem && uniqueItemPosition == 3) || (uniqueItemPosition == null && (!hasEquipped || tempEquip != null))) {
          if (tempEquip == null) {
            hasEquipped = true;
          }
          diffCharacterModel.equipsProvider.equipEquip(equipEditingProvider.editingEquip, EquipType.ring, equipPosition: 3, isCalculatingDifference: true);
          diffCharacterModel.calculateEverything(recalculateCache: true);
          widgetChildren.add(updateDifferenceText(context: context, isEquipEditing: true, replacing: tempEquip));
          diffCharacterModel.equipsProvider.equipEquip(tempEquip, EquipType.ring, equipPosition: 3, isCalculatingDifference: true);
        }

        tempEquip = diffCharacterModel.equipsProvider.ring4;
        if ((isUniqueItem && uniqueItemPosition == 4) || (uniqueItemPosition == null && (!hasEquipped || tempEquip != null))) {
          diffCharacterModel.equipsProvider.equipEquip(equipEditingProvider.editingEquip, EquipType.ring, equipPosition: 4, isCalculatingDifference: true);
          diffCharacterModel.calculateEverything(recalculateCache: true);
          widgetChildren.add(updateDifferenceText(context: context, isEquipEditing: true, replacing: tempEquip));
          diffCharacterModel.equipsProvider.equipEquip(tempEquip, EquipType.ring, equipPosition: 4, isCalculatingDifference: true);
        }

        widgetReturn = Column(children: widgetChildren);
      case EquipType.pocket:
        tempEquip = diffCharacterModel.equipsProvider.pocketItem;
        diffCharacterModel.equipsProvider.equipEquip(equipEditingProvider.editingEquip, EquipType.pocket, isCalculatingDifference: true);
        diffCharacterModel.calculateEverything(recalculateCache: true);
        widgetReturn = updateDifferenceText(context: context, isEquipEditing: true, replacing: tempEquip);
      case EquipType.pendant:
        var uniqueItemPosition = getUniqueItemPosition([mainCharacterModel.equipsProvider.pendant1, mainCharacterModel.equipsProvider.pendant2]);

        tempEquip = diffCharacterModel.equipsProvider.pendant1;
        if (tempEquip == null) {
          hasEquipped = true;
        }
        if ((isUniqueItem && uniqueItemPosition == 1) || uniqueItemPosition == null) {
          diffCharacterModel.equipsProvider.equipEquip(equipEditingProvider.editingEquip, EquipType.pendant, equipPosition: 1, isCalculatingDifference: true);
          diffCharacterModel.calculateEverything(recalculateCache: true);
          widgetChildren.add(updateDifferenceText(context: context, isEquipEditing: true, replacing: tempEquip));
          diffCharacterModel.equipsProvider.equipEquip(tempEquip, EquipType.pendant, equipPosition: 1, isCalculatingDifference: true);
        }

        tempEquip = diffCharacterModel.equipsProvider.pendant2;
        if ((isUniqueItem && uniqueItemPosition == 2) || (uniqueItemPosition == null && (!hasEquipped || tempEquip != null))) {
          diffCharacterModel.equipsProvider.equipEquip(equipEditingProvider.editingEquip, EquipType.pendant, equipPosition: 2, isCalculatingDifference: true);
          diffCharacterModel.calculateEverything(recalculateCache: true);
          widgetChildren.add(updateDifferenceText(context: context, isEquipEditing: true, replacing: tempEquip));
          diffCharacterModel.equipsProvider.equipEquip(tempEquip, EquipType.pendant, equipPosition: 2, isCalculatingDifference: true);
        }

        widgetReturn = Column(children: widgetChildren);
      case EquipType.weapon:
        tempEquip = diffCharacterModel.equipsProvider.weapon;
        diffCharacterModel.equipsProvider.equipEquip(equipEditingProvider.editingEquip, EquipType.weapon, isCalculatingDifference: true);
        diffCharacterModel.calculateEverything(recalculateCache: true);
        widgetReturn = updateDifferenceText(context: context, isEquipEditing: true, replacing: tempEquip);
      case EquipType.belt:
        tempEquip = diffCharacterModel.equipsProvider.belt;
        diffCharacterModel.equipsProvider.equipEquip(equipEditingProvider.editingEquip, EquipType.belt, isCalculatingDifference: true);
        diffCharacterModel.calculateEverything(recalculateCache: true);
        widgetReturn = updateDifferenceText(context: context, isEquipEditing: true, replacing: tempEquip);
      case EquipType.hat:
        tempEquip = diffCharacterModel.equipsProvider.hat;
        diffCharacterModel.equipsProvider.equipEquip(equipEditingProvider.editingEquip, EquipType.hat, isCalculatingDifference: true);
        diffCharacterModel.calculateEverything(recalculateCache: true);
        widgetReturn = updateDifferenceText(context: context, isEquipEditing: true, replacing: tempEquip);
      case EquipType.face:
        tempEquip = diffCharacterModel.equipsProvider.face;
        diffCharacterModel.equipsProvider.equipEquip(equipEditingProvider.editingEquip, EquipType.face, isCalculatingDifference: true);
        diffCharacterModel.calculateEverything(recalculateCache: true);
        widgetReturn = updateDifferenceText(context: context, isEquipEditing: true, replacing: tempEquip);
      case EquipType.eye:
        tempEquip = diffCharacterModel.equipsProvider.eye;
        diffCharacterModel.equipsProvider.equipEquip(equipEditingProvider.editingEquip, EquipType.eye, isCalculatingDifference: true);
        diffCharacterModel.calculateEverything(recalculateCache: true);
        widgetReturn = updateDifferenceText(context: context, isEquipEditing: true, replacing: tempEquip);
      case EquipType.overall:
        tempEquip = diffCharacterModel.equipsProvider.overall;
        diffCharacterModel.equipsProvider.equipEquip(equipEditingProvider.editingEquip, EquipType.overall, isCalculatingDifference: true);
        diffCharacterModel.calculateEverything(recalculateCache: true);
        widgetReturn = updateDifferenceText(context: context, isEquipEditing: true, replacing: tempEquip);
      case EquipType.top:
        tempEquip = diffCharacterModel.equipsProvider.top;
        diffCharacterModel.equipsProvider.equipEquip(equipEditingProvider.editingEquip, EquipType.top, isCalculatingDifference: true);
        diffCharacterModel.calculateEverything(recalculateCache: true);
        widgetReturn = updateDifferenceText(context: context, isEquipEditing: true, replacing: tempEquip);
      case EquipType.bottom:
        tempEquip = diffCharacterModel.equipsProvider.bottom;
        diffCharacterModel.equipsProvider.equipEquip(equipEditingProvider.editingEquip, EquipType.top, isCalculatingDifference: true);
        diffCharacterModel.calculateEverything(recalculateCache: true);
        widgetReturn = updateDifferenceText(context: context, isEquipEditing: true, replacing: tempEquip);
      case EquipType.shoes:
        tempEquip = diffCharacterModel.equipsProvider.shoes;
        diffCharacterModel.equipsProvider.equipEquip(equipEditingProvider.editingEquip, EquipType.shoes, isCalculatingDifference: true);
        diffCharacterModel.calculateEverything(recalculateCache: true);
        widgetReturn = updateDifferenceText(context: context, isEquipEditing: true, replacing: tempEquip);
      case EquipType.earrings:
        tempEquip = diffCharacterModel.equipsProvider.earrings;
        diffCharacterModel.equipsProvider.equipEquip(equipEditingProvider.editingEquip, EquipType.earrings, isCalculatingDifference: true);
        diffCharacterModel.calculateEverything(recalculateCache: true);
        widgetReturn = updateDifferenceText(context: context, isEquipEditing: true, replacing: tempEquip);
      case EquipType.shoulder:
        tempEquip = diffCharacterModel.equipsProvider.shoulder;
        diffCharacterModel.equipsProvider.equipEquip(equipEditingProvider.editingEquip, EquipType.shoulder, isCalculatingDifference: true);
        diffCharacterModel.calculateEverything(recalculateCache: true);
        widgetReturn = updateDifferenceText(context: context, isEquipEditing: true, replacing: tempEquip);
      case EquipType.gloves:
        tempEquip = diffCharacterModel.equipsProvider.gloves;
        diffCharacterModel.equipsProvider.equipEquip(equipEditingProvider.editingEquip, EquipType.gloves, isCalculatingDifference: true);
        diffCharacterModel.calculateEverything(recalculateCache: true);
        widgetReturn = updateDifferenceText(context: context, isEquipEditing: true, replacing: tempEquip);
      case EquipType.emblem:
        tempEquip = diffCharacterModel.equipsProvider.emblem;
        diffCharacterModel.equipsProvider.equipEquip(equipEditingProvider.editingEquip, EquipType.emblem, isCalculatingDifference: true);
        diffCharacterModel.calculateEverything(recalculateCache: true);
        widgetReturn = updateDifferenceText(context: context, isEquipEditing: true, replacing: tempEquip);
      case EquipType.badge:
        tempEquip = diffCharacterModel.equipsProvider.badge;
        diffCharacterModel.equipsProvider.equipEquip(equipEditingProvider.editingEquip, EquipType.badge, isCalculatingDifference: true);
        diffCharacterModel.calculateEverything(recalculateCache: true);
        widgetReturn = updateDifferenceText(context: context, isEquipEditing: true, replacing: tempEquip);
      case EquipType.medal:
        tempEquip = diffCharacterModel.equipsProvider.medal;
        diffCharacterModel.equipsProvider.equipEquip(equipEditingProvider.editingEquip, EquipType.medal, isCalculatingDifference: true);
        diffCharacterModel.calculateEverything(recalculateCache: true);
        widgetReturn = updateDifferenceText(context: context, isEquipEditing: true, replacing: tempEquip);
      case EquipType.secondary:
      case EquipType.shield:
      case EquipType.katara:
        diffCharacterModel.equipsProvider.equipEquip(equipEditingProvider.editingEquip, EquipType.secondary, isCalculatingDifference: true);
        diffCharacterModel.calculateEverything(recalculateCache: true);
        widgetReturn = updateDifferenceText(context: context, isEquipEditing: true, replacing: tempEquip);
      case EquipType.cape:
        tempEquip = diffCharacterModel.equipsProvider.cape;
        diffCharacterModel.equipsProvider.equipEquip(equipEditingProvider.editingEquip, EquipType.cape, isCalculatingDifference: true);
        diffCharacterModel.calculateEverything(recalculateCache: true);
        widgetReturn = updateDifferenceText(context: context, isEquipEditing: true, replacing: tempEquip);
      case EquipType.heart:
        tempEquip = diffCharacterModel.equipsProvider.heart;
        diffCharacterModel.equipsProvider.equipEquip(equipEditingProvider.editingEquip, EquipType.heart, isCalculatingDifference: true);
        diffCharacterModel.calculateEverything(recalculateCache: true);
        widgetReturn = updateDifferenceText(context: context, isEquipEditing: true, replacing: tempEquip);
      case EquipType.title:
        tempEquip = diffCharacterModel.equipsProvider.title;
        diffCharacterModel.equipsProvider.equipEquip(equipEditingProvider.editingEquip, EquipType.title, isCalculatingDifference: true);
        diffCharacterModel.calculateEverything(recalculateCache: true);
        widgetReturn = updateDifferenceText(context: context, isEquipEditing: true, replacing: tempEquip);
      case EquipType.pet:
        var uniqueItemPosition = getUniqueItemPosition([mainCharacterModel.equipsProvider.pet1, mainCharacterModel.equipsProvider.pet2, mainCharacterModel.equipsProvider.pet3]);

        tempEquip = diffCharacterModel.equipsProvider.pet1;
        if (tempEquip == null) {
          hasEquipped = true;
        }
        if ((isUniqueItem && uniqueItemPosition == 1) || uniqueItemPosition == null) {
          diffCharacterModel.equipsProvider.equipEquip(equipEditingProvider.editingEquip, EquipType.pet, equipPosition: 1, isCalculatingDifference: true);
          diffCharacterModel.calculateEverything(recalculateCache: true);
          widgetChildren.add(updateDifferenceText(context: context, isEquipEditing: true, replacing: tempEquip));
          diffCharacterModel.equipsProvider.equipEquip(tempEquip, EquipType.pet, equipPosition: 1, isCalculatingDifference: true);
        }

        tempEquip = diffCharacterModel.equipsProvider.totem2;
        if ((isUniqueItem && uniqueItemPosition == 2) || (uniqueItemPosition == null && (!hasEquipped || tempEquip != null))) {
          if (tempEquip == null) {
            hasEquipped = true;
          }
          diffCharacterModel.equipsProvider.equipEquip(equipEditingProvider.editingEquip, EquipType.pet, equipPosition: 2, isCalculatingDifference: true);
          diffCharacterModel.calculateEverything(recalculateCache: true);
          widgetChildren.add(updateDifferenceText(context: context, isEquipEditing: true, replacing: tempEquip));
          diffCharacterModel.equipsProvider.equipEquip(tempEquip, EquipType.pet, equipPosition: 2, isCalculatingDifference: true);
        }

        tempEquip = diffCharacterModel.equipsProvider.pet3;
        if ((isUniqueItem && uniqueItemPosition == 3) || (uniqueItemPosition == null && (!hasEquipped || tempEquip != null))) {
          diffCharacterModel.equipsProvider.equipEquip(equipEditingProvider.editingEquip, EquipType.pet, equipPosition: 3, isCalculatingDifference: true);
          diffCharacterModel.calculateEverything(recalculateCache: true);
          widgetChildren.add(updateDifferenceText(context: context, isEquipEditing: true, replacing: tempEquip));
          diffCharacterModel.equipsProvider.equipEquip(tempEquip, EquipType.pet, equipPosition: 3, isCalculatingDifference: true);
        }

        widgetReturn = Column(children: widgetChildren);
      case EquipType.petEquip:
        var uniqueItemPosition = getUniqueItemPosition([mainCharacterModel.equipsProvider.petEquip1, mainCharacterModel.equipsProvider.petEquip2, mainCharacterModel.equipsProvider.petEquip3]);

        tempEquip = diffCharacterModel.equipsProvider.petEquip1;
        if (tempEquip == null) {
          hasEquipped = true;
        }
        if ((isUniqueItem && uniqueItemPosition == 1) || uniqueItemPosition == null) {
          diffCharacterModel.equipsProvider.equipEquip(equipEditingProvider.editingEquip, EquipType.petEquip, equipPosition: 1, isCalculatingDifference: true);
          diffCharacterModel.calculateEverything(recalculateCache: true);
          widgetChildren.add(updateDifferenceText(context: context, isEquipEditing: true, replacing: tempEquip));
          diffCharacterModel.equipsProvider.equipEquip(tempEquip, EquipType.petEquip, equipPosition: 1, isCalculatingDifference: true);
        }

        tempEquip = diffCharacterModel.equipsProvider.petEquip2;
        if ((isUniqueItem && uniqueItemPosition == 2) || (uniqueItemPosition == null && (!hasEquipped || tempEquip != null))) {
          if (tempEquip == null) {
            hasEquipped = true;
          }
          diffCharacterModel.equipsProvider.equipEquip(equipEditingProvider.editingEquip, EquipType.petEquip, equipPosition: 2, isCalculatingDifference: true);
          diffCharacterModel.calculateEverything(recalculateCache: true);
          widgetChildren.add(updateDifferenceText(context: context, isEquipEditing: true, replacing: tempEquip));
          diffCharacterModel.equipsProvider.equipEquip(tempEquip, EquipType.petEquip, equipPosition: 2, isCalculatingDifference: true);
        }

        tempEquip = diffCharacterModel.equipsProvider.petEquip3;
        if ((isUniqueItem && uniqueItemPosition == 3) || (uniqueItemPosition == null && (!hasEquipped || tempEquip != null))) {
          diffCharacterModel.equipsProvider.equipEquip(equipEditingProvider.editingEquip, EquipType.petEquip, equipPosition: 3, isCalculatingDifference: true);
          diffCharacterModel.calculateEverything(recalculateCache: true);
          widgetChildren.add(updateDifferenceText(context: context, isEquipEditing: true, replacing: tempEquip));
          diffCharacterModel.equipsProvider.equipEquip(tempEquip, EquipType.petEquip, equipPosition: 3, isCalculatingDifference: true);
        }

        widgetReturn = Column(children: widgetChildren);
      case null:
        widgetReturn = widgetReturn;
      default:
        throw Exception("Unhandled equipType ${equipEditingProvider.editingEquip?.equipType}");
    }

    diffCharacterModel.equipsProvider = equipModule;
    return widgetReturn;
  }

}

const Text noDifferenceEquip = Text(
  "NO DIFFERENCE IN EQUIPMENT",
  style: TextStyle(color: Colors.greenAccent),
);