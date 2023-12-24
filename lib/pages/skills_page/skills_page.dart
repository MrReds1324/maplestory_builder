import 'package:flutter/material.dart';
import 'package:maplestory_builder/constants/constants.dart';

class SkillsPage extends StatelessWidget {

  const SkillsPage(
    {
      super.key
    }
  );

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(
          color: statColor
        ),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: const Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('SKILLS')
        ],
      ),
    );
  }
}