import 'package:flutter/material.dart';
import 'package:maplestory_builder/constants/constants.dart';
import 'package:maplestory_builder/modules/hexa_stats.dart/hexa_stat.dart';
import 'package:maplestory_builder/modules/utilities/utilities.dart';
import 'package:maplestory_builder/modules/utilities/widgets.dart';
import 'package:maplestory_builder/pages/hexa_stats_page/editing_hexa_stats.dart';
import 'package:maplestory_builder/providers/difference_provider.dart';
import 'package:maplestory_builder/providers/hexa_stats/hexa_stat_editing_provider.dart';
import 'package:maplestory_builder/providers/hexa_stats/hexa_stats_provider.dart';
import 'package:provider/provider.dart';

class HexaStatsPage extends StatelessWidget {

  const HexaStatsPage(
    {
      super.key
    }
  );

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(
          color: statColor
        ),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: const Row(
        children: [
          _EquippedHexaStats(),
          SizedBox(width: 10),
          _HexaStatInventory(),
          SizedBox(width: 10),
          Expanded(
            child: HexaStatBuilder(),
          ),
        ],
      ),
    );
  }
}

class _EquippedHexaStats extends StatelessWidget {

  const _EquippedHexaStats();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          "Equipped Hexa Stats",
          style: Theme.of(context).textTheme.headlineMedium
        ),
        SetSelectButtonRow<HexaStatsProvider>(
          onHoverFunction: context.read<DifferenceCalculatorProvider>().compareHexaStatSets,
          onPressed: (int setPosition) => context.read<HexaStatsProvider>().changeActiveSet(setPosition),
          selectorFunction: (BuildContext context, HexaStatsProvider hexaStatsProvider) => hexaStatsProvider.activeHexaStatsSetNumber,
        ),      
        const _HexaStatSelector(
          hexaStatPosition: 1,
        ),
        const _HexaStatSelector(
          hexaStatPosition: 2,
        ),
        const _HexaStatSelector(
          hexaStatPosition: 3,
        ),
        const _HexaStatSelector(
          hexaStatPosition: 4,
        ),
        const _HexaStatSelector(
          hexaStatPosition: 5,
        ),
        const _HexaStatSelector(
          hexaStatPosition: 6,
        ),
        const _HexaStatStatsListView(),
      ],
    );
  }
}


class _HexaStatSelector extends StatelessWidget {
  final int hexaStatPosition;

  const _HexaStatSelector({
    required this.hexaStatPosition,
  });

  List<DropdownMenuItem> getDropdownItemList(BuildContext context, HexaStatsProvider hexaStatsProvider) {
    // Always add a default null selector to the list
    List<DropdownMenuItem<HexaStat>> dropdownItems = [
      DropdownMenuItem(
        value: null,
        child: Text(
          'None',
          style: Theme.of(context).textTheme.bodyMedium
        ),
      )
    ];

    List<HexaStat> filteredList = <HexaStat>[];
    var additionalStatCount = hexaStatsProvider.activeHexaStatsSet.additionalStatCount;
    // We can only have one hexa stat of each main type, filter out already used ones here
    hexaStatFilterloop:
    for(HexaStat hexaStat in hexaStatsProvider.allHexaStats.values) { 
      // Stops us from being able to select multiple of a single hexa stat
      for (MapEntry<int, int?> equippedHexaStat in hexaStatsProvider.activeHexaStatsSet.equippedHexaStat.entries) {
        if (equippedHexaStat.key == hexaStatPosition) {
          continue;
        }
        else if (hexaStat.hexaStatId == equippedHexaStat.value) {
          continue hexaStatFilterloop;
        }
        else if (hexaStat.selectedStats[1] == hexaStatsProvider.allHexaStats[equippedHexaStat.value]?.selectedStats[1]) {
          continue hexaStatFilterloop;
        }
        else if ((additionalStatCount[hexaStat.selectedStats[2]]?.$1 == 2 && !(additionalStatCount[hexaStat.selectedStats[2]]?.$2.contains(hexaStatPosition) ?? true)) 
          || (additionalStatCount[hexaStat.selectedStats[3]]?.$1 == 2 && !(additionalStatCount[hexaStat.selectedStats[3]]?.$2.contains(hexaStatPosition) ?? true))
          ) {
          continue hexaStatFilterloop;
        }
      }
      
      filteredList.add(hexaStat);
    }

    dropdownItems.addAll(
      filteredList.map((value) {
        return DropdownMenuItem(
          value: value,
          child: MapleTooltip(
            tooltipWidgets: [value.createHexaStatContainer(context)],
            child: Text(
              "${value.hexaStatName} (${value.selectedStats[1]?.formattedName ?? 'None'} lvl ${value.totalStatLevel}/20)",
              style: Theme.of(context).textTheme.bodyMedium
            ),
          ),
        );
      }).toList()
    );

    return dropdownItems;
  }

  HexaStat? getSelectedHexaStat(HexaStatsProvider hexaStatsProvider) {
    return hexaStatsProvider.activeHexaStatsSet.getSelectedHexaStat(hexaStatPosition);
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        SizedBox(
          width: 70,
          child: Text("Hexa Stat $hexaStatPosition"),
        ),
        SizedBox(
          width: 230,
          child: Consumer<HexaStatsProvider>(
            builder: (context, hexaStatsProvider, child) {
              return DropdownButton(
                alignment: AlignmentDirectional.center,
                isDense: true,
                isExpanded: true,
                value: getSelectedHexaStat(hexaStatsProvider),
                onChanged: (newValue) {
                  hexaStatsProvider.equipHexaStat(newValue, hexaStatPosition);
                },
                items: getDropdownItemList(context, hexaStatsProvider)
              );
            }
          ),
        ),
      ],
    );
  }
}

class _HexaStatInventory extends StatelessWidget {

  const _HexaStatInventory();

 Function _curriedOnHover(HexaStat hexaStat) {
    return (BuildContext context) {
      return context.read<DifferenceCalculatorProvider>().compareHexaStat(context, hexaStat);
    };
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(bottom: 5),
      child: Column(
        children: <Widget>[
          Container(
            padding: const EdgeInsets.only(bottom: 5),
            child: Text(
              "Hexa Stat Inventory",
              style: Theme.of(context).textTheme.headlineMedium
            ),
          ),
          Expanded(
            child: Container(
              height: 700,
              width: 425,
              decoration: BoxDecoration(
                border: Border.all(color: statColor),
                borderRadius: const BorderRadius.all(Radius.circular(10))
              ),
              child: Consumer<HexaStatsProvider>(
                builder: (context, hexaStatsprovider, child) {
                  var allHexaStatList = hexaStatsprovider.allHexaStats.values.toList();
                  return ListView.builder(
                    itemCount: hexaStatsprovider.allHexaStats.length,
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      return MapleTooltip(
                        onHoverFunction: _curriedOnHover(allHexaStatList[index]),
                        tooltipWidgets: [
                          allHexaStatList[index].createHexaStatContainer(context),
                          Selector<DifferenceCalculatorProvider, Widget>(
                            selector: (_, differenceCalculatorProvider) => differenceCalculatorProvider.differenceWidget,
                            builder: (context, widget, child) {
                              return widget;
                            }
                          ),
                        ],
                        child: ListTile(
                          title: Row(
                            children: [
                              Container(
                                constraints: const BoxConstraints(maxWidth: 260),
                                child: Text("${allHexaStatList[index].hexaStatName} (${allHexaStatList[index].selectedStats[1]?.formattedName ?? 'None'} lvl ${allHexaStatList[index].totalStatLevel}/20)"),
                              ),
                              const Spacer(),
                              TextButton(
                                onPressed: () => hexaStatsprovider.deleteHexaStat(allHexaStatList[index]), 
                                child: const Text("Delete")
                              ),
                              TextButton(
                                onPressed: () => context.read<HexaStatEditingProvider>().addEditingHexaStat(hexaStat: allHexaStatList[index]), 
                                child: const Text("Edit")
                              ),
                            ]
                          ),
                        ),
                      );
                    },
                  );
                }
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _HexaStatStatsListView extends StatelessWidget {

  const _HexaStatStatsListView();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(bottom: 5),
      child: Column(
        children: <Widget>[
          Text(
            "Hexa Stat Stats",
            style: Theme.of(context).textTheme.headlineMedium
          ),
          Container(
            height: 669,
            width: 300,
            decoration: BoxDecoration(
              border: Border.all(color: statColor),
              borderRadius: const BorderRadius.all(Radius.circular(10))
            ),
            child: Consumer<HexaStatsProvider>(
              builder: (context, hexaStatsProvider, child) {
                var selectedStats = hexaStatsProvider.calculateStats().entries.toList();
                return ListView.builder(
                  padding: const EdgeInsets.only(right: 8),
                  itemCount: selectedStats.length,
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    return ListTile(
                      title: Row(
                        children: [
                          Container(
                            constraints: const BoxConstraints(maxWidth: 150),
                            child: Text(
                              selectedStats[index].key.formattedName,
                              style: Theme.of(context).textTheme.bodyMedium,
                            ),
                          ),
                          const Spacer(),
                          Text(
                            "${selectedStats[index].key.isPositive ? '+' : ' -'}${selectedStats[index].key.isPercentage ? doublePercentFormater.format(selectedStats[index].value) : selectedStats[index].value}",
                            style: Theme.of(context).textTheme.bodyMedium
                          ) 
                        ]
                      ),
                    );
                  },
                );
              }
            ),
          ),
        ],
      ),
    );
  }
}
