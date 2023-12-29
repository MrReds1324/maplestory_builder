import 'package:maplestory_builder/constants/constants.dart';

enum HexaStatType {
  hexaStat1(
    formattedName: "Hexa Stat 1",
    statIncrement: {

    }
  );

  const HexaStatType({
    required this.formattedName,
    required this.statIncrement,
  });

  final String formattedName;
  final Map<StatType, num> statIncrement;
}