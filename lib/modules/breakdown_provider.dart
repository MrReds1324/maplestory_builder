import 'package:flutter/material.dart';
import 'package:maplestory_builder/providers/character_provider.dart';

class BreadkdownCalculator with ChangeNotifier {

  CharacterProvider? mainCharacterModel;


  BreadkdownCalculator(CharacterProvider characterModel){
    mainCharacterModel = characterModel;
  }
}