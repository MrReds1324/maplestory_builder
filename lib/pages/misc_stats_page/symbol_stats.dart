import 'package:flutter/material.dart';
import 'package:maplestory_builder/constants/character/symbols_stats.dart';
import 'package:maplestory_builder/constants/character/trait_stats.dart';
import 'package:maplestory_builder/constants/constants.dart';
import 'package:maplestory_builder/modules/utilities/widgets.dart';
import 'package:maplestory_builder/providers/difference_provider.dart';
import 'package:maplestory_builder/providers/symbol_stats_provider.dart';
import 'package:maplestory_builder/providers/trait_stats_provider.dart';
import 'package:provider/provider.dart';

class ArcaneSymbolTable extends StatelessWidget {
  const ArcaneSymbolTable({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: Container(
        width: 455,
        height: 298,
        padding: const EdgeInsets.all(5),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Arcane Symbols",
              style: Theme.of(context).textTheme.headlineMedium
            ),
            const ArcaneSymbolCell(arcaneSymbol: ArcaneSymbol.vanishingJourney),
            const ArcaneSymbolCell(arcaneSymbol: ArcaneSymbol.chuchuIsland),
            const ArcaneSymbolCell(arcaneSymbol: ArcaneSymbol.lachelein),
            const ArcaneSymbolCell(arcaneSymbol: ArcaneSymbol.arcana),
            const ArcaneSymbolCell(arcaneSymbol: ArcaneSymbol.morass),
            const ArcaneSymbolCell(arcaneSymbol: ArcaneSymbol.esfera),          
          ]
        ),
      ),
    );
  }
}

class SacredSymbolTable extends StatelessWidget {
  const SacredSymbolTable({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: Container(
        width: 455,
        height: 298,
        padding: const EdgeInsets.all(5),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Sacred Symbols",
              style: Theme.of(context).textTheme.headlineMedium
            ),
            const SacredSymbolCell(sacredSymbol: SacredSymbol.cernium),
            const SacredSymbolCell(sacredSymbol: SacredSymbol.arcus),
            const SacredSymbolCell(sacredSymbol: SacredSymbol.odium),
            const SacredSymbolCell(sacredSymbol: SacredSymbol.shangrila),
            const SacredSymbolCell(sacredSymbol: SacredSymbol.arteria),
            const SacredSymbolCell(sacredSymbol: SacredSymbol.carcion),          
          ]
        ),
      ),
    );
  }
}

class ArcaneSymbolCell extends StatelessWidget {
  final ArcaneSymbol arcaneSymbol;

  const ArcaneSymbolCell(
    {
      required this.arcaneSymbol,
      super.key
    }
  );

  @override
  Widget build(BuildContext context){
    return Container(
      padding: const EdgeInsets.all(2.5),
      child: Row(
        children: <Widget>[
          Container(
            height: 37,
            width: 220,
            clipBehavior: Clip.hardEdge,
            padding: const EdgeInsets.symmetric(horizontal: 5),
            decoration: BoxDecoration(
              color: statColor,
              border: Border.all(
                color: statColor
              ),
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(10),
                bottomLeft: Radius.circular(10),
              ),
            ),
            child: Center(
              child: Text(arcaneSymbol.formattedName)
              // child: _getStatTooltip(arcaneSymbol)
            )
          ),
          Container(
            height: 37,
            width: 220,
            clipBehavior: Clip.hardEdge,
            padding: const EdgeInsets.symmetric(horizontal: 5),
            decoration: BoxDecoration(
              border: Border.all(
                color: statColor
              ),
              borderRadius: const BorderRadius.only(
                topRight: Radius.circular(10),
                bottomRight: Radius.circular(10),
              ),
            ),
            child: Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ArcaneSymbolButton(
                    arcaneSymbol: arcaneSymbol, 
                    isLarge: true,
                    isSubtract: true,
                  ),
                  ArcaneSymbolButton(
                    arcaneSymbol: arcaneSymbol, 
                    isSubtract: true,
                  ),
                  const Spacer(),
                  // _getStatSelector(arcaneSymbol),
                  const Spacer(),
                  ArcaneSymbolButton(
                    arcaneSymbol: arcaneSymbol, 
                  ),
                  ArcaneSymbolButton(
                    arcaneSymbol: arcaneSymbol, 
                    isLarge: true,
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}

class SacredSymbolCell extends StatelessWidget {
  final SacredSymbol sacredSymbol;

  const SacredSymbolCell(
    {
      required this.sacredSymbol,
      super.key
    }
  );

  @override
  Widget build(BuildContext context){
    return Container(
      padding: const EdgeInsets.all(2.5),
      child: Row(
        children: <Widget>[
          Container(
            height: 37,
            width: 220,
            clipBehavior: Clip.hardEdge,
            padding: const EdgeInsets.symmetric(horizontal: 5),
            decoration: BoxDecoration(
              color: statColor,
              border: Border.all(
                color: statColor
              ),
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(10),
                bottomLeft: Radius.circular(10),
              ),
            ),
            child: Center(
              child: Text(sacredSymbol.formattedName),
              // child: _getStatTooltip(sacredSymbol)
            )
          ),
          Container(
            height: 37,
            width: 220,
            clipBehavior: Clip.hardEdge,
            padding: const EdgeInsets.symmetric(horizontal: 5),
            decoration: BoxDecoration(
              border: Border.all(
                color: statColor
              ),
              borderRadius: const BorderRadius.only(
                topRight: Radius.circular(10),
                bottomRight: Radius.circular(10),
              ),
            ),
            child: Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  SacredSymbolButton(
                    sacredSymbol: sacredSymbol, 
                    isLarge: true,
                    isSubtract: true,
                  ),
                  SacredSymbolButton(
                    sacredSymbol: sacredSymbol, 
                    isSubtract: true,
                  ),
                  const Spacer(),
                  // _getStatSelector(sacredSymbol),
                  const Spacer(),
                  SacredSymbolButton(
                    sacredSymbol: sacredSymbol, 
                  ),
                  SacredSymbolButton(
                    sacredSymbol: sacredSymbol, 
                    isLarge: true,
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}

class ArcaneSymbolButton extends StatelessWidget {
  final ArcaneSymbol arcaneSymbol;
  final bool isLarge;
  final bool isSubtract;

  const ArcaneSymbolButton(
    {
      required this.arcaneSymbol,
      this.isLarge = false,
      this.isSubtract = false,
      super.key
    }
  );

  void _onHover(BuildContext context){
    context.read<DifferenceCalculatorProvider>().modifyArcaneLevels(isLarge ? 5 : 1, arcaneSymbol, isSubtract);
  }

  @override
  Widget build(BuildContext context) {
    return MapleTooltip(
      tooltipWidgets: [
        Text('${isSubtract ? "Removes": "Adds"} ${isLarge ? 5 : 1} levels ${isSubtract ? "from" : "to"} ${arcaneSymbol.formattedName}'),
        Consumer<DifferenceCalculatorProvider>(
          builder: (context, differenceCalculator, child) => differenceCalculator.differenceWidget
        ),
      ],
      onHoverFunction: _onHover,
      child: IconButton(
        iconSize: 12,
        onPressed: () {
          var traitStatsProvider = context.read<SymbolStatsProvider>();
          var func = isSubtract ? traitStatsProvider.subtractArcaneLevels : traitStatsProvider.addArcaneLevels;
          func(isLarge ? 5 : 1, arcaneSymbol);
        },
        icon: Icon(
          isSubtract ? 
          isLarge ? Icons.keyboard_double_arrow_down : Icons.keyboard_arrow_down : 
          isLarge ? Icons.keyboard_double_arrow_up : Icons.keyboard_arrow_up
        ),
      ),
    );
  }
}

class SacredSymbolButton extends StatelessWidget {
  final SacredSymbol sacredSymbol;
  final bool isLarge;
  final bool isSubtract;

  const SacredSymbolButton(
    {
      required this.sacredSymbol,
      this.isLarge = false,
      this.isSubtract = false,
      super.key
    }
  );

  void _onHover(BuildContext context){
    context.read<DifferenceCalculatorProvider>().modifySacredLevels(isLarge ? 5 : 1, sacredSymbol, isSubtract);
  }

  @override
  Widget build(BuildContext context) {
    return MapleTooltip(
      tooltipWidgets: [
        Text('${isSubtract ? "Removes": "Adds"} ${isLarge ? 5 : 1} levels ${isSubtract ? "from" : "to"} ${sacredSymbol.formattedName}'),
        Consumer<DifferenceCalculatorProvider>(
          builder: (context, differenceCalculator, child) => differenceCalculator.differenceWidget
        ),
      ],
      onHoverFunction: _onHover,
      child: IconButton(
        iconSize: 12,
        onPressed: () {
          var symbolStatsProvider = context.read<SymbolStatsProvider>();
          var func = isSubtract ? symbolStatsProvider.subtractSacredLevels : symbolStatsProvider.addSacredLevels;
          func(isLarge ? 5 : 1, sacredSymbol);
        },
        icon: Icon(
          isSubtract ? 
          isLarge ? Icons.keyboard_double_arrow_down : Icons.keyboard_arrow_down : 
          isLarge ? Icons.keyboard_double_arrow_up : Icons.keyboard_arrow_up
        ),
      ),
    );
  }
}

Selector _getStatSelector(TraitName traitName) {
  return Selector<TraitStatsProvider, int>(
    selector: (_, traitStatsProvider) => traitStatsProvider.traitLevels[traitName]!,
    builder: (context, data, child) {
      return Text('$data');
    }
  );
}

MapleTooltip _getStatTooltip(TraitName traitName) {

  void onHover(BuildContext context) {
    context.read<TraitStatsProvider>().getHoverTooltipText(traitName);
  }

  return MapleTooltip(
    tooltipTitle: traitName.formattedName,
    tooltipWidgets: [
      Selector<TraitStatsProvider, Widget>(
        selector: (_, traitStatsProvider) => traitStatsProvider.hoverTooltip,
        builder: (context, data, child) {
          return data;
        }
      )
    ],
    onHoverFunction: onHover,
    label: traitName.formattedName,
  );
}