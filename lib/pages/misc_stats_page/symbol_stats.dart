import 'package:flutter/material.dart';
import 'package:maplestory_builder/constants/character/symbols_stats.dart';
import 'package:maplestory_builder/constants/constants.dart';
import 'package:maplestory_builder/modules/utilities/widgets.dart';
import 'package:maplestory_builder/providers/difference_provider.dart';
import 'package:maplestory_builder/providers/character/symbol_stats_provider.dart';
import 'package:provider/provider.dart';

class ArcaneSymbolTable extends StatelessWidget {
  const ArcaneSymbolTable({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 463,
      height: 298,
      padding: const EdgeInsets.all(5),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "Arcane Symbols",
            style: Theme.of(context).textTheme.headlineMedium
          ),
          const _ArcaneSymbolCell(arcaneSymbol: ArcaneSymbol.vanishingJourney),
          const _ArcaneSymbolCell(arcaneSymbol: ArcaneSymbol.chuchuIsland),
          const _ArcaneSymbolCell(arcaneSymbol: ArcaneSymbol.lachelein),
          const _ArcaneSymbolCell(arcaneSymbol: ArcaneSymbol.arcana),
          const _ArcaneSymbolCell(arcaneSymbol: ArcaneSymbol.morass),
          const _ArcaneSymbolCell(arcaneSymbol: ArcaneSymbol.esfera),          
        ]
      ),
    );
  }
}

class SacredSymbolTable extends StatelessWidget {
  const SacredSymbolTable({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 463,
      height: 298,
      padding: const EdgeInsets.all(5),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "Sacred Symbols",
            style: Theme.of(context).textTheme.headlineMedium
          ),
          const _SacredSymbolCell(sacredSymbol: SacredSymbol.cernium),
          const _SacredSymbolCell(sacredSymbol: SacredSymbol.arcus),
          const _SacredSymbolCell(sacredSymbol: SacredSymbol.odium),
          const _SacredSymbolCell(sacredSymbol: SacredSymbol.shangrila),
          const _SacredSymbolCell(sacredSymbol: SacredSymbol.arteria),
          const _SacredSymbolCell(sacredSymbol: SacredSymbol.carcion),          
        ]
      ),
    );
  }
}

class _ArcaneSymbolCell extends StatelessWidget {
  final ArcaneSymbol arcaneSymbol;

  const _ArcaneSymbolCell({
    required this.arcaneSymbol,
  });

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
              child: _getStatTooltip(arcaneSymbol: arcaneSymbol)
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
                  _ArcaneSymbolButton(
                    arcaneSymbol: arcaneSymbol, 
                    isLarge: true,
                    isSubtract: true,
                  ),
                  _ArcaneSymbolButton(
                    arcaneSymbol: arcaneSymbol, 
                    isSubtract: true,
                  ),
                  const Spacer(),
                  Selector<SymbolStatsProvider, int>(
                    selector: (_, symbolStatsProvider) => symbolStatsProvider.arcaneSymbolLevels[arcaneSymbol]!,
                    builder: (context, data, child) {
                      return Text('$data');
                    }
                  ),
                  const Spacer(),
                  _ArcaneSymbolButton(
                    arcaneSymbol: arcaneSymbol, 
                  ),
                  _ArcaneSymbolButton(
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

class _SacredSymbolCell extends StatelessWidget {
  final SacredSymbol sacredSymbol;

  const _SacredSymbolCell({
    required this.sacredSymbol,
  });

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
              child: _getStatTooltip(sacredSymbol: sacredSymbol)
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
                  _SacredSymbolButton(
                    sacredSymbol: sacredSymbol, 
                    isLarge: true,
                    isSubtract: true,
                  ),
                  _SacredSymbolButton(
                    sacredSymbol: sacredSymbol, 
                    isSubtract: true,
                  ),
                  const Spacer(),
                  Selector<SymbolStatsProvider, int>(
                    selector: (_, symbolStatsProvider) => symbolStatsProvider.sacredSymbolLevels[sacredSymbol]!,
                    builder: (context, data, child) {
                      return Text('$data');
                    }
                  ),
                  const Spacer(),
                  _SacredSymbolButton(
                    sacredSymbol: sacredSymbol, 
                  ),
                  _SacredSymbolButton(
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

class _ArcaneSymbolButton extends StatelessWidget {
  final ArcaneSymbol arcaneSymbol;
  final bool isLarge;
  final bool isSubtract;

  const _ArcaneSymbolButton({
    required this.arcaneSymbol,
    this.isLarge = false,
    this.isSubtract = false,
  });

  void _onHover(BuildContext context){
    context.read<DifferenceCalculatorProvider>().modifyArcaneLevels(isLarge ? 5 : 1, arcaneSymbol, isSubtract);
  }

  @override
  Widget build(BuildContext context) {
    return MapleTooltip(
      tooltipWidgets: [
        Text('${isSubtract ? "Removes": "Adds"} ${isLarge ? 5 : 1} levels ${isSubtract ? "from" : "to"} ${arcaneSymbol.formattedName}'),
        Selector<DifferenceCalculatorProvider, Widget>(
          selector: (_, differenceCalculatorProvider) => differenceCalculatorProvider.differenceWidget,
          builder: (context, widget, child) {
            return widget;
          }
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

class _SacredSymbolButton extends StatelessWidget {
  final SacredSymbol sacredSymbol;
  final bool isLarge;
  final bool isSubtract;

  const _SacredSymbolButton({
    required this.sacredSymbol,
    this.isLarge = false,
    this.isSubtract = false,
  });

  void _onHover(BuildContext context){
    context.read<DifferenceCalculatorProvider>().modifySacredLevels(isLarge ? 5 : 1, sacredSymbol, isSubtract);
  }

  @override
  Widget build(BuildContext context) {
    return MapleTooltip(
      tooltipWidgets: [
        Text('${isSubtract ? "Removes": "Adds"} ${isLarge ? 5 : 1} levels ${isSubtract ? "from" : "to"} ${sacredSymbol.formattedName}'),
        Selector<DifferenceCalculatorProvider, Widget>(
          selector: (_, differenceCalculatorProvider) => differenceCalculatorProvider.differenceWidget,
          builder: (context, widget, child) {
            return widget;
          }
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

MapleTooltip _getStatTooltip({ArcaneSymbol? arcaneSymbol, SacredSymbol? sacredSymbol}) {

  void onHover(BuildContext context) {
    context.read<SymbolStatsProvider>().getHoverTooltipText(arcaneSymbol: arcaneSymbol, sacredSymbol: sacredSymbol);
  }

  return MapleTooltip(
    tooltipTitle: arcaneSymbol?.formattedName ?? sacredSymbol?.formattedName ?? '',
    tooltipWidgets: [
      Selector<SymbolStatsProvider, Widget>(
        selector: (_, symbolStatsProvider) => symbolStatsProvider.hoverTooltip,
        builder: (context, data, child) {
          return data;
        }
      )
    ],
    onHoverFunction: onHover,
    label: arcaneSymbol?.formattedName ?? sacredSymbol?.formattedName,
  );
}