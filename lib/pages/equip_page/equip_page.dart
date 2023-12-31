import 'package:flutter/material.dart';
import 'package:maplestory_builder/constants/character/classes.dart';
import 'package:maplestory_builder/constants/constants.dart';
import 'package:maplestory_builder/modules/equipment/equips.dart';
import 'package:maplestory_builder/modules/utilities/widgets.dart';
import 'package:maplestory_builder/pages/equip_page/editing_equips.dart';
import 'package:maplestory_builder/providers/difference_provider.dart';
import 'package:maplestory_builder/providers/equipment/equips_provider.dart';
import 'package:maplestory_builder/providers/equipment/equip_editing_provider.dart';
import 'package:provider/provider.dart';

class EquipPage extends StatelessWidget {

  const EquipPage(
    {
      super.key
    }
  );

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(
          color: DEFAULT_COLOR
        ),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: const Row(
        children: [
          _EquippedItems(),
          SizedBox(width: 10),
          _InventoryAndItemListColumn(),
          SizedBox(width: 10),
          Expanded(
            child: EquipBuilder(),
          ),
        ],
      ),
    );
  }
}

class _EquippedItems extends StatelessWidget {

  const _EquippedItems();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          "Equipped Items",
          style: Theme.of(context).textTheme.headlineMedium
        ),
        SetSelectButtonRow<EquipsProvider>(
          onHoverFunction: context.read<DifferenceCalculatorProvider>().compareEquipSets,
          onPressed: (int setPosition) => context.read<EquipsProvider>().changeActiveSet(setPosition),
          selectorFunction: (BuildContext context, EquipsProvider equipsProvider) => equipsProvider.activeSetNumber,
        ),
        // Totems
        const _EquippedItemSelector(
          equipType: EquipType.totem,
          equipPosition: 1,
        ),
        const _EquippedItemSelector(
          equipType: EquipType.totem,
          equipPosition: 2,
        ),
        const _EquippedItemSelector(
          equipType: EquipType.totem,
          equipPosition: 3,
        ),
        // Rings
        const _EquippedItemSelector(
          equipType: EquipType.ring,
          equipPosition: 1,
        ),
        const _EquippedItemSelector(
          equipType: EquipType.ring,
          equipPosition: 2,
        ),
        const _EquippedItemSelector(
          equipType: EquipType.ring,
          equipPosition: 3,
        ),
        const _EquippedItemSelector(
          equipType: EquipType.ring,
          equipPosition: 4,
        ),
        // Pocket
        const _EquippedItemSelector(
          equipType: EquipType.pocket,
        ),
        // Pendant
        const _EquippedItemSelector(
          equipType: EquipType.pendant,
          equipPosition: 1,
        ),
        const _EquippedItemSelector(
          equipType: EquipType.pendant,
          equipPosition: 2,
        ),
        // Weapon
        const _EquippedItemSelector(
          equipType: EquipType.weapon,
        ),
        // Belt
        const _EquippedItemSelector(
          equipType: EquipType.belt,
        ),
        // Hat
        const _EquippedItemSelector(
          equipType: EquipType.hat,
        ),
        // Face
        const _EquippedItemSelector(
          equipType: EquipType.face,
        ),
        // Eye
        const _EquippedItemSelector(
          equipType: EquipType.eye,
        ),
        // Overall
        const _EquippedItemSelector(
          equipType: EquipType.overall,
        ),
        // Top
        const _EquippedItemSelector(
          equipType: EquipType.top,
        ),
        // Bottom
        const _EquippedItemSelector(
          equipType: EquipType.bottom,
        ),
        // Shoes
        const _EquippedItemSelector(
          equipType: EquipType.shoes,
        ),
        // Earrings
        const _EquippedItemSelector(
          equipType: EquipType.earrings,
        ),
        // Shoulder
        const _EquippedItemSelector(
          equipType: EquipType.shoulder,
        ),
        // Gloves
        const _EquippedItemSelector(
          equipType: EquipType.gloves,
        ),
        // Emblem
        const _EquippedItemSelector(
          equipType: EquipType.emblem,
        ),
        // Badge
        const _EquippedItemSelector(
          equipType: EquipType.badge,
        ),
        // Medal
        const _EquippedItemSelector(
          equipType: EquipType.medal,
        ),
        // Secondary
        const _EquippedItemSelector(
          equipType: EquipType.secondary,
        ),
        // Cape
        const _EquippedItemSelector(
          equipType: EquipType.cape,
        ),
        // Heart
        const _EquippedItemSelector(
          equipType: EquipType.heart,
        ),
        // Title
        const _EquippedItemSelector(
          equipType: EquipType.title,
        ),
        // Pets and Pet Equips
        const _EquippedItemSelector(
          equipType: EquipType.pet,
          equipPosition: 1,
        ),
        const _EquippedItemSelector(
          equipType: EquipType.pet,
          equipPosition: 2,
        ),
        const _EquippedItemSelector(
          equipType: EquipType.pet,
          equipPosition: 3,
        ),
        const _EquippedItemSelector(
          equipType: EquipType.petEquip,
          equipPosition: 1,
        ),
        const _EquippedItemSelector(
          equipType: EquipType.petEquip,
          equipPosition: 2,
        ),
        const _EquippedItemSelector(
          equipType: EquipType.petEquip,
          equipPosition: 3,
        ),
      ],
    );
  }
}


class _EquippedItemSelector extends StatelessWidget {
  final EquipType equipType;
  final int equipPosition;

  const _EquippedItemSelector({
    required this.equipType,
    this.equipPosition = 0,
  });

  List<DropdownMenuItem> getDropdownItemList(BuildContext context, EquipsProvider equipsProvider, EquipType equipType) {
    var filteredList = equipsProvider.allEquips.values.where((element) {
      if (equipType == EquipType.secondary) {
        return SECONDARY_TYPES.contains(element.equipName.equipType);
      }
      else if (equipType == EquipType.ring) {
        return element.equipName.equipType == equipType || element.equipName.equipType == EquipType.ozRing;
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


class _InventoryAndItemListColumn extends StatelessWidget {

  const _InventoryAndItemListColumn();

  @override
  Widget build(BuildContext context){
    return const Column(
      children: [
        _InventoryItems(),
        _SearchableItemList(),
      ],
    );
  }
}

class _InventoryItems extends StatelessWidget {

  const _InventoryItems({
    super.key
  });

  Function _curriedOnHover(Equip equip) {
    return (BuildContext context) {
      return context.read<DifferenceCalculatorProvider>().compareEquip(context, equip);
    };
  }

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
                border: Border.all(color: DEFAULT_COLOR),
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
      )
    );
  }
}

class _SearchableItemList extends StatefulWidget {
  
  const _SearchableItemList();

  @override
  State<_SearchableItemList> createState() => _SearchableItemListState();
}

class _SearchableItemListState extends State<_SearchableItemList> {
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

      if (selectedClassType.value == ClassType.xenon) {
        tempItems = tempItems.where((element) => element.equipName.classType == ClassType.pirate || element.equipName.classType == ClassType.thief).toList();
      }
      else if (selectedClassType.value != ClassType.all) {
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
                  _ListenableDropDownSelector(
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
                  _ListenableDropDownSelector(
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
                border: Border.all(color: DEFAULT_COLOR),
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

class _ListenableDropDownSelector extends StatelessWidget {
  final ValueNotifier selectedValue;
  final List<DropdownMenuItem> menuItems;

  const _ListenableDropDownSelector({ 
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
