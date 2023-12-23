import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:maplestory_builder/modules/utilities/utilities.dart';
import 'package:maplestory_builder/providers/character/ap_stats_provider.dart';
import 'package:maplestory_builder/providers/character/character_provider.dart';
import 'package:maplestory_builder/providers/legion/legion_artifacts_provider.dart';
import 'package:maplestory_builder/providers/legion/legion_character_editing_provider.dart';
import 'package:maplestory_builder/providers/legion/legion_stats_provider.dart';
import 'package:maplestory_builder/providers/difference_provider.dart';
import 'package:maplestory_builder/pages/homepage.dart';
import 'package:maplestory_builder/providers/calculator_provider.dart';
import 'package:maplestory_builder/providers/breakdown_provider.dart';
import 'package:maplestory_builder/providers/equipment/equip_editing_provider.dart';
import 'package:maplestory_builder/providers/equipment/equips_provider.dart';
import 'package:maplestory_builder/providers/character/hyper_stats_provider.dart';
import 'package:maplestory_builder/providers/character/inner_ability_provider.dart';
import 'package:maplestory_builder/providers/character/symbol_stats_provider.dart';
import 'package:maplestory_builder/providers/character/trait_stats_provider.dart';
import 'package:provider/provider.dart';


void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider<LegionCharacterEditingProvider>(create: (_) => LegionCharacterEditingProvider()),
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
        ChangeNotifierProxyProvider<CharacterProvider, SymbolStatsProvider>(
          create: (BuildContext context) => SymbolStatsProvider(
            characterProvider: Provider.of<CharacterProvider>(context, listen: false)
          ),
          update: (
            BuildContext context, 
            CharacterProvider characterProvider, 
            SymbolStatsProvider? symbolStatsProvider
          ) => symbolStatsProvider?.update(characterProvider) 
            ??
            SymbolStatsProvider(
              characterProvider: characterProvider
            ),
        ),
        ChangeNotifierProvider<InnerAbilityProvider>(create: (_) => InnerAbilityProvider()),
        ChangeNotifierProxyProvider<CharacterProvider, LegionStatsProvider>(
          create: (BuildContext context) => LegionStatsProvider(
            characterProvider: Provider.of<CharacterProvider>(context, listen: false)
          ),
          update: (
            BuildContext context, 
            CharacterProvider characterProvider, 
            LegionStatsProvider? legionStatsProvider
          ) => legionStatsProvider?.update(characterProvider) 
            ??
            LegionStatsProvider(
              characterProvider: characterProvider
            ),
        ),
        ChangeNotifierProvider<LegionArtifactProvider>(create: (_) => LegionArtifactProvider()),
        ChangeNotifierProxyProvider8<CharacterProvider, APStatsProvider, InnerAbilityProvider, TraitStatsProvider, 
        HyperStatsProvider, SymbolStatsProvider, EquipsProvider, LegionStatsProvider, CalculatorProvider>(
          create: (BuildContext context) => CalculatorProvider(
            characterProvider: Provider.of<CharacterProvider>(context, listen: false),
            apStatsProvider: Provider.of<APStatsProvider>(context, listen: false),
            innerAbilityProvider: Provider.of<InnerAbilityProvider>(context, listen: false),
            traitStatsProvider: Provider.of<TraitStatsProvider>(context, listen: false),
            hyperStatsProvider: Provider.of<HyperStatsProvider>(context, listen: false),
            symbolStatsProvider: Provider.of<SymbolStatsProvider>(context, listen: false),
            equipsProvider: Provider.of<EquipsProvider>(context, listen: false),
            legionStatsProvider: Provider.of<LegionStatsProvider>(context, listen: false),
          ), 
          update: (
            BuildContext context, 
            CharacterProvider characterProvider, 
            APStatsProvider apStatsProvider, 
            InnerAbilityProvider innerAbilityProvider,
            TraitStatsProvider traitStatsProvider, 
            HyperStatsProvider hyperStatsProvider,
            SymbolStatsProvider symbolStatsProvider,
            EquipsProvider equipsProvider,
            LegionStatsProvider legionStatsProvider,
            CalculatorProvider? calculatorProvider
          ) => calculatorProvider?.update(
              characterProvider, 
              apStatsProvider, 
              innerAbilityProvider, 
              traitStatsProvider, 
              hyperStatsProvider, 
              symbolStatsProvider, 
              equipsProvider,
              legionStatsProvider
            ) 
            ?? 
            CalculatorProvider(
              characterProvider: characterProvider,
              apStatsProvider: apStatsProvider,
              innerAbilityProvider: innerAbilityProvider,
              traitStatsProvider: traitStatsProvider,
              hyperStatsProvider: hyperStatsProvider,
              symbolStatsProvider: symbolStatsProvider,
              equipsProvider: equipsProvider,
              legionStatsProvider: legionStatsProvider
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
      scrollBehavior: const MaterialScrollBehavior().copyWith(
        dragDevices: {PointerDeviceKind.mouse, PointerDeviceKind.trackpad, PointerDeviceKind.stylus, PointerDeviceKind.touch},
      ),
      theme: ThemeData(
        brightness: Brightness.dark,
        textTheme: const TextTheme(
          bodyMedium: TextStyle(fontSize: 12),
          headlineMedium: TextStyle(decoration: TextDecoration.underline),
          headlineLarge: TextStyle(decoration: TextDecoration.underline),
        ),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'BuildStory'),
    );
  }
}


