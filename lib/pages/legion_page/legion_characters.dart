import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:maplestory_builder/constants/legion/legion_stats.dart';
import 'package:maplestory_builder/constants/constants.dart';
import 'package:maplestory_builder/modules/legion/legion_mod.dart';
import 'package:maplestory_builder/modules/utilities/widgets.dart';
import 'package:maplestory_builder/providers/legion/legion_character_editing_provider.dart';
import 'package:maplestory_builder/providers/legion/legion_stats_provider.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:provider/provider.dart';

class PlacedCharacters extends StatelessWidget {
  const PlacedCharacters({
    super.key
  });

  Function _curriedOnHover(LegionCharacter legionCharacter) {
    return (BuildContext context) {
      // return context.read<DifferenceCalculatorProvider>().compareEquip(context, equip);
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
                  child: Consumer<LegionStatsProvider>(
                    builder: (context, legionStatsProvider, child) {
                      var allPlacedCharacters = legionStatsProvider.activeLegionSet.getPlacedCharacters();
                      return ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: allPlacedCharacters.length,
                        shrinkWrap: true,
                        padding: const EdgeInsets.all(5),
                        itemBuilder: (context, index) {
                          return MapleTooltip(
                            tooltipTitle: allPlacedCharacters[index].legionBlock.formattedName,
                            onHoverFunction: _curriedOnHover(allPlacedCharacters[index]),
                            tooltipWidgets: [
                              allPlacedCharacters[index].createLegionCharacterContainer(context),
                            ],
                            child: CharacterTile(
                              legionCharacter: allPlacedCharacters[index],
                              isPlaced: true,
                            ),
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

  Function _curriedOnHover(LegionCharacter legionCharacter) {
    return (BuildContext context) {
      // return context.read<DifferenceCalculatorProvider>().compareEquip(context, legionCharacter);
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
                  child: Consumer<LegionStatsProvider>(
                    builder: (context, legionStatsProvider, child) {
                      var allLegionCharactersList = legionStatsProvider.getUnplacedLegionCharacters();
                      return ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: allLegionCharactersList.length,
                        shrinkWrap: true,
                        padding: const EdgeInsets.all(5),
                        itemBuilder: (context, index) {
                          return MapleTooltip(
                            tooltipTitle: allLegionCharactersList[index].legionBlock.formattedName,
                            onHoverFunction: _curriedOnHover(allLegionCharactersList[index]),
                            tooltipWidgets: [
                              allLegionCharactersList[index].createLegionCharacterContainer(context),
                            ],
                            child: CharacterTile(
                              legionCharacter: allLegionCharactersList[index],
                            ),
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
  final LegionCharacter legionCharacter;
  final bool isPlaced;

  const CharacterTile({
    required this.legionCharacter,
    this.isPlaced = false,
    super.key
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(right: 2.5),
      child: Container(
        padding: const EdgeInsets.all(5),
        width: 125,
        height: 178,
        decoration: BoxDecoration(
          color: statColor,
          border: Border.all(
            color: statColor
          ),
          borderRadius: const BorderRadius.all(Radius.circular(10)),
        ),
        child: Stack(
          alignment: Alignment.topCenter,
          children: [
            Positioned(
              top: -10,
              child: SizedBox(
                width: 114,
                child: Row(
                  children: [
                    Text(
                      legionCharacter.characterLevelToRank(),
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(fontSize: 36),
                    ),
                    const Spacer(),
                    Text(
                      "Lv.${legionCharacter.legionCharacterLevel}",
                    ),
                  ]
                ),
              ), 
            ),
            Positioned(
              top: 25,
              child: Icon(
                MdiIcons.accountBox,
                size: 96,
              ),
            ),
            Positioned(
              top: 112,
              child: Text(legionCharacter.legionBlock.formattedName),
            ),
            Positioned(
              top: 137,
              child: SizedBox(
                width: 114,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    MapleTooltip(
                      tooltipWidgets: const [
                        Text("Delete Character"),
                      ],
                      child: IconButton(
                        padding: const EdgeInsets.all(1),
                        constraints: const BoxConstraints(),
                        iconSize: 19,
                        onPressed: legionCharacter.legionCharacterHash == 0 ? null : () {
                          context.read<LegionStatsProvider>().deleteLegionCharacter(legionCharacter);
                        }, 
                        icon: Icon(MdiIcons.trashCan),
                      ),
                    ),
                    const Spacer(),
                    MapleTooltip(
                      tooltipWidgets: [
                        Text(isPlaced ? "Remove Character" : "Place Character"),
                      ],
                      child: IconButton(
                        padding: const EdgeInsets.all(1),
                        constraints: const BoxConstraints(),
                        iconSize: 19,
                        onPressed: legionCharacter.legionCharacterLevel < 60 ? null : () {
                          var legionStatsProvider = context.read<LegionStatsProvider>();
                          isPlaced ? legionStatsProvider.removePlacedLegionCharacter(legionCharacter) : legionStatsProvider.placeLegionCharacter(legionCharacter);
                        }, 
                        icon: isPlaced ? Icon(MdiIcons.minusThick) : Icon(MdiIcons.plusThick),
                      ),
                    ),
                    const Spacer(),
                    MapleTooltip(
                      tooltipWidgets: const [
                        Text("Edit Character"),
                      ],
                      child: IconButton(
                        padding: const EdgeInsets.all(1),
                        constraints: const BoxConstraints(),
                        iconSize: 19,
                        onPressed: legionCharacter.legionCharacterHash == 0 ? null : () {
                          context.read<LegionCharacterEditingProvider>().addEditingLegionCharacter(legionCharacter: legionCharacter);
                          showDialog(context: context,
                            builder: (BuildContext context){
                              return const EditCharacterDialogBox();
                            }
                          );
                        },
                        icon: Icon(MdiIcons.accountEdit),
                      ),
                    ),
                  ]
                ),
              ),
            )
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

class EditCharacterDialogBox extends StatelessWidget {

  const EditCharacterDialogBox({
    super.key, 
  });

  List<DropdownMenuItem<LegionBlock>> getDropdownLegionBlockList(BuildContext context, LegionCharacter? editingLegionCharacter) {
    List<DropdownMenuItem<LegionBlock>> dropdownItems = [];

    Set<LegionBlock> createdSpecialBlocks = {};
    for (LegionCharacter legionCharacter in context.read<LegionStatsProvider>().allLegionCharacters.values) {
      if (LegionBlock.specialBlocks.contains(legionCharacter.legionBlock)) {
        createdSpecialBlocks.add(legionCharacter.legionBlock);
      }
    }


    List<LegionBlock> filteredList = <LegionBlock>[];
    // We can only have one of the flame types per equip, filter out any ones already used here
    for(LegionBlock legionBlock in LegionBlock.values) { 
      // Stops us from being able to select multiple of a special block
      if (!createdSpecialBlocks.contains(legionBlock) || editingLegionCharacter?.legionBlock == legionBlock) {
        filteredList.add(legionBlock);
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

    return dropdownItems;
  }

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
            width: 350,
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
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text('Legion Block: '),
                    Consumer<LegionCharacterEditingProvider>(
                      builder: (context, legionEditingCharacterProvider, child) {
                        return DropdownButton(
                          value: legionEditingCharacterProvider.editingLegionCharacter?.legionBlock,
                          onChanged: (LegionBlock? newValue) {
                            if (newValue != null) {
                              context.read<LegionCharacterEditingProvider>().updatedLegionBlock(newValue);
                            }
                          },
                          items: getDropdownLegionBlockList(context, legionEditingCharacterProvider.editingLegionCharacter),
                        );
                      }
                    ),
                  ]
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text('Legion Block Level: '),
                    SizedBox(
                      width: 140,
                      child: Selector<LegionCharacterEditingProvider, LegionBlock?>(
                        selector: (_, legionCharacterEditingProvider) => legionCharacterEditingProvider.editingLegionCharacter?.legionBlock,
                        builder: (_, legionBlock, __) {
                          var legionCharacterEditingProvider = context.read<LegionCharacterEditingProvider>();
                          return TextField(
                            style: Theme.of(context).textTheme.bodyMedium,
                            controller: legionCharacterEditingProvider.levelTextController,
                            onChanged: (value) => legionCharacterEditingProvider.updateCharacterLevel(value.isNotEmpty ? int.parse(value) : 0),
                            keyboardType: TextInputType.number,
                            inputFormatters: <TextInputFormatter>[
                              FilteringTextInputFormatter.allow(RegExp(r'^\d*')),
                            ],
                            decoration: const InputDecoration(
                              isDense: true
                            ),
                          );
                        }
                      ),
                    )
                  ]
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text("Character Effect: "),
                    Consumer<LegionCharacterEditingProvider>(
                      builder: (_, legionCharacterEditingProvider, __) {
                        return legionCharacterEditingProvider.editingLegionCharacter?.createLegionCharacterContainer(context) ?? const SizedBox.shrink();
                      }
                    ),
                  ]
                ),
                Row(
                  children: [
                    TextButton(
                      onPressed: () {
                        context.read<LegionCharacterEditingProvider>().cancelLegionCharacterEditing();
                        Navigator.of(context).pop();
                      },
                      child: const Text("Cancel"),
                    ),
                    const Spacer(),
                    TextButton(
                      onPressed: () {
                        context.read<LegionCharacterEditingProvider>().saveEditingLegionCharacter(context);
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