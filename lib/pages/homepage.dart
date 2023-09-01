import 'package:flutter/material.dart';
import 'package:maplestory_builder/pages/stats_bar/statsblock.dart';
import 'package:maplestory_builder/pages/equip_page/equip_page.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';


class MyHomePage extends StatelessWidget {
  const MyHomePage(
    {
      required this.title,
      super.key
    }
  );

  final String title;

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 1,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          title: Text(title),
          bottom: TabBar(
            tabs: [
              Tab(icon: Icon(MdiIcons.sword)),
            ],
          ),
        ),
        body: const Row(
          children: [
            StatTable(),
            Expanded(
              child: TabBarView(
                children: [
                  EquipPage(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}