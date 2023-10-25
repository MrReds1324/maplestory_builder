import 'package:flutter/material.dart';
import 'package:maplestory_builder/constants/constants.dart';
import 'package:maplestory_builder/modules/equipment/equips.dart';
import 'package:maplestory_builder/modules/utilities/widgets.dart';
import 'package:maplestory_builder/pages/equip_page/editing_equips.dart';
import 'package:maplestory_builder/providers/difference_provider.dart';
import 'package:maplestory_builder/providers/equips_provider.dart';
import 'package:maplestory_builder/providers/equip_editing_provider.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:provider/provider.dart';

class EquipPage extends StatelessWidget {

  const EquipPage(
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
          children: [
            EquippedItems(),
            InventoryAndItemListColumn(),
            Expanded(
              child: EquipBuilder(),
            ),
          ],
        ),
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
      children: [
        Container(
          padding: const EdgeInsets.only(bottom: 5),
          child: Expanded(child: Row(
            children: [
              Text(
                "Equipped Items",
                style: Theme.of(context).textTheme.headlineMedium
              ),
              const EquipSetSelectButton(equipSetPosition: 1),
              const EquipSetSelectButton(equipSetPosition: 2),
              const EquipSetSelectButton(equipSetPosition: 3),
              const EquipSetSelectButton(equipSetPosition: 4),
              const EquipSetSelectButton(equipSetPosition: 5),
            ]
          ),
          ),
        ),
        const Expanded(
          child: SingleChildScrollView(
            padding: EdgeInsets.only(right: 13),
            child: Column(
              children: [
                // Totems
                EquippedItemSelector(
                  equipType: EquipType.totem,
                  equipPosition: 1,
                ),
                EquippedItemSelector(
                  equipType: EquipType.totem,
                  equipPosition: 2,
                ),
                EquippedItemSelector(
                  equipType: EquipType.totem,
                  equipPosition: 3,
                ),
                // Rings
                EquippedItemSelector(
                  equipType: EquipType.ring,
                  equipPosition: 1,
                ),
                EquippedItemSelector(
                  equipType: EquipType.ring,
                  equipPosition: 2,
                ),
                EquippedItemSelector(
                  equipType: EquipType.ring,
                  equipPosition: 3,
                ),
                EquippedItemSelector(
                  equipType: EquipType.ring,
                  equipPosition: 4,
                ),
                EquippedItemSelector(
                  equipType: EquipType.ozRing,
                ),
                // Pocket
                EquippedItemSelector(
                  equipType: EquipType.pocket,
                ),
                // Pendant
                EquippedItemSelector(
                  equipType: EquipType.pendant,
                  equipPosition: 1,
                ),
                EquippedItemSelector(
                  equipType: EquipType.pendant,
                  equipPosition: 2,
                ),
                // Weapon
                EquippedItemSelector(
                  equipType: EquipType.weapon,
                ),
                // Belt
                EquippedItemSelector(
                  equipType: EquipType.belt,
                ),
                // Hat
                EquippedItemSelector(
                  equipType: EquipType.hat,
                ),
                // Face
                EquippedItemSelector(
                  equipType: EquipType.face,
                ),
                // Eye
                EquippedItemSelector(
                  equipType: EquipType.eye,
                ),
                // Overall
                EquippedItemSelector(
                  equipType: EquipType.overall,
                ),
                // Top
                EquippedItemSelector(
                  equipType: EquipType.top,
                ),
                // Bottom
                EquippedItemSelector(
                  equipType: EquipType.bottom,
                ),
                // Shoes
                EquippedItemSelector(
                  equipType: EquipType.shoes,
                ),
                // Earrings
                EquippedItemSelector(
                  equipType: EquipType.earrings,
                ),
                // Shoulder
                EquippedItemSelector(
                  equipType: EquipType.shoulder,
                ),
                // Gloves
                EquippedItemSelector(
                  equipType: EquipType.gloves,
                ),
                // Emblem
                EquippedItemSelector(
                  equipType: EquipType.emblem,
                ),
                // Badge
                EquippedItemSelector(
                  equipType: EquipType.badge,
                ),
                // Medal
                EquippedItemSelector(
                  equipType: EquipType.medal,
                ),
                // Secondary
                EquippedItemSelector(
                  equipType: EquipType.secondary,
                ),
                // Cape
                EquippedItemSelector(
                  equipType: EquipType.cape,
                ),
                // Heart
                EquippedItemSelector(
                  equipType: EquipType.heart,
                ),
                // Title
                EquippedItemSelector(
                  equipType: EquipType.title,
                ),
                // Pets and Pet Equips
                EquippedItemSelector(
                  equipType: EquipType.pet,
                  equipPosition: 1,
                ),
                EquippedItemSelector(
                  equipType: EquipType.pet,
                  equipPosition: 2,
                ),
                EquippedItemSelector(
                  equipType: EquipType.pet,
                  equipPosition: 3,
                ),
                EquippedItemSelector(
                  equipType: EquipType.petEquip,
                  equipPosition: 1,
                ),
                EquippedItemSelector(
                  equipType: EquipType.petEquip,
                  equipPosition: 2,
                ),
                EquippedItemSelector(
                  equipType: EquipType.petEquip,
                  equipPosition: 3,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}


class EquippedItemSelector extends StatelessWidget {
  final EquipType equipType;
  final int equipPosition;

  const EquippedItemSelector(
    {
      required this.equipType,
      this.equipPosition = 0,
      super.key
    }
  );

  List<DropdownMenuItem> getDropdownItemList(BuildContext context, EquipsProvider equipsProvider, EquipType equipType) {
    var filteredList = equipsProvider.allEquips.values.where((element) {
      if (equipType == EquipType.secondary) {
        return secondaryTypes.contains(element.equipName.equipType);
      }
      else {
        return element.equipName.equipType == equipType;
      }
    }).toList();

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

    dropdownItems.addAll(
      filteredList.map((value) {
        return DropdownMenuItem(
          value: value,
          child: MapleTooltip(
            maxWidth: value.getTooltipWidth(),
            tooltipWidgets: [value.createEquipContainer(context)],
            child: Text(
              value.equipName.formattedName,
              style: Theme.of(context).textTheme.bodyMedium
            ),
          ),
        );
      }).toList()
    );

    return dropdownItems;
  }

  Equip? getSelectedEquip(EquipsProvider equipsProvider, EquipType equipType, int equipPosition) {
    return equipsProvider.activeEquipSet.getSelectedEquip(equipType, equipPosition: equipPosition);
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        SizedBox(
          width: 75,
          child: Text("${equipType.formattedName.toUpperCase()} ${equipPosition > 0 ? equipPosition : ''}"),
        ),
        SizedBox(
          width: 225,
          child: Consumer<EquipsProvider>(
            builder: (context, equipsProvider, child) {
              return DropdownButton(
                alignment: AlignmentDirectional.center,
                isDense: true,
                isExpanded: true,
                value: getSelectedEquip(equipsProvider, equipType, equipPosition),
                onChanged: (newValue) {
                  equipsProvider.equipEquip(newValue, equipType, equipPosition: equipPosition);
                },
                items: getDropdownItemList(context, equipsProvider, equipType)
              );
            }
          ),
        ),
      ],
    );
  }
}


class InventoryAndItemListColumn extends StatelessWidget {

  const InventoryAndItemListColumn(
    {
      super.key
    }
  );

  @override
  Widget build(BuildContext context){
    return const SizedBox(
      child: SingleChildScrollView(
        padding: EdgeInsets.only(right: 13),
        child: Column(
          children: [
            InventoryItems(),
            SearchableItemList(),
          ],
        ),
      ),
    );
  }
}

class InventoryItems extends StatelessWidget {

  const InventoryItems({
    super.key
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 425,
      height: 500,
      child: Column(
        children: <Widget>[
          Container(
            padding: const EdgeInsets.only(bottom: 5),
            child: Text(
              "Inventory",
              style: Theme.of(context).textTheme.headlineMedium
            ),
          ),
          Expanded(
            child: Container(
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
                        tooltipWidgets: [allEquipsList[index].createEquipContainer(context)],
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
      )
    );
  }
}

class SearchableItemList extends StatefulWidget {
  
  const SearchableItemList(
    {
      super.key
    }
  );

  @override
  State<SearchableItemList> createState() => _SearchableItemListState();
}

class _SearchableItemListState extends State<SearchableItemList> {
  TextEditingController editingController = TextEditingController();
  var items = <Equip>[];
  var stringQuery = '';
  final ValueNotifier<EquipType> selectedEquipType = ValueNotifier<EquipType>(EquipType.all);
  final ValueNotifier<ClassType> selectedClassType = ValueNotifier<ClassType>(ClassType.all);

  @override
  void initState() {
    items = equipList;
    selectedEquipType.addListener(filterSearchResultsEquip);
    selectedClassType.addListener(filterSearchResultsEquip);
    stringQuery = '';
    super.initState();
  }

  void filterSearchResultsEquip() {
    setState(() {
      var tempItems = equipList;

      if (selectedClassType.value != ClassType.all) {
        tempItems = tempItems.where((element) => element.equipName.classType == ClassType.all || element.equipName.classType == selectedClassType.value).toList();
      }

      if (selectedEquipType.value != EquipType.all) {
        tempItems = tempItems.where((element) => element.equipName.equipType == selectedEquipType.value).toList();
      }

      items = stringQuery.isEmpty ? tempItems : tempItems.where((element) => 
        element.equipName.formattedName.toLowerCase().contains(stringQuery.toLowerCase())
      ).toList();
    });
  }

  void filterSearchResultsText(String query) {
    setState(() {
      stringQuery = query;
      var tempItems = equipList;
      
      if (selectedClassType.value != ClassType.all) {
        tempItems = tempItems.where((element) => element.equipName.classType == ClassType.all || element.equipName.classType == selectedClassType.value).toList();
      }

      if (selectedEquipType.value != EquipType.all) {
        tempItems = tempItems.where((element) => element.equipName.equipType == selectedEquipType.value).toList();
      }

      items = stringQuery.isEmpty ? tempItems : tempItems.where((element) => 
        element.equipName.formattedName.toLowerCase().contains(stringQuery.toLowerCase())
      ).toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 425,
      height: 411,
      padding: const EdgeInsets.only(bottom: 5),
      child: Column(
        children: <Widget>[
          Text(
            "All Items",
            style: Theme.of(context).textTheme.headlineMedium
          ),
          Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    "Equip Type:",
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                  DropDownSelector(
                    selectedValue: selectedEquipType,
                    menuItems: EquipType.values.map((equipType) {
                      return DropdownMenuItem(
                        value: equipType,
                        child: Text(equipType.formattedName),
                      );
                    }).toList(),
                  ),
                  Text(
                    "Class:",
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                  DropDownSelector(
                    selectedValue: selectedClassType,
                    menuItems: ClassType.values.map((classType) {
                      return DropdownMenuItem(
                        value: classType,
                        child: Text(classType.formattedName),
                      );
                    }).toList(),
                  )
                ]
              ),
              Container(
                padding: const EdgeInsets.only(bottom: 5),
                child: TextField(
                  onChanged: (value) {
                    filterSearchResultsText(value);
                  },
                  controller: editingController,
                  decoration: const InputDecoration(
                    labelText: "Search",
                    hintText: "Search",
                    prefixIcon: Icon(Icons.search),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(25.0))
                    )
                  ),
                ),
              ),
            ],
          ),
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                border: Border.all(color: statColor),
                borderRadius: const BorderRadius.all(Radius.circular(10))
              ),
              child: ListView.builder(
                itemCount: items.length,
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  return MapleTooltip(
                    maxWidth: items[index].getTooltipWidth(),
                    tooltipWidgets: [
                      Consumer<EquipsProvider>(
                        builder: (_, equipsProvider, __) {
                          return items[index].createEquipContainer(context);
                        }
                      ),
                    ],
                    child: ListTile(
                      title: Row(
                        children: [
                          Text(items[index].equipName.formattedName),
                          const Spacer(),
                          TextButton(
                            onPressed: () => context.read<EquipEditingProvider>().addEditingEquip(items[index]), 
                            child: const Text("Edit")
                          )
                        ]
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
        ],
      )
    );
  }
}

class DropDownSelector extends StatelessWidget {
  final ValueNotifier selectedValue;
  final List<DropdownMenuItem> menuItems;

  const DropDownSelector({
    super.key, 
    required this.selectedValue,
    required this.menuItems
  });

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: selectedValue,
      builder: (context, v, _) {
        return DropdownButton(
          value: v,
          onChanged: (newValue) {
            if (newValue != null) {
              selectedValue.value = newValue;
            }
          },
          items: menuItems,
        );
      }
    );
  }
}

class EquipSetSelectButton extends StatelessWidget {
  final int equipSetPosition;

  const EquipSetSelectButton({
    super.key, 
    required this.equipSetPosition
  });

  IconData _getIconData() {
    switch(equipSetPosition) {
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
    context.read<DifferenceCalculatorProvider>().compareEquipSets(context, equipSetPosition);
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
      child: Container(
        padding: const EdgeInsets.only(top: 9),
        child: IconButton(
          padding: const EdgeInsets.all(1),
          constraints: const BoxConstraints(),
          iconSize: 19,
          onPressed: () => context.read<EquipsProvider>().changeActiveSet(equipSetPosition), 
          icon: Consumer<EquipsProvider>(
            builder: (_, equipsProvider, __) {
              return Icon(
                _getIconData(),
                color: equipSetPosition == equipsProvider.activeSetNumber ? starColor : null,
              );
            }
          ),
        )
      )
    );
  }
}