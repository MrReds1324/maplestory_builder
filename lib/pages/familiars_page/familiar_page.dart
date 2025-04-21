import 'package:flutter/material.dart';
import 'package:maplestory_builder/constants/constants.dart';
import 'package:maplestory_builder/modules/familiars/badges_mod.dart';
import 'package:maplestory_builder/modules/familiars/familiar.dart';
import 'package:maplestory_builder/modules/familiars/familiar_badge.dart';
import 'package:maplestory_builder/modules/utilities/utilities.dart';
import 'package:maplestory_builder/modules/utilities/widgets.dart';
import 'package:maplestory_builder/pages/familiars_page/editing_familiars.dart';
import 'package:maplestory_builder/providers/difference_provider.dart';
import 'package:maplestory_builder/providers/familiars/familiar_editing_provider.dart';
import 'package:maplestory_builder/providers/familiars/familiars_provider.dart';
import 'package:provider/provider.dart';

class FamiliarPage extends StatelessWidget {
  const FamiliarPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: DEFAULT_COLOR),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: const Row(
        children: [
          _EquippedFamiliarsBadges(),
          SizedBox(width: 10),
          _FamiliarInventory(),
          SizedBox(width: 10),
          Expanded(
            child: FamiliarBuilder(),
          ),
        ],
      ),
    );
  }
}

class _EquippedFamiliarsBadges extends StatelessWidget {
  const _EquippedFamiliarsBadges();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text("Active Familiars",
            style: Theme.of(context).textTheme.headlineMedium),
        SetSelectButtonRow<FamiliarsProvider>(
          onHoverFunction:
              context.read<DifferenceCalculatorProvider>().compareFamiliarSets,
          onPressed: (int setPosition) => context
              .read<FamiliarsProvider>()
              .changeActiveFamiliarSet(setPosition),
          selectorFunction:
              (BuildContext context, FamiliarsProvider familiarsProvider) =>
                  familiarsProvider.activeFamiliarSetNumber,
        ),
        const _FamiliarSelector(
          familiarPosition: 1,
        ),
        const _FamiliarSelector(
          familiarPosition: 2,
        ),
        const _FamiliarSelector(
          familiarPosition: 3,
        ),
        const _FamiliarStatListView(),
        Text("Equipped Badges",
            style: Theme.of(context).textTheme.headlineMedium),
        SetSelectButtonRow<FamiliarsProvider>(
          onHoverFunction:
              context.read<DifferenceCalculatorProvider>().compareBadgeSets,
          onPressed: (int setPosition) => context
              .read<FamiliarsProvider>()
              .changeActiveBadgeSet(setPosition),
          selectorFunction:
              (BuildContext context, FamiliarsProvider familiarsProvider) =>
                  familiarsProvider.activeBadgeSetNumber,
        ),
        FutureBuilder(
            future: BadgeModule.loadingBadges,
            builder: (BuildContext context, AsyncSnapshot<void> snapshot) {
              if (snapshot.connectionState == ConnectionState.done) {
                if (snapshot.hasError) {
                  return Center(
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                        const Icon(Icons.error_outline,
                            color: Colors.red, size: 60),
                        Padding(
                          padding: const EdgeInsets.only(top: 16),
                          child: Text('Error: ${snapshot.error}'),
                        ),
                      ]));
                }
                return const Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      _BadgeSelector(
                        badgePosition: 1,
                      ),
                      _BadgeSelector(
                        badgePosition: 2,
                      ),
                      _BadgeSelector(
                        badgePosition: 3,
                      ),
                      _BadgeSelector(
                        badgePosition: 4,
                      ),
                      _BadgeSelector(
                        badgePosition: 5,
                      ),
                      _BadgeSelector(
                        badgePosition: 6,
                      ),
                      _BadgeSelector(
                        badgePosition: 7,
                      ),
                      _BadgeSelector(
                        badgePosition: 8,
                      ),
                    ]);
              } else {
                return const Center(
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                      SizedBox(
                          width: 60,
                          height: 60,
                          child: CircularProgressIndicator()),
                      Padding(
                          padding: EdgeInsets.only(top: 16),
                          child: Text('Loading Badges')),
                    ]));
              }
            }),
        const _BadgeStatListView(),
      ],
    );
  }
}

class _BadgeSelector extends StatelessWidget {
  final int badgePosition;

  const _BadgeSelector({
    required this.badgePosition,
  });

  List<DropdownMenuItem> getDropdownItemList(
      BuildContext context, FamiliarsProvider familiarsProvider) {
    // Always add a default null selector to the list
    List<DropdownMenuItem> dropdownItems = [
      DropdownMenuItem(
        value: null,
        child: Text('None', style: Theme.of(context).textTheme.bodyMedium),
      )
    ];

    List<FamiliarBadge> filteredList = <FamiliarBadge>[];
    // We can only have one of badge of each, filter out already used ones here
    badgeFilterLoop:
    for (MapEntry<int, FamiliarBadge> badgeEntry
        in BadgeModule.allBadges.entries) {
      // Stops us from being able to select multiple of a single badge
      for (MapEntry<int, FamiliarBadge?> activeBadges
          in familiarsProvider.activeBadgeSet.activeBadges.entries) {
        if (activeBadges.key == badgePosition) {
          continue;
        } else if (badgeEntry.key == activeBadges.value?.badgeId) {
          continue badgeFilterLoop;
        }
      }

      filteredList.add(badgeEntry.value);
    }

    dropdownItems.addAll(filteredList.map((value) {
      return DropdownMenuItem(
        value: value,
        child: MapleTooltip(
          tooltipTitle: value.badgeName,
          tooltipWidgets: [value.createBadgeContainer(context)],
          child: Text(value.badgeName,
              style: Theme.of(context).textTheme.bodyMedium),
        ),
      );
    }).toList());

    return dropdownItems;
  }

  FamiliarBadge? getSelectedBadge(FamiliarsProvider familiarsProvider) {
    return familiarsProvider.activeBadgeSet.getSelectedBadge(badgePosition);
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        SizedBox(
          width: 60,
          child: Text("Badge $badgePosition"),
        ),
        SizedBox(
          width: 240,
          child: Consumer<FamiliarsProvider>(
              builder: (context, familiarsProvider, child) {
            return DropdownButton(
                alignment: AlignmentDirectional.center,
                isDense: true,
                isExpanded: true,
                value: getSelectedBadge(familiarsProvider),
                onChanged: (newValue) {
                  familiarsProvider.equipBadge(newValue, badgePosition);
                },
                items: getDropdownItemList(context, familiarsProvider));
          }),
        ),
      ],
    );
  }
}

class _FamiliarSelector extends StatelessWidget {
  final int familiarPosition;

  const _FamiliarSelector({
    required this.familiarPosition,
  });

  List<DropdownMenuItem> getDropdownItemList(
      BuildContext context, FamiliarsProvider familiarsProvider) {
    // Always add a default null selector to the list
    List<DropdownMenuItem<Familiar>> dropdownItems = [
      DropdownMenuItem(
        value: null,
        child: Text('None', style: Theme.of(context).textTheme.bodyMedium),
      )
    ];

    List<Familiar> filteredList = <Familiar>[];
    // We can only have one of badge of each, filter out already used ones here
    familiarFilterloop:
    for (Familiar familiar in familiarsProvider.allFamiliars.values) {
      // Stops us from being able to select multiple of a single familiar
      for (MapEntry<int, int?> equippedFamiliar
          in familiarsProvider.activeFamiliarSet.equippedFamiliars.entries) {
        if (equippedFamiliar.key == familiarPosition) {
          continue;
        } else if (familiar.familiarId == equippedFamiliar.value) {
          continue familiarFilterloop;
        }
      }

      filteredList.add(familiar);
    }

    dropdownItems.addAll(filteredList.map((value) {
      return DropdownMenuItem(
        value: value,
        child: MapleTooltip(
          tooltipWidgets: [value.createFamiliarContainer(context)],
          child: Text(value.familiarName,
              style: Theme.of(context).textTheme.bodyMedium),
        ),
      );
    }).toList());

    return dropdownItems;
  }

  Familiar? getSelectedFamiliar(FamiliarsProvider familiarsProvider) {
    return familiarsProvider.activeFamiliarSet
        .getSelectedFamiliar(familiarPosition);
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        SizedBox(
          width: 60,
          child: Text("Familiar $familiarPosition"),
        ),
        SizedBox(
          width: 240,
          child: Consumer<FamiliarsProvider>(
              builder: (context, familiarsProvider, child) {
            return DropdownButton(
                alignment: AlignmentDirectional.center,
                isDense: true,
                isExpanded: true,
                value: getSelectedFamiliar(familiarsProvider),
                onChanged: (newValue) {
                  familiarsProvider.equipFamiliar(newValue, familiarPosition);
                },
                items: getDropdownItemList(context, familiarsProvider));
          }),
        ),
      ],
    );
  }
}

class _FamiliarInventory extends StatelessWidget {
  const _FamiliarInventory();

  Function _curriedOnHover(Familiar familiar) {
    return (BuildContext context) {
      return context
          .read<DifferenceCalculatorProvider>()
          .compareFamiliar(context, familiar);
    };
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(bottom: 5),
      child: Column(
        children: <Widget>[
          Container(
            padding: const EdgeInsets.only(bottom: 5),
            child: Text("Familiar Inventory",
                style: Theme.of(context).textTheme.headlineMedium),
          ),
          Expanded(
            child: Container(
              height: 700,
              width: 425,
              decoration: BoxDecoration(
                  border: Border.all(color: DEFAULT_COLOR),
                  borderRadius: const BorderRadius.all(Radius.circular(10))),
              child: Consumer<FamiliarsProvider>(
                  builder: (context, familiarsProvider, child) {
                var allFamiliarsList =
                    familiarsProvider.allFamiliars.values.toList();
                return ListView.builder(
                  itemCount: familiarsProvider.allFamiliars.length,
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    return MapleTooltip(
                      onHoverFunction: _curriedOnHover(allFamiliarsList[index]),
                      tooltipWidgets: [
                        allFamiliarsList[index]
                            .createFamiliarContainer(context),
                        Selector<DifferenceCalculatorProvider, Widget>(
                            selector: (_, differenceCalculatorProvider) =>
                                differenceCalculatorProvider.differenceWidget,
                            builder: (context, widget, child) {
                              return widget;
                            }),
                      ],
                      child: ListTile(
                        title: Row(children: [
                          Text(allFamiliarsList[index].familiarName),
                          const Spacer(),
                          TextButton(
                              onPressed: () => familiarsProvider
                                  .deleteFamiliar(allFamiliarsList[index]),
                              child: const Text("Delete")),
                          TextButton(
                              onPressed: () => context
                                  .read<FamiliarEditingProvider>()
                                  .addEditingFamiliar(
                                      familiar: allFamiliarsList[index]),
                              child: const Text("Edit")),
                        ]),
                      ),
                    );
                  },
                );
              }),
            ),
          ),
        ],
      ),
    );
  }
}

class _FamiliarStatListView extends StatelessWidget {
  const _FamiliarStatListView();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(bottom: 5),
      child: Column(
        children: <Widget>[
          Text("Familiar Stats",
              style: Theme.of(context).textTheme.headlineMedium),
          Container(
            height: 225,
            width: 300,
            decoration: BoxDecoration(
                border: Border.all(color: DEFAULT_COLOR),
                borderRadius: const BorderRadius.all(Radius.circular(10))),
            child: Consumer<FamiliarsProvider>(
                builder: (context, familiarsProvider, child) {
              var selectedStats = familiarsProvider.activeFamiliarSet
                  .calculateStats()
                  .entries
                  .toList();
              return ListView.builder(
                padding: const EdgeInsets.only(right: 8),
                itemCount: selectedStats.length,
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Row(children: [
                      SizedBox(
                        width: 100,
                        child: Text(
                          selectedStats[index].key.formattedName,
                          style: Theme.of(context).textTheme.bodyMedium,
                        ),
                      ),
                      const Spacer(),
                      Text(
                          "${selectedStats[index].key.isPositive ? '+' : ' -'}${selectedStats[index].key.isPercentage ? doublePercentFormater.format(selectedStats[index].value) : selectedStats[index].value}",
                          style: Theme.of(context).textTheme.bodyMedium)
                    ]),
                  );
                },
              );
            }),
          ),
        ],
      ),
    );
  }
}

class _BadgeStatListView extends StatelessWidget {
  const _BadgeStatListView();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(bottom: 5),
      child: Column(
        children: <Widget>[
          Text("Badge Stats",
              style: Theme.of(context).textTheme.headlineMedium),
          Container(
            height: 225,
            width: 300,
            decoration: BoxDecoration(
                border: Border.all(color: DEFAULT_COLOR),
                borderRadius: const BorderRadius.all(Radius.circular(10))),
            child: Consumer<FamiliarsProvider>(
                builder: (context, familiarsProvider, child) {
              var selectedStats =
                  familiarsProvider.activeBadgeSet.moduleStats.entries.toList();
              return ListView.builder(
                padding: const EdgeInsets.only(right: 8),
                itemCount: selectedStats.length,
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Row(children: [
                      SizedBox(
                        width: 100,
                        child: Text(
                          selectedStats[index].key.formattedName,
                          style: Theme.of(context).textTheme.bodyMedium,
                        ),
                      ),
                      const Spacer(),
                      Text(
                          "${selectedStats[index].key.isPositive ? '+' : ' -'} ${selectedStats[index].key.isPercentage ? doublePercentFormater.format(selectedStats[index].value) : selectedStats[index].value}",
                          style: Theme.of(context).textTheme.bodyMedium)
                    ]),
                  );
                },
              );
            }),
          ),
        ],
      ),
    );
  }
}
