import 'package:flutter/material.dart';
import 'package:maplestory_builder/constants/constants.dart';
import 'package:maplestory_builder/modules/equipment/equips.dart';
import 'package:maplestory_builder/modules/utilities/widgets.dart';
import 'package:maplestory_builder/providers/difference_provider.dart';
import 'package:maplestory_builder/providers/equipment/equip_editing_provider.dart';
import 'package:maplestory_builder/providers/equipment/equips_provider.dart';
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
      child: Container(
        padding: const EdgeInsets.all(5),
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
                          itemCount: equipsProvider.allEquips.length,
                          shrinkWrap: true,
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
                  const AddCharacterButton()
                ]
              ),
            ),
          ]
        ),
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
                        itemCount: equipsProvider.allEquips.length,
                        shrinkWrap: true,
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
                const AddCharacterButton()
              ]
            ),
          ),
        ]
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
      height: 188,
      decoration: BoxDecoration(
        color: statColor,
        border: Border.all(
          color: statColor
        ),
        borderRadius: const BorderRadius.all(Radius.circular(10)),
      ),
      child: const Text("Add Character"),
    );
  }
}