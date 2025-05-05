import 'package:flutter/material.dart';
import 'package:maplestory_builder/constants/character/symbols_stats.dart';
import 'package:maplestory_builder/constants/constants.dart';
import 'package:maplestory_builder/modules/utilities/widgets.dart';
import 'package:maplestory_builder/providers/character/symbol_stats_provider.dart';
import 'package:maplestory_builder/providers/difference_provider.dart';
import 'package:provider/provider.dart';

class SymbolTable<T extends Enum> extends StatelessWidget {
  final List<T> enumValues;
  final String tableTitle;

  const SymbolTable(
      {required this.enumValues, required this.tableTitle, super.key});

  List<Widget> generateTable(BuildContext context) {
    List<Widget> returnValue = [
      Text(tableTitle, style: Theme.of(context).textTheme.headlineMedium),
    ];

    for (Enum enumValue in enumValues) {
      returnValue.add(_SymbolCell(symbol: enumValue));
    }

    return returnValue;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 463,
      height: (76 + (37 * enumValues.length)).toDouble(),
      padding: const EdgeInsets.all(5),
      child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: generateTable(context)),
    );
  }
}

class _SymbolCell<T extends Enum> extends StatelessWidget {
  final T symbol;

  const _SymbolCell({
    required this.symbol,
  });

  Widget getAssetImage() {
    if (symbol is ArcaneSymbol) {
      return (symbol as ArcaneSymbol).getAssetImage();
    } else if (symbol is SacredSymbol) {
      return (symbol as SacredSymbol).getAssetImage();
    } else if (symbol is GrandSacredSymbol) {
      return (symbol as GrandSacredSymbol).getAssetImage();
    }
    return const SizedBox.shrink();
  }

  int getSelector(SymbolStatsProvider symbolStatsProvider) {
    if (symbol is ArcaneSymbol) {
      return symbolStatsProvider.arcaneSymbolLevels[symbol]!;
    } else if (symbol is SacredSymbol) {
      return symbolStatsProvider.sacredSymbolLevels[symbol]!;
    } else if (symbol is GrandSacredSymbol) {
      return symbolStatsProvider.grandSacredSymbolLevels[symbol]!;
    }
    return 0;
  }

  @override
  Widget build(BuildContext context) {
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
              color: DEFAULT_COLOR,
              border: Border.all(color: DEFAULT_COLOR),
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(10),
                bottomLeft: Radius.circular(10),
              ),
            ),
            child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
              const SizedBox(width: 30),
              getAssetImage(),
              const SizedBox(width: 15),
              _getStatTooltip(symbol),
              const Spacer()
            ]),
          ),
          Container(
            height: 37,
            width: 220,
            clipBehavior: Clip.hardEdge,
            padding: const EdgeInsets.symmetric(horizontal: 5),
            decoration: BoxDecoration(
              border: Border.all(color: DEFAULT_COLOR),
              borderRadius: const BorderRadius.only(
                topRight: Radius.circular(10),
                bottomRight: Radius.circular(10),
              ),
            ),
            child: Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  _SymbolButton(
                    symbol: symbol,
                    isLarge: true,
                    isSubtract: true,
                  ),
                  _SymbolButton(
                    symbol: symbol,
                    isSubtract: true,
                  ),
                  const Spacer(),
                  Selector<SymbolStatsProvider, int>(
                      selector: (_, symbolStatsProvider) =>
                          getSelector(symbolStatsProvider),
                      builder: (context, data, child) {
                        return Text('$data');
                      }),
                  const Spacer(),
                  _SymbolButton(
                    symbol: symbol,
                  ),
                  _SymbolButton(
                    symbol: symbol,
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

class _SymbolButton<T extends Enum> extends StatelessWidget {
  final T symbol;
  final bool isLarge;
  final bool isSubtract;

  const _SymbolButton({
    required this.symbol,
    this.isLarge = false,
    this.isSubtract = false,
  });

  void _onHover(BuildContext context) {
    context
        .read<DifferenceCalculatorProvider>()
        .modifySymbolLevels(isLarge ? 5 : 1, symbol, isSubtract);
  }

  String getFormattedName() {
    if (symbol is ArcaneSymbol) {
      return (symbol as ArcaneSymbol).formattedName;
    } else if (symbol is SacredSymbol) {
      return (symbol as SacredSymbol).formattedName;
    } else if (symbol is GrandSacredSymbol) {
      return (symbol as GrandSacredSymbol).formattedName;
    }
    return "";
  }

  @override
  Widget build(BuildContext context) {
    return MapleTooltip(
      tooltipWidgets: [
        Text(
            '${isSubtract ? "Removes" : "Adds"} ${isLarge ? 5 : 1} levels ${isSubtract ? "from" : "to"} ${getFormattedName()}'),
        Selector<DifferenceCalculatorProvider, Widget>(
            selector: (_, differenceCalculatorProvider) =>
                differenceCalculatorProvider.differenceWidget,
            builder: (context, widget, child) {
              return widget;
            }),
      ],
      onHoverFunction: _onHover,
      child: IconButton(
        iconSize: 12,
        onPressed: () {
          var traitStatsProvider = context.read<SymbolStatsProvider>();
          var func = isSubtract
              ? traitStatsProvider.subtractSymbolLevels
              : traitStatsProvider.addSymbolLevels;
          func(isLarge ? 5 : 1, symbol);
        },
        icon: Icon(isSubtract
            ? isLarge
                ? Icons.keyboard_double_arrow_down
                : Icons.keyboard_arrow_down
            : isLarge
                ? Icons.keyboard_double_arrow_up
                : Icons.keyboard_arrow_up),
      ),
    );
  }
}

MapleTooltip _getStatTooltip<T extends Enum>(T symbol) {
  void onHover(BuildContext context) {
    context.read<SymbolStatsProvider>().getHoverTooltipText(symbol);
  }

  String formattedName = "";
  if (symbol is ArcaneSymbol) {
    formattedName = symbol.formattedName;
  } else if (symbol is SacredSymbol) {
    formattedName = symbol.formattedName;
  } else if (symbol is GrandSacredSymbol) {
    formattedName = symbol.formattedName;
  }

  return MapleTooltip(
    tooltipTitle: formattedName,
    tooltipWidgets: [
      Selector<SymbolStatsProvider, Widget>(
          selector: (_, symbolStatsProvider) =>
              symbolStatsProvider.hoverTooltip,
          builder: (context, data, child) {
            return data;
          })
    ],
    onHoverFunction: onHover,
    label: formattedName,
  );
}
