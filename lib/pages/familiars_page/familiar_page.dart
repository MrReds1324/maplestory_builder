import 'package:flutter/material.dart';
import 'package:maplestory_builder/constants/constants.dart';
import 'package:maplestory_builder/constants/familiars/badge_stats.dart';
import 'package:maplestory_builder/modules/equipment/equips.dart';
import 'package:maplestory_builder/modules/utilities/widgets.dart';
import 'package:maplestory_builder/pages/familiars_page/editing_familiars.dart';
import 'package:maplestory_builder/providers/difference_provider.dart';
import 'package:maplestory_builder/providers/equipment/equips_provider.dart';
import 'package:maplestory_builder/providers/equipment/equip_editing_provider.dart';
import 'package:maplestory_builder/providers/familiars/familiars_provider.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:provider/provider.dart';

class FamiliarPage extends StatelessWidget {

  const FamiliarPage({
    super.key
  });

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
          EquippedItems(),
          SizedBox(width: 10),
          FamiliarInventory(),
          SizedBox(width: 10),
          Expanded(
            child: FamiliarBuilder(),
          ),
        ],
      ),
    );
  }
}

class EquippedItems extends StatelessWidget {

  const EquippedItems(
    {
      super.key
    }
  );

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          "Equipped Badges",
          style: Theme.of(context).textTheme.headlineMedium
        ),
        const Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            BadgeSetSelectButton(badgeSetPosition: 1),
            BadgeSetSelectButton(badgeSetPosition: 2),
            BadgeSetSelectButton(badgeSetPosition: 3),
            BadgeSetSelectButton(badgeSetPosition: 4),
            BadgeSetSelectButton(badgeSetPosition: 5),
          ]
        ),
        const Column(
          children: [
            BadgeSelector(
              badgePosition: 1,
            ),
            BadgeSelector(
              badgePosition: 2,
            ),
            BadgeSelector(
              badgePosition: 3,
            ),
            BadgeSelector(
              badgePosition: 4,
            ),
            BadgeSelector(
              badgePosition: 5,
            ),
            BadgeSelector(
              badgePosition: 6,
            ),
            BadgeSelector(
              badgePosition: 7,
            ),
            BadgeSelector(
              badgePosition: 8,
            ),
          ],
        ),
        Text(
          "Active Familiars",
          style: Theme.of(context).textTheme.headlineMedium
        ),
        const Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            BadgeSetSelectButton(badgeSetPosition: 1),
            BadgeSetSelectButton(badgeSetPosition: 2),
            BadgeSetSelectButton(badgeSetPosition: 3),
            BadgeSetSelectButton(badgeSetPosition: 4),
            BadgeSetSelectButton(badgeSetPosition: 5),
          ]
        ),
        const Column(
          children: [
            BadgeSelector(
              badgePosition: 1,
            ),
            BadgeSelector(
              badgePosition: 2,
            ),
            BadgeSelector(
              badgePosition: 3,
            ),
          ],
        ),
      ],
    );
  }
}


class BadgeSelector extends StatelessWidget {
  final int badgePosition;

  const BadgeSelector(
    {
      required this.badgePosition,
      super.key
    }
  );

  List<DropdownMenuItem> getDropdownItemList(BuildContext context, FamiliarsProvider familiarsProvider) {
    // Always add a default null selector to the list
    List<DropdownMenuItem> dropdownItems = [
      DropdownMenuItem(
        value: null,
        child: Text(
          'None',
          style: Theme.of(context).textTheme.bodyMedium
        ),
      )
    ];

    List<BadgeName> filteredList = <BadgeName>[];
    // We can only have one of badge of each, filter out already used ones here
    badgeFilterloop:
    for(BadgeName badgeName in BadgeName.values) { 
      // Stops us from being able to select multiple of a single badge
      for (MapEntry<int, BadgeName?> editingbadges in familiarsProvider.activeBadgeSet.activebadges.entries) {
        if (editingbadges.key == badgePosition) {
          continue;
        }
        else if (badgeName == editingbadges.value) {
          continue badgeFilterloop;
        }
      }
      
      filteredList.add(badgeName);
    }

    dropdownItems.addAll(
      filteredList.map((value) {
        return DropdownMenuItem(
          value: value,
          child: MapleTooltip(
            tooltipTitle: value.formattedName,
            tooltipWidgets: [value.createBadgeContainer(context)],
            child: Text(
              value.formattedName,
              style: Theme.of(context).textTheme.bodyMedium
            ),
          ),
        );
      }).toList()
    );

    return dropdownItems;
  }

  BadgeName? getSelectedBadge(FamiliarsProvider familiarsProvider) {
    return familiarsProvider.activeBadgeSet.getSelectedBadge(badgePosition);
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        SizedBox(
          width: 75,
          child: Text("Badge $badgePosition"),
        ),
        SizedBox(
          width: 225,
          child: Consumer<FamiliarsProvider>(
            builder: (context, familiarsProvider, child) {
              return DropdownButton(
                alignment: AlignmentDirectional.center,
                isDense: true,
                isExpanded: true,
                value: getSelectedBadge(familiarsProvider),
                onChanged: (newValue) {
                  familiarsProvider.equipBadge(newValue, badgePosition);
                },
                items: getDropdownItemList(context, familiarsProvider)
              );
            }
          ),
        ),
      ],
    );
  }
}


class FamiliarInventory extends StatelessWidget {

  const FamiliarInventory(
    {
      super.key
    }
  );

 Function _curriedOnHover(Equip equip) {
    return (BuildContext context) {
      return context.read<DifferenceCalculatorProvider>().compareEquip(context, equip);
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
              "Familiar Inventory",
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
              child: Consumer<EquipsProvider>(
                builder: (context, equipsProvider, child) {
                  var allEquipsList = equipsProvider.allEquips.values.toList();
                  return ListView.builder(
                    itemCount: equipsProvider.allEquips.length,
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      return MapleTooltip(
                        maxWidth: allEquipsList[index].getTooltipWidth(),
                        onHoverFunction: _curriedOnHover(allEquipsList[index]),
                        tooltipWidgets: [
                          allEquipsList[index].createEquipContainer(context),
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
                              Text(allEquipsList[index].equipName.formattedName),
                              const Spacer(),
                              TextButton(
                                onPressed: () => equipsProvider.deleteEquip(allEquipsList[index]), 
                                child: const Text("Delete")
                              ),
                              TextButton(
                                onPressed: () => context.read<EquipEditingProvider>().addEditingEquip(allEquipsList[index]), 
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

class BadgeSetSelectButton extends StatelessWidget {
  final int badgeSetPosition;

  const BadgeSetSelectButton({
    super.key, 
    required this.badgeSetPosition
  });

  IconData _getIconData() {
    switch(badgeSetPosition) {
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
    context.read<DifferenceCalculatorProvider>().compareEquipSets(context, badgeSetPosition);
  }

  @override
  Widget build(BuildContext context) {
    return MapleTooltip(
      tooltipWidgets: [
        Selector<DifferenceCalculatorProvider, Widget>(
          selector: (_, differenceCalculatorProvider) => differenceCalculatorProvider.differenceWidget,
          builder: (context, widget, child) {
            return widget;
          }
        ),
      ],
      onHoverFunction: _onHover,
      child: IconButton(
        padding: const EdgeInsets.all(1),
        constraints: const BoxConstraints(),
        iconSize: 19,
        onPressed: () => context.read<EquipsProvider>().changeActiveSet(badgeSetPosition), 
        icon: Consumer<EquipsProvider>(
          builder: (_, equipsProvider, __) {
            return Icon(
              _getIconData(),
              color: badgeSetPosition == equipsProvider.activeSetNumber ? starColor : null,
            );
          }
        ),
      )
    );
  }
}