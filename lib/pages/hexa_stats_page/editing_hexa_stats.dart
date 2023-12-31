
import 'package:flutter/material.dart';
import 'package:maplestory_builder/constants/constants.dart';
import 'package:maplestory_builder/constants/hexa_stats/hexa_stats.dart';
import 'package:maplestory_builder/modules/hexa_stats.dart/hexa_stat.dart';
import 'package:maplestory_builder/modules/utilities/widgets.dart';
import 'package:maplestory_builder/providers/difference_provider.dart';
import 'package:maplestory_builder/providers/hexa_stats/hexa_stat_editing_provider.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:provider/provider.dart';

class HexaStatBuilder extends StatelessWidget {

  const HexaStatBuilder({
    super.key
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 5),
        decoration: BoxDecoration(
          border: Border.all(color: statColor),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextButton(
                  onPressed: () => context.read<HexaStatEditingProvider>().cancelEditingHexaStat(),
                  child: const Text("Cancel")
                ),
                TextButton(
                  onPressed: () => context.read<HexaStatEditingProvider>().addEditingHexaStat(),
                  child: const Text("New Hexa Stat")
                ),
                TextButton(
                  onPressed: () => context.read<HexaStatEditingProvider>().saveEditingHexaStat(context), 
                  child: const Text("Save")
                ),
              ],
            ),
            const _HexaStatBuilderContent()
          ]
        ),
      ),
    );
  }
}

class _HexaStatBuilderContent extends StatelessWidget {

  const _HexaStatBuilderContent();

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: 323,
            padding: const EdgeInsets.symmetric(horizontal: 5),
            child: Column(
              children: [
                Container(
                  padding: const EdgeInsets.only(bottom: 5),
                  child: Text(
                    "Editing Hexa Stat",
                    style: Theme.of(context).textTheme.headlineMedium
                  ),
                ),
                Consumer<HexaStatEditingProvider>(
                  builder: (_, hexaStatEditingProvider, __) {
                    return hexaStatEditingProvider.editingHexaStat?.createHexaStatContainer(context) 
                    ?? Container(
                      width: 300,
                      padding: const EdgeInsets.all(2.5),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Center(
                            child: Text(
                              "-No Hexa Stat-", 
                              style: Theme.of(context).textTheme.headlineSmall,
                            )
                          ),
                          Center(
                            child: Icon(
                              MdiIcons.hexagonSlice6,
                              size: 100,
                              color: missingColor,
                            ),
                          ),
                        ],
                      ),
                    );
                  }
                ),
                const _HexaStatNameInput(),
                const _HexaStatInput(),  
              ],
            ),
          ),
          const Expanded(
            child: _HexaStatComparisonWidget()
          ),
        ]
      ),
    );
  }
}

class _HexaStatComparisonWidget extends StatelessWidget {
  const _HexaStatComparisonWidget();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.only(bottom: 5),
          child: Text(
            "Difference",
            style: Theme.of(context).textTheme.headlineMedium
          ),
        ),
        Expanded(
          child: Container(
            padding: const EdgeInsets.only(bottom: 5),
            child: Container(
              width: 320,
              decoration: BoxDecoration(
                border: Border.all(color: statColor),
                borderRadius: const BorderRadius.all(Radius.circular(10))
              ),
              padding: const EdgeInsets.only(right: 5, left: 18, top: 5, bottom: 5),
              child: SingleChildScrollView(
                padding: const EdgeInsets.only(right: 13),
                child: Consumer2<HexaStatEditingProvider, DifferenceCalculatorProvider>(
                  builder: (_, hexaStatEditingProvider, differenceCalculatorProvider, __) {
                    return differenceCalculatorProvider.compareEditingHexaStat(context) 
                    ?? 
                    const Text(
                      "NOT CURRENTLY EDITING HEXA STAT",
                      style: TextStyle(color: Colors.red),
                      textAlign: TextAlign.center,
                    );
                  }
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class _HexaStatInput extends StatelessWidget {

  const _HexaStatInput();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          "Hexa Stat Lines",
          style: Theme.of(context).textTheme.bodyLarge?.copyWith(decoration: TextDecoration.underline)
        ),
        const Column(
          children: [
            _HexaStatStatCell(statPosition: 1),
            SizedBox(height: 5),
            _HexaStatStatCell(statPosition: 2),
            SizedBox(height: 5),
            _HexaStatStatCell(statPosition: 3)
          ]
        ),
      ]
    );
  }
}

class _HexaStatStatCell extends StatelessWidget {
  final int statPosition;

  const _HexaStatStatCell({
    required this.statPosition,
  });

  @override
  Widget build(BuildContext context){
    return Container(
      padding: const EdgeInsets.all(2.5),
      decoration: BoxDecoration(
        border: Border.all(
          color: statColor
        ),
        borderRadius: const BorderRadius.all(Radius.circular(10)),
      ),
      child: Column(
        children: <Widget>[
          Text(
            "${statPosition == 1 ? 'Main' : 'Additional'} Stat"
          ),
          Container(
            height: 37,
            width: 300,
            padding: const EdgeInsets.symmetric(horizontal: 5),
            child: Center(
              child: _StatTypeDropdown(statPosition: statPosition)
            )
          ),
          Container(
            height: 37,
            width: 150,
            padding: const EdgeInsets.symmetric(horizontal: 5),
            child: Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  _StatLevelButton(
                    statPosition: statPosition,
                    isSubtract: true,
                  ),
                  const Spacer(),
                  Selector<HexaStatEditingProvider, int>(
                    selector: (_, hexaStatEditingProvider) => hexaStatEditingProvider.editingHexaStat?.statLevels[statPosition] ?? 0,
                    builder: (context, data, child) {
                      return Text('$data');
                    }
                  ),
                  const Spacer(),
                  _StatLevelButton(
                    statPosition: statPosition,
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

class _StatTypeDropdown extends StatelessWidget {
  final int statPosition;

  const _StatTypeDropdown({
    required this.statPosition,
  });

  List<DropdownMenuItem<StatType>> getDropDownStatTypeList(BuildContext context, HexaStat? editingHexaStat) {
    List<DropdownMenuItem<StatType>> dropdownItems = [
      // Always add a default null selector to the list
      DropdownMenuItem(
        value: null,
        child: Text(
          'None',
          style: Theme.of(context).textTheme.bodyMedium
        ),
      )
    ];

    List<StatType> filteredList = [];
    // We can only have one of the stat types per hexa stat, filter out any ones already used here
    flameFilterloop:
    for(StatType statType in AVAILABLE_HEXA_STAT_STATS) { 
      // Stops us from being able to select multiple of a single stat type
      for (MapEntry<int, StatType?> editingStatType in (editingHexaStat?.selectedStats.entries ?? {})) {
        if (editingStatType.key == statPosition) {
          continue;
        }
        else if (statType == editingStatType.value) {
          continue flameFilterloop;
        }
      }
      
      filteredList.add(statType);
    }

    dropdownItems.addAll(
      filteredList.map((value) {
        return DropdownMenuItem(
          value: value,
          child: Text(
            value.formattedName,
            style: Theme.of(context).textTheme.bodyMedium
          ),
        );
      }).toList()
    );

    return dropdownItems;
  }

  StatType? _getSelectedStatType(HexaStatEditingProvider hexaStatEditingProvider) {
    return hexaStatEditingProvider.editingHexaStat?.selectedStats[statPosition];
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 300,
      child: Consumer<HexaStatEditingProvider>(
        builder: (context, hexaStatEditingProvider, child) {
          return DropdownButton(
            alignment: AlignmentDirectional.center,
            isDense: true,
            isExpanded: true,
            value: _getSelectedStatType(hexaStatEditingProvider),
            onChanged: hexaStatEditingProvider.isEditing ? (StatType? newValue) {
              hexaStatEditingProvider.updateStatSelection(statPosition, newValue);
            } : null,
            items: getDropDownStatTypeList(context, hexaStatEditingProvider.editingHexaStat)
          );
        }
      ),
    );
  }
}

class _StatLevelButton extends StatelessWidget {
  final int statPosition;
  final bool isSubtract;

  const _StatLevelButton({
    required this.statPosition,
    this.isSubtract = false,
  });

  @override
  Widget build(BuildContext context) {
    return MapleTooltip(
      tooltipWidgets: [
        Text('${isSubtract ? "Removes": "Adds"} 1 Hexa Stat Level'),
      ],
      child: IconButton(
        iconSize: 12,
        onPressed: () {
          var hexaStatEditingProvider = context.read<HexaStatEditingProvider>();
          var func = isSubtract ? hexaStatEditingProvider.subtractHexaStatLevel : hexaStatEditingProvider.addHexaStatLevel;
          func(statPosition);
        },
        icon: Icon(
          isSubtract ? Icons.keyboard_arrow_down : Icons.keyboard_arrow_up
        ),
      ),
    );
  }
}

class _HexaStatNameInput extends StatelessWidget {

  const _HexaStatNameInput();

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text("Hexa Stat Name:"),
        const Spacer(),
        SizedBox(
          width: 215,
          child: 
          Selector<HexaStatEditingProvider, bool>(
            selector: (_, hexaStatEditingProvider) => hexaStatEditingProvider.isEditing,
            builder: (context, isEnabled, child) {
              return TextField(
                style: Theme.of(context).textTheme.bodyMedium,
                enabled: isEnabled,
                controller: context.read<HexaStatEditingProvider>().textController,
                onChanged: (value) => context.read<HexaStatEditingProvider>().updateHexaStatName(value.isNotEmpty ? value : ""),
                decoration: const InputDecoration(
                  isDense: true
                ),
              );
            }
          ),
        )
      ]
    );
  }
}