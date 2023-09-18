import 'package:flutter/material.dart';
import 'package:maplestory_builder/providers/character_provider.dart';

class BreadkdownCalculator with ChangeNotifier {

  CharacterModel? mainCharacterModel;


  BreadkdownCalculator(CharacterModel characterModel){
    mainCharacterModel = characterModel;
  }
}