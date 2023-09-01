import 'package:flutter/material.dart';
import 'package:maplestory_builder/core/constants.dart';
import 'package:maplestory_builder/core/items/equips.dart';
import 'package:maplestory_builder/modules/character_provider.dart';
import 'package:maplestory_builder/modules/utilities.dart';

class DifferenceCalculator with ChangeNotifier {

  late CharacterModel mainCharacterModel;
  late CharacterModel diffCharacterModel;
  Widget differenceWidget = const SizedBox.shrink();

  DifferenceCalculator(CharacterModel characterModel){
    mainCharacterModel = characterModel;
    diffCharacterModel = characterModel.copyWith();
    if (mainCharacterModel.editingEquip != null) {
    }
  }

  Widget updateDifferenceText({bool isEquipEditing=false, Equip? replacing}){

    void createText(List<Text> textList, num newValue, num originalValue, {StatType? statType, RangeType? rangeType, bool isPercentage=false}) {
      assert(statType != null || rangeType != null, "Must provide statType or RangeType");
      var difference = newValue - originalValue;
      if (difference == 0) {
        return;
      }

      Text? text;
      if (statType != null){
        text = Text(
          '${difference < 0 ? "" : "+"}${isPercentage ? doublePercentFormater.format(difference) : doubleRoundFormater.format(difference)} ${formatStatTypeEnumName(statType)} (${difference < 0 ? "" : "+"}${doublePercentFormater.format(calculteDifferencePercentage(newValue, originalValue))})',
          style: TextStyle(
            color: difference < 0 ?Colors.redAccent: Colors.greenAccent,
          ),
        );
      }
      if (rangeType != null) {
        text = Text(
          '${difference < 0 ? "" : "+"}${rangeFormatter.format(difference)} ${formatRangeTypeEnumName(rangeType)} (${difference < 0 ? "" : "+"}${doublePercentFormater.format(calculteDifferencePercentage(newValue, originalValue))})',
          style: TextStyle(
            color: difference < 0 ?Colors.redAccent: Colors.greenAccent,
          ),
        );
      }

      if (text != null) {
        textList.add(text);
      }
    }

    var textList = <Text>[];

    if (isEquipEditing){
      if (replacing == null) {
        textList.add(
          const Text(
            "Equipping: ",
          )
        );
      }
      else{
        textList.add(
          Text(
            "Replacing ${replacing.name}: "
          )
        );
      }
    }

    createText(textList, diffCharacterModel.upperDamageRange, mainCharacterModel.upperDamageRange, rangeType: RangeType.damageRange);
    createText(textList, diffCharacterModel.upperBossDamangeRange, mainCharacterModel.upperBossDamangeRange, rangeType: RangeType.bossDamageRange);
    createText(textList, diffCharacterModel.totalStr, mainCharacterModel.totalStr, statType: StatType.str);
    createText(textList, diffCharacterModel.totalDex, mainCharacterModel.totalDex, statType: StatType.dex);
    createText(textList, diffCharacterModel.totalInt, mainCharacterModel.totalInt, statType: StatType.int);
    createText(textList, diffCharacterModel.totalLuk, mainCharacterModel.totalLuk, statType: StatType.luk);
    createText(textList, diffCharacterModel.totalHp, mainCharacterModel.totalHp, statType: StatType.hp);
    createText(textList, diffCharacterModel.totalMp, mainCharacterModel.totalMp, statType: StatType.mp);
    createText(textList, diffCharacterModel.totalAttack, mainCharacterModel.totalAttack, statType: StatType.attack);
    createText(textList, diffCharacterModel.totalMAttack, mainCharacterModel.totalMAttack, statType: StatType.mattack);
    createText(textList, diffCharacterModel.totalDefense, mainCharacterModel.totalDefense, statType: StatType.defense);
    createText(textList, diffCharacterModel.totalIgnoreDefense, mainCharacterModel.totalIgnoreDefense, statType: StatType.ignoreDefense, isPercentage: true);
    createText(textList, diffCharacterModel.totalBossDamage, mainCharacterModel.totalBossDamage, statType: StatType.bossDamage, isPercentage: true);
    createText(textList, diffCharacterModel.totalSpeed, mainCharacterModel.totalSpeed, statType: StatType.speed);
    createText(textList, diffCharacterModel.totalJump, mainCharacterModel.totalJump, statType: StatType.jump);
    createText(textList, diffCharacterModel.totalIgnoreDefense, mainCharacterModel.totalIgnoreDefense, statType: StatType.ignoreDefense, isPercentage: true);
    createText(textList, diffCharacterModel.totalDamage, mainCharacterModel.totalDamage, statType: StatType.damage, isPercentage: true);
    createText(textList, diffCharacterModel.totalDamageNormalMobs, mainCharacterModel.totalDamageNormalMobs, statType: StatType.damageNormalMobs, isPercentage: true);
    createText(textList, diffCharacterModel.totalElementalIgnoreDefense, mainCharacterModel.totalElementalIgnoreDefense, statType: StatType.ignoreElementalDefense, isPercentage: true);
    createText(textList, diffCharacterModel.flatStr, mainCharacterModel.flatStr, statType: StatType.finalStr);
    createText(textList, diffCharacterModel.flatDex, mainCharacterModel.flatDex, statType: StatType.finalDex);
    createText(textList, diffCharacterModel.flatInt, mainCharacterModel.flatInt, statType: StatType.finalInt);
    createText(textList, diffCharacterModel.flatLuk, mainCharacterModel.flatLuk, statType: StatType.finalLuk);
    createText(textList, diffCharacterModel.flatHp, mainCharacterModel.flatHp, statType: StatType.finalHp);
    createText(textList, diffCharacterModel.flatMP, mainCharacterModel.flatMP, statType: StatType.finalMp);
    createText(textList, diffCharacterModel.flatAttack, mainCharacterModel.flatAttack, statType: StatType.finalAttack);
    createText(textList, diffCharacterModel.flatMAttack, mainCharacterModel.flatMAttack, statType: StatType.finalMAttack);

    if (isEquipEditing) {
      if (textList.length > 1) {
        return Column(children: textList);
      }
      else {
        return const SizedBox.shrink();
      }
    }
    differenceWidget = Column(children: textList);
    notifyListeners();
    return const SizedBox.shrink();
  }

  void subtractApToStat(int apAmount, StatType statType) {
    var tempApStats = diffCharacterModel.apStatsModule.copyWith();
    diffCharacterModel.apStatsModule.subtractApToStat(apAmount, statType);
    diffCharacterModel.calculateEverything();
    updateDifferenceText();
    diffCharacterModel.apStatsModule = tempApStats;
  }

  void addApToStat(int apAmount, StatType statType) {
    var tempApStats = diffCharacterModel.apStatsModule.copyWith();
    diffCharacterModel.apStatsModule.addApToStat(apAmount, statType);
    diffCharacterModel.calculateEverything();
    updateDifferenceText();
    diffCharacterModel.apStatsModule = tempApStats;
  }

  Widget compareEditingEquip(){
    Equip? tempEquip;
    Widget widgetReturn = const SizedBox.shrink();
    switch(mainCharacterModel.editingEquip?.equipType){
      case EquipType.totem:
        var widgetChildren = <Widget>[];
        var hasEquipped = false;

        tempEquip = diffCharacterModel.equipModule.totem1;
        if (tempEquip != null) {
          diffCharacterModel.equipModule.totem1 = mainCharacterModel.editingEquip;
          diffCharacterModel.calculateEverything();
          widgetChildren.add(updateDifferenceText(isEquipEditing: true, replacing: tempEquip));
          diffCharacterModel.equipModule.totem1 = tempEquip;
        }
        else {
          hasEquipped = true;
          diffCharacterModel.equipModule.totem1 = mainCharacterModel.editingEquip;
          diffCharacterModel.calculateEverything();
          widgetChildren.add(updateDifferenceText(isEquipEditing: true, replacing: tempEquip));
          diffCharacterModel.equipModule.totem1 = tempEquip;
        }

        tempEquip = diffCharacterModel.equipModule.totem2;
        if (tempEquip != null) {
          diffCharacterModel.equipModule.totem2 = mainCharacterModel.editingEquip;
          diffCharacterModel.calculateEverything();
          widgetChildren.add(updateDifferenceText(isEquipEditing: true, replacing: tempEquip));
          diffCharacterModel.equipModule.totem2 = tempEquip;
        }
        else if (!hasEquipped) {
          hasEquipped = true;
          diffCharacterModel.equipModule.totem2 = mainCharacterModel.editingEquip;
          diffCharacterModel.calculateEverything();
          widgetChildren.add(updateDifferenceText(isEquipEditing: true, replacing: tempEquip));
          diffCharacterModel.equipModule.totem2 = tempEquip;
        }

        tempEquip = diffCharacterModel.equipModule.totem3;
        if (tempEquip != null) {
          diffCharacterModel.equipModule.totem3 = mainCharacterModel.editingEquip;
          diffCharacterModel.calculateEverything();
          widgetChildren.add(updateDifferenceText(isEquipEditing: true, replacing: tempEquip));
          diffCharacterModel.equipModule.totem3 = tempEquip;
        }
        else if (!hasEquipped) {
          hasEquipped = true;
          diffCharacterModel.equipModule.totem3 = mainCharacterModel.editingEquip;
          diffCharacterModel.calculateEverything();
          widgetChildren.add(updateDifferenceText(isEquipEditing: true, replacing: tempEquip));
          diffCharacterModel.equipModule.totem3 = tempEquip;
        }

        widgetReturn = Column(children: widgetChildren);
      case EquipType.ring:
        var widgetChildren = <Widget>[];
        var hasEquipped = false;

        tempEquip = diffCharacterModel.equipModule.ring1;
        if (tempEquip != null) {
          diffCharacterModel.equipModule.ring1 = mainCharacterModel.editingEquip;
          diffCharacterModel.calculateEverything();
          widgetChildren.add(updateDifferenceText(isEquipEditing: true, replacing: tempEquip));
          diffCharacterModel.equipModule.ring1 = tempEquip;
        }
        else {
          hasEquipped = true;
          diffCharacterModel.equipModule.ring1 = mainCharacterModel.editingEquip;
          diffCharacterModel.calculateEverything();
          widgetChildren.add(updateDifferenceText(isEquipEditing: true, replacing: tempEquip));
          diffCharacterModel.equipModule.ring1 = tempEquip;
        }

        tempEquip = diffCharacterModel.equipModule.ring2;
        if (tempEquip != null) {
          diffCharacterModel.equipModule.ring2 = mainCharacterModel.editingEquip;
          diffCharacterModel.calculateEverything();
          widgetChildren.add(updateDifferenceText(isEquipEditing: true, replacing: tempEquip));
          diffCharacterModel.equipModule.ring2 = tempEquip;
        }
        else if (!hasEquipped) {
          hasEquipped = true;
          diffCharacterModel.equipModule.ring2 = mainCharacterModel.editingEquip;
          diffCharacterModel.calculateEverything();
          widgetChildren.add(updateDifferenceText(isEquipEditing: true, replacing: tempEquip));
          diffCharacterModel.equipModule.ring2 = tempEquip;
        }

        tempEquip = diffCharacterModel.equipModule.ring3;
        if (tempEquip != null) {
          diffCharacterModel.equipModule.ring3 = mainCharacterModel.editingEquip;
          diffCharacterModel.calculateEverything();
          widgetChildren.add(updateDifferenceText(isEquipEditing: true, replacing: tempEquip));
          diffCharacterModel.equipModule.ring3 = tempEquip;
        }
        else if (!hasEquipped) {
          hasEquipped = true;
          diffCharacterModel.equipModule.ring3 = mainCharacterModel.editingEquip;
          diffCharacterModel.calculateEverything();
          widgetChildren.add(updateDifferenceText(isEquipEditing: true, replacing: tempEquip));
          diffCharacterModel.equipModule.ring3 = tempEquip;
        }

        tempEquip = diffCharacterModel.equipModule.ring4;
        if (tempEquip != null) {
          diffCharacterModel.equipModule.ring4 = mainCharacterModel.editingEquip;
          diffCharacterModel.calculateEverything();
          widgetChildren.add(updateDifferenceText(isEquipEditing: true, replacing: tempEquip));
          diffCharacterModel.equipModule.ring4 = tempEquip;
        }
        else if (!hasEquipped) {
          hasEquipped = true;
          diffCharacterModel.equipModule.ring4 = mainCharacterModel.editingEquip;
          diffCharacterModel.calculateEverything();
          widgetChildren.add(updateDifferenceText(isEquipEditing: true, replacing: tempEquip));
          diffCharacterModel.equipModule.ring4 = tempEquip;
        }

        widgetReturn = Column(children: widgetChildren);
      case EquipType.pocket:
        tempEquip = diffCharacterModel.equipModule.pocketItem;
        diffCharacterModel.equipModule.pocketItem = mainCharacterModel.editingEquip;
        diffCharacterModel.calculateEverything();
        widgetReturn = updateDifferenceText(isEquipEditing: true, replacing: tempEquip);
        diffCharacterModel.equipModule.pocketItem = tempEquip;
      case EquipType.pendant:
        var widgetChildren = <Widget>[];
        var hasEquipped = false;

        tempEquip = diffCharacterModel.equipModule.pendant1;
        if (tempEquip != null) {
          diffCharacterModel.equipModule.pendant1 = mainCharacterModel.editingEquip;
          diffCharacterModel.calculateEverything();
          widgetChildren.add(updateDifferenceText(isEquipEditing: true, replacing: tempEquip));
          diffCharacterModel.equipModule.pendant1 = tempEquip;
        }
        else {
          hasEquipped = true;
          diffCharacterModel.equipModule.pendant1 = mainCharacterModel.editingEquip;
          diffCharacterModel.calculateEverything();
          widgetChildren.add(updateDifferenceText(isEquipEditing: true, replacing: tempEquip));
          diffCharacterModel.equipModule.pendant1 = tempEquip;
        }

        tempEquip = diffCharacterModel.equipModule.pendant2;
        if (tempEquip != null) {
          diffCharacterModel.equipModule.pendant2 = mainCharacterModel.editingEquip;
          diffCharacterModel.calculateEverything();
          widgetChildren.add(updateDifferenceText(isEquipEditing: true, replacing: tempEquip));
          diffCharacterModel.equipModule.pendant2 = tempEquip;
        }
        else if (!hasEquipped) {
          hasEquipped = true;
          diffCharacterModel.equipModule.pendant2 = mainCharacterModel.editingEquip;
          diffCharacterModel.calculateEverything();
          widgetChildren.add(updateDifferenceText(isEquipEditing: true, replacing: tempEquip));
          diffCharacterModel.equipModule.pendant2 = tempEquip;
        }

        widgetReturn = Column(children: widgetChildren);
      case EquipType.weapon:
        tempEquip = diffCharacterModel.equipModule.weapon;
        diffCharacterModel.equipModule.weapon = mainCharacterModel.editingEquip;
        diffCharacterModel.calculateEverything();
        widgetReturn = updateDifferenceText(isEquipEditing: true, replacing: tempEquip);
        diffCharacterModel.equipModule.weapon = tempEquip;
      case EquipType.belt:
        tempEquip = diffCharacterModel.equipModule.belt;
        diffCharacterModel.equipModule.belt = mainCharacterModel.editingEquip;
        diffCharacterModel.calculateEverything();
        widgetReturn = updateDifferenceText(isEquipEditing: true, replacing: tempEquip);
        diffCharacterModel.equipModule.belt = tempEquip;
      case EquipType.hat:
        tempEquip = diffCharacterModel.equipModule.hat;
        diffCharacterModel.equipModule.hat = mainCharacterModel.editingEquip;
        diffCharacterModel.calculateEverything();
        widgetReturn = updateDifferenceText(isEquipEditing: true, replacing: tempEquip);
        diffCharacterModel.equipModule.hat = tempEquip;
      case EquipType.face:
        tempEquip = diffCharacterModel.equipModule.face;
        diffCharacterModel.equipModule.face = mainCharacterModel.editingEquip;
        diffCharacterModel.calculateEverything();
        widgetReturn = updateDifferenceText(isEquipEditing: true, replacing: tempEquip);
        diffCharacterModel.equipModule.face = tempEquip;
      case EquipType.eye:
        tempEquip = diffCharacterModel.equipModule.eye;
        diffCharacterModel.equipModule.eye = mainCharacterModel.editingEquip;
        diffCharacterModel.calculateEverything();
        widgetReturn = updateDifferenceText(isEquipEditing: true, replacing: tempEquip);
        diffCharacterModel.equipModule.eye = tempEquip;
      case EquipType.overall:
        var tempTop = diffCharacterModel.equipModule.top;
        var tempBot = diffCharacterModel.equipModule.bottom;
        tempEquip = diffCharacterModel.equipModule.overall;
        
        diffCharacterModel.equipModule.overall = mainCharacterModel.editingEquip;
        diffCharacterModel.equipModule.top = null;
        diffCharacterModel.equipModule.bottom = null;
        diffCharacterModel.calculateEverything();
        widgetReturn = updateDifferenceText(isEquipEditing: true, replacing: tempEquip);
        diffCharacterModel.equipModule.overall = tempEquip;
        diffCharacterModel.equipModule.top = tempTop;
        diffCharacterModel.equipModule.bottom = tempBot;
      case EquipType.top:
        var tempOverall = diffCharacterModel.equipModule.overall;
        tempEquip = diffCharacterModel.equipModule.top;
        
        diffCharacterModel.equipModule.top = mainCharacterModel.editingEquip;
        diffCharacterModel.equipModule.overall = null;
        diffCharacterModel.calculateEverything();
        widgetReturn = updateDifferenceText(isEquipEditing: true, replacing: tempEquip);
        diffCharacterModel.equipModule.overall = tempOverall;
        diffCharacterModel.equipModule.top = tempEquip;
      case EquipType.bottom:
        var tempOverall = diffCharacterModel.equipModule.overall;
        tempEquip = diffCharacterModel.equipModule.bottom;
        
        diffCharacterModel.equipModule.bottom = mainCharacterModel.editingEquip;
        diffCharacterModel.equipModule.overall = null;
        diffCharacterModel.calculateEverything();
        widgetReturn = updateDifferenceText(isEquipEditing: true, replacing: tempEquip);
        diffCharacterModel.equipModule.overall = tempOverall;
        diffCharacterModel.equipModule.bottom = tempEquip;
      case EquipType.shoes:
        tempEquip = diffCharacterModel.equipModule.shoes;
        diffCharacterModel.equipModule.shoes = mainCharacterModel.editingEquip;
        diffCharacterModel.calculateEverything();
        widgetReturn = updateDifferenceText(isEquipEditing: true, replacing: tempEquip);
        diffCharacterModel.equipModule.shoes = tempEquip;
      case EquipType.earrings:
        tempEquip = diffCharacterModel.equipModule.earrings;
        diffCharacterModel.equipModule.earrings = mainCharacterModel.editingEquip;
        diffCharacterModel.calculateEverything();
        widgetReturn = updateDifferenceText(isEquipEditing: true, replacing: tempEquip);
        diffCharacterModel.equipModule.earrings = tempEquip;
      case EquipType.shoulder:
        tempEquip = diffCharacterModel.equipModule.shoulder;
        diffCharacterModel.equipModule.shoulder = mainCharacterModel.editingEquip;
        diffCharacterModel.calculateEverything();
        widgetReturn = updateDifferenceText(isEquipEditing: true, replacing: tempEquip);
        diffCharacterModel.equipModule.shoulder = tempEquip;
      case EquipType.gloves:
        tempEquip = diffCharacterModel.equipModule.gloves;
        diffCharacterModel.equipModule.gloves = mainCharacterModel.editingEquip;
        diffCharacterModel.calculateEverything();
        widgetReturn = updateDifferenceText(isEquipEditing: true, replacing: tempEquip);
        diffCharacterModel.equipModule.gloves = tempEquip;
      case EquipType.emblem:
        tempEquip = diffCharacterModel.equipModule.emblem;
        diffCharacterModel.equipModule.emblem = mainCharacterModel.editingEquip;
        diffCharacterModel.calculateEverything();
        widgetReturn = updateDifferenceText(isEquipEditing: true, replacing: tempEquip);
        diffCharacterModel.equipModule.emblem = tempEquip;
      case EquipType.badge:
        tempEquip = diffCharacterModel.equipModule.badge;
        diffCharacterModel.equipModule.badge = mainCharacterModel.editingEquip;
        diffCharacterModel.calculateEverything();
        widgetReturn = updateDifferenceText(isEquipEditing: true, replacing: tempEquip);
        diffCharacterModel.equipModule.badge = tempEquip;
      case EquipType.medal:
        tempEquip = diffCharacterModel.equipModule.medal;
        diffCharacterModel.equipModule.medal = mainCharacterModel.editingEquip;
        diffCharacterModel.calculateEverything();
        widgetReturn = updateDifferenceText(isEquipEditing: true, replacing: tempEquip);
        diffCharacterModel.equipModule.medal = tempEquip;
      case EquipType.secondary:
      case EquipType.shield:
      case EquipType.katara:
        tempEquip = diffCharacterModel.equipModule.secondary;
        diffCharacterModel.equipModule.secondary = mainCharacterModel.editingEquip;
        diffCharacterModel.calculateEverything();
        widgetReturn = updateDifferenceText(isEquipEditing: true, replacing: tempEquip);
        diffCharacterModel.equipModule.secondary = tempEquip;
      case EquipType.cape:
        tempEquip = diffCharacterModel.equipModule.cape;
        diffCharacterModel.equipModule.cape = mainCharacterModel.editingEquip;
        diffCharacterModel.calculateEverything();
        widgetReturn = updateDifferenceText(isEquipEditing: true, replacing: tempEquip);
        diffCharacterModel.equipModule.cape = tempEquip;
      case EquipType.heart:
        tempEquip = diffCharacterModel.equipModule.heart;
        diffCharacterModel.equipModule.heart = mainCharacterModel.editingEquip;
        diffCharacterModel.calculateEverything();
        widgetReturn = updateDifferenceText(isEquipEditing: true, replacing: tempEquip);
        diffCharacterModel.equipModule.heart = tempEquip;
      default:
        return widgetReturn;
    }

    // This is to ensure that we only return the below decorated box when there is actually something to display
    if (widgetReturn is SizedBox) {
      return widgetReturn;
    }
    else if (widgetReturn is Column) {
      bool isAllSizedBox = true;
      for (var i = 0; i < widgetReturn.children.length; i++){
        if (widgetReturn.children[i] is! SizedBox) {
          isAllSizedBox = false;
          break;
        }
      }
      if (isAllSizedBox) {
        return const SizedBox.shrink();
      }
    }

    return Container(
      padding: const EdgeInsets.only(bottom: 5),
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(color: statColor),
          borderRadius: const BorderRadius.all(Radius.circular(10))
        ),
        padding: const EdgeInsets.all(5),
        child: SingleChildScrollView(child: widgetReturn),
      ),
    );
  }

}