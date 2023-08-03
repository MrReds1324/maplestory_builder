import 'package:flutter/material.dart';
import 'package:maplestory_builder/core/constants.dart';
import 'package:maplestory_builder/modules/character_provider.dart';
import 'package:maplestory_builder/modules/utilities.dart';

class DifferenceCalculator with ChangeNotifier {

  late CharacterModel mainCharacterModel;
  late CharacterModel diffCharacterModel;
  Widget differenceWidget = const SizedBox.shrink();


  DifferenceCalculator(CharacterModel characterModel){
    mainCharacterModel = characterModel;
    diffCharacterModel = characterModel.copyWith();
  }

  void updateDifferenceText(){

    void createText(List<Text> textList, num newValue, num originalValue, StatType statType) {
      var difference = newValue - originalValue;
      if (difference == 0) {
        return;
      }
      textList.add(
        Text(
          '${difference < 0 ? "" : "+"}$difference ${formatStatTypeEnumName(statType)} (${difference < 0 ? "" : "+"}${doublePercentFormater.format(calculteDifferencePercentage(newValue, originalValue))})'
        )
      );
    }

    var textList = <Text>[];

    createText(textList, diffCharacterModel.apStatsModule.apStr, mainCharacterModel.apStatsModule.apStr, StatType.str);
    createText(textList, diffCharacterModel.apStatsModule.apDex, mainCharacterModel.apStatsModule.apDex, StatType.dex);
    createText(textList, diffCharacterModel.apStatsModule.apInt, mainCharacterModel.apStatsModule.apInt, StatType.int);
    createText(textList, diffCharacterModel.apStatsModule.apLuk, mainCharacterModel.apStatsModule.apLuk, StatType.luk);
    createText(textList, diffCharacterModel.apStatsModule.apHP, mainCharacterModel.apStatsModule.apHP, StatType.hp);
    createText(textList, diffCharacterModel.apStatsModule.apMP, mainCharacterModel.apStatsModule.apMP, StatType.mp);


    differenceWidget = Column(children: textList);
    notifyListeners();
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

}