import 'package:flutter/material.dart';
import 'package:maplestory_builder/providers/difference_provider.dart';
import 'package:maplestory_builder/pages/homepage.dart';
import 'package:maplestory_builder/providers/character_provider.dart';
import 'package:maplestory_builder/modules/breakdown_provider.dart';
import 'package:maplestory_builder/providers/equip_editing_provider.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider<EquipEditingProvider>(create: (_) => EquipEditingProvider()),
        ChangeNotifierProvider<CharacterProvider>(create: (_) => CharacterProvider()),
        ChangeNotifierProxyProvider2<EquipEditingProvider, CharacterProvider, DifferenceCalculatorProvider>(            
          create: (BuildContext context) => DifferenceCalculatorProvider(equipEditingProvider: Provider.of<EquipEditingProvider>(context, listen: false), mainCharacterModel: Provider.of<CharacterProvider>(context, listen: false)),
          update: (BuildContext context, EquipEditingProvider equipEditingProvider, CharacterProvider characterProvider, DifferenceCalculatorProvider? differenceCalculator) 
          => differenceCalculator?.update(equipEditingProvider, characterProvider) ?? DifferenceCalculatorProvider(equipEditingProvider: equipEditingProvider, mainCharacterModel: characterProvider),
        ),
        ChangeNotifierProxyProvider<CharacterProvider, BreadkdownCalculator>(          
          create: (BuildContext context) => BreadkdownCalculator(Provider.of<CharacterProvider>(context, listen: false)),
          update: (BuildContext context, CharacterProvider character, BreadkdownCalculator? damageCalculator) => BreadkdownCalculator(character),
        ),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        brightness: Brightness.dark,
        textTheme: const TextTheme(
          bodyMedium: TextStyle(fontSize: 12),
          headlineMedium: TextStyle(decoration: TextDecoration.underline)
        ),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Maplestory Builder'),
    );
  }
}


