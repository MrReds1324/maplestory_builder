import 'package:flutter/material.dart';
import 'package:maplestory_builder/constants/constants.dart';

class ConsumablesPage extends StatelessWidget {

  const ConsumablesPage(
    {
      super.key
    }
  );

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(
          color: DEFAULT_COLOR
        ),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: const Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('CONSUMABLES')
        ],
      ),
    );
  }
}