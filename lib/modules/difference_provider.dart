import 'package:flutter/material.dart';
import 'package:maplestory_builder/core/constants.dart';
import 'package:maplestory_builder/modules/character_provider.dart';
import 'package:maplestory_builder/modules/utilities.dart';

class DifferenceCalculator with ChangeNotifier {

  late CharacterModel mainCharacterModel;
  late CharacterModel diffCharacterModel;
  String differenceText = '';


  DifferenceCalculator(CharacterModel characterModel){
    mainCharacterModel = characterModel;
    diffCharacterModel = characterModel.copyWith();
  }

  void subtractApToStat(int apAmount, StatType statType) {
    diffCharacterModel.apStatsModule.subtractApToStat(apAmount, statType);
    diffCharacterModel.calculateEverything();
    differenceText = '-$apAmount STR (${doublePercentFormater.format((diffCharacterModel.apStatsModule.apStr / mainCharacterModel.apStatsModule.apStr) - 1)})';
    notifyListeners();
  }

}