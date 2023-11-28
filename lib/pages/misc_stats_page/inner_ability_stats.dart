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
    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: Container(
        width: 455,
        height: 193,
        padding: const EdgeInsets.all(5),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Inner Ability",
              style: Theme.of(context).textTheme.headlineMedium
            ),
            const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                InnerAbilitySelectButton(innerAbilityPosition: 1),
                InnerAbilitySelectButton(innerAbilityPosition: 2),
                InnerAbilitySelectButton(innerAbilityPosition: 3),
                InnerAbilitySelectButton(innerAbilityPosition: 4),
                InnerAbilitySelectButton(innerAbilityPosition: 5),
              ]
            ),
            const InnerAbilityCell(innerAbilityPosition: 1),
            const InnerAbilityCell(innerAbilityPosition: 2),
            const InnerAbilityCell(innerAbilityPosition: 3),         
          ]
        ),
      ),
    );
  }
}

class InnerAbilityCell extends StatelessWidget {
  final int innerAbilityPosition;

  const InnerAbilityCell(
    {
      required this.innerAbilityPosition,
      super.key
    }
  );

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
                  color: statColor,
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
                color: statColor
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

class InnerAbilitySelectButton extends StatelessWidget {
  final int innerAbilityPosition;

  const InnerAbilitySelectButton({
    super.key, 
    required this.innerAbilityPosition
  });

  IconData _getIconData() {
    switch(innerAbilityPosition) {
      case 1:
        return MdiIcons.numeric1CircleOutline;
      case 2:
        return MdiIcons.numeric2CircleOutline;
      case 3:
        return MdiIcons.numeric3CircleOutline;
      case 4:
        return MdiIcons.numeric4CircleOutline;
      case 5:
        return MdiIcons.numeric5CircleOutline;
      default:
        return MdiIcons.exclamation;
    }
  }

  void _onHover(BuildContext context){
    context.read<DifferenceCalculatorProvider>().compareInnerAbility(context, innerAbilityPosition);
  }

  @override
  Widget build(BuildContext context) {
    return MapleTooltip(
      tooltipWidgets: [
        Consumer<DifferenceCalculatorProvider>(
          builder: (context, differenceCalculator, child) => differenceCalculator.differenceWidget
        ),
      ],
      onHoverFunction: _onHover,
      child: IconButton(
        padding: const EdgeInsets.all(1),
        constraints: const BoxConstraints(),
        iconSize: 19,
        onPressed: () => context.read<InnerAbilityProvider>().changeActiveSet(innerAbilityPosition), 
        icon: Consumer<InnerAbilityProvider>(
          builder: (_, innerAbilityProvider, __) {
            return Icon(
              _getIconData(),
              color: innerAbilityPosition == innerAbilityProvider.activeSetNumber ? starColor : null,
            );
          }
        )
      )
    );
  }
}