import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:maplestory_builder/constants/constants.dart';
import 'package:maplestory_builder/constants/familiars/potential_stats.dart';
import 'package:maplestory_builder/modules/familiars/familiar.dart';
import 'package:maplestory_builder/providers/difference_provider.dart';
import 'package:maplestory_builder/providers/equipment/equip_editing_provider.dart';
import 'package:maplestory_builder/providers/familiars/familiar_editing_provider.dart';
import 'package:provider/provider.dart';

class FamiliarBuilder extends StatelessWidget {

  const FamiliarBuilder(
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
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextButton(
                  onPressed: () => context.read<FamiliarEditingProvider>().cancelEquipFamiliar(),
                  child: const Text("Cancel")
                ),
                TextButton(
                  onPressed: () => context.read<FamiliarEditingProvider>().addEditingFamiliar(),
                  child: const Text("New Familiar")
                ),
                TextButton(
                  onPressed: () => context.read<FamiliarEditingProvider>().saveEditingFamiliar(context), 
                  child: const Text("Save")
                ),
              ],
            ),
            const FamiliarBuilderContent()
          ]
        ),
      ),
    );
  }
}

class FamiliarBuilderContent extends StatelessWidget {

  const FamiliarBuilderContent({super.key});

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
                    "Editing Familiar",
                    style: Theme.of(context).textTheme.headlineMedium
                  ),
                ),
                Expanded(
                  child: Column(
                    children: [
                      Expanded(
                        child: ListView(
                          padding: const EdgeInsets.only(right: 13, bottom: 5),
                          children: const [
                            _PotenialTierDropdown(),
                            _PotentialDropdowns(potentialPosition: 1),
                            _PotentialDropdowns(potentialPosition: 2),
                            _StatsTweak(),
                          ],
                        ),
                      ),
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
                      width: 320,
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
                              "NOT CURRENTLY EDITING A FAMILIAR",
                              style: TextStyle(color: Colors.red),
                              textAlign: TextAlign.center,
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

class _PotenialTierDropdown extends StatelessWidget {

  const _PotenialTierDropdown();

  List<DropdownMenuItem> getDropdownPotentialsTierList(BuildContext context) {
    List<DropdownMenuItem<FamiliarPotentialTier>> dropdownItems = [
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
      FamiliarPotentialTier.filteredList.map((value) {
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

  FamiliarPotentialTier? getSelectedPotentialTier(Familiar? editingFamiliar) {
    return editingFamiliar?.potentialTier;
  }

  @override
  Widget build(BuildContext context) {
    return  Row(
      children: [
        Consumer<FamiliarEditingProvider>(
          builder: (context, familiarEditingProvider, child) {
            return Text(
              "Potential: ",
              style: TextStyle(
                color: getSelectedPotentialTier(familiarEditingProvider.editingFamiliar)?.color
              ),
            );
          }
        ),
        SizedBox(
          width: 213,
          child: Consumer<FamiliarEditingProvider>(
            builder: (context, familiarEditingProvider, child) {
              return DropdownButton(
                alignment: AlignmentDirectional.center,
                isDense: true,
                isExpanded: true,
                value: getSelectedPotentialTier(familiarEditingProvider.editingFamiliar),
                onChanged: (newValue) {
                  familiarEditingProvider.updatePotentialTier(newValue);
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

  const _PotentialDropdowns({
    required this.potentialPosition
  });

  List<DropdownMenuItem> getDropdownPotentialsList(BuildContext context, Familiar? editingFamiliar) {
    List<DropdownMenuItem<(FamiliarPotential, bool)>> dropdownItems = [
      // Always add a default null selector to the list
      DropdownMenuItem(
        value: null,
        child: Text(
          'None',
          style: Theme.of(context).textTheme.bodyMedium
        ),
      )
    ];

    if (editingFamiliar != null) {

      List<(FamiliarPotential, bool)> filteredList = editingFamiliar.getPotentialsList(potentialPosition);

      dropdownItems.addAll(
        filteredList.map((value) {
          return DropdownMenuItem(
            value: value,
            child: RichText(
              text: TextSpan(
                children: [
                  TextSpan(
                    text: value.$1.formattedName.isNotEmpty ? value.$1.formattedName : value.$1.statType.formattedName,
                    style: Theme.of(context).textTheme.bodyMedium
                  ),
                  TextSpan(
                    text: value.$2 ? "  (Prime)" : "",
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

  (FamiliarPotential, bool)? getSelectedPotentialLine(Familiar? editingFamiliar, int potentialPosition) {
    var targetPotentialLine = editingFamiliar?.potentials[potentialPosition];
    return targetPotentialLine?.familiarPotential != null ? (targetPotentialLine!.familiarPotential!, targetPotentialLine.isPrime) : null;
  }

  @override
  Widget build(BuildContext context) {
    return  SizedBox(
      width: 300,
      child: Consumer<FamiliarEditingProvider>(
        builder: (context, familiarEditingProvider, child) {
          return DropdownButton(
            alignment: AlignmentDirectional.center,
            isDense: true,
            isExpanded: true,
            value: getSelectedPotentialLine(familiarEditingProvider.editingFamiliar, potentialPosition),
            onChanged: (newValue) {
              familiarEditingProvider.updatePotentialSelection(potentialPosition, newValue,);
            },
            items: getDropdownPotentialsList(context, familiarEditingProvider.editingFamiliar)
          );
        }
      ),
    );
  }
}

class _StatsTweak extends StatelessWidget {
  const _StatsTweak();

  @override
  Widget build(BuildContext context) {
    return ExpansionTile(
      iconColor: equipStarColor,
      title: const Text("Stat Tweaks"),
      children: [
        SizedBox(
          height: 450,
          child: ListView(
            shrinkWrap: true,
            padding: const EdgeInsets.only(right: 13, bottom: 5),
            children: const <Widget>[
              _StatsTweakInput(statType: StatType.str),
              _StatsTweakInput(statType: StatType.dex),
              _StatsTweakInput(statType: StatType.int),
              _StatsTweakInput(statType: StatType.luk),
              _StatsTweakInput(statType: StatType.attack),
              _StatsTweakInput(statType: StatType.mattack),
              _StatsTweakInput(statType: StatType.mp),
              _StatsTweakInput(statType: StatType.hp),
              _StatsTweakInput(statType: StatType.defense),
              _StatsTweakInput(statType: StatType.speed),
              _StatsTweakInput(statType: StatType.jump),
            ],
          ),
        ),
      ],
    );
  }
}

class _StatsTweakInput extends StatelessWidget {
  final StatType statType;

  const _StatsTweakInput({required this.statType});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(statType.formattedName),
        const Spacer(),
        SizedBox(
          width: 200,
          child: TextField(
            style: Theme.of(context).textTheme.bodyMedium,
            controller: context.read<EquipEditingProvider>().getTweakTextController(statType),
            onChanged: (value) => context.read<EquipEditingProvider>().updateTweakStat(statType, value.isNotEmpty && value != "-" ? int.parse(value) : 0),
            keyboardType: TextInputType.number,
            inputFormatters: <TextInputFormatter>[
              FilteringTextInputFormatter.allow(RegExp(r'^-?\d*')),
            ],
            decoration: const InputDecoration(
              isDense: true
            ),
          )
        )
      ]
    );
  }
}