import 'package:flutter/material.dart';
import 'package:maplestory_builder/pages/homepage.dart';
import 'package:maplestory_builder/modules/character_provider.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => CharacterModel(),
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
          bodyMedium: TextStyle(fontSize: 12)
        ),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Maplestory Builder'),
    );
  }
}


