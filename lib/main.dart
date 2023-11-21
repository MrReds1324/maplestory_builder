import 'package:flutter/material.dart';
import 'package:maplestory_builder/providers/ap_stats_provider.dart';
import 'package:maplestory_builder/providers/character_provider.dart';
import 'package:maplestory_builder/providers/difference_provider.dart';
import 'package:maplestory_builder/pages/homepage.dart';
import 'package:maplestory_builder/providers/calculator_provider.dart';
import 'package:maplestory_builder/providers/breakdown_provider.dart';
import 'package:maplestory_builder/providers/equip_editing_provider.dart';
import 'package:maplestory_builder/providers/equips_provider.dart';
import 'package:maplestory_builder/providers/hyper_stats_provider.dart';
import 'package:maplestory_builder/providers/trait_stats_provider.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider<EquipEditingProvider>(create: (_) => EquipEditingProvider()),
        ChangeNotifierProvider(create: (_) => CharacterProvider()),
        ChangeNotifierProvider<TraitStatsProvider>(create: (_) => TraitStatsProvider()),
        ChangeNotifierProvider<EquipsProvider>(create: (_) => EquipsProvider()),
        ChangeNotifierProxyProvider<CharacterProvider, APStatsProvider>(
          create: (BuildContext context) => APStatsProvider(
            characterProvider: Provider.of<CharacterProvider>(context, listen: false)
          ),
          update: (
            BuildContext context, 
            CharacterProvider characterProvider, 
            APStatsProvider? apStatsProvider
          ) => apStatsProvider?.update(characterProvider) 
            ??
            APStatsProvider(
              characterProvider: characterProvider
            ),
        ),
        ChangeNotifierProxyProvider<CharacterProvider, HyperStatsProvider>(
          create: (BuildContext context) => HyperStatsProvider(
            characterProvider: Provider.of<CharacterProvider>(context, listen: false)
          ),
          update: (
            BuildContext context, 
            CharacterProvider characterProvider, 
            HyperStatsProvider? hyperStatsProvider
          ) => hyperStatsProvider?.update(characterProvider) 
            ??
            HyperStatsProvider(
              characterProvider: characterProvider
            ),
        ),
        ChangeNotifierProxyProvider5<CharacterProvider, APStatsProvider, TraitStatsProvider, HyperStatsProvider, EquipsProvider, CalculatorProvider>(
          create: (BuildContext context) => CalculatorProvider(
            characterProvider: Provider.of<CharacterProvider>(context, listen: false),
            apStatsProvider: Provider.of<APStatsProvider>(context, listen: false),
            traitStatsProvider: Provider.of<TraitStatsProvider>(context, listen: false),
            hyperStatsProvider: Provider.of<HyperStatsProvider>(context, listen: false),
            equipsProvider: Provider.of<EquipsProvider>(context, listen: false),
          ), 
          update: (
            BuildContext context, 
            CharacterProvider characterProvider, 
            APStatsProvider apStatsProvider, 
            TraitStatsProvider traitStatsProvider, 
            HyperStatsProvider hyperStatsProvider, 
            EquipsProvider equipsProvider, 
            CalculatorProvider? calculatorProvider
          ) => calculatorProvider?.update(characterProvider, apStatsProvider, traitStatsProvider, hyperStatsProvider, equipsProvider) 
            ?? 
            CalculatorProvider(
              characterProvider: characterProvider,
              apStatsProvider: apStatsProvider,
              traitStatsProvider: traitStatsProvider,
              hyperStatsProvider: hyperStatsProvider,
              equipsProvider: equipsProvider
            ),
        ),
        ChangeNotifierProxyProvider2<EquipEditingProvider, CalculatorProvider, DifferenceCalculatorProvider>(            
          create: (BuildContext context) => DifferenceCalculatorProvider(
            equipEditingProvider: Provider.of<EquipEditingProvider>(context, listen: false), 
            mainCalculatorProvider: Provider.of<CalculatorProvider>(context, listen: false)
          ),
          update: (BuildContext context, EquipEditingProvider equipEditingProvider, CalculatorProvider calculatorProvider, DifferenceCalculatorProvider? differenceCalculator) 
            => differenceCalculator?.update(equipEditingProvider, calculatorProvider) 
            ?? 
            DifferenceCalculatorProvider(
              equipEditingProvider: equipEditingProvider, 
              mainCalculatorProvider: calculatorProvider
            ),
        ),
        ChangeNotifierProxyProvider<CalculatorProvider, BreadkdownCalculator>(          
          create: (BuildContext context) => BreadkdownCalculator(Provider.of<CalculatorProvider>(context, listen: false)),
          update: (BuildContext context, CalculatorProvider character, BreadkdownCalculator? damageCalculator) => BreadkdownCalculator(character),
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
      home: const MyHomePage(title: 'BuildStory'),
    );
  }
}


