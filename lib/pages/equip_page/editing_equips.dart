import 'package:flutter/material.dart';
import 'package:maplestory_builder/core/constants.dart';
import 'package:maplestory_builder/core/constants/equipment/potential_stats.dart';
import 'package:maplestory_builder/core/items/equipment/equips.dart';
import 'package:maplestory_builder/core/items/equipment/potentials.dart';
import 'package:maplestory_builder/modules/utilities.dart';
import 'package:maplestory_builder/providers/difference_provider.dart';
import 'package:maplestory_builder/providers/equip_editing_provider.dart';
import 'package:provider/provider.dart';

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
                    onPressed: () => context.read<EquipEditingProvider>().cancelEquipEditing(),
                    child: const Text("Cancel")
                  ),
                  TextButton(
                    onPressed: () => context.read<EquipEditingProvider>().saveEditingEquip(context), 
                    child: const Text("Save")
                  ),
                ],
              ),
              const EquipBuilderContent()
            ]
          )
        ),
      ),
    );
  }
}

class EquipBuilderContent extends StatelessWidget {

  const EquipBuilderContent({super.key});

  @override
  Widget build(BuildContext context) {
    return 
    Expanded(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: 323,
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
                Expanded(child: 
                  ListView(
                    padding: const EdgeInsets.only(right: 13, bottom: 5),
                    children: <Widget>[
                      Consumer<EquipEditingProvider>(
                        builder: (_, equipEditingProvider, __) {
                          return equipEditingProvider.editingEquip?.createEquipContainer(context, isEquipEditing: true) ?? const SizedBox.shrink();
                        }
                      ),
                      const _StarForceSlider(),
                      const _PotentialSelector(),
                      const _FlameSelector(),
                    ],
                  ),
                ),
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
                      padding: const EdgeInsets.only(right: 5, left: 18, top: 5, bottom: 5),
                      child: SingleChildScrollView(
                        padding: const EdgeInsets.only(right: 13),
                        child: Consumer2<EquipEditingProvider, DifferenceCalculatorProvider>(
                          builder: (_, equipEditingProvider, differenceCalculatorProvider, __) {
                            return differenceCalculatorProvider.compareEditingEquip(context) 
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
    return ExpansionTile(
      iconColor: equipStarColor,
      title: const Text("Star Force"),
      children: [
        Row(
          children: [
            const Text("Star Force:"),
            Expanded(
              child: Consumer<EquipEditingProvider>(
                builder: (_, equipEditingProvider, __) {
                  return Slider(
                    value: equipEditingProvider.editingEquip?.starForceModule?.currentStars.toDouble() ?? 0,
                    max: equipEditingProvider.editingEquip?.starForceModule?.possibleStars.toDouble() ?? 0,
                    divisions: equipEditingProvider.editingEquip?.starForceModule?.possibleStars.toInt() ?? 1,
                    label: equipEditingProvider.editingEquip?.starForceModule?.currentStars.round().toString(),
                    onChanged: (double newValue) {
                      equipEditingProvider.updateStarforce(newValue);
                    },
                  );
                }
              ),
            ),
          ],
        ),
      ],
    );
  }
}

class _FlameSelector extends StatelessWidget {

  const _FlameSelector();

  @override
  Widget build(BuildContext context) {
    return const ExpansionTile(
      iconColor: equipStarColor,
      childrenPadding: EdgeInsets.only(bottom: 5),
      title: Text("Flames"),
      children: [
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
    return Row(
      children: [
        const Text("Flame: "),
        SizedBox(
          width: 120,
          child: Consumer<EquipEditingProvider>(
            builder: (context, equipEditingProvider, child) {
              return DropdownButton(
                alignment: AlignmentDirectional.center,
                isDense: true,
                isExpanded: true,
                value: getSelectedFlameType(equipEditingProvider.editingEquip, flamePosition),
                onChanged: (newValue) {
                  equipEditingProvider.updateFlame(flamePosition, flameType: newValue);
                },
                items: getDropdownFlameList(context, equipEditingProvider.editingEquip)
              );
            }
          ),
        ),
        const Spacer(),
        const Text("Tier: "),
        SizedBox(
          width: 80,
          child: Consumer<EquipEditingProvider>(
            builder: (context, equipEditingProvider, child) {
              return DropdownButton(
                alignment: AlignmentDirectional.center,
                isDense: true,
                isExpanded: true,
                value: getSelectedFlameTier(equipEditingProvider.editingEquip, flamePosition),
                onChanged: (newValue) {
                  equipEditingProvider.updateFlame(flamePosition, flameTier: newValue, isUpdatingTier: true);
                },
                items: getDropdownFlameTierList(context, equipEditingProvider.editingEquip)
              );
            }
          ),
        ),
      ]
    );
  }
}

class _PotentialSelector extends StatelessWidget {

  const _PotentialSelector();

  @override
  Widget build(BuildContext context) {
    return const ExpansionTile(
      iconColor: equipStarColor,
      childrenPadding: EdgeInsets.only(bottom: 5),
      title: Text("Potentials"),
      children: [
        _PotenialTierDropdown(),
        _PotentialDropdowns(potentialPosition: 1),
        _PotentialDropdowns(potentialPosition: 2),
        _PotentialDropdowns(potentialPosition: 3),
        Divider(
          height: 15,
          thickness: 1,
          color: statColor,
        ),
        _PotenialTierDropdown(isBonus: true),
        _PotentialDropdowns(potentialPosition: 1, isBonus: true),
        _PotentialDropdowns(potentialPosition: 2, isBonus: true),
        _PotentialDropdowns(potentialPosition: 3, isBonus: true),
      ],
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
    return  Row(
      children: [
        Consumer<EquipEditingProvider>(
          builder: (context, equipEditingProvider, child) {
            return Text(
              "${isBonus ? 'Bonus' : 'Main'} Potential: ",
              style: TextStyle(
                color: getSelectedPotentialTier(equipEditingProvider.editingEquip)?.color
              ),
            );
          }
        ),
        SizedBox(
          width: isBonus ? 207 : 213,
          child: Consumer<EquipEditingProvider>(
            builder: (context, equipEditingProvider, child) {
              return DropdownButton(
                alignment: AlignmentDirectional.center,
                isDense: true,
                isExpanded: true,
                value: getSelectedPotentialTier(equipEditingProvider.editingEquip),
                onChanged: (newValue) {
                  equipEditingProvider.updatePotentialTier(newValue, isBonus: isBonus);
                },
                items: getDropdownPotentialsTierList(context)
              );
            }
          ),
        ),
      ]
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

          if (value is PotentialLineStatic) {
            valueToDisplay = value.statValue;
          }
          else if (value is PotentialLineRange) {
            valueToDisplay = value.statValue[offset];
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
    return  SizedBox(
      width: 300,
      child: Consumer<EquipEditingProvider>(
        builder: (context, equipEditingProvider, child) {
          return DropdownButton(
            alignment: AlignmentDirectional.center,
            isDense: true,
            isExpanded: true,
            value: getSelectedPotentialLine(equipEditingProvider.editingEquip, potentialPosition),
            onChanged: (newValue) {
              equipEditingProvider.updatePotential(potentialPosition, newValue, isBonus: isBonus);
            },
            items: getDropdownPotentialsList(context, equipEditingProvider.editingEquip)
          );
        }
      ),
    );
  }
}