import 'package:flutter/material.dart';
import 'package:maplestory_builder/core/constants.dart';
import 'package:maplestory_builder/core/items/equips.dart';
import 'package:maplestory_builder/modules/character_provider.dart';
import 'package:maplestory_builder/modules/utilities.dart';

class DifferenceCalculator with ChangeNotifier {

  late CharacterModel mainCharacterModel;
  late CharacterModel diffCharacterModel;
  Widget differenceWidget = const SizedBox.shrink();
  Widget equipDifferenceWidget = const SizedBox.shrink();


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

    if (isEquipEditing) {
      return Column(children: textList);
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
    var tempEquip = diffCharacterModel.equipModule.hat;
    diffCharacterModel.equipModule.hat = mainCharacterModel.editingEquip;
    diffCharacterModel.calculateEverything();
    var widgetReturn = updateDifferenceText(isEquipEditing: true, replacing: tempEquip);
    diffCharacterModel.equipModule.hat = tempEquip;
    return widgetReturn;
  }

}