import 'package:flutter/material.dart';
import 'package:maplestory_builder/pages/stats_bar/statsblock.dart';
import 'package:maplestory_builder/pages/equip_page/equip_page.dart';

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
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          title: Text(title),
          bottom: const TabBar(
            tabs: [
              Tab(icon: Icon(Icons.directions_car)),
              Tab(icon: Icon(Icons.directions_transit)),
              Tab(icon: Icon(Icons.directions_bike)),
            ],
          ),
        ),
        body: const Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            StatTable(),
            Expanded(
              child: TabBarView(
                children: [
                  EquipPage(),
                  Icon(Icons.directions_transit),
                  Icon(Icons.directions_bike),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}