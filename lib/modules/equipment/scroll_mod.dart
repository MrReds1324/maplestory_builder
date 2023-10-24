import 'package:flutter/material.dart';
import 'package:maplestory_builder/constants/constants.dart';
import 'package:maplestory_builder/constants/equipment/scroll_stats.dart';
import 'package:maplestory_builder/modules/equipment/equips.dart';
import 'package:maplestory_builder/modules/utilities/utilities.dart';

class ScrollModule {
  final int totalScrollSlots;
  final int scrollOffset;
  int usedScrollSlots;
  List<BaseScroll> usedScrolls;
  SavedScrolledRange? editingScroll;
  

  Map<StatType, int> moduleStats;

  ScrollModule({
    required this.totalScrollSlots,
    required this.scrollOffset,
    this.usedScrollSlots = 0,
    List<BaseScroll>? usedScrolls,
    Map<StatType, int>? moduleStats,
  }) : 
  usedScrolls = usedScrolls ?? [], 
  moduleStats = moduleStats ?? {};

  ScrollModule copyWith({
    int? totalScrollSlots,
    int? scrollOffset,
    int? usedScrollSlots,
    List<BaseScroll>? usedScrolls,
    Map<StatType, int>? moduleStats,
  }) {
    return ScrollModule(
      totalScrollSlots: totalScrollSlots ?? this.totalScrollSlots,
      scrollOffset: scrollOffset ?? this.scrollOffset,
      usedScrollSlots: usedScrollSlots ?? this.usedScrollSlots,
      usedScrolls: usedScrolls ?? deepCopyScrollsList(this.usedScrolls),
      moduleStats: moduleStats ?? Map<StatType, int>.from(this.moduleStats),
    );
  }

  int get(StatType statType) {
    return moduleStats[statType] ?? 0;
  }

  void addScrollByName(ScrollName editingScrollName) {
    var editingScrollValue = allScrolls[editingScrollName];
    if (editingScrollValue != null) {
      addEditingScroll(editingScrollValue);
    }
  }

  void addEditingScroll(BaseScroll baseScroll) {
    // Scroll with range means we have selected a new scroll to edit
    if (baseScroll is ScrollWithRange) {
      if (baseScroll.slotCost > (totalScrollSlots - usedScrollSlots)) {
        return;
      }
      clearEditingScroll();
      editingScroll = SavedScrolledRange(
        scrollStats: baseScroll.getScrollStartingStats(),
        scrollName: baseScroll.scrollName, 
        slotCost: baseScroll.slotCost,
      );
      editingScroll!.isEditing = true;
      addScroll(editingScroll!);
    }
    else if (baseScroll is SavedScrolledRange) {
      clearEditingScroll();
      editingScroll = baseScroll;
      editingScroll!.isEditing = true;
    }
    else {
      addScroll(baseScroll);
    }
  }

  void addScroll(BaseScroll baseScroll) {
    if (baseScroll.slotCost > (totalScrollSlots - usedScrollSlots)) {
      return;
    }
    usedScrollSlots += baseScroll.slotCost;
    if (baseScroll is SavedScrolledRange) {
      usedScrolls.add(baseScroll);
    }
    else {
      usedScrolls.add(
        SavedScroll(
          scrollName: baseScroll.scrollName,
          slotCost: baseScroll.slotCost,
        )
      );
    }
    calculateModuleStats();
  }

  void deleteScroll(BaseScroll deletingScroll) {
    usedScrollSlots -= deletingScroll.slotCost;
    if (deletingScroll == editingScroll) {
      editingScroll = null;
    }
    usedScrolls.remove(deletingScroll);
    calculateModuleStats();
  }

  void clearEditingScroll() {
    editingScroll?.isEditing = false;
    editingScroll = null;
  }

  List<MapEntry<StatType, ScrollRange>> getEditingScrollStats() {
    var selectedScroll = allScrolls[editingScroll?.scrollName];
    return selectedScroll is ScrollWithRange ? selectedScroll.scrollStats.entries.toList() : [];
  }

  double getEditingScrollStatsValue(StatType statType) {
    if (editingScroll != null) {
      return editingScroll!.scrollStats[statType]!.toDouble();
    }
    else {
      return 0;
    }
  }

  void updateEditingScrollStatsValue(StatType statType, double statValue) {
    if (editingScroll != null) {
      editingScroll!.scrollStats[statType] = statValue.toInt();
      calculateModuleStats();
    }
  }

  void calculateModuleStats() {
    moduleStats = {};

    void calculateScroll(BaseScroll baseScroll) {
      Map<StatType, int> scrollStats = {};
      if (baseScroll is SavedScrolledRange) {
        scrollStats = baseScroll.scrollStats;
      }
      else if (baseScroll is SavedScroll) {
        var selectedScroll = allScrolls[baseScroll.scrollName];
        if (selectedScroll is StaticScroll) {
          scrollStats = selectedScroll.scrollStats;
        }
        else if (selectedScroll is Scroll) {
          scrollStats = selectedScroll.scrollStats[scrollOffset];
        }
      }

      scrollStats.forEach((key, value) { 
        moduleStats[key] = (moduleStats[key] ?? 0) + value;
      });
      
    }

    for (BaseScroll scroll in usedScrolls) {
      calculateScroll(scroll);
    }
  }
}

int getScrollOffsetFromItemLevel(int itemLevel) {
  if (itemLevel <= 74) { // 0-74
    return INDEX_0;
  }
  else if (itemLevel <= 114) { // 75-114
    return INDEX_75;
  }
  else { // 115+
    return INDEX_115;
  }
}

List<ScrollName> getScrollsListForEquip(Equip? editingEquip) {
  List<ScrollName> filteredList;
  switch(editingEquip?.equipType) {
    case EquipType.hat:
    case EquipType.overall:
    case EquipType.top:
    case EquipType.bottom:
    case EquipType.shoes:
    case EquipType.cape:
    case EquipType.badge:
      filteredList = chaosScrolls + armorOnlyScrolls + armorAndShoulderScrolls;
    case EquipType.gloves:
      filteredList = chaosScrolls + gloveScrolls + armorOnlyScrolls + armorAndShoulderScrolls;
    case EquipType.shoulder:
      filteredList = chaosScrolls + armorAndShoulderScrolls;
    case EquipType.face:
    case EquipType.eye:
    case EquipType.ring:
    case EquipType.pendant:
    case EquipType.belt:
      filteredList = chaosScrolls + accessoryScrolls;
    case EquipType.earrings:
      filteredList = chaosScrolls + accessoryScrolls + earringOnly;
    case EquipType.weapon:
    case EquipType.secondary:
    case EquipType.shield:
    case EquipType.katara:
      filteredList = chaosScrolls + weaponScrolls;
    case EquipType.heart:
      filteredList = chaosScrolls + heartScrolls;
    default:
      return [];
  }

  return filteredList;
}

Color? getScrollEditingColor(BaseScroll? baseScroll) {
  if (baseScroll != null && baseScroll is SavedScrolledRange) {
    return baseScroll.isEditing ? Colors.greenAccent : null;
  }
  return null;
}