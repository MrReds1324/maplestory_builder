import 'package:flutter/material.dart';
import 'package:maplestory_builder/constants/constants.dart';
import 'package:maplestory_builder/modules/consumables/consumables.dart';
import 'package:maplestory_builder/modules/utilities/widgets.dart';
import 'package:maplestory_builder/providers/consumables/consumables_provider.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:provider/provider.dart';

class ConsumableCard extends StatelessWidget {
  final Consumable consumable;

  const ConsumableCard({required this.consumable, super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Selector<ConsumablesProvider, (bool, bool)>(
        selector: (_, consumablesProvider) {
          bool isActive = consumablesProvider
              .activeConsumablesSet.activeConsumables
              .contains(consumable.consumableId);
          return (isActive, _getDeactivatedState(context, isActive));
        },
        builder: (context, data, child) {
          return Container(
            width: 40,
            decoration: BoxDecoration(
                border: Border.all(
                    color: data.$1
                        ? Colors.greenAccent
                        : data.$2
                            ? Colors.red
                            : DEFAULT_COLOR,
                    width: 2),
                borderRadius: const BorderRadius.all(Radius.circular(10))),
            padding: const EdgeInsets.all(2.5),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                  child: child ?? const SizedBox.shrink(),
                ),
                Text("Duration: ${consumable.getDurationString()}"),
                Text("ID: ${consumable.consumableId}"),
              ],
            ),
          );
        },
        child: _ConsumableInnerContents(consumable: consumable),
      ),
    );
  }
}

class _ConsumableInnerContents extends StatelessWidget {
  final Consumable consumable;

  const _ConsumableInnerContents({
    required this.consumable,
  });

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            constraints: const BoxConstraints(maxWidth: 145),
            child: Text(
              consumable.name,
              style: Theme.of(context).textTheme.bodyLarge,
            ),
          ),
          MapleTooltip(
            tooltipWidgets: [
              Text(consumable.description),
              const Divider(),
              consumable.createConsumableContainer(context),
            ],
            child: Icon(MdiIcons.informationOutline),
          )
        ],
      ),
      const Spacer(),
      Selector<ConsumablesProvider, (bool, bool)>(
          selector: (_, consumablesProvider) {
        bool isActive = consumablesProvider
            .activeConsumablesSet.activeConsumables
            .contains(consumable.consumableId);
        return (isActive, _getDeactivatedState(context, isActive));
      }, builder: (context, data, child) {
        return IconButton(
          onPressed:
              _getOnPressedFunction(context, data.$1, data.$2, consumable),
          icon: consumable.getAssetImage(),
          iconSize: 40,
        );
      })
    ]);
  }
}

void Function()? _getOnPressedFunction(BuildContext context, bool isActivated,
    bool isDeactivated, Consumable consumable) {
  void onPressed() {
    context.read<ConsumablesProvider>().activateConsumable(consumable);
  }

  if (isActivated) {
    return onPressed;
  } else if (isDeactivated) {
    return null;
  } else {
    return onPressed;
  }
}

bool _getDeactivatedState(BuildContext context, bool isActivated) {
  if (isActivated) {
    return false;
  } else {
    // var disabledBuffSlots = context.read<ConsumablesProvider>().disabledBuffSlots;
    // for (BuffSlot buffSlot in consumable.buffSlots) {
    //   if (disabledBuffSlots.contains(buffSlot)) {
    //     return false;
    //   }
    // }
    return false;
  }
}
