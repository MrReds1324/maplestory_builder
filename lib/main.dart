import 'package:flutter/material.dart';
import 'package:maplestory_builder/providers/difference_provider.dart';
import 'package:maplestory_builder/pages/homepage.dart';
import 'package:maplestory_builder/providers/character_provider.dart';
import 'package:maplestory_builder/modules/breakdown_provider.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [  
        ChangeNotifierProvider<CharacterModel>(create: (_) => CharacterModel()),
        ChangeNotifierProxyProvider<CharacterModel, DifferenceCalculator>(            
          create: (BuildContext context) => DifferenceCalculator(Provider.of<CharacterModel>(context, listen: false)),
          update: (BuildContext context, CharacterModel character, DifferenceCalculator? differenceCalculator) => differenceCalculator?.update(character) ?? DifferenceCalculator(character),
        ),
        ChangeNotifierProxyProvider<CharacterModel, BreadkdownCalculator>(          
          create: (BuildContext context) => BreadkdownCalculator(Provider.of<CharacterModel>(context, listen: false)),
          update: (BuildContext context, CharacterModel character, BreadkdownCalculator? damageCalculator) => BreadkdownCalculator(character),
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


