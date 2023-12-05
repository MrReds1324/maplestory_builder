import 'package:flutter/material.dart';
import 'package:maplestory_builder/constants/constants.dart';
import 'package:maplestory_builder/constants/equipment/scroll_stats.dart';
import 'package:maplestory_builder/modules/equipment/equips.dart';
import 'package:maplestory_builder/modules/utilities/utilities.dart';

class ScrollModule {
  final int totalScrollSlots;
  final int scrollOffset;
  int usedScrollSlots;
  List<AbstractScroll> usedScrolls;
  SavedScrolledRange? editingScroll;
  
  Map<StatType, int> moduleStats;

  ScrollModule({
    required this.totalScrollSlots,
    required this.scrollOffset,
    this.usedScrollSlots = 0,
    List<AbstractScroll>? usedScrolls,
    Map<StatType, int>? moduleStats,
  }) : 
  usedScrolls = usedScrolls ?? [], 
  moduleStats = moduleStats ?? {};

  ScrollModule copyWith({
    int? totalScrollSlots,
    int? scrollOffset,
    int? usedScrollSlots,
    List<AbstractScroll>? usedScrolls,
    Map<StatType, int>? moduleStats,
  }) {
    return ScrollModule(
      totalScrollSlots: totalScrollSlots ?? this.totalScrollSlots,
      scrollOffset: scrollOffset ?? this.scrollOffset,
      usedScrollSlots: usedScrollSlots ?? this.usedScrollSlots,
      usedScrolls: usedScrolls ?? listDeepCopy(this.usedScrolls),
      moduleStats: moduleStats ?? Map<StatType, int>.from(this.moduleStats),
    );
  }

  int get(StatType statType) {
    return moduleStats[statType] ?? 0;
  }

  void addScrollByName(ScrollName editingScrollName) {
    addEditingScroll(editingScrollName.createScrollObject());
  }

  void addEditingScroll(AbstractScroll scroll) {
    // Scroll with range means we have selected a new scroll to edit
    if (scroll is ScrollWithRange) {
      if (scroll.slotCost > (totalScrollSlots - usedScrollSlots)) {
        return;
      }
      clearEditingScroll();
      editingScroll = SavedScrolledRange(
        scrollStats: scroll.getScrollStartingStats(),
        scrollName: scroll.scrollName, 
        slotCost: scroll.slotCost,
      );
      editingScroll!.isEditing = true;
      addScroll(editingScroll!);
    }
    else if (scroll is SavedScrolledRange) {
      clearEditingScroll();
      editingScroll = scroll;
      editingScroll!.isEditing = true;
    }
    else {
      addScroll(scroll);
    }
  }

  void addScroll(AbstractScroll scroll) {
    if (scroll.slotCost > (totalScrollSlots - usedScrollSlots)) {
      return;
    }
    usedScrollSlots += scroll.slotCost;
    if (scroll is SavedScrolledRange) {
      usedScrolls.add(scroll);
    }
    else {
      usedScrolls.add(
        SavedScroll(
          scrollName: scroll.scrollName,
          slotCost: scroll.slotCost,
        )
      );
    }
    calculateModuleStats();
  }

  void deleteScroll(AbstractScroll deletingScroll) {
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
    var selectedScroll = editingScroll?.scrollName.createScrollObject();
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

    void calculateScroll(AbstractScroll scroll) {
      Map<StatType, int> scrollStats = {};
      if (scroll is SavedScrolledRange) {
        scrollStats = scroll.scrollStats;
      }
      else if (scroll is SavedScroll) {
        if (scroll.scrollName.scrollType == StaticScroll) {
          scrollStats = scroll.scrollName.scrollStats;
        }
        else if (scroll.scrollName.scrollType == Scroll) {
          scrollStats = scroll.scrollName.scrollStats[scrollOffset];
        }
      }

      scrollStats.forEach((key, value) { 
        moduleStats[key] = (moduleStats[key] ?? 0) + value;
      });
      
    }

    for (AbstractScroll scroll in usedScrolls) {
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
  switch(editingEquip?.equipName.equipType) {
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

Color? getScrollEditingColor(AbstractScroll? baseScroll) {
  if (baseScroll != null && baseScroll is SavedScrolledRange) {
    return baseScroll.isEditing ? Colors.greenAccent : null;
  }
  return null;
}