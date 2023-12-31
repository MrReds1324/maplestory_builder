import 'package:flutter/material.dart';
import 'package:maplestory_builder/constants/character/inner_ability_stats.dart';
import 'package:maplestory_builder/constants/constants.dart';
import 'package:maplestory_builder/modules/utilities/widgets.dart';
import 'package:maplestory_builder/providers/difference_provider.dart';
import 'package:maplestory_builder/providers/character/inner_ability_provider.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:provider/provider.dart';

class InnerAbilityStatsTable extends StatelessWidget {
  const InnerAbilityStatsTable({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 463,
      height: 193,
      padding: const EdgeInsets.all(5),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "Inner Ability",
            style: Theme.of(context).textTheme.headlineMedium
          ),
          SetSelectButtonRow<InnerAbilityProvider>(
            onHoverFunction: context.read<DifferenceCalculatorProvider>().compareInnerAbilitySets,
            onPressed: (int setPosition) => context.read<InnerAbilityProvider>().changeActiveSet(setPosition),
            selectorFunction: (BuildContext context, InnerAbilityProvider innerAbilityProvider) => innerAbilityProvider.activeSetNumber,
          ),
          const _InnerAbilityCell(innerAbilityPosition: 1),
          const _InnerAbilityCell(innerAbilityPosition: 2),
          const _InnerAbilityCell(innerAbilityPosition: 3),         
        ]
      ),
    );
  }
}

class _InnerAbilityCell extends StatelessWidget {
  final int innerAbilityPosition;

  const _InnerAbilityCell({
    required this.innerAbilityPosition,
  });

  @override
  Widget build(BuildContext context){
    return Container(
      padding: const EdgeInsets.all(2.5),
      child: Row(
        children: <Widget>[
          Consumer<InnerAbilityProvider>(
            builder: (context, innerAbilityProvider, child) {
              var selectedInnerAbilityLine = innerAbilityProvider.activeInnerAbility.assignedInnerAbility[innerAbilityPosition]!;
              return Container(
                height: 37,
                width: 220,
                clipBehavior: Clip.hardEdge,
                padding: const EdgeInsets.symmetric(horizontal: 5),
                decoration: BoxDecoration(
                  color: DEFAULT_COLOR,
                  border: Border.all(
                    color: selectedInnerAbilityLine.getRankColor()
                  ),
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(10),
                    bottomLeft: Radius.circular(10),
                  ),
                ),
                child: Center(
                  child: _InnerAbilityDropdown(innerAbilityPosition: innerAbilityPosition)
                )
              );
            }
          ),
          Container(
            height: 37,
            width: 220,
            clipBehavior: Clip.hardEdge,
            padding: const EdgeInsets.symmetric(horizontal: 5),
            decoration: BoxDecoration(
              border: Border.all(
                color: DEFAULT_COLOR
              ),
              borderRadius: const BorderRadius.only(
                topRight: Radius.circular(10),
                bottomRight: Radius.circular(10),
              ),
            ),
            child: Center(
              child: Consumer<InnerAbilityProvider>(
                builder: (_, innerAbilityProvider, __) {
                  var activeInnerAbilityLine = innerAbilityProvider.activeInnerAbility.assignedInnerAbility[innerAbilityPosition];

                  return Slider(
                    value: activeInnerAbilityLine?.selectedRange.toDouble() ?? 0,
                    max: activeInnerAbilityLine?.innerAbility?.getStatValueSliderLength() ?? 0,
                    divisions: activeInnerAbilityLine?.innerAbility?.statValues.length ?? 1,
                    label: activeInnerAbilityLine?.getSliderLabel(),
                    onChanged: (double newValue) {
                      innerAbilityProvider.updateInnerAbilityValue(innerAbilityPosition, newValue.toInt());
                    },
                  );
                }
              ),
            ),
          )
        ],
      ),
    );
  }
}

class _InnerAbilityDropdown extends StatelessWidget {
  final int innerAbilityPosition;

  const _InnerAbilityDropdown({
    required this.innerAbilityPosition,
  });

  List<DropdownMenuItem> getDropDownInnerAbilityList(BuildContext context) {
    List<DropdownMenuItem<InnerAbility>> dropdownItems = [
      // Always add a default null selector to the list
      DropdownMenuItem(
        value: null,
        child: Text(
          'None',
          style: Theme.of(context).textTheme.bodyMedium
        ),
      )
    ];

    var activeInnerAbility = context.read<InnerAbilityProvider>().activeInnerAbility;
    var assignedInnerAbilities = activeInnerAbility.assignedInnerAbility;

    List<InnerAbility> filteredList = <InnerAbility>[];
    // We can only have one of the unique inner ability type, filter out any ones already used here
    for(InnerAbility innerAbility in InnerAbility.values) { 
      // Stops us from being able to select multiple of a single "unique" inner ability
      if (innerAbility.isUnique) {
        if (innerAbilityPosition != 1 && innerAbility == assignedInnerAbilities[1]?.innerAbility) {
          continue;
        }
        else if (innerAbilityPosition != 2 && innerAbility == assignedInnerAbilities[2]?.innerAbility) {
          continue;
        }
        else if (innerAbilityPosition != 3 && innerAbility == assignedInnerAbilities[3]?.innerAbility) {
          continue;
        }
      }
      filteredList.add(innerAbility);
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

  void _onHover(BuildContext context) {
    context.read<InnerAbilityProvider>().getHoverTooltipText(innerAbilityPosition);
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 200,
      child: Consumer<InnerAbilityProvider>(
        builder: (context, innerAbilityProvider, child) {
          var selectedInnerAbilityLine = innerAbilityProvider.activeInnerAbility.assignedInnerAbility[innerAbilityPosition]!;
          return MapleTooltip(
            tooltipWidgets: [
              Selector<InnerAbilityProvider, Widget>(
                selector: (_, innerAbilityProvider) => innerAbilityProvider.hoverTooltip,
                builder: (context, data, child) {
                  return data;
                }
              )
            ],
            onHoverFunction: _onHover,
            tooltipTitle: selectedInnerAbilityLine.innerAbility?.formattedName ?? 'None',
            child: Row(
              children: [
                SizedBox(
                  width: 176,
                  child: DropdownButton(
                    alignment: AlignmentDirectional.center,
                    isDense: true,
                    isExpanded: true,
                    value: selectedInnerAbilityLine.innerAbility,
                    onChanged: (newValue) {
                      innerAbilityProvider.updateInnerAbility(innerAbilityPosition, newValue);
                    },
                    items: getDropDownInnerAbilityList(context)
                  ),
                ),
                Icon(
                  MdiIcons.creation,
                  color: selectedInnerAbilityLine.getRankColor(),
                )
              ]
            ),
          );
        }
      ),
    );
  }
}
