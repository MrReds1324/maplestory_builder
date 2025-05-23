import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:maplestory_builder/constants/constants.dart';
import 'package:maplestory_builder/constants/equipment/flame_stats.dart';
import 'package:maplestory_builder/constants/equipment/potential_stats.dart';
import 'package:maplestory_builder/constants/equipment/scroll_stats.dart';
import 'package:maplestory_builder/constants/equipment/soul_stats.dart';
import 'package:maplestory_builder/modules/equipment/equips.dart';
import 'package:maplestory_builder/modules/equipment/flames_mod.dart';
import 'package:maplestory_builder/modules/equipment/potentials_mod.dart';
import 'package:maplestory_builder/modules/equipment/scroll_mod.dart';
import 'package:maplestory_builder/modules/utilities/utilities.dart';
import 'package:maplestory_builder/modules/utilities/widgets.dart';
import 'package:maplestory_builder/providers/difference_provider.dart';
import 'package:maplestory_builder/providers/equipment/equip_editing_provider.dart';
import 'package:provider/provider.dart';

class EquipBuilder extends StatelessWidget {
  const EquipBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 5),
        decoration: BoxDecoration(
          border: Border.all(color: DEFAULT_COLOR),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextButton(
                  onPressed: () =>
                      context.read<EquipEditingProvider>().cancelEquipEditing(),
                  child: const Text("Cancel")),
              TextButton(
                  onPressed: () => context
                      .read<EquipEditingProvider>()
                      .saveEditingEquip(context),
                  child: const Text("Save")),
            ],
          ),
          const _EquipBuilderContent()
        ]),
      ),
    );
  }
}

class _EquipBuilderContent extends StatelessWidget {
  const _EquipBuilderContent();

  @override
  Widget build(BuildContext context) {
    return Expanded(
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
                    child: Text("Editing Equip",
                        style: Theme.of(context).textTheme.headlineMedium),
                  ),
                  Expanded(
                    child: Column(
                      children: [
                        Consumer<EquipEditingProvider>(
                            builder: (_, equipEditingProvider, __) {
                          return equipEditingProvider.editingEquip
                                  ?.createEquipContainer(context,
                                      isEquipEditing: true) ??
                              const SizedBox.shrink();
                        }),
                        Expanded(
                          child: ListView(
                            padding:
                                const EdgeInsets.only(right: 13, bottom: 5),
                            children: <Widget>[
                              Selector<EquipEditingProvider, bool>(
                                  selector: (_, equipEditingProvider) =>
                                      equipEditingProvider.canScroll,
                                  builder: (context, canScroll, child) {
                                    return canScroll
                                        ? const _ScrollSelector()
                                        : const SizedBox.shrink();
                                  }),
                              Selector<EquipEditingProvider, bool>(
                                  selector: (_, equipEditingProvider) =>
                                      equipEditingProvider.canStar,
                                  builder: (context, canStar, child) {
                                    return canStar
                                        ? const _StarForceSlider()
                                        : const SizedBox.shrink();
                                  }),
                              Selector<EquipEditingProvider, bool>(
                                  selector: (_, equipEditingProvider) =>
                                      equipEditingProvider.canPotential,
                                  builder: (context, canPotential, child) {
                                    return canPotential
                                        ? const _PotentialSelector()
                                        : const SizedBox.shrink();
                                  }),
                              Selector<EquipEditingProvider, bool>(
                                  selector: (_, equipEditingProvider) =>
                                      equipEditingProvider.canFlame,
                                  builder: (context, canFlame, child) {
                                    return canFlame
                                        ? const _FlameSelector()
                                        : const SizedBox.shrink();
                                  }),
                              Selector<EquipEditingProvider, bool>(
                                  selector: (_, equipEditingProvider) =>
                                      equipEditingProvider.canSoul,
                                  builder: (context, canSoul, child) {
                                    return canSoul
                                        ? const _SoulSelector()
                                        : const SizedBox.shrink();
                                  }),
                              Selector<EquipEditingProvider, bool>(
                                  selector: (_, equipEditingProvider) =>
                                      equipEditingProvider
                                          .canPitchedBossUpgrade,
                                  builder:
                                      (context, canPitchedBossUpgrade, child) {
                                    return canPitchedBossUpgrade
                                        ? const _PitchedBossUpgrades()
                                        : const SizedBox.shrink();
                                  }),
                              const _StatsTweak(),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const Expanded(child: _EquipComparisonWidget()),
          ]),
    );
  }
}

class _EquipComparisonWidget extends StatelessWidget {
  const _EquipComparisonWidget();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.only(bottom: 5),
          child: Text("Difference",
              style: Theme.of(context).textTheme.headlineMedium),
        ),
        Expanded(
          child: Container(
            padding: const EdgeInsets.only(bottom: 5),
            child: Container(
              width: 320,
              decoration: BoxDecoration(
                  border: Border.all(color: DEFAULT_COLOR),
                  borderRadius: const BorderRadius.all(Radius.circular(10))),
              padding:
                  const EdgeInsets.only(right: 5, left: 18, top: 5, bottom: 5),
              child: SingleChildScrollView(
                padding: const EdgeInsets.only(right: 13),
                child: Consumer2<EquipEditingProvider,
                        DifferenceCalculatorProvider>(
                    builder: (_, equipEditingProvider,
                        differenceCalculatorProvider, __) {
                  return differenceCalculatorProvider
                          .compareEditingEquip(context) ??
                      const Text(
                        "NOT CURRENTLY EDITING AN EQUIP",
                        style: TextStyle(color: Colors.red),
                        textAlign: TextAlign.center,
                      );
                }),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class _StarForceSlider extends StatelessWidget {
  const _StarForceSlider();

  @override
  Widget build(BuildContext context) {
    return ExpansionTile(
      iconColor: EQUIP_STAR_COLOR,
      title: const Text("Star Force"),
      children: [
        Row(
          children: [
            const Text("Star Force:"),
            Expanded(
              child: Consumer<EquipEditingProvider>(
                  builder: (_, equipEditingProvider, __) {
                return Slider(
                  value: equipEditingProvider
                          .editingEquip?.starForceModule?.currentStars
                          .toDouble() ??
                      0,
                  max: equipEditingProvider
                          .editingEquip?.starForceModule?.possibleStars
                          .toDouble() ??
                      0,
                  divisions: equipEditingProvider
                          .editingEquip?.starForceModule?.possibleStars
                          .toInt() ??
                      1,
                  label: equipEditingProvider
                      .editingEquip?.starForceModule?.currentStars
                      .round()
                      .toString(),
                  onChanged: (double newValue) {
                    equipEditingProvider.updateStarforce(newValue);
                  },
                );
              }),
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
      iconColor: EQUIP_STAR_COLOR,
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

  List<DropdownMenuItem> getDropdownFlameList(
      BuildContext context, Equip? editingEquip) {
    List<DropdownMenuItem<FlameName>> dropdownItems = [
      // Always add a default null selector to the list
      DropdownMenuItem(
        value: null,
        child: Text('None', style: Theme.of(context).textTheme.bodyMedium),
      )
    ];

    if (editingEquip != null &&
        editingEquip.flameModule != null &&
        editingEquip.equipName.flameCategory != FlameCategory.none) {
      List<FlameName> filteredList = <FlameName>[];
      // We can only have one of the flame types per equip, filter out any ones already used here
      flameFilterloop:
      for (FlameName flameName in FlameName.values) {
        // Can only get level reduction if there is at one level to reduce
        if (flameName == FlameName.levelReduction &&
            editingEquip.equipName.itemLevel == 0) {
          continue;
        }
        // Weapons do not roll speed, jump, or regular attack flames
        else if (WEAPON_EXCLUDED_FLAMES.contains(flameName) &&
            editingEquip.equipName.equipType == EquipType.weapon) {
          continue;
        }
        // Only weapons can roll damage, boss damage, and weapon flames
        else if (WEAPON_ONLY_FLAMES.contains(flameName)) {
          if (editingEquip.equipName.equipType != EquipType.weapon) {
            continue;
          } else if (editingEquip.equipName.flameCategory ==
                  FlameCategory.advantaged &&
              <FlameName>{
                FlameName.wepAttackFlameNonAdvantaged,
                FlameName.wepMattackFlameNonAdvantaged
              }.contains(flameName)) {
            continue;
          } else if (editingEquip.equipName.flameCategory ==
                  FlameCategory.nonAdvantaged &&
              <FlameName>{
                FlameName.wepAttackFlameAdvantaged,
                FlameName.wepMattackFlameAdvantaged
              }.contains(flameName)) {
            continue;
          }
        }

        // Stops us from being able to select multiple of a single flame
        for (MapEntry<int, FlameLine> editingFlames
            in (editingEquip.flameModule?.flames.entries ?? {})) {
          if (editingFlames.key == flamePosition) {
            continue;
          } else if (flameName == editingFlames.value.flameName) {
            continue flameFilterloop;
          }
        }

        filteredList.add(flameName);
      }

      dropdownItems.addAll(filteredList.map((value) {
        return DropdownMenuItem(
          value: value,
          child: Text(value.formattedName,
              style: Theme.of(context).textTheme.bodyMedium),
        );
      }).toList());
    }

    return dropdownItems;
  }

  List<DropdownMenuItem> getDropdownFlameTierList(
      BuildContext context, Equip? editingEquip) {
    List<DropdownMenuItem<FlameTier>> dropdownItems = [
      // Always add a default null selector to the list
      DropdownMenuItem(
        value: null,
        child: Text('None', style: Theme.of(context).textTheme.bodyMedium),
      )
    ];

    if (editingEquip != null &&
        editingEquip.flameModule != null &&
        editingEquip.equipName.flameCategory != FlameCategory.none) {
      List<FlameTier> filteredList;
      // If the item is flame advantaged, remove the first two tiers
      if (editingEquip.equipName.flameCategory == FlameCategory.advantaged) {
        filteredList = FlameTier.values.sublist(2);
      }
      // If we can access all the flames
      else if (editingEquip.equipName.flameCategory == FlameCategory.all) {
        filteredList = FlameTier.values;
      }
      // Else remove the last two tiers
      else {
        filteredList = FlameTier.values.sublist(0, 5);
      }

      dropdownItems.addAll(filteredList.map((value) {
        return DropdownMenuItem(
          value: value,
          child: Text(value.formattedName,
              style: Theme.of(context).textTheme.bodyMedium),
        );
      }).toList());
    }

    return dropdownItems;
  }

  FlameName? getSelectedFlameName(Equip? editingEquip, int flamePosition) {
    return editingEquip?.flameModule?.getFlameLine(flamePosition).flameName;
  }

  FlameTier? getSelectedFlameTier(Equip? editingEquip, int flamePosition) {
    return editingEquip?.flameModule?.getFlameLine(flamePosition).flameTier;
  }

  @override
  Widget build(BuildContext context) {
    return Row(children: [
      const Text("Flame: "),
      SizedBox(
        width: 120,
        child: Consumer<EquipEditingProvider>(
            builder: (context, equipEditingProvider, child) {
          return DropdownButton(
              alignment: AlignmentDirectional.center,
              isDense: true,
              isExpanded: true,
              value: getSelectedFlameName(
                  equipEditingProvider.editingEquip, flamePosition),
              onChanged: (newValue) {
                equipEditingProvider.updateFlame(flamePosition,
                    flameName: newValue);
              },
              items: getDropdownFlameList(
                  context, equipEditingProvider.editingEquip));
        }),
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
              value: getSelectedFlameTier(
                  equipEditingProvider.editingEquip, flamePosition),
              onChanged: (newValue) {
                equipEditingProvider.updateFlame(flamePosition,
                    flameTier: newValue, isUpdatingTier: true);
              },
              items: getDropdownFlameTierList(
                  context, equipEditingProvider.editingEquip));
        }),
      ),
    ]);
  }
}

class _PotentialSelector extends StatelessWidget {
  const _PotentialSelector();

  @override
  Widget build(BuildContext context) {
    return const ExpansionTile(
      iconColor: EQUIP_STAR_COLOR,
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
          color: DEFAULT_COLOR,
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
        child: Text('None', style: Theme.of(context).textTheme.bodyMedium),
      )
    ];

    dropdownItems.addAll(PotentialTier.values.map((value) {
      return DropdownMenuItem(
        value: value,
        child: Text(value.formattedName,
            style: Theme.of(context)
                .textTheme
                .bodyMedium
                ?.copyWith(color: value.color)),
      );
    }).toList());

    return dropdownItems;
  }

  PotentialTier? getSelectedPotentialTier(Equip? editingEquip) {
    if (isBonus) {
      return editingEquip?.potentialModule?.bonusPotential;
    } else {
      return editingEquip?.potentialModule?.mainPotential;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Row(children: [
      Consumer<EquipEditingProvider>(
          builder: (context, equipEditingProvider, child) {
        return Text(
          "${isBonus ? 'Bonus' : 'Main'} Potential: ",
          style: TextStyle(
              color: getSelectedPotentialTier(equipEditingProvider.editingEquip)
                  ?.color),
        );
      }),
      SizedBox(
        width: isBonus ? 207 : 213,
        child: Consumer<EquipEditingProvider>(
            builder: (context, equipEditingProvider, child) {
          return DropdownButton(
              alignment: AlignmentDirectional.center,
              isDense: true,
              isExpanded: true,
              value:
                  getSelectedPotentialTier(equipEditingProvider.editingEquip),
              onChanged: (newValue) {
                equipEditingProvider.updatePotentialTier(newValue,
                    isBonus: isBonus);
              },
              items: getDropdownPotentialsTierList(context));
        }),
      ),
    ]);
  }
}

class _PotentialDropdowns extends StatelessWidget {
  final int potentialPosition;
  final bool isBonus;

  const _PotentialDropdowns({
    required this.potentialPosition,
    this.isBonus = false,
  });

  List<DropdownMenuItem> getDropdownPotentialsList(
      BuildContext context, Equip? editingEquip) {
    List<DropdownMenuItem<PotentialLine>> dropdownItems = [
      // Always add a default null selector to the list
      DropdownMenuItem(
        value: null,
        child: Text('None', style: Theme.of(context).textTheme.bodyMedium),
      )
    ];

    if (editingEquip != null &&
        editingEquip.potentialModule != null &&
        editingEquip.equipName.potentialCategory != PotentialCategory.none) {
      List<PotentialLine> filteredList =
          getPotentialsListForEquip(editingEquip, isBonus: isBonus);

      dropdownItems.addAll(filteredList.map((value) {
        num? valueToDisplay;
        if (value.potentialName.potentialType == PotentialType.static) {
          assert(value.potentialName.statValue is num,
              "Static potential lines must be of type num");
          valueToDisplay = value.potentialName.statValue;
        } else if (value.potentialName.potentialType == PotentialType.range) {
          assert(value.potentialName.statValue is List,
              "Range potential lines must be of type num");
          valueToDisplay = value.potentialName.statValue[
              getPotentialOffsetFromItemLevel(
                  editingEquip.equipName.itemLevel)];
        } else {
          // TODO: add skill stuff here
        }

        return DropdownMenuItem(
          value: value,
          child: RichText(
              text: TextSpan(children: [
            TextSpan(
                text:
                    "${value.statType.formattedName} ${value.statType.isPositive ? '+' : '-'}${value.statType.isPercentage ? doubleRoundPercentFormater.format(valueToDisplay) : valueToDisplay}",
                style: Theme.of(context).textTheme.bodyMedium),
            TextSpan(
                text: value.isPrime ? "  (Prime)" : "",
                style: Theme.of(context)
                    .textTheme
                    .bodyMedium
                    ?.copyWith(color: STAR_COLOR)),
          ])),
        );
      }).toList());
    }

    return dropdownItems;
  }

  PotentialLine? getSelectedPotentialLine(
      Equip? editingEquip, int potentialPosition) {
    if (isBonus) {
      return editingEquip?.potentialModule?.bonusPotentials[potentialPosition];
    } else {
      return editingEquip?.potentialModule?.mainPotentials[potentialPosition];
    }
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 300,
      child: Consumer<EquipEditingProvider>(
          builder: (context, equipEditingProvider, child) {
        return DropdownButton(
            alignment: AlignmentDirectional.center,
            isDense: true,
            isExpanded: true,
            value: getSelectedPotentialLine(
                equipEditingProvider.editingEquip, potentialPosition),
            onChanged: (newValue) {
              equipEditingProvider.updatePotential(potentialPosition, newValue,
                  isBonus: isBonus);
            },
            items: getDropdownPotentialsList(
                context, equipEditingProvider.editingEquip));
      }),
    );
  }
}

class _ScrollSelector extends StatelessWidget {
  const _ScrollSelector();

  @override
  Widget build(BuildContext context) {
    return ExpansionTile(
      iconColor: EQUIP_STAR_COLOR,
      childrenPadding: const EdgeInsets.only(bottom: 5),
      title: Consumer<EquipEditingProvider>(
          builder: (context, equipEditingProvider, child) {
        return Text(
            "Scrolls (${(equipEditingProvider.editingEquip?.scrollModule?.usedScrollSlots ?? 0)}/${(equipEditingProvider.editingEquip?.scrollModule?.totalScrollSlots ?? 0)})");
      }),
      children: [
        SizedBox(
          height: 450,
          child: ListView(
            padding: const EdgeInsets.only(right: 13, bottom: 5),
            children: const <Widget>[
              _UsedScrolls(),
              _EditingScroll(),
              _AvailableScrolls(),
            ],
          ),
        ),
      ],
    );
  }
}

class _UsedScrolls extends StatelessWidget {
  const _UsedScrolls();

  @override
  Widget build(BuildContext context) {
    return ExpansionTile(
      iconColor: EQUIP_STAR_COLOR,
      title: const Text("Used Scrolls"),
      children: [
        Consumer<EquipEditingProvider>(
            builder: (context, equipEditingProvider, child) {
          return ListView.builder(
            padding: const EdgeInsets.only(right: 13),
            itemCount: equipEditingProvider
                    .editingEquip?.scrollModule?.usedScrolls.length ??
                0,
            shrinkWrap: true,
            itemBuilder: (context, index) {
              return MapleTooltip(
                maxWidth: 300,
                tooltipWidgets: [
                  equipEditingProvider
                          .editingEquip?.scrollModule?.usedScrolls[index]
                          .createScrollContainer(
                              context,
                              equipEditingProvider
                                  .editingEquip?.equipName.itemLevel) ??
                      const SizedBox.shrink()
                ],
                child: ListTile(
                  title: Row(children: [
                    SizedBox(
                      width: 112,
                      child: Text(
                        equipEditingProvider.editingEquip?.scrollModule
                                ?.usedScrolls[index].scrollName.formattedName ??
                            "UNKNOWN",
                        style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                            color: getScrollEditingColor(equipEditingProvider
                                .editingEquip
                                ?.scrollModule
                                ?.usedScrolls[index])),
                      ),
                    ),
                    const Spacer(),
                    equipEditingProvider.editingEquip?.scrollModule
                            ?.usedScrolls[index] is SavedScrolledRange
                        ? TextButton(
                            onPressed: () {
                              var selectScroll = equipEditingProvider
                                  .editingEquip
                                  ?.scrollModule
                                  ?.usedScrolls[index];
                              if (selectScroll is SavedScrolledRange) {
                                equipEditingProvider
                                    .addEditingScroll(selectScroll);
                              }
                            },
                            // onPressed: () => equipEditingProvider.addEditingScroll(equipEditingProvider.editingEquip?.scrollModule?.usedScrolls[index]),
                            child: const Text("Edit"))
                        : const SizedBox.shrink(),
                    TextButton(
                        onPressed: () => equipEditingProvider.deleteScroll(
                            equipEditingProvider.editingEquip?.scrollModule
                                ?.usedScrolls[index]),
                        child: const Text("Delete")),
                  ]),
                ),
              );
            },
          );
        }),
      ],
    );
  }
}

class _EditingScroll extends StatelessWidget {
  const _EditingScroll();

  @override
  Widget build(BuildContext context) {
    return ExpansionTile(
      iconColor: EQUIP_STAR_COLOR,
      title: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text("Editing Scroll"),
          const Spacer(),
          TextButton(
              onPressed: () =>
                  context.read<EquipEditingProvider>().clearEditingScroll(),
              child: const Text("Clear")),
        ],
      ),
      children: <Widget>[
        Consumer<EquipEditingProvider>(
            builder: (context, equipEditingProvider, child) {
          List<MapEntry<StatType, ScrollRange>> scrollStats =
              equipEditingProvider.editingEquip?.scrollModule
                      ?.getEditingScrollStats() ??
                  [];
          return ListView.builder(
            itemCount: scrollStats.length,
            shrinkWrap: true,
            padding: const EdgeInsets.only(right: 13),
            itemBuilder: (context, index) {
              return MapleTooltip(
                maxWidth: 300,
                tooltipWidgets: [
                  equipEditingProvider.editingEquip?.scrollModule?.editingScroll
                          ?.createScrollContainer(
                              context,
                              equipEditingProvider
                                  .editingEquip?.equipName.itemLevel) ??
                      const SizedBox.shrink()
                ],
                child: Expanded(
                  child: ListTile(
                    title: Row(children: [
                      Text(
                        scrollStats[index].key.formattedName,
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                      const HorizontalLine(),
                      SizedBox(
                          width: 161,
                          child: Slider(
                            value: equipEditingProvider
                                    .editingEquip?.scrollModule
                                    ?.getEditingScrollStatsValue(
                                        scrollStats[index].key) ??
                                0,
                            min: scrollStats[index].value.minRange,
                            max: scrollStats[index].value.maxRange,
                            divisions: scrollStats[index].value.divisions,
                            label: (equipEditingProvider
                                        .editingEquip?.scrollModule
                                        ?.getEditingScrollStatsValue(
                                            scrollStats[index].key) ??
                                    0)
                                .toInt()
                                .toString(),
                            onChanged: (double newValue) {
                              equipEditingProvider
                                  .updateEditingScrollStatsValue(
                                      scrollStats[index].key, newValue);
                            },
                          ))
                    ]),
                  ),
                ),
              );
            },
          );
        }),
      ],
    );
  }
}

class _AvailableScrolls extends StatelessWidget {
  const _AvailableScrolls();

  @override
  Widget build(BuildContext context) {
    return ExpansionTile(
      iconColor: EQUIP_STAR_COLOR,
      title: const Text("Available Scrolls"),
      children: [
        Consumer<EquipEditingProvider>(
            builder: (context, equipEditingProvider, child) {
          List<ScrollName> availableScrolls =
              getScrollsListForEquip(equipEditingProvider.editingEquip);

          return ListView.builder(
            itemCount: availableScrolls.length,
            shrinkWrap: true,
            padding: const EdgeInsets.only(right: 13),
            itemBuilder: (context, index) {
              return MapleTooltip(
                maxWidth: 300,
                tooltipWidgets: [
                  availableScrolls[index]
                      .createScrollObject()
                      .createScrollContainer(
                          context,
                          equipEditingProvider
                              .editingEquip?.equipName.itemLevel)
                ],
                child: ListTile(
                  title: Row(children: [
                    SizedBox(
                      width: 178,
                      child: Text(
                        availableScrolls[index].formattedName,
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                    ),
                    const Spacer(),
                    TextButton(
                        onPressed: () {
                          equipEditingProvider
                              .addScrollByName(availableScrolls[index]);
                        },
                        child: const Text("Add")),
                  ]),
                ),
              );
            },
          );
        }),
      ],
    );
  }
}

class _PitchedBossUpgrades extends StatelessWidget {
  const _PitchedBossUpgrades();

  @override
  Widget build(BuildContext context) {
    return ExpansionTile(
      iconColor: EQUIP_STAR_COLOR,
      title: const Text("Pitched Boss Upgrade"),
      children: [
        Consumer<EquipEditingProvider>(
            builder: (context, equipEditingProvider, child) {
          return MapleTooltip(
            tooltipWidgets: [
              equipEditingProvider.editingEquip?.pitchedBossUpgradeModule
                      ?.createPitchedBossUpgradeContainer(context) ??
                  const SizedBox.shrink()
            ],
            child: Row(
              children: [
                Checkbox(
                  value: equipEditingProvider
                          .editingEquip?.pitchedBossUpgradeModule?.isActive ??
                      false,
                  onChanged: (value) => equipEditingProvider
                      .updatePitchedBossUpgrade(value ?? false),
                ),
                Text(equipEditingProvider.editingEquip?.pitchedBossUpgradeModule
                        ?.pitchedBossUpgrade.formattedName ??
                    ''),
              ],
            ),
          );
        }),
      ],
    );
  }
}

class _SoulSelector extends StatelessWidget {
  const _SoulSelector();

  List<DropdownMenuItem<SoulName>> getDropdownSoulNameList(
      BuildContext context) {
    List<DropdownMenuItem<SoulName>> dropdownItems = [
      // Always add a default null selector to the list
      DropdownMenuItem(
        value: null,
        child: Text('None', style: Theme.of(context).textTheme.bodyMedium),
      )
    ];

    dropdownItems.addAll(SoulName.values.map((value) {
      return DropdownMenuItem(
        value: value,
        child: Text(value.formattedName,
            style: Theme.of(context).textTheme.bodyMedium),
      );
    }).toList());

    return dropdownItems;
  }

  List<DropdownMenuItem> getDropdownSoulStatList(
      BuildContext context, Equip? editingEquip) {
    List<DropdownMenuItem> dropdownItems = [
      // Always add a default null selector to the list
      DropdownMenuItem(
        value: null,
        child: Text('None', style: Theme.of(context).textTheme.bodyMedium),
      )
    ];

    var filteredList = editingEquip?.soulModule?.soulName?.soulStats ?? [];

    dropdownItems.addAll(filteredList.map((value) {
      return DropdownMenuItem(
        value: value,
        child: Text(
            "${value.$1.formattedName}: ${value.$1.isPositive ? '+' : '-'}${value.$1.isPercentage ? doubleRoundPercentFormater.format(value.$2) : value.$2}",
            style: Theme.of(context).textTheme.bodyMedium),
      );
    }).toList());

    return dropdownItems;
  }

  @override
  Widget build(BuildContext context) {
    return ExpansionTile(
      iconColor: EQUIP_STAR_COLOR,
      title: const Text("Soul Weapon"),
      childrenPadding: const EdgeInsets.only(bottom: 5),
      children: [
        Column(children: [
          Row(children: [
            const Text("Soul: "),
            SizedBox(
              width: 269,
              child: Consumer<EquipEditingProvider>(
                  builder: (context, equipEditingProvider, child) {
                return DropdownButton(
                    alignment: AlignmentDirectional.center,
                    isDense: true,
                    isExpanded: true,
                    value:
                        equipEditingProvider.editingEquip?.soulModule?.soulName,
                    onChanged: (newValue) {
                      equipEditingProvider.updateSoulName(newValue);
                    },
                    items: getDropdownSoulNameList(context));
              }),
            ),
          ]),
          Row(children: [
            const Text("Stat: "),
            SizedBox(
              width: 272,
              child: Consumer<EquipEditingProvider>(
                  builder: (context, equipEditingProvider, child) {
                return DropdownButton(
                    alignment: AlignmentDirectional.center,
                    isDense: true,
                    isExpanded: true,
                    value: equipEditingProvider
                        .editingEquip?.soulModule?.selectedSoulStat,
                    onChanged: (newValue) {
                      equipEditingProvider.updateSoulStat(newValue);
                    },
                    items: getDropdownSoulStatList(
                        context, equipEditingProvider.editingEquip));
              }),
            ),
          ])
        ])
      ],
    );
  }
}

class _StatsTweak extends StatelessWidget {
  const _StatsTweak();

  @override
  Widget build(BuildContext context) {
    return ExpansionTile(
      iconColor: EQUIP_STAR_COLOR,
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
    return Row(mainAxisAlignment: MainAxisAlignment.center, children: [
      Text(statType.formattedName),
      const Spacer(),
      SizedBox(
          width: 200,
          child: TextField(
            style: Theme.of(context).textTheme.bodyMedium,
            controller: context
                .read<EquipEditingProvider>()
                .getTweakTextController(statType),
            onChanged: (value) => context
                .read<EquipEditingProvider>()
                .updateTweakStat(statType,
                    value.isNotEmpty && value != "-" ? int.parse(value) : 0),
            keyboardType: TextInputType.number,
            inputFormatters: <TextInputFormatter>[
              FilteringTextInputFormatter.allow(RegExp(r'^-?\d*')),
            ],
            decoration: const InputDecoration(isDense: true),
          ))
    ]);
  }
}
