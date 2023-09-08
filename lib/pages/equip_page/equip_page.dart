import 'package:flutter/material.dart';
import 'package:maplestory_builder/core/constants.dart';
import 'package:maplestory_builder/core/constants/potential_stats.dart';
import 'package:maplestory_builder/core/items/equips.dart';
import 'package:maplestory_builder/core/items/potentials.dart';
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

  List<DropdownMenuItem> getDropdownItemList(BuildContext context, EquipModule equipModule, EquipType equipType) {
    var filteredList = equipModule.allEquips.where((element) {
      if (equipType == EquipType.secondary) {
        return secondaryTypes.contains(element.equipType);
      }
      else {
        return element.equipType == equipType;
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
            maxWidth: 310,
            tooltipWidgets: [value.createEquipContainer(context)],
            child: Text(
              value.name,
              style: Theme.of(context).textTheme.bodyMedium
            ),
          ),
        );
      }).toList()
    );

    return dropdownItems;
  }

  Equip? getSelectedEquip(EquipModule equipModule, EquipType equipType, int equipPosition) {
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
      case EquipType.title:
        return equipModule.title;
      case EquipType.pet:
        if (equipPosition == 1) {
          return equipModule.pet1;
        }
        else if (equipPosition == 2) {
          return equipModule.pet2;
        }
        else {
          return equipModule.pet3;
        }
      case EquipType.petEquip:
        if (equipPosition == 1) {
          return equipModule.petEquip1;
        }
        else if (equipPosition == 2) {
          return equipModule.petEquip2;
        }
        else {
          return equipModule.petEquip3;
        }
      default:
        throw Exception("Unhandled EquipType $equipType trying to be equipped");
    }
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
        Consumer<CharacterModel>(
          builder: (context, characterModel, child) {
            return SizedBox(
              width: 225,
              child: DropdownButton(
                alignment: AlignmentDirectional.center,
                isDense: true,
                isExpanded: true,
                value: getSelectedEquip(characterModel.equipModule, equipType, equipPosition),
                onChanged: (newValue) {
                  var character = context.read<CharacterModel>();
                  character.equipEquip(newValue, equipType, equipPosition: equipPosition);
                },
                items: getDropdownItemList(context, characterModel.equipModule, equipType)
              ),
            );
          }
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
          Consumer<CharacterModel>(
            builder: (context, characterModel, child) {
              return Expanded(
                child: Container(
                  decoration: BoxDecoration(
                    border: Border.all(color: statColor),
                    borderRadius: const BorderRadius.all(Radius.circular(10))
                  ),
                  child: ListView.builder(
                    itemCount: characterModel.equipModule.allEquips.length,
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      return MapleTooltip(
                        maxWidth: 310,
                        tooltipWidgets: [characterModel.equipModule.allEquips[index].createEquipContainer(context)],
                        child: ListTile(
                          title: Row(
                            children: [
                              Text(characterModel.equipModule.allEquips[index].name),
                              const Spacer(),
                              TextButton(
                                onPressed: () => characterModel.deleteEquip(characterModel.equipModule.allEquips[index]), 
                                child: const Text("Delete")
                              ),
                              TextButton(
                                onPressed: () => context.read<CharacterModel>().addEditingEquip(characterModel.equipModule.allEquips[index]), 
                                child: const Text("Edit")
                              ),
                            ]
                          ),
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
                    maxWidth: 310,
                    tooltipWidgets: [items[index].createEquipContainer(context)],
                    child: ListTile(
                      title: Row(
                        children: [
                          Text(items[index].name),
                          const Spacer(),
                          TextButton(
                            onPressed: () => context.read<CharacterModel>().addEditingEquip(items[index]), 
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


class EquipBuilder extends StatelessWidget {

  const EquipBuilder(
    {
      super.key
    }
  );

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
        child: Expanded( 
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextButton(
                    onPressed: () => context.read<CharacterModel>().cancelEquipEditing(),
                    child: const Text("Cancel")
                  ),
                  TextButton(
                    onPressed: () => context.read<CharacterModel>().saveEditingEquip(), 
                    child: const Text("Save")
                  ),
                ],
              ),
              const _EquipBuilder()
            ]
          )
        ),
      ),
    );
  }
}

class _EquipBuilder extends StatelessWidget {

  const _EquipBuilder();

  @override
  Widget build(BuildContext context) {
    return 
    Expanded(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: 300,
            padding: const EdgeInsets.symmetric(horizontal: 5),
            child: Column(
              children: [
                Container(
                  padding: const EdgeInsets.only(bottom: 5),
                  child: Text(
                    "Editing Equip",
                    style: Theme.of(context).textTheme.headlineMedium
                  ),
                ),
                const _FlameSelector(),
                const Divider(
                  height: 15,
                  thickness: 1,
                  color: statColor,
                ),
                const _StarForceSlider(),
                const Divider(
                  height: 15,
                  thickness: 1,
                  color: statColor,
                ),
                Consumer<CharacterModel>(
                  builder: (_, characterModel, __) {
                    return characterModel.editingEquip?.createEquipContainer(context, isEquipEditing: true) ?? const SizedBox.shrink();
                  }
                ),
                const _PotentialSelector(),
              ],
            ),
          ),
          Expanded(
            child: Column(
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
                      decoration: BoxDecoration(
                        border: Border.all(color: statColor),
                        borderRadius: const BorderRadius.all(Radius.circular(10))
                      ),
                      padding: const EdgeInsets.only(right: 5, left: 18),
                      child: SingleChildScrollView(
                        padding: const EdgeInsets.only(right: 13),
                        child: Consumer<CharacterModel>(
                          builder: (_, characterModel, __) {
                            return context.read<DifferenceCalculator>().compareEditingEquip() 
                            ?? 
                            const Text(
                              "NOT CURRENTLY EDITING AN EQUIP",
                              style: TextStyle(color: Colors.red),
                            );
                          }
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ]
      ),
    );
  }
}

class _StarForceSlider extends StatelessWidget {

  const _StarForceSlider();

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Text("Star Force:"),
        Expanded(
          child: Consumer<CharacterModel>(
            builder: (_, characterModel, __) {
              return Slider(
                value: characterModel.editingEquip?.starForceModule?.currentStars.toDouble() ?? 0,
                max: characterModel.editingEquip?.starForceModule?.possibleStars.toDouble() ?? 0,
                divisions: characterModel.editingEquip?.starForceModule?.possibleStars.toInt() ?? 1,
                label: characterModel.editingEquip?.starForceModule?.currentStars.round().toString(),
                onChanged: (double newValue) {
                  context.read<CharacterModel>().updateStarforce(newValue);
                  context.read<DifferenceCalculator>().compareEditingEquip();
                },
              );
            }
          ),
        ),
      ],
    );
  }
}

class _FlameSelector extends StatelessWidget {

  const _FlameSelector();

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        Text("Flame Selection"),
        _FlameDropdowns(flamePosition: 1),
        _FlameDropdowns(flamePosition: 2),
        _FlameDropdowns(flamePosition: 3),
        _FlameDropdowns(flamePosition: 4),
      ],
    );
  }
}

class _FlameDropdowns extends StatelessWidget {
  final int flamePosition;

  const _FlameDropdowns({
    required this.flamePosition,
  });

  List<DropdownMenuItem> getDropdownFlameList(BuildContext context, Equip? editingEquip) {
    List<DropdownMenuItem<FlameType>> dropdownItems = [
      // Always add a default null selector to the list
      DropdownMenuItem(
        value: null,
        child: Text(
          'None',
          style: Theme.of(context).textTheme.bodyMedium
        ),
      )
    ];

    if (editingEquip != null && editingEquip.flameModule != null && editingEquip.canFlame) {

      List<FlameType> filteredList = <FlameType>[];
      // We can only have one of the flame types per equip, filter out any ones already used here
      for(FlameType flameType in FlameType.values) { 
        // Can only get level reduction if there is at one level to reduce
        if (flameType == FlameType.levelReduction && editingEquip.itemLevel == 0) {
          continue;
        }
        // Weapons do not roll speed or jump
        else if ((flameType == FlameType.speed || flameType == FlameType.jump) && editingEquip.equipType == EquipType.weapon) {
          continue;
        }
        // Only weapons can roll damage and boss damage
        else if ((flameType == FlameType.damage || flameType == FlameType.bossDamage) && editingEquip.equipType != EquipType.weapon) {
          continue;
        }

        if (flamePosition != 1 && flameType == editingEquip.flameModule?.flameLine1?.flameType) {
          continue;
        }
        else if (flamePosition != 2 && flameType == editingEquip.flameModule?.flameLine2?.flameType) {
          continue;
        }
        else if (flamePosition != 3 && flameType == editingEquip.flameModule?.flameLine3?.flameType) {
          continue;
        }
        else if (flamePosition != 4 && flameType == editingEquip.flameModule?.flameLine4?.flameType) {
          continue;
        }
        else {
          filteredList.add(flameType);
        }
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
    }

    return dropdownItems;
  }

  List<DropdownMenuItem> getDropdownFlameTierList(BuildContext context, Equip? editingEquip) {
    List<DropdownMenuItem<FlameTier>> dropdownItems = [
      // Always add a default null selector to the list
      DropdownMenuItem(
        value: null,
        child: Text(
          'None',
          style: Theme.of(context).textTheme.bodyMedium
        ),
      )
    ];

    if (editingEquip != null && editingEquip.flameModule != null && editingEquip.canFlame) {

      List<FlameTier> filteredList;
      // If the item is flame advantaged, remove the first two tiers
      if (editingEquip.isFlameAdvantaged) {
        filteredList = FlameTier.values.sublist(2);
      }
      // Else remove the last two tiers
      else {
        filteredList = FlameTier.values.sublist(0, 5);
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
    }

    return dropdownItems;
  }

  FlameType? getSelectedFlameType(Equip? editingEquip, int flamePosition){
    if (flamePosition == 1) {
      return editingEquip?.flameModule?.flameLine1?.flameType;
    }
    if (flamePosition == 2) {
      return editingEquip?.flameModule?.flameLine2?.flameType;
    }
    if (flamePosition == 3) {
      return editingEquip?.flameModule?.flameLine3?.flameType;
    }
    else {
      return editingEquip?.flameModule?.flameLine4?.flameType;
    }
  }

  FlameTier? getSelectedFlameTier(Equip? editingEquip, int flamePosition){
    if (flamePosition == 1) {
      return editingEquip?.flameModule?.flameLine1?.flameTier;
    }
    if (flamePosition == 2) {
      return editingEquip?.flameModule?.flameLine2?.flameTier;
    }
    if (flamePosition == 3) {
      return editingEquip?.flameModule?.flameLine3?.flameTier;
    }
    else {
      return editingEquip?.flameModule?.flameLine4?.flameTier;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<CharacterModel>(
      builder: (context, characterModel, child) {
        return Row(
          children: [
            const Text("Flame: "),
            SizedBox(
              width: 120,
              child: DropdownButton(
                alignment: AlignmentDirectional.center,
                isDense: true,
                isExpanded: true,
                value: getSelectedFlameType(characterModel.editingEquip, flamePosition),
                onChanged: (newValue) {
                  characterModel.updateFlame(flamePosition, flameType: newValue);
                },
                items: getDropdownFlameList(context, characterModel.editingEquip)
              ),
            ),
            const Spacer(),
            const Text("Tier: "),
            SizedBox(
              width: 80,
              child: DropdownButton(
                alignment: AlignmentDirectional.center,
                isDense: true,
                isExpanded: true,
                value: getSelectedFlameTier(characterModel.editingEquip, flamePosition),
                onChanged: (newValue) {
                  characterModel.updateFlame(flamePosition, flameTier: newValue, isUpdatingTier: true);
                },
                items: getDropdownFlameTierList(context, characterModel.editingEquip)
              ),
            ),
          ]
        );
      }
    );
  }
}

class _PotentialSelector extends StatelessWidget {

  const _PotentialSelector();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 5),
      child: const Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Divider(
            height: 15,
            thickness: 1,
            color: statColor,
          ),
          Text("Main Potential Selection"),
          _PotenialTierDropdown(),
          _PotentialDropdowns(potentialPosition: 1),
          _PotentialDropdowns(potentialPosition: 2),
          _PotentialDropdowns(potentialPosition: 3),
          Divider(
            height: 15,
            thickness: 1,
            color: statColor,
          ),
          Text("Bonus Potential Selection"),
          _PotenialTierDropdown(isBonus: true),
          _PotentialDropdowns(potentialPosition: 1, isBonus: true),
          _PotentialDropdowns(potentialPosition: 2, isBonus: true),
          _PotentialDropdowns(potentialPosition: 3, isBonus: true),
        ],
      ),
    );
  }
}

class _PotenialTierDropdown extends StatelessWidget {
  final bool isBonus;

  const _PotenialTierDropdown({
    this.isBonus = false,
  });

  List<DropdownMenuItem> getDropdownPotentialsTierList(BuildContext context) {
    List<DropdownMenuItem<PotentialTier>> dropdownItems = [
      // Always add a default null selector to the list
      DropdownMenuItem(
        value: null,
        child: Text(
          'None',
          style: Theme.of(context).textTheme.bodyMedium
        ),
      )
    ];

    dropdownItems.addAll(
      PotentialTier.values.map((value) {
        return DropdownMenuItem(
          value: value,
          child: Text(
            value.formattedName,
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(color: value.color)
          ),
        );
      }).toList()
    );

    return dropdownItems;
  }

  PotentialTier? getSelectedPotentialTier(Equip? editingEquip) {
    if (isBonus) {
      return editingEquip?.potentialModule?.bonusPotential;
    }
    else {
      return editingEquip?.potentialModule?.mainPotential;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<CharacterModel>(
      builder: (context, characterModel, child) {
        return Row(
          children: [
            Text(
              "Potential: ",
              style: TextStyle(
                color: getSelectedPotentialTier(characterModel.editingEquip)?.color
              ),
            ),
            SizedBox(
              width: 234,
              child: DropdownButton(
                alignment: AlignmentDirectional.center,
                isDense: true,
                isExpanded: true,
                value: getSelectedPotentialTier(characterModel.editingEquip),
                onChanged: (newValue) {
                  characterModel.updatePotentialTier(newValue, isBonus: isBonus);
                },
                items: getDropdownPotentialsTierList(context)
              ),
            ),
          ]
        );
      }
    );
  }
}

class _PotentialDropdowns extends StatelessWidget {
  final int potentialPosition;
  final bool isBonus;

  const _PotentialDropdowns({
    required this.potentialPosition,
    this.isBonus = false,
  });

  List<DropdownMenuItem> getDropdownPotentialsList(BuildContext context, Equip? editingEquip) {
    List<DropdownMenuItem<PotentialLine>> dropdownItems = [
      // Always add a default null selector to the list
      DropdownMenuItem(
        value: null,
        child: Text(
          'None',
          style: Theme.of(context).textTheme.bodyMedium
        ),
      )
    ];

    if (editingEquip != null && editingEquip.potentialModule != null && editingEquip.canPotential) {

      List<PotentialLine> filteredList = getPotentialsListForEquip(editingEquip, isBonus: isBonus);

      dropdownItems.addAll(
        filteredList.map((value) {
          var offset = getPotentialOffsetFromItemLevel(editingEquip.itemLevel.toInt());
          num? valueToDisplay;

          if (value.statValue != null) {
            if (value is StaticPotentialLine) {
              valueToDisplay = value.statValue![0];
            }
            else {
              valueToDisplay = value.statValue![offset];
            }
          }
          else {
            // TODO: add skill stuff here
          }

          return DropdownMenuItem(
            value: value,
            child: RichText(
              text: TextSpan(
                children: [
                  TextSpan(
                    text: "${value.statType.formattedName} ${value.statType.isPositive ? '+' : '-'}${value.statType.isPercentage ? doubleRoundPercentFormater.format(valueToDisplay) : valueToDisplay}",
                    style: Theme.of(context).textTheme.bodyMedium
                  ),
                  TextSpan(
                    text: value.isPrime ? "  (Prime)" : "",
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(color: starColor)
                  ),
                ]
              )
            ),
          );
        }).toList()
      );
    }

    return dropdownItems;
  }

  PotentialLine? getSelectedPotentialLine(Equip? editingEquip, int potentialPosition) {
    if (isBonus) {
      if (potentialPosition == 1) {
        return editingEquip?.potentialModule?.bonusPotentialLine1;
      }
      else if (potentialPosition == 2) {
        return editingEquip?.potentialModule?.bonusPotentialLine2;
      }
      else {
        return editingEquip?.potentialModule?.bonusPotentialLine3;
      }
    }
    else {
      if (potentialPosition == 1) {
        return editingEquip?.potentialModule?.mainPotentialLine1;
      }
      else if (potentialPosition == 2) {
        return editingEquip?.potentialModule?.mainPotentialLine2;
      }
      else {
        return editingEquip?.potentialModule?.mainPotentialLine3;
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<CharacterModel>(
      builder: (context, characterModel, child) {
        return  SizedBox(
          width: 300,
          child: DropdownButton(
            alignment: AlignmentDirectional.center,
            isDense: true,
            isExpanded: true,
            value: getSelectedPotentialLine(characterModel.editingEquip, potentialPosition),
            onChanged: (newValue) {
              characterModel.updatePotential(potentialPosition, newValue, isBonus: isBonus);
            },
            items: getDropdownPotentialsList(context, characterModel.editingEquip)
          ),
        );
      }
    );
  }
}