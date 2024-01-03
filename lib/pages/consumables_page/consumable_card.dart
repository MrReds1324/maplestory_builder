import 'package:flutter/material.dart';
import 'package:maplestory_builder/constants/constants.dart';
import 'package:maplestory_builder/constants/consumables/consumables.dart';
import 'package:maplestory_builder/modules/utilities/utilities.dart';
import 'package:maplestory_builder/modules/utilities/widgets.dart';
import 'package:maplestory_builder/providers/consumables/consumables_provider.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:provider/provider.dart';

class ConsumableCard extends StatelessWidget {

  final ConsumableName consumableName;

  const ConsumableCard({
    required this.consumableName,
    super.key
  });

  String _getDurationString() {
    if (consumableName.duration >= 3600) {
      var formattedTime = consumableName.duration ~/ 3600;
      return "$formattedTime hours";
    }
    else if (consumableName.duration >= 60) {
      var formattedTime = consumableName.duration ~/ 60;
      return "$formattedTime minutes";
    }
    else {
      return "${consumableName.duration} seconds";
    }
  }

  void Function(bool?)? _getOnChangedFunction(BuildContext context, bool isSelected, bool isActivated) {
    void onChanged(bool? newValue) {
      context.read<ConsumablesProvider>().selectConsumable(consumableName, newValue);
    }

    if (isSelected) {
      return onChanged;
    }
    else if (!isActivated) {
      return null;
    }

    return onChanged;
  }

  bool _getActivatedState(BuildContext context, bool? isActivated) {
    if (isActivated == null) {
      if (context.read<ConsumablesProvider>().activeConsumablesSet.selectedConsumables.keys.contains(ConsumableName.advancedBlessingPotion)) {
        return false;
      }
      else {
        return true;
      }
    }
    else {
      return isActivated;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      color: DEFAULT_COLOR,
      child: Container(
        padding: const EdgeInsets.all(2.5),
        child: Selector<ConsumablesProvider, (bool, bool)>(
          selector: (_, consumablesProvider) => (consumablesProvider.activeConsumablesSet.selectedConsumables[consumableName] != null, _getActivatedState(context, consumablesProvider.activeConsumablesSet.selectedConsumables[consumableName])),
          builder: (context, data, child) {
            return Container(
              decoration: BoxDecoration(
                border: Border.all(color: data.$2 ? DEFAULT_COLOR: Colors.redAccent),
                borderRadius: const BorderRadius.all(Radius.circular(10))
              ),
              padding: const EdgeInsets.all(2.5),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                    child: child ?? const SizedBox.shrink(),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("Duration: ${_getDurationString()}"),
                      const Spacer(),
                      const Text("Selected"),
                      const SizedBox(width: 5),
                      Checkbox(
                        isError: true,
                        value: data.$1,
                        onChanged: _getOnChangedFunction(context, data.$1, data.$2),
                      ),
                    ],
                  )
                ],
              ),
            );
          },
          child: _ConsumableInnerContents(consumableName: consumableName),
        ),
      ),
    );
  }
}

class _ConsumableInnerContents extends StatelessWidget {
  final ConsumableName consumableName;

  const _ConsumableInnerContents({
    required this.consumableName,
  });


  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              constraints: const BoxConstraints(
                maxWidth: 235
              ),
              child: Text(
                consumableName.formattedName,
                style: Theme.of(context).textTheme.headlineSmall,
              ),
            ),
            MapleTooltip(
              tooltipWidgets: [
                Text(consumableName.description),
              ],
              child: Icon(MdiIcons.informationOutline),
            )
          ],
        ),
        _ConsumableStatsListView(
          consumableName: consumableName,
        ),
        const Spacer(),
      ]
    );
  }
}

class _ConsumableStatsListView extends StatelessWidget {
  final ConsumableName consumableName;

 const _ConsumableStatsListView({
  required this.consumableName,
 });

  @override
  Widget build(BuildContext context) {
    var consumableStats = consumableName.statValues.entries.toList();
    return SizedBox(
      width: 300,
      child: ListView.builder(
        padding: const EdgeInsets.only(right: 8),
        itemCount: consumableStats.length,
        shrinkWrap: true,
        itemBuilder: (context, index) {
          return ListTile(
            title: Row(
              children: [
                Container(
                  constraints: const BoxConstraints(maxWidth: 150),
                  child: Text(
                    consumableStats[index].key.formattedName,
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                ),
                const Spacer(),
                Text(
                  "${consumableStats[index].key.isPositive ? '+' : ' -'}${consumableStats[index].key.isPercentage ? doublePercentFormater.format(consumableStats[index].value) : consumableStats[index].value}",
                  style: Theme.of(context).textTheme.bodyMedium
                ) 
              ]
            ),
          );
        },
      ),
    );
  }
}