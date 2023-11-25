import 'package:flutter/material.dart';
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
    return Expanded(
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(
            color: statColor
          ),
        ),
        padding: const EdgeInsets.symmetric(horizontal: 8),
        child: const Row(
          crossAxisAlignment: CrossAxisAlignment.start,
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
                ArcaneSymbolTable(),
                SacredSymbolTable()
              ],
            )
          ],
        ),
      ),
    );
  }
}