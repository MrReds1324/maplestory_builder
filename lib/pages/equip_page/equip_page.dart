import 'package:flutter/material.dart';
import 'package:maplestory_builder/core/constants.dart';
import 'package:maplestory_builder/core/items/equips.dart';
import 'package:maplestory_builder/modules/character_provider.dart';
import 'package:maplestory_builder/modules/difference_provider.dart';
import 'package:maplestory_builder/modules/equip_mod.dart';
import 'package:maplestory_builder/modules/utilities.dart';
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
            EquipBuilder(),
          ],
        ),
      )
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
          child: Text(
            "Equipped Items",
            style: Theme.of(context).textTheme.headlineMedium
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

  List<DropdownMenuItem> getDropdownItemList(BuildContext context, EquipType equipType) {
    EquipModule equipModule = context.read<CharacterModel>().equipModule;
    var filteredList = equipModule.allEquips.where((element) {
      if (equipType == EquipType.secondary) {
        return secondaryTypes.contains(element.equipType);
      }
      else {
        return element.equipType == equipType;
      }
    }).toList();
    var dropdownItems =  filteredList.map((value) {
      return DropdownMenuItem(
        value: value,
        child: MapleTooltip(
          maxWidth: 310,
          tooltipWidgets: [value.createEquipContainer(context)],
          child: Text(
            value.name,
            style: Theme.of(context).textTheme.bodyMedium
          ),
        ),
      );
    }).toList();
    // Always add a default null selector to the list
    dropdownItems.add(
      DropdownMenuItem(
        value: null,
        child: Text(
          'None',
          style: Theme.of(context).textTheme.bodyMedium
        ),
      )
    );
    return dropdownItems;
  }

  Equip? getSelectorEquip(EquipModule equipModule, EquipType equipType, int equipPosition) {
    switch(equipType) {
      case EquipType.totem:
        if (equipPosition == 1) {
          return equipModule.totem1;
        }
        else if (equipPosition == 2) {
          return equipModule.totem2;
        }
        else {
          return equipModule.totem3;
        }
      case EquipType.ring:
        if (equipPosition == 1) {
          return equipModule.ring1;
        }
        else if (equipPosition == 2) {
          return equipModule.ring2;
        }
        else if (equipPosition == 3) {
          return equipModule.ring3;
        }
        else {
          return equipModule.ring4;
        }
      case EquipType.pocket:
        return equipModule.pocketItem;
      case EquipType.pendant:
        if (equipPosition == 1) {
          return equipModule.pendant1;
        }
        else {
          return equipModule.pendant2;
        }
      case EquipType.weapon:
        return equipModule.weapon;
      case EquipType.belt:
        return equipModule.belt;
      case EquipType.hat:
        return equipModule.hat;
      case EquipType.face:
        return equipModule.face;
      case EquipType.eye:
        return equipModule.eye;
      case EquipType.overall:
        return equipModule.overall;
      case EquipType.top:
        return equipModule.top;
      case EquipType.bottom:
        return equipModule.bottom;
      case EquipType.shoes:
        return equipModule.shoes;
      case EquipType.earrings:
        return equipModule.earrings;
      case EquipType.shoulder:
        return equipModule.shoulder;
      case EquipType.gloves:
        return equipModule.gloves;
      case EquipType.emblem:
        return equipModule.emblem;
      case EquipType.badge:
        return equipModule.badge;
      case EquipType.medal:
        return equipModule.medal;
      case EquipType.secondary:
        return equipModule.secondary;
      case EquipType.cape:
        return equipModule.cape;
      case EquipType.heart:
        return equipModule.heart;
      default:
        throw Exception("Unhandled EquipType $equipType trying to be equipped");
    }
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 300,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          SizedBox(
            width: 75,
            child: Text("${equipType.name.toUpperCase()} ${equipPosition > 0 ? equipPosition : ''}"),
          ),
          Selector<CharacterModel, Equip?>(
            selector: (_, character) => getSelectorEquip(character.equipModule, equipType, equipPosition),
            builder: (context, equip, child) {
              return SizedBox(
                width: 225,
                child: DropdownButton(
                  alignment: AlignmentDirectional.center,
                  isDense: true,
                  isExpanded: true,
                  value: equip,
                  onChanged: (newValue) {
                    var character = context.read<CharacterModel>();
                    character.equipEquip(newValue, equipType, equipPosition: equipPosition);
                  },
                  items: getDropdownItemList(context, equipType)
                ),
              );
            }
          ),
        ],
      ),
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
    return const SingleChildScrollView(
      padding: EdgeInsets.only(right: 13),
      child: Column(
        children: [
          InventoryItems(),
          SearchableItemList(),
        ],
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
          Selector<CharacterModel, List<Equip>>(
            selector: (_, character) => character.equipModule.allEquips,
            builder: (context, allEquips, child) {
              return Expanded(
                child: Container(
                  decoration: BoxDecoration(
                    border: Border.all(color: statColor),
                    borderRadius: const BorderRadius.all(Radius.circular(10))
                  ),
                  child: ListView.builder(
                    itemCount: allEquips.length,
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      return MapleTooltip(
                        maxWidth: 310,
                        tooltipWidgets: [allEquips[index].createEquipContainer(context)],
                        child: ListTile(
                          title: Text(allEquips[index].name),
                        ),
                      );
                    },
                  ),
                ),
              );
            }
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
        tempItems = tempItems.where((element) => element.classType == ClassType.all || element.classType == selectedClassType.value).toList();
      }

      if (selectedEquipType.value != EquipType.all) {
        tempItems = tempItems.where((element) => element.equipType == selectedEquipType.value).toList();
      }

      items = stringQuery.isEmpty ? tempItems : tempItems.where((element) => 
        element.name.toLowerCase().contains(stringQuery.toLowerCase())
      ).toList();
    });
  }

  void filterSearchResultsText(String query) {
    setState(() {
      stringQuery = query;
      var tempItems = equipList;
      
      if (selectedClassType.value != ClassType.all) {
        tempItems = tempItems.where((element) => element.classType == ClassType.all || element.classType == selectedClassType.value).toList();
      }

      if (selectedEquipType.value != EquipType.all) {
        tempItems = tempItems.where((element) => element.equipType == selectedEquipType.value).toList();
      }

      items = stringQuery.isEmpty ? tempItems : tempItems.where((element) => 
        element.name.toLowerCase().contains(stringQuery.toLowerCase())
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
                        child: Text(equipType.name.toUpperCase()),
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
                        child: Text(classType.name.toUpperCase()),
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
                    maxWidth: 310,
                    tooltipWidgets: [items[index].createEquipContainer(context)],
                    child: ListTile(
                      title: Text(items[index].name),
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


class EquipBuilder extends StatelessWidget {

  const EquipBuilder(
    {
      super.key
    }
  );

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 5),
        child: Container(
          padding: const EdgeInsets.all(5),
          decoration: BoxDecoration(
            border: Border.all(color: statColor),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Column(
            children: [
              Consumer<CharacterModel>(
                builder: (_, characterModel, __) {
                  return Column(
                    children: [
                      Row(
                        children: [
                          const Text("Star Force"),
                          Expanded(
                            child: Slider(
                              value: characterModel.editingEquip?.starForceMod?.currentStars.toDouble() ?? 0,
                              max: characterModel.editingEquip?.starForceMod?.possibleStars.toDouble() ?? 0,
                              divisions: characterModel.editingEquip?.starForceMod?.possibleStars.toInt() ?? 0,
                              label: characterModel.editingEquip?.starForceMod?.currentStars.round().toString(),
                              onChanged: (double newValue) {
                                context.read<CharacterModel>().updateStarforce(newValue);
                                context.read<DifferenceCalculator>().compareEditingEquip();
                              },
                            ),
                          )
                        ],
                      ),
                      characterModel.editingEquip?.createEquipContainer(context) ?? const SizedBox.shrink(),
                      context.read<DifferenceCalculator>().compareEditingEquip(),
                    ],
                  );
                }
              ),
              // Consumer<DifferenceCalculator>(
              //   builder: (context, differenceCalculator, child) =>  differenceCalculator.equipDifferenceWidget
              // ),
            ]
          )
        ),
      ),
    );
  }
}