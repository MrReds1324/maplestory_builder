import 'package:flutter/material.dart';
import 'package:maplestory_builder/constants/constants.dart';
import 'package:maplestory_builder/constants/consumables/consumables.dart';
import 'package:maplestory_builder/modules/utilities/utilities.dart';
import 'package:maplestory_builder/modules/utilities/widgets.dart';
import 'package:maplestory_builder/pages/consumables_page/consumable_card.dart';
import 'package:maplestory_builder/providers/consumables/consumables_provider.dart';
import 'package:maplestory_builder/providers/difference_provider.dart';
import 'package:provider/provider.dart';

class ConsumablesPage extends StatelessWidget {

  const ConsumablesPage({
    super.key
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(
          color: DEFAULT_COLOR
        ),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: Column(
        children: [
          Text(
            "Consumable Buffs",
            style: Theme.of(context).textTheme.headlineLarge
          ),
          SetSelectButtonRow<ConsumablesProvider>(
            onHoverFunction: context.read<DifferenceCalculatorProvider>().compareConsumablesSets,
            onPressed: (int setPosition) => context.read<ConsumablesProvider>().changeActiveSet(setPosition),
            selectorFunction: (BuildContext context, ConsumablesProvider consumablesProvider) => consumablesProvider.activeSetNumber,
          ),
          const Expanded(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _SearchableItemGrid(),
                SizedBox(width: 10),
                _ConsumableStatsListView(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _SearchableItemGrid extends StatefulWidget {
  
  const _SearchableItemGrid();

  @override
  State<_SearchableItemGrid> createState() => _SearchableItemGridState();
}

class _SearchableItemGridState extends State<_SearchableItemGrid> {
  TextEditingController editingController = TextEditingController();
  var items = <ConsumableName>[];
  var stringQuery = '';
  final ValueNotifier<ConsumableCategory> selectedConsumableCategory = ValueNotifier<ConsumableCategory>(ConsumableCategory.all);

  @override
  void initState() {
    items = ConsumableName.values;
    selectedConsumableCategory.addListener(filterSearchResultsEquip);
    stringQuery = '';
    super.initState();
  }

  void filterSearchResultsEquip() {
    setState(() {
      var tempItems = ConsumableName.values;

      if (selectedConsumableCategory.value != ConsumableCategory.all) {
        tempItems = tempItems.where((element) => element.consumableCategories.contains(selectedConsumableCategory.value)).toList();
      }

      items = stringQuery.isEmpty ? tempItems : tempItems.where((element) => 
        element.formattedName.toLowerCase().contains(stringQuery.toLowerCase())
      ).toList();
    });
  }

  void filterSearchResultsText(String query) {
    setState(() {
      stringQuery = query;
      var tempItems = ConsumableName.values;

      if (selectedConsumableCategory.value != ConsumableCategory.all) {
        tempItems = tempItems.where((element) => element.consumableCategories.contains(selectedConsumableCategory.value)).toList();
      }

      items = stringQuery.isEmpty ? tempItems : tempItems.where((element) => 
        element.formattedName.toLowerCase().contains(stringQuery.toLowerCase())
      ).toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 1131,
      padding: const EdgeInsets.only(bottom: 5),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Spacer(),
              Container(
                padding: const EdgeInsets.only(bottom: 5),
                constraints: const BoxConstraints(maxWidth: 500),
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
              const Spacer(),
              Text(
                "Consumable Type:",
                style: Theme.of(context).textTheme.titleMedium,
              ),
              const SizedBox(width: 10),
              ListenableDropDownSelector(
                selectedValue: selectedConsumableCategory,
                menuItems: ConsumableCategory.values.map((consumableCategory) {
                  return DropdownMenuItem(
                    value: consumableCategory,
                    child: Text(consumableCategory.formattedName),
                  );
                }).toList(),
              ),
              const Spacer(),
            ]
          ),
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                border: Border.all(color: DEFAULT_COLOR),
                borderRadius: const BorderRadius.all(Radius.circular(10))
              ),
              child: GridView.builder(
                padding: const EdgeInsets.only(right: 13),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 4,
                ),
                itemCount: items.length,
                shrinkWrap: true,
                itemBuilder: (BuildContext context, int index) {
                  return ConsumableCard(
                    consumableName: items[index]
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

class _ConsumableStatsListView extends StatelessWidget {

  const _ConsumableStatsListView();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(bottom: 5),
      child: Column(
        children: <Widget>[
          Text(
            "Consumable Stats",
            style: Theme.of(context).textTheme.headlineMedium
          ),
          Container(
            height: 809,
            width: 300,
            decoration: BoxDecoration(
              border: Border.all(color: DEFAULT_COLOR),
              borderRadius: const BorderRadius.all(Radius.circular(10))
            ),
            child: Consumer<ConsumablesProvider>(
              builder: (context, consumablesProvider, child) {
                var selectedStats = consumablesProvider.calculateStats().entries.toList();
                return ListView.builder(
                  padding: const EdgeInsets.only(right: 8),
                  itemCount: selectedStats.length,
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    return ListTile(
                      title: Row(
                        children: [
                          Container(
                            constraints: const BoxConstraints(maxWidth: 150),
                            child: Text(
                              selectedStats[index].key.formattedName,
                              style: Theme.of(context).textTheme.bodyMedium,
                            ),
                          ),
                          const Spacer(),
                          Text(
                            "${selectedStats[index].key.isPositive ? '+' : ' -'}${selectedStats[index].key.isPercentage ? doublePercentFormater.format(selectedStats[index].value) : selectedStats[index].value}",
                            style: Theme.of(context).textTheme.bodyMedium
                          ) 
                        ]
                      ),
                    );
                  },
                );
              }
            ),
          ),
        ],
      ),
    );
  }
}
