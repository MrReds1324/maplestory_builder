import 'package:flutter/material.dart';
import 'package:maplestory_builder/pages/consumables_page/consumables_page.dart';
import 'package:maplestory_builder/pages/equip_page/equip_page.dart';
import 'package:maplestory_builder/pages/familiars_page/familiar_page.dart';
import 'package:maplestory_builder/pages/hexa_stats_page/hexa_stats_page.dart';
import 'package:maplestory_builder/pages/legion_artifact_page/legion_artifact_page.dart';
import 'package:maplestory_builder/pages/legion_page/legion_page.dart';
import 'package:maplestory_builder/pages/misc_stats_page/misc_stats_page.dart';
import 'package:maplestory_builder/pages/settings_page/settings_page.dart';
import 'package:maplestory_builder/pages/skills_page/skills_page.dart';
import 'package:maplestory_builder/pages/stats_bar/statsblock.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({required this.title, super.key});

  final String title;

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 9,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          title: Text(title),
          bottom: TabBar(
            tabs: [
              Tab(icon: Icon(MdiIcons.shieldEdit)),
              Tab(icon: Icon(MdiIcons.accountEdit)),
              Tab(icon: Icon(MdiIcons.puzzleEdit)),
              Tab(icon: Icon(MdiIcons.puzzleEditOutline)),
              Tab(icon: Icon(MdiIcons.bookEdit)),
              Tab(icon: Icon(MdiIcons.vectorPolylineEdit)),
              Tab(icon: hexagonEdit),
              Tab(icon: Icon(MdiIcons.bottleTonicPlus)),
              Tab(icon: Icon(MdiIcons.cog)),
            ],
          ),
          actions: [
            IconButton(
                onPressed: () => (), icon: Icon(MdiIcons.contentSaveAll)),
            IconButton(onPressed: () => (), icon: Icon(MdiIcons.import))
          ],
        ),
        body: const Row(
          children: [
            StatTable(),
            Expanded(
              child: TabBarView(
                children: [
                  EquipPage(),
                  MiscStatsPage(),
                  LegionPage(),
                  LegionArtifactPage(),
                  FamiliarPage(),
                  SkillsPage(),
                  HexaStatsPage(),
                  ConsumablesPage(),
                  SettingsPage(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

Widget hexagonEdit = Stack(
  children: [
    Icon(MdiIcons.hexagonOutline),
    Positioned(top: 10, left: 1, child: Icon(MdiIcons.pencil, size: 15))
  ],
);
