import 'package:flutter/material.dart';
import 'package:maplestory_builder/providers/calculator_provider.dart';

class BreadkdownCalculator with ChangeNotifier {

  CalculatorProvider? mainCharacterModel;


  BreadkdownCalculator(CalculatorProvider characterModel){
    mainCharacterModel = characterModel;
  }
}