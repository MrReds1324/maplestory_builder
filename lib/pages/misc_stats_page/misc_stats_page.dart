import 'package:flutter/material.dart';
import 'package:maplestory_builder/constants/character/symbols_stats.dart';
import 'package:maplestory_builder/constants/constants.dart';
import 'package:maplestory_builder/pages/misc_stats_page/hyper_stats.dart';
import 'package:maplestory_builder/pages/misc_stats_page/inner_ability_stats.dart';
import 'package:maplestory_builder/pages/misc_stats_page/symbol_stats.dart';
import 'package:maplestory_builder/pages/misc_stats_page/trait_stats.dart';

class MiscStatsPage extends StatelessWidget {

  const MiscStatsPage(
    {
      super.key
    }
  );

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(
          color: DEFAULT_COLOR
        ),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: const Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          HyperStatTable(),
          Column(
            children: [
              InnerAbilityStatsTable(),
              TraitStatsTable(),
            ],
          ),
          Column(
            children: [
              SymbolTable(tableTitle: "Arcane Symbols", enumValues: ArcaneSymbol.values),
              SymbolTable(tableTitle: "Sacred Symbols", enumValues: SacredSymbol.values),
              SymbolTable(tableTitle: "Grand Sacred Symbols", enumValues: GrandSacredSymbol.values),
            ],
          )
        ],
      ),
    );
  }
}