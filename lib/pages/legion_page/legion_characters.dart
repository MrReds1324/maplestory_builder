import 'package:flutter/material.dart';
import 'package:maplestory_builder/constants/character/legion_stats.dart';
import 'package:maplestory_builder/constants/constants.dart';
import 'package:maplestory_builder/modules/equipment/equips.dart';
import 'package:maplestory_builder/modules/utilities/widgets.dart';
import 'package:maplestory_builder/providers/legion/legion_character_editing_provider.dart';
import 'package:maplestory_builder/providers/legion/legion_stats_provider.dart';
import 'package:maplestory_builder/providers/difference_provider.dart';
import 'package:maplestory_builder/providers/equipment/equips_provider.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:provider/provider.dart';

class PlacedCharacters extends StatelessWidget {
  const PlacedCharacters({
    super.key
  });

  Function _curriedOnHover(Equip equip) {
    return (BuildContext context) {
      return context.read<DifferenceCalculatorProvider>().compareEquip(context, equip);
    };
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        children: [
          Text(
            "Placed Characters",
            style: Theme.of(context).textTheme.headlineMedium
          ),
          Container(
            height: 188,
            decoration: BoxDecoration(
              border: Border.all(color: statColor),
              borderRadius: const BorderRadius.all(Radius.circular(10))
            ),
            child: Row(
              children: [
                Expanded(
                  child: Consumer<EquipsProvider>(
                    builder: (context, equipsProvider, child) {
                      var allEquipsList = equipsProvider.allEquips.values.toList();
                      return ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: equipsProvider.allEquips.length,
                        shrinkWrap: true,
                        padding: const EdgeInsets.all(5),
                        itemBuilder: (context, index) {
                          return MapleTooltip(
                            maxWidth: allEquipsList[index].getTooltipWidth(),
                            onHoverFunction: _curriedOnHover(allEquipsList[index]),
                            tooltipWidgets: [
                              allEquipsList[index].createEquipContainer(context),
                              Consumer<DifferenceCalculatorProvider>(
                                builder: (context, differenceCalculator, child) => differenceCalculator.differenceWidget
                              ),
                            ],
                            child: const CharacterTile(),
                          );
                        },
                      );
                    }
                  ),
                ),
              ]
            ),
          ),
        ]
      ), 
    );
  }
}

class AvailableCharacters extends StatelessWidget {
  const AvailableCharacters({
    super.key
  });

  Function _curriedOnHover(Equip equip) {
    return (BuildContext context) {
      return context.read<DifferenceCalculatorProvider>().compareEquip(context, equip);
    };
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        children: [
          Text(
            "Available Characters",
            style: Theme.of(context).textTheme.headlineMedium
          ),
          Container(
            height: 188,
            decoration: BoxDecoration(
              border: Border.all(color: statColor),
              borderRadius: const BorderRadius.all(Radius.circular(10))
            ),
            child: Row(
              children: [
                Expanded(
                  child: Consumer<EquipsProvider>(
                    builder: (context, equipsProvider, child) {
                      var allEquipsList = equipsProvider.allEquips.values.toList();
                      return ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: equipsProvider.allEquips.length,
                        shrinkWrap: true,
                        padding: const EdgeInsets.all(5),
                        itemBuilder: (context, index) {
                          return MapleTooltip(
                            maxWidth: allEquipsList[index].getTooltipWidth(),
                            onHoverFunction: _curriedOnHover(allEquipsList[index]),
                            tooltipWidgets: [
                              allEquipsList[index].createEquipContainer(context),
                              Consumer<DifferenceCalculatorProvider>(
                                builder: (context, differenceCalculator, child) => differenceCalculator.differenceWidget
                              ),
                            ],
                            child: const CharacterTile(),
                          );
                        },
                      );
                    }
                  ),
                ),
                Container(
                  padding: const EdgeInsets.all(5),
                  child: const AddCharacterButton()
                )
              ]
            ),
          ),
        ]
      ), 
    );
  }
}

class CharacterTile extends StatelessWidget {
  const CharacterTile({
    super.key
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(right: 2.5),
        child: Container(
        width: 125,
        decoration: BoxDecoration(
          color: statColor,
          border: Border.all(
            color: statColor
          ),
          borderRadius: const BorderRadius.all(Radius.circular(10)),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              MdiIcons.accountBox,
              size: 96,
            ),
            const Text("Character"),
          ]
        ),
      ),
    );
  }
}

class AddCharacterButton extends StatelessWidget {
  const AddCharacterButton({
    super.key
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 125,
      height: 178,
      decoration: BoxDecoration(
        color: statColor,
        border: Border.all(
          color: statColor
        ),
        borderRadius: const BorderRadius.all(Radius.circular(10)),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Spacer(),
          const Text("Add Character"),
          const Spacer(),
          IconButton(
            onPressed: () {
              context.read<LegionCharacterEditingProvider>().addEditingLegionCharacter();
              showDialog(context: context,
                builder: (BuildContext context){
                  return const EditCharacterDialogBox();
                }
              );
            }, 
            icon: Icon(
              MdiIcons.plusBoxOutline,
              size: 96,
            ),
          ),
          const Spacer(flex: 2),
        ]
      ),
    );
  }
}

class EditCharacterDialogBox extends StatefulWidget {

  const EditCharacterDialogBox({
    super.key, 
  });

  @override
  EditCharacterDialogBoxState createState() => EditCharacterDialogBoxState();
}

class EditCharacterDialogBoxState extends State<EditCharacterDialogBox> {
  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      elevation: 0,
      backgroundColor: Colors.transparent,
      child: Stack(
        children: <Widget>[
          Container(
            width: 600,
            padding: const EdgeInsets.all(10),
            margin: const EdgeInsets.only(top: 5),
            decoration: BoxDecoration(
              shape: BoxShape.rectangle,
              color: Theme.of(context).primaryColor,
              borderRadius: BorderRadius.circular(10),
              boxShadow: const [
                BoxShadow(
                  color: Colors.black,
                  offset: Offset(0,10),
                  blurRadius: 10
                ),
              ]
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Text(
                  "Editing Legion Character",
                  style: Theme.of(context).textTheme.headlineMedium
                ),
                Consumer<LegionCharacterEditingProvider>(
                  builder: (context, legionStatsProvider, child) {
                    return DropdownButton(
                      value: legionStatsProvider.editingLegionCharacter?.legionBlock,
                      onChanged: (LegionBlock? newValue) {
                        if (newValue != null) {
                          context.read<LegionCharacterEditingProvider>().updatedLegionBlock(newValue);
                        }
                      },
                      items: LegionBlock.values.map((LegionBlock value) {
                        return DropdownMenuItem(
                          value: value,
                          child: Text(value.formattedName),
                        );
                      }).toList(),
                    );
                  }
                ),
                Row(
                  children: [
                    TextButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      child: const Text("Cancel"),
                    ),
                    const Spacer(),
                    TextButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      child: const Text("Save"),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}