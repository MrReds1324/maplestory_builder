// ignore_for_file: constant_identifier_names

import 'package:flutter/material.dart';
import 'package:maplestory_builder/constants/constants.dart';
import 'package:maplestory_builder/modules/equipment/scroll_mod.dart';

enum ScrollName {
  // Pet Equipment Scrolls
  premiumPetAtt100(formattedName: "Premium Scroll for Pet Equip for Attack Power 100%"),
  premiumPetMatt100(formattedName: "Premium Scroll for Pet Equip for Magic Attack 100%"),
  petAtt100(formattedName: "Scroll for Pet Equip for Attack Power 100%"),
  petMatt100(formattedName: "Scroll for Pet Equip for Magic Attack 100%"),
  petAtt70(formattedName: "Scroll for Pet Equip for Attack Power 70%"),
  petMatt70(formattedName: "Scroll for Pet Equip for Magic Attack 70%"),
  miraclePetAtt50(formattedName: "Miracle Scroll for Pet Equip for Attack Power 50%"),
  miraclePetMatt50(formattedName: "Miracle Scroll for Pet Equip for Magic Attack 50%"),
  petSpeed100(formattedName: "Scroll for Pet Equip for Speed 100%"),
  petSpeed10(formattedName: "Scroll for Pet Equip for Speed 10%"),
  petJump100(formattedName: "Scroll for Pet Equip for Jump 100%"),
  petJump10(formattedName: "Scroll for Pet Equip for Jump 10%"),
  // Chaos Scrolls
  incredibleChaosScrollOfGoodness(formattedName: "Incredible Chaos Scroll of Goodness"),
  chaosScrollOfGoodness(formattedName: "Chaos Scroll of Goodness"),
  miraculousChaosScroll(formattedName: "Miraculous Chaos Scroll"),
  chaosScroll(formattedName: "Chaos Scroll"),
  // Armor only
  miracleArmorAtt50(formattedName: "Miracle Scroll for Attack Power 50%"),
  miracleArmorMatt50(formattedName: "Miracle Scroll for Magic Attack 50%"),
  armorAtt70(formattedName: "Armor Scroll for Attack Power 70%"),
  armorMatt70(formattedName: "Armor Scroll for Magic Attack 70%"),
  // Armor and Shoulder
  armorAndShoulderStr100(formattedName: "STR 100%"),
  armorAndShoulderStr70(formattedName: "STR 70%"),
  armorAndShoulderStr30(formattedName: "STR 30%"),
  armorAndShoulderStr15(formattedName: "STR 15%"),
  armorAndShoulderDex100(formattedName: "DEX 100%"),
  armorAndShoulderDex70(formattedName: "DEX 70%"),
  armorAndShoulderDex30(formattedName: "DEX 30%"),
  armorAndShoulderDex15(formattedName: "DEX 15%"),
  armorAndShoulderInt100(formattedName: "INT 100%"),
  armorAndShoulderInt70(formattedName: "INT 70%"),
  armorAndShoulderInt30(formattedName: "INT 30%"),
  armorAndShoulderInt15(formattedName: "INT 15%"),
  armorAndShoulderLuk100(formattedName: "LUK 100%"),
  armorAndShoulderLuk70(formattedName: "LUK 70%"),
  armorAndShoulderLuk30(formattedName: "LUK 30%"),
  armorAndShoulderLuk15(formattedName: "LUK 15%"),
  armorAndShoulderAllStat30(formattedName: "All Stats 30%"),
  armorAndShoulderAllStat15(formattedName: "All Stats 15%"),
  armorAndShoulderHP100(formattedName: "HP 100%"),
  armorAndShoulderHP70(formattedName: "HP 70%"),
  armorAndShoulderHP30(formattedName: "HP 30%"),
  armorAndShoulderHP15(formattedName: "HP 15%"),
  // Gloves
  glovesAtt100(formattedName: "Attack Power 100%"),
  glovesAtt70(formattedName: "Attack Power 70%"),
  glovesAtt30(formattedName: "Attack Power 30%"),
  glovesAtt15(formattedName: "Attack Power 15%"),
  glovesMatt100(formattedName: "Magic Attack 100%"),
  glovesMatt70(formattedName: "Magic Attack 70%"),
  glovesMatt30(formattedName: "Magic Attack 30%"),
  glovesMatt15(formattedName: "Magic Attack 15%"),
  // Dominator
  fragmentOfDistortedTime(formattedName: "Fragment of Distorted Time"),
  // Superior/Reinforced Gollux
  advancedGolluxScroll(formattedName: "Advanced Gollux Scroll"),
  // Solid/Cracked Gollux
  basicGolluxScroll(formattedName: "Basic Gollux Scroll"),
  // Masteria 
  // Glona's Heart, Delgrunds Honor, and Numenal's Willpower
  masteriaGrandmasterScroll(formattedName: "Masteria Grandmaster Accessory Exclusive Enhancement Scroll"),
  // Legacy of Light/Darkness
  legacyOfLightAndDarknessScroll(formattedName: "Legacy of Light／Darkness Exclusive Enhancement Scroll"),
  // Chaos Horntail/Horntail Pendandt
  dragonStone(formattedName: "Dragon Stone"),
  // Accessory
  // Earring Only
  earringInt10(formattedName: "Scroll for Earring for INT 10%"),
  accessoryStr100(formattedName: "STR 100%"),
  accessoryStr70(formattedName: "STR 70%"),
  accessoryStr30(formattedName: "STR 30%"),
  accessoryDex100(formattedName: "DEX 100%"),
  accessoryDex70(formattedName: "DEX 70%"),
  accessoryDex30(formattedName: "DEX 30%"),
  accessoryInt100(formattedName: "INT 100%"),
  accessoryInt70(formattedName: "INT 70%"),
  accessoryInt30(formattedName: "INT 30%"),
  accessoryLuk100(formattedName: "LUK 100%"),
  accessoryLuk70(formattedName: "LUK 70%"),
  accessoryLuk30(formattedName: "LUK 30%"),
  accessoryAllStat30(formattedName: "All Stats 30%"),
  accessoryHP100(formattedName: "HP 100%"),
  accessoryHP70(formattedName: "HP 70%"),
  accessoryHP30(formattedName: "HP 30%"),
  premiumAccessoryAtt(formattedName: "Premium Accessory Scroll for Attack Power"),
  premiumAccessoryMatt(formattedName: "Premium Accessory Scroll for Magic Attack"),
  miracleAccessoryAtt50(formattedName: "Miracle Scroll for Accessory for Attack Power 50%"),
  miracleAccessoryMatt50(formattedName: "Miracle Scroll for Accessory for Magic Attack 50%"),
  accessoryAtt(formattedName: "Accessory Scroll for Attack Power"),
  accessoryMatt(formattedName: "Accessory Scroll for Magic Attack"),
  accessoryAtt70(formattedName: "Accessory Scroll for Attack Power 70%"),
  accessoryMatt70(formattedName: "Accessory Scroll for Magic Attack 70%"),
  // Hearts
  heartAtt100(formattedName: "Attack Power 100%"),
  heartAtt70(formattedName: "Attack Power 70%"),
  heartAtt30(formattedName: "Attack Power 30%"),
  heartMatt100(formattedName: "Magic Attack 100%"),
  heartMatt70(formattedName: "Magic Attack 70%"),
  heartMatt30(formattedName: "Magic Attack 30%"),
  // Weapons
  weaponAttStr100(formattedName: "Attack Power (STR) 100%"),
  weaponAttStr70(formattedName: "Attack Power (STR) 70%"),
  weaponAttStr30(formattedName: "Attack Power (STR) 30%"),
  weaponAttStr15(formattedName: "Attack Power (STR) 15%"),
  weaponAttDex100(formattedName: "Attack Power (DEX) 100%"),
  weaponAttDex70(formattedName: "Attack Power (DEX) 70%"),
  weaponAttDex30(formattedName: "Attack Power (DEX) 30%"),
  weaponAttDex15(formattedName: "Attack Power (DEX) 15%"),
  weaponMattInt100(formattedName: "Magic Attack (INT) 100%"),
  weaponMattInt70(formattedName: "Magic Attack (INT) 70%"),
  weaponMattInt30(formattedName: "Magic Attack (INT) 30%"),
  weaponMattInt15(formattedName: "Magic Attack (INT) 15%"),
  weaponAttLuk100(formattedName: "Attack Power (LUK) 100%"),
  weaponAttLuk70(formattedName: "Attack Power (LUK) 70%"),
  weaponAttLuk30(formattedName: "Attack Power (LUK) 30%"),
  weaponAttLuk15(formattedName: "Attack Power (LUK) 15%"),
  weaponAttHP100(formattedName: "Attack Power (HP) 100%"),
  weaponAttHP70(formattedName: "Attack Power (HP) 70%"),
  weaponAttHP30(formattedName: "Attack Power (HP) 30%"),
  weaponAttHP15(formattedName: "Attack Power (HP) 15%"),
  magicalWeaponAtt50(formattedName: "Magical Scroll for Attack Power 50%"),
  magicalWeaponMatt50(formattedName: "Magical Scroll for Magic Attack 50%"),
  miracleWeaponAtt50(formattedName: "Miracle Scroll for Attack Power 50%"),
  miracleWeaponMatt50(formattedName: "Miracle Scroll for Magic Attack 50%"),
  ;

  const ScrollName({
    required this.formattedName
  });

  final String formattedName;
}

const INDEX_0 = 0; // 0-74
const INDEX_75 = 1; // 75-114
const INDEX_115 = 2; // 115+

abstract class BaseScroll {
  final ScrollName scrollName;
  final int slotCost;

  const BaseScroll({
    required this.scrollName,
    this.slotCost = 1,
  });

  Widget createScrollContainer(BuildContext context, int? itemLevel);
}

class Scroll extends BaseScroll {
  final List<Map<StatType, int>> scrollStats;

  const Scroll({
    required super.scrollName,
    required this.scrollStats,
    super.slotCost = 1,
  });

  @override
  Widget createScrollContainer(BuildContext context, int? itemLevel) {
    var scrollOffset = getScrollOffsetFromItemLevel(itemLevel ?? 0);

    List<Widget> createTextLines(BuildContext context) {
      List<Widget> childrenRows = [
        Text(
          scrollName.formattedName,
          style: Theme.of(context).textTheme.bodyLarge?.copyWith(decoration: TextDecoration.underline),
        ),
      ];
      
      scrollStats[scrollOffset].forEach((key, value) {
        childrenRows.add(
          Text(
            "${key.formattedName}: +$value",
            style: Theme.of(context).textTheme.bodyMedium,
          ),
        );
      });

      return childrenRows;
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: createTextLines(context)
    );
  }
}

class StaticScroll extends BaseScroll {
  final Map<StatType, int> scrollStats;

  const StaticScroll({
    required super.scrollName,
    required this.scrollStats,
    super.slotCost = 1,
  });

  @override
  Widget createScrollContainer(BuildContext context, int? itemLevel) {

    List<Widget> createTextLines(BuildContext context) {
      List<Widget> childrenRows = [
        Text(
          scrollName.formattedName,
          style: Theme.of(context).textTheme.bodyLarge?.copyWith(decoration: TextDecoration.underline),
        ),
      ];
      
      scrollStats.forEach((key, value) {
        childrenRows.add(
          Text(
            "${key.formattedName}: +$value",
            style: Theme.of(context).textTheme.bodyMedium,
          ),
        );
      });

      return childrenRows;
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: createTextLines(context)
    );
  }
}

class ScrollWithRange extends BaseScroll {
  final Map<StatType, ScrollRange> scrollStats;

  const ScrollWithRange({
    required super.scrollName,
    required this.scrollStats,
    super.slotCost = 1,
  });

  Map<StatType, int> getScrollStartingStats() {
    Map<StatType, int> scrollStartingStats = {};

    scrollStats.forEach((key, value) { 
      scrollStartingStats[key] = value.minRange.toInt();
    });

    return scrollStartingStats;
  }

  @override
  Widget createScrollContainer(BuildContext context, int? itemLevel) {

    List<Widget> createTextLines(BuildContext context) {
      List<Widget> childrenRows = [
        Text(
          scrollName.formattedName,
          style: Theme.of(context).textTheme.bodyLarge?.copyWith(decoration: TextDecoration.underline),
        )
      ];
      
      scrollStats.forEach((key, value) {
        childrenRows.add(
          Text(
            "${key.formattedName}: ${value.minRange >=0 ? '+': ''}${value.minRange.toInt()} to ${value.maxRange >=0 ? '+': ''}${value.maxRange.toInt()}",
            style: Theme.of(context).textTheme.bodyMedium,
          ),
        );
      });

      return childrenRows;
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: createTextLines(context)
    );
  }
}

class SavedScrolledRange extends BaseScroll {
  Map<StatType, int> scrollStats;
  bool isEditing = false;

  SavedScrolledRange({
    required super.scrollName,
    Map<StatType, int>? scrollStats,
    super.slotCost = 1,
  }) : scrollStats = scrollStats ?? {};

  SavedScrolledRange copyWith({
    ScrollName? scrollName,
    Map<StatType, int>? scrollStats,
    int? slotCost,
  }) {
    return SavedScrolledRange(
      scrollName: scrollName ?? this.scrollName, 
      scrollStats: scrollStats ?? this.scrollStats,
      slotCost: slotCost ?? this.slotCost,
    );
  }

  @override
  Widget createScrollContainer(BuildContext context, int? itemLevel) {

    List<Widget> createTextLines(BuildContext context) {
      List<Widget> childrenRows = [
        Text(
          scrollName.formattedName,
          style: Theme.of(context).textTheme.bodyLarge?.copyWith(decoration: TextDecoration.underline),
        ),
      ];
      
      scrollStats.forEach((key, value) {
        childrenRows.add(
          Text(
            "${key.formattedName}: +$value",
            style: Theme.of(context).textTheme.bodyMedium,
          ),
        );
      });

      return childrenRows;
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: createTextLines(context)
    );
  }
}

class SavedScroll extends BaseScroll {

  SavedScroll({
    required super.scrollName,
    super.slotCost = 1,
  });

  SavedScroll copyWith({
    ScrollName? scrollName,
    int? slotCost,
  }) {
    return SavedScroll(
      scrollName: scrollName ?? this.scrollName, 
      slotCost: slotCost ?? this.slotCost,
    );
  }

  @override
  Widget createScrollContainer(BuildContext context, int? itemLevel) {
    return allScrolls[scrollName]!.createScrollContainer(context, itemLevel);
  }
}

class ScrollRange {
  final double minRange;
  final double maxRange;
  final int divisions;

  const ScrollRange({
    this.minRange = 0,
    this.maxRange = 0,
    this.divisions = 1,
  });
}

// Pet Equipment Scrolls
const List<ScrollName> petScrolls = [
  ScrollName.premiumPetAtt100,
  ScrollName.premiumPetMatt100,
  ScrollName.petAtt100,
  ScrollName.petMatt100,
  ScrollName.petAtt70,
  ScrollName.petMatt70,
  ScrollName.miraclePetAtt50,
  ScrollName.miraclePetMatt50,
  ScrollName.petSpeed100,
  ScrollName.petSpeed10,
  ScrollName.petJump100,
  ScrollName.petJump10,
];

// Chaos Scrolls
const List<ScrollName> chaosScrolls = [
  ScrollName.incredibleChaosScrollOfGoodness,
  ScrollName.chaosScrollOfGoodness,
  ScrollName.miraculousChaosScroll,
  ScrollName.chaosScroll,
];

// Armor
const List<ScrollName> armorOnlyScrolls = [
  ScrollName.miracleArmorAtt50,
  ScrollName.miracleArmorMatt50,
  ScrollName.armorAtt70,
  ScrollName.armorMatt70,
];

// Armor + Shoulder
const List<ScrollName> armorAndShoulderScrolls = [
  ScrollName.armorAndShoulderStr100,
  ScrollName.armorAndShoulderStr70,
  ScrollName.armorAndShoulderStr30,
  ScrollName.armorAndShoulderStr15,
  ScrollName.armorAndShoulderDex100,
  ScrollName.armorAndShoulderDex70,
  ScrollName.armorAndShoulderDex30,
  ScrollName.armorAndShoulderDex15,
  ScrollName.armorAndShoulderInt100,
  ScrollName.armorAndShoulderInt70,
  ScrollName.armorAndShoulderInt30,
  ScrollName.armorAndShoulderInt15,
  ScrollName.armorAndShoulderLuk100,
  ScrollName.armorAndShoulderLuk70,
  ScrollName.armorAndShoulderLuk30,
  ScrollName.armorAndShoulderLuk15,
  ScrollName.armorAndShoulderAllStat30,
  ScrollName.armorAndShoulderAllStat15,
  ScrollName.armorAndShoulderHP100,
  ScrollName.armorAndShoulderHP70,
  ScrollName.armorAndShoulderHP30,
  ScrollName.armorAndShoulderHP15,
];

// Gloves
const List<ScrollName> gloveScrolls = [
  ScrollName.glovesAtt100,
  ScrollName.glovesAtt70,
  ScrollName.glovesAtt30,
  ScrollName.glovesAtt15,
  ScrollName.glovesMatt100,
  ScrollName.glovesMatt70,
  ScrollName.glovesMatt30,
  ScrollName.glovesMatt15,
];

// Accessories
// Earring only
const List<ScrollName> earringOnly = [
  ScrollName.earringInt10,
];
const List<ScrollName> accessoryScrolls = [
  ScrollName.accessoryStr100,
  ScrollName.accessoryStr70,
  ScrollName.accessoryStr30,
  ScrollName.accessoryDex100,
  ScrollName.accessoryDex70,
  ScrollName.accessoryDex30,
  ScrollName.accessoryInt100,
  ScrollName.accessoryInt70,
  ScrollName.accessoryInt30,
  ScrollName.accessoryLuk100,
  ScrollName.accessoryLuk70,
  ScrollName.accessoryLuk30,
  ScrollName.accessoryAllStat30,
  ScrollName.accessoryHP100,
  ScrollName.accessoryHP70,
  ScrollName.accessoryHP30,
  ScrollName.premiumAccessoryAtt,
  ScrollName.premiumAccessoryMatt,
  ScrollName.miracleAccessoryAtt50,
  ScrollName.miracleAccessoryMatt50,
  ScrollName.accessoryAtt,
  ScrollName.accessoryMatt,
  ScrollName.accessoryAtt70,
  ScrollName.accessoryMatt70,

  
];

// Hearts
const List<ScrollName> heartScrolls = [
  ScrollName.heartAtt100,
  ScrollName.heartAtt70,
  ScrollName.heartAtt30,
  ScrollName.heartMatt100,
  ScrollName.heartMatt70,
  ScrollName.heartMatt30,
];

// Weapons
const List<ScrollName> weaponScrolls = [
  ScrollName.weaponAttStr100,
  ScrollName.weaponAttStr70,
  ScrollName.weaponAttStr30,
  ScrollName.weaponAttStr15,
  ScrollName.weaponAttDex100,
  ScrollName.weaponAttDex70,
  ScrollName.weaponAttDex30,
  ScrollName.weaponAttDex15,
  ScrollName.weaponMattInt100,
  ScrollName.weaponMattInt70,
  ScrollName.weaponMattInt30,
  ScrollName.weaponMattInt15,
  ScrollName.weaponAttLuk100,
  ScrollName.weaponAttLuk70,
  ScrollName.weaponAttLuk30,
  ScrollName.weaponAttLuk15,
  ScrollName.weaponAttHP100,
  ScrollName.weaponAttHP70,
  ScrollName.weaponAttHP30,
  ScrollName.weaponAttHP15,
  ScrollName.magicalWeaponAtt50,
  ScrollName.magicalWeaponMatt50,
  ScrollName.miracleWeaponAtt50,
  ScrollName.miracleWeaponMatt50,
];

const Map<ScrollName, BaseScroll> allScrolls = {
  // Pet Equipment Scrolls
  ScrollName.premiumPetAtt100: ScrollWithRange(
    scrollName: ScrollName.premiumPetAtt100, 
    scrollStats: {
      StatType.attack: ScrollRange(minRange: 4, maxRange: 5, divisions: 1)
    }
  ),
  ScrollName.premiumPetMatt100: ScrollWithRange(
    scrollName: ScrollName.premiumPetMatt100, 
    scrollStats: {
      StatType.mattack: ScrollRange(minRange: 4, maxRange: 5, divisions: 1)
    }
  ),
  ScrollName.petAtt100: ScrollWithRange(
    scrollName: ScrollName.petAtt100, 
    scrollStats: {
      StatType.attack: ScrollRange(minRange: 2, maxRange: 4, divisions: 2)
    }
  ),
  ScrollName.petMatt100: ScrollWithRange(
    scrollName: ScrollName.petMatt100, 
    scrollStats: {
      StatType.mattack: ScrollRange(minRange: 2, maxRange: 4, divisions: 2)
    }
  ),
  ScrollName.petAtt70: ScrollWithRange(
    scrollName: ScrollName.petAtt70, 
    scrollStats: {
      StatType.attack: ScrollRange(minRange: 1, maxRange: 2, divisions: 1)
    }
  ),
  ScrollName.petMatt70: ScrollWithRange(
    scrollName: ScrollName.petMatt70, 
    scrollStats: {
      StatType.mattack: ScrollRange(minRange: 1, maxRange: 2, divisions: 1)
    }
  ),
  ScrollName.miraclePetAtt50: ScrollWithRange(
    scrollName: ScrollName.miraclePetAtt50, 
    scrollStats: {
      StatType.attack: ScrollRange(minRange: 1, maxRange: 4, divisions: 3)
    }
  ),
  ScrollName.miraclePetMatt50: ScrollWithRange(
    scrollName: ScrollName.miraclePetMatt50, 
    scrollStats: {
      StatType.mattack: ScrollRange(minRange: 1, maxRange: 4, divisions: 3)
    }
  ),
  ScrollName.petSpeed100: StaticScroll(
    scrollName: ScrollName.petSpeed100, 
    scrollStats: {
      StatType.speed: 1
    }
  ),
  ScrollName.petSpeed10: StaticScroll(
    scrollName: ScrollName.petSpeed10, 
    scrollStats: {
      StatType.speed: 3
    }
  ),
  ScrollName.petJump100: StaticScroll(
    scrollName: ScrollName.petJump100, 
    scrollStats: {
      StatType.jump: 1
    }
  ),
  ScrollName.petJump10: StaticScroll(
    scrollName: ScrollName.petJump10, 
    scrollStats: {
      StatType.jump: 3
    }
  ),
  // Chaos Scrolls
  ScrollName.incredibleChaosScrollOfGoodness: ScrollWithRange(
    scrollName: ScrollName.incredibleChaosScrollOfGoodness, 
    scrollStats: {
      StatType.str: ScrollRange(maxRange: 6, divisions: 6),
      StatType.dex: ScrollRange(maxRange: 6, divisions: 6),
      StatType.int: ScrollRange(maxRange: 6, divisions: 6),
      StatType.luk: ScrollRange(maxRange: 6, divisions: 6),
      StatType.attack: ScrollRange(maxRange: 6, divisions: 6),
      StatType.mattack: ScrollRange(maxRange: 6, divisions: 6),
      StatType.hp: ScrollRange(maxRange: 60, divisions: 6),
      StatType.mp: ScrollRange(maxRange: 60, divisions: 6),
    }
  ),
  ScrollName.chaosScrollOfGoodness: ScrollWithRange(
    scrollName: ScrollName.chaosScrollOfGoodness, 
    scrollStats: {
      StatType.str: ScrollRange(maxRange: 5, divisions: 5),
      StatType.dex: ScrollRange(maxRange: 5, divisions: 5),
      StatType.int: ScrollRange(maxRange: 5, divisions: 5),
      StatType.luk: ScrollRange(maxRange: 5, divisions: 5),
      StatType.attack: ScrollRange(maxRange: 5, divisions: 5),
      StatType.mattack: ScrollRange(maxRange: 5, divisions: 5),
      StatType.hp: ScrollRange(maxRange: 50, divisions: 5),
      StatType.mp: ScrollRange(maxRange: 50, divisions: 5),
    }
  ),
  ScrollName.miraculousChaosScroll: ScrollWithRange(
    scrollName: ScrollName.miraculousChaosScroll, 
    scrollStats: {
      StatType.str: ScrollRange(minRange: -6, maxRange: 6, divisions: 12),
      StatType.dex: ScrollRange(minRange: -6, maxRange: 6, divisions: 12),
      StatType.int: ScrollRange(minRange: -6, maxRange: 6, divisions: 12),
      StatType.luk: ScrollRange(minRange: -6, maxRange: 6, divisions: 12),
      StatType.attack: ScrollRange(minRange: -6, maxRange: 6, divisions: 12),
      StatType.mattack: ScrollRange(minRange: -6, maxRange: 6, divisions: 12),
      StatType.hp: ScrollRange(minRange: -60, maxRange: 60, divisions: 12),
      StatType.mp: ScrollRange(minRange: -60, maxRange: 60, divisions: 12),
    }
  ),
  ScrollName.chaosScroll: ScrollWithRange(
    scrollName: ScrollName.chaosScroll, 
    scrollStats: {
      StatType.str: ScrollRange(minRange: -5, maxRange: 5, divisions: 10),
      StatType.dex: ScrollRange(minRange: -5, maxRange: 5, divisions: 10),
      StatType.int: ScrollRange(minRange: -5, maxRange: 5, divisions: 10),
      StatType.luk: ScrollRange(minRange: -5, maxRange: 5, divisions: 10),
      StatType.attack: ScrollRange(minRange: -5, maxRange: 5, divisions: 10),
      StatType.mattack: ScrollRange(minRange: -5, maxRange: 5, divisions: 10),
      StatType.hp: ScrollRange(minRange: -50, maxRange: 50, divisions: 10),
      StatType.mp: ScrollRange(minRange: -50, maxRange: 50, divisions: 10),
    }
  ),
  // Armor only
  ScrollName.miracleArmorAtt50: ScrollWithRange(
    scrollName: ScrollName.miracleArmorAtt50, 
    scrollStats: {
      StatType.attack: ScrollRange(minRange: 2, maxRange: 3, divisions: 1),
    }
  ),
  ScrollName.miracleArmorMatt50: ScrollWithRange(
    scrollName: ScrollName.miracleArmorMatt50, 
    scrollStats: {
      StatType.mattack: ScrollRange(minRange: 2, maxRange: 3, divisions: 1),
    }
  ),
  ScrollName.armorAtt70: ScrollWithRange(
    scrollName: ScrollName.armorAtt70, 
    scrollStats: {
      StatType.attack: ScrollRange(minRange: 1, maxRange: 2, divisions: 1),
    }
  ),
  ScrollName.armorMatt70: ScrollWithRange(
    scrollName: ScrollName.armorMatt70, 
    scrollStats: {
      StatType.mattack: ScrollRange(minRange: 1, maxRange: 2, divisions: 1),
    }
  ),
  // Armor and Shoulder
  ScrollName.armorAndShoulderStr100: Scroll(
    scrollName: ScrollName.armorAndShoulderStr100, 
    scrollStats: [
      {StatType.str: 1, StatType.hp: 5, StatType.defense: 1}, 
      {StatType.str: 2, StatType.hp: 20, StatType.defense: 2}, 
      {StatType.str: 3, StatType.hp: 30, StatType.defense: 3}, 
    ]
  ),
  ScrollName.armorAndShoulderStr70: Scroll(
    scrollName: ScrollName.armorAndShoulderStr70, 
    scrollStats: [
      {StatType.str: 2, StatType.hp: 15, StatType.defense: 2}, 
      {StatType.str: 3, StatType.hp: 50, StatType.defense: 4}, 
      {StatType.str: 4, StatType.hp: 70, StatType.defense: 5}, 
    ]
  ),
  ScrollName.armorAndShoulderStr30: Scroll(
    scrollName: ScrollName.armorAndShoulderStr30, 
    scrollStats: [
      {StatType.str: 3, StatType.hp: 30, StatType.defense: 4}, 
      {StatType.str: 5, StatType.hp: 70, StatType.defense: 7}, 
      {StatType.str: 7, StatType.hp: 120, StatType.defense: 10}, 
    ]
  ),
  ScrollName.armorAndShoulderStr15: Scroll(
    scrollName: ScrollName.armorAndShoulderStr15, 
    scrollStats: [
      {StatType.str: 4, StatType.hp: 45, StatType.defense: 6}, 
      {StatType.str: 7, StatType.hp: 110, StatType.defense: 10}, 
      {StatType.str: 10, StatType.hp: 170, StatType.defense: 15}, 
    ]
  ),
  ScrollName.armorAndShoulderDex100: Scroll(
    scrollName: ScrollName.armorAndShoulderDex100, 
    scrollStats: [
      {StatType.dex: 1, StatType.hp: 5, StatType.defense: 1}, 
      {StatType.dex: 2, StatType.hp: 20, StatType.defense: 2}, 
      {StatType.dex: 3, StatType.hp: 30, StatType.defense: 3}, 
    ]
  ),
  ScrollName.armorAndShoulderDex70: Scroll(
    scrollName: ScrollName.armorAndShoulderDex70, 
    scrollStats: [
      {StatType.dex: 2, StatType.hp: 15, StatType.defense: 2}, 
      {StatType.dex: 3, StatType.hp: 50, StatType.defense: 4}, 
      {StatType.dex: 4, StatType.hp: 70, StatType.defense: 5}, 
    ]
  ),
  ScrollName.armorAndShoulderDex30: Scroll(
    scrollName: ScrollName.armorAndShoulderDex30, 
    scrollStats: [
      {StatType.dex: 3, StatType.hp: 30, StatType.defense: 4}, 
      {StatType.dex: 5, StatType.hp: 70, StatType.defense: 7}, 
      {StatType.dex: 7, StatType.hp: 120, StatType.defense: 10}, 
    ]
  ),
  ScrollName.armorAndShoulderDex15: Scroll(
    scrollName: ScrollName.armorAndShoulderDex15, 
    scrollStats: [
      {StatType.dex: 4, StatType.hp: 45, StatType.defense: 6}, 
      {StatType.dex: 7, StatType.hp: 110, StatType.defense: 10}, 
      {StatType.dex: 10, StatType.hp: 170, StatType.defense: 15}, 
    ]
  ),
  ScrollName.armorAndShoulderInt100: Scroll(
    scrollName: ScrollName.armorAndShoulderInt100, 
    scrollStats: [
      {StatType.int: 1, StatType.hp: 5, StatType.defense: 1}, 
      {StatType.int: 2, StatType.hp: 20, StatType.defense: 2}, 
      {StatType.int: 3, StatType.hp: 30, StatType.defense: 3}, 
    ]
  ),
  ScrollName.armorAndShoulderInt70: Scroll(
    scrollName: ScrollName.armorAndShoulderInt70, 
    scrollStats: [
      {StatType.int: 2, StatType.hp: 15, StatType.defense: 2}, 
      {StatType.int: 3, StatType.hp: 50, StatType.defense: 4}, 
      {StatType.int: 4, StatType.hp: 70, StatType.defense: 5}, 
    ]
  ),
  ScrollName.armorAndShoulderInt30: Scroll(
    scrollName: ScrollName.armorAndShoulderInt30, 
    scrollStats: [
      {StatType.int: 3, StatType.hp: 30, StatType.defense: 4}, 
      {StatType.int: 5, StatType.hp: 70, StatType.defense: 7}, 
      {StatType.int: 7, StatType.hp: 120, StatType.defense: 10}, 
    ]
  ),
  ScrollName.armorAndShoulderInt15: Scroll(
    scrollName: ScrollName.armorAndShoulderInt15, 
    scrollStats: [
      {StatType.int: 4, StatType.hp: 45, StatType.defense: 6}, 
      {StatType.int: 7, StatType.hp: 110, StatType.defense: 10}, 
      {StatType.int: 10, StatType.hp: 170, StatType.defense: 15}, 
    ]
  ),
  ScrollName.armorAndShoulderLuk100: Scroll(
    scrollName: ScrollName.armorAndShoulderLuk100, 
    scrollStats: [
      {StatType.luk: 1, StatType.hp: 5, StatType.defense: 1}, 
      {StatType.luk: 2, StatType.hp: 20, StatType.defense: 2}, 
      {StatType.luk: 3, StatType.hp: 30, StatType.defense: 3}, 
    ]
  ),
  ScrollName.armorAndShoulderLuk70: Scroll(
    scrollName: ScrollName.armorAndShoulderLuk70, 
    scrollStats: [
      {StatType.luk: 2, StatType.hp: 15, StatType.defense: 2}, 
      {StatType.luk: 3, StatType.hp: 50, StatType.defense: 4}, 
      {StatType.luk: 4, StatType.hp: 70, StatType.defense: 5}, 
    ]
  ),
  ScrollName.armorAndShoulderLuk30: Scroll(
    scrollName: ScrollName.armorAndShoulderLuk30, 
    scrollStats: [
      {StatType.luk: 3, StatType.hp: 30, StatType.defense: 4}, 
      {StatType.luk: 5, StatType.hp: 70, StatType.defense: 7}, 
      {StatType.luk: 7, StatType.hp: 120, StatType.defense: 10}, 
    ]
  ),
  ScrollName.armorAndShoulderLuk15: Scroll(
    scrollName: ScrollName.armorAndShoulderLuk15, 
    scrollStats: [
      {StatType.luk: 4, StatType.hp: 45, StatType.defense: 6}, 
      {StatType.luk: 7, StatType.hp: 110, StatType.defense: 10}, 
      {StatType.luk: 10, StatType.hp: 170, StatType.defense: 15}, 
    ]
  ),
  ScrollName.armorAndShoulderAllStat30: Scroll(
    scrollName: ScrollName.armorAndShoulderAllStat30, 
    scrollStats: [
      {StatType.allStats: 1, StatType.hp: 30, StatType.defense: 4}, 
      {StatType.allStats: 2, StatType.hp: 70, StatType.defense: 7}, 
      {StatType.allStats: 3, StatType.hp: 120, StatType.defense: 10}, 
    ]
  ),
  ScrollName.armorAndShoulderAllStat15: Scroll(
    scrollName: ScrollName.armorAndShoulderAllStat15, 
    scrollStats: [
      {StatType.allStats: 2, StatType.hp: 45, StatType.defense: 6}, 
      {StatType.allStats: 3, StatType.hp: 110, StatType.defense: 10}, 
      {StatType.allStats: 4, StatType.hp: 170, StatType.defense: 15}, 
    ]
  ),
  ScrollName.armorAndShoulderHP100: Scroll(
    scrollName: ScrollName.armorAndShoulderHP100, 
    scrollStats: [
      {StatType.hp: 55, StatType.defense: 1}, 
      {StatType.hp: 120, StatType.defense: 2}, 
      {StatType.hp: 180, StatType.defense: 3}, 
    ]
  ),
  ScrollName.armorAndShoulderHP70: Scroll(
    scrollName: ScrollName.armorAndShoulderHP70, 
    scrollStats: [
      {StatType.hp: 115, StatType.defense: 2}, 
      {StatType.hp: 190, StatType.defense: 4}, 
      {StatType.hp: 270, StatType.defense: 5}, 
    ]
  ),
  ScrollName.armorAndShoulderHP30: Scroll(
    scrollName: ScrollName.armorAndShoulderHP30, 
    scrollStats: [
      {StatType.hp: 180, StatType.defense: 4}, 
      {StatType.hp: 320, StatType.defense: 7}, 
      {StatType.hp: 470, StatType.defense: 10}, 
    ]
  ),
  ScrollName.armorAndShoulderHP15: Scroll(
    scrollName: ScrollName.armorAndShoulderHP15, 
    scrollStats: [
      {StatType.hp: 245, StatType.defense: 6}, 
      {StatType.hp: 460, StatType.defense: 10}, 
      {StatType.hp: 670, StatType.defense: 15}, 
    ]
  ),
  // Gloves
  ScrollName.glovesAtt100: Scroll(
    scrollName: ScrollName.glovesAtt100, 
    scrollStats: [
      {StatType.attack: 0},
      {StatType.attack: 1}, 
    ]
  ),
  ScrollName.glovesAtt70: Scroll(
    scrollName: ScrollName.glovesAtt70, 
    scrollStats: [
      {StatType.attack: 1},
      {StatType.attack: 2}, 
    ]
  ),
  ScrollName.glovesAtt30: Scroll(
    scrollName: ScrollName.glovesAtt30, 
    scrollStats: [
      {StatType.attack: 2},
      {StatType.attack: 3}, 
    ]
  ),
  ScrollName.glovesAtt15: Scroll(
    scrollName: ScrollName.glovesAtt15, 
    scrollStats: [
      {StatType.attack: 3},
      {StatType.attack: 4}, 
    ]
  ),
  ScrollName.glovesMatt100: Scroll(
    scrollName: ScrollName.glovesMatt100, 
    scrollStats: [
      {StatType.mattack: 0},
      {StatType.mattack: 1}, 
    ]
  ),
  ScrollName.glovesMatt70: Scroll(
    scrollName: ScrollName.glovesMatt70, 
    scrollStats: [
      {StatType.mattack: 1},
      {StatType.mattack: 2}, 
    ]
  ),
  ScrollName.glovesMatt30: Scroll(
    scrollName: ScrollName.glovesMatt30, 
    scrollStats: [
      {StatType.mattack: 2},
      {StatType.mattack: 3}, 
    ]
  ),
  ScrollName.glovesMatt15: Scroll(
    scrollName: ScrollName.glovesMatt15, 
    scrollStats: [
      {StatType.mattack: 3},
      {StatType.mattack: 4}, 
    ]
  ),
  // Dominator
  ScrollName.fragmentOfDistortedTime: StaticScroll(
    scrollName: ScrollName.fragmentOfDistortedTime, 
    scrollStats: {
      StatType.allStats: 3,
      StatType.attack: 3,
      StatType.mattack: 3,
      StatType.hp: 40,
      StatType.mp: 40,
      StatType.defense: 25,
      StatType.speed: 3,
      StatType.jump: 2,
    }
  ),
  // Superior/Reinforced Gollux
  ScrollName.advancedGolluxScroll: StaticScroll(
    scrollName: ScrollName.advancedGolluxScroll, 
    scrollStats: {
      StatType.allStats: 3,
      StatType.attack: 4,
      StatType.mattack: 4,
    }
  ),
  // Solid/Cracked Gollux
  ScrollName.basicGolluxScroll: StaticScroll(
    scrollName: ScrollName.basicGolluxScroll, 
    scrollStats: {
      StatType.allStats: 1,
      StatType.attack: 2,
      StatType.mattack: 2,
    }
  ),
  // Masteria 
  // Glona's Heart, Delgrunds Honor, and Numenal's Willpower
  ScrollName.masteriaGrandmasterScroll: StaticScroll(
    scrollName: ScrollName.masteriaGrandmasterScroll, 
    scrollStats: {
      StatType.allStats: 13,
      StatType.attack: 5,
      StatType.mattack: 5,
      StatType.hp: 10,
      StatType.mp: 10,
      StatType.defense: 10,
    }
  ),
  // Legacy of Light/Darkness
  ScrollName.legacyOfLightAndDarknessScroll: StaticScroll(
    scrollName: ScrollName.legacyOfLightAndDarknessScroll, 
    scrollStats: {
      StatType.allStats: 6,
      StatType.attack: 2,
      StatType.mattack: 2,
    }
  ),
  // Chaos Horntail/Horntail Pendandt
  ScrollName.dragonStone: StaticScroll(
    scrollName: ScrollName.dragonStone, 
    slotCost: 3,
    scrollStats: {
      StatType.allStats: 15,
      StatType.hp: 750,
      StatType.defense: 360,
    }
  ),
  // Accessory
  // Earring Only
  ScrollName.earringInt10: StaticScroll(
    scrollName: ScrollName.earringInt10, 
    scrollStats: {
      StatType.int: 3,
      StatType.mattack: 5,
    }
  ),
  ScrollName.accessoryStr100: Scroll(
    scrollName: ScrollName.accessoryStr100, 
    scrollStats: [
      {StatType.str: 1}, 
      {StatType.str: 1}, 
      {StatType.str: 2}, 
    ]
  ),
  ScrollName.accessoryStr70: Scroll(
    scrollName: ScrollName.accessoryStr70,
    scrollStats: [
      {StatType.str: 2}, 
      {StatType.str: 2}, 
      {StatType.str: 3}, 
    ]
  ),
  ScrollName.accessoryStr30: Scroll(
    scrollName: ScrollName.accessoryStr30, 
    scrollStats: [
      {StatType.str: 3}, 
      {StatType.str: 4}, 
      {StatType.str: 5}, 
    ]
  ),
  ScrollName.accessoryDex100: Scroll(
    scrollName: ScrollName.accessoryDex100, 
    scrollStats: [
      {StatType.dex: 1}, 
      {StatType.dex: 1}, 
      {StatType.dex: 2}, 
    ]
  ),
  ScrollName.accessoryDex70: Scroll(
    scrollName: ScrollName.accessoryDex70, 
    scrollStats: [
      {StatType.dex: 2}, 
      {StatType.dex: 2}, 
      {StatType.dex: 3},  
    ]
  ),
  ScrollName.accessoryDex30: Scroll(
    scrollName: ScrollName.accessoryDex30, 
    scrollStats: [
      {StatType.dex: 3}, 
      {StatType.dex: 4}, 
      {StatType.dex: 5},
    ]
  ),
  ScrollName.accessoryInt100: Scroll(
    scrollName: ScrollName.accessoryInt100, 
    scrollStats: [
      {StatType.int: 1}, 
      {StatType.int: 1}, 
      {StatType.int: 2},
    ]
  ),
  ScrollName.accessoryInt70: Scroll(
    scrollName: ScrollName.accessoryInt70, 
    scrollStats: [
      {StatType.int: 2}, 
      {StatType.int: 2}, 
      {StatType.int: 3},
    ]
  ),
  ScrollName.accessoryInt30: Scroll(
    scrollName: ScrollName.accessoryInt30, 
    scrollStats: [
      {StatType.int: 3}, 
      {StatType.int: 4}, 
      {StatType.int: 5},
    ]
  ),
  ScrollName.accessoryLuk100: Scroll(
    scrollName: ScrollName.accessoryLuk100, 
    scrollStats: [
      {StatType.luk: 1}, 
      {StatType.luk: 1}, 
      {StatType.luk: 2},
    ]
  ),
  ScrollName.accessoryLuk70: Scroll(
    scrollName: ScrollName.accessoryLuk70, 
    scrollStats: [
      {StatType.luk: 2}, 
      {StatType.luk: 2}, 
      {StatType.luk: 3},
    ]
  ),
  ScrollName.accessoryLuk30: Scroll(
    scrollName: ScrollName.accessoryLuk30, 
    scrollStats: [
      {StatType.luk: 3}, 
      {StatType.luk: 4}, 
      {StatType.luk: 5}, 
    ]
  ),
  ScrollName.accessoryAllStat30: Scroll(
    scrollName: ScrollName.accessoryAllStat30, 
    scrollStats: [
      {StatType.allStats: 1}, 
      {StatType.allStats: 2}, 
      {StatType.allStats: 3}, 
    ]
  ),
  ScrollName.accessoryHP100: Scroll(
    scrollName: ScrollName.accessoryHP100, 
    scrollStats: [
      {StatType.hp: 50}, 
      {StatType.hp: 50}, 
      {StatType.hp: 100}, 
    ]
  ),
  ScrollName.accessoryHP70: Scroll(
    scrollName: ScrollName.accessoryHP70, 
    scrollStats: [
      {StatType.hp: 100}, 
      {StatType.hp: 100}, 
      {StatType.hp: 150}, 
    ]
  ),
  ScrollName.accessoryHP30: Scroll(
    scrollName: ScrollName.accessoryHP30, 
    scrollStats: [
      {StatType.hp: 150}, 
      {StatType.hp: 200}, 
      {StatType.hp: 250}, 
    ]
  ),
  ScrollName.premiumAccessoryAtt: ScrollWithRange(
    scrollName: ScrollName.premiumAccessoryAtt, 
    scrollStats: {
      StatType.attack: ScrollRange(minRange: 4, maxRange: 5, divisions: 1),
    }
  ),
  ScrollName.premiumAccessoryMatt: ScrollWithRange(
    scrollName: ScrollName.premiumAccessoryMatt, 
    scrollStats: {
      StatType.mattack: ScrollRange(minRange: 4, maxRange: 5, divisions: 1),
    }
  ),
  ScrollName.miracleAccessoryAtt50: ScrollWithRange(
    scrollName: ScrollName.miracleAccessoryAtt50, 
    scrollStats: {
      StatType.attack: ScrollRange(minRange: 1, maxRange: 4, divisions: 3),
    }
  ),
  ScrollName.miracleAccessoryMatt50: ScrollWithRange(
    scrollName: ScrollName.miracleAccessoryMatt50, 
    scrollStats: {
      StatType.mattack: ScrollRange(minRange: 1, maxRange: 4, divisions: 3),
    }
  ),
  ScrollName.accessoryAtt: ScrollWithRange(
    scrollName: ScrollName.accessoryAtt, 
    scrollStats: {
      StatType.attack: ScrollRange(minRange: 2, maxRange: 4, divisions: 2),
    }
  ),
  ScrollName.accessoryMatt: ScrollWithRange(
    scrollName: ScrollName.accessoryMatt, 
    scrollStats: {
      StatType.mattack: ScrollRange(minRange: 2, maxRange: 4, divisions: 2),
    }
  ),
  ScrollName.accessoryAtt70: ScrollWithRange(
    scrollName: ScrollName.accessoryAtt70, 
    scrollStats: {
      StatType.attack: ScrollRange(minRange: 1, maxRange: 2, divisions: 1),
    }
  ),
  ScrollName.accessoryMatt70: ScrollWithRange(
    scrollName: ScrollName.accessoryMatt70, 
    scrollStats: {
      StatType.mattack: ScrollRange(minRange: 1, maxRange: 2, divisions: 1),
    }
  ),
  // Hearts
  ScrollName.heartAtt100: Scroll(
    scrollName: ScrollName.heartAtt100, 
    scrollStats: [
      {StatType.attack: 1},
      {StatType.attack: 2}, 
      {StatType.attack: 3}, 
    ]
  ),
  ScrollName.heartAtt70: Scroll(
    scrollName: ScrollName.heartAtt70, 
    scrollStats: [
      {StatType.attack: 2},
      {StatType.attack: 3}, 
      {StatType.attack: 4},  
    ]
  ),
  ScrollName.heartAtt30: Scroll(
    scrollName: ScrollName.heartAtt30, 
    scrollStats: [
      {StatType.attack: 3},
      {StatType.attack: 5}, 
      {StatType.attack: 7},  
    ]
  ),
  ScrollName.heartMatt100: Scroll(
    scrollName: ScrollName.heartMatt100, 
    scrollStats: [
      {StatType.mattack: 1},
      {StatType.mattack: 2}, 
      {StatType.mattack: 3}, 
    ]
  ),
  ScrollName.heartMatt70: Scroll(
    scrollName: ScrollName.heartMatt70, 
    scrollStats: [
      {StatType.mattack: 2},
      {StatType.mattack: 3}, 
      {StatType.mattack: 4}, 
    ]
  ),
  ScrollName.heartMatt30: Scroll(
    scrollName: ScrollName.heartMatt30, 
    scrollStats: [
      {StatType.mattack: 3},
      {StatType.mattack: 5}, 
      {StatType.mattack: 7}, 
    ]
  ),

  // Weapons
  ScrollName.weaponAttStr100: Scroll(
    scrollName: ScrollName.weaponAttStr100, 
    scrollStats: [
      {StatType.attack: 1}, 
      {StatType.attack: 2},
      {StatType.attack: 3, StatType.str: 1},
    ]
  ),
  ScrollName.weaponAttStr70: Scroll(
    scrollName: ScrollName.weaponAttStr70, 
    scrollStats: [
      {StatType.attack: 2}, 
      {StatType.attack: 3, StatType.str: 1},
      {StatType.attack: 5, StatType.str: 2},
    ]
  ),
  ScrollName.weaponAttStr30: Scroll(
    scrollName: ScrollName.weaponAttStr30, 
    scrollStats: [
      {StatType.attack: 3, StatType.str: 1}, 
      {StatType.attack: 5, StatType.str: 2},
      {StatType.attack: 7, StatType.str: 3},
    ]
  ),
  ScrollName.weaponAttStr15: Scroll(
    scrollName: ScrollName.weaponAttStr15, 
    scrollStats: [
      {StatType.attack: 5, StatType.str: 2}, 
      {StatType.attack: 7, StatType.str: 3},
      {StatType.attack: 9, StatType.str: 4},
    ]
  ),
  ScrollName.weaponAttDex100: Scroll(
    scrollName: ScrollName.weaponAttDex100,
     scrollStats: [
      {StatType.attack: 1}, 
      {StatType.attack: 2},
      {StatType.attack: 3, StatType.dex: 1}, 
    ]
  ),
  ScrollName.weaponAttDex70: Scroll(
    scrollName: ScrollName.weaponAttDex70,
     scrollStats: [
      {StatType.attack: 2}, 
      {StatType.attack: 3, StatType.dex: 1},
      {StatType.attack: 5, StatType.dex: 2},
    ]
  ),
  ScrollName.weaponAttDex30: Scroll(
    scrollName: ScrollName.weaponAttDex30, 
    scrollStats: [
      {StatType.attack: 3, StatType.dex: 1}, 
      {StatType.attack: 5, StatType.dex: 2},
      {StatType.attack: 7, StatType.dex: 3}, 
    ]
  ),
  ScrollName.weaponAttDex15: Scroll(
    scrollName: ScrollName.weaponAttDex15, 
    scrollStats: [
      {StatType.attack: 5, StatType.dex: 2}, 
      {StatType.attack: 7, StatType.dex: 3},
      {StatType.attack: 9, StatType.dex: 4}, 
    ]
  ),
  ScrollName.weaponMattInt100: Scroll(
    scrollName: ScrollName.weaponMattInt100, 
    scrollStats: [
      {StatType.mattack: 1}, 
      {StatType.mattack: 2},
      {StatType.mattack: 3, StatType.int: 1},
    ]
  ),
  ScrollName.weaponMattInt70: Scroll(
    scrollName: ScrollName.weaponMattInt70,
    scrollStats: [
      {StatType.mattack: 2}, 
      {StatType.mattack: 3, StatType.int: 1},
      {StatType.mattack: 5, StatType.int: 2},
    ]
  ),
  ScrollName.weaponMattInt30: Scroll(
    scrollName: ScrollName.weaponMattInt30, 
    scrollStats: [
      {StatType.mattack: 3, StatType.int: 1}, 
      {StatType.mattack: 5, StatType.int: 2},
      {StatType.mattack: 7, StatType.int: 3}, 
    ]
  ),
  ScrollName.weaponMattInt15: Scroll(
    scrollName: ScrollName.weaponMattInt15, 
    scrollStats: [
      {StatType.mattack: 5, StatType.int: 2}, 
      {StatType.mattack: 7, StatType.int: 3},
      {StatType.mattack: 9, StatType.int: 4},
    ]
  ),
  ScrollName.weaponAttLuk100: Scroll(
    scrollName: ScrollName.weaponAttLuk100, 
    scrollStats: [
      {StatType.attack: 1}, 
      {StatType.attack: 2},
      {StatType.attack: 3, StatType.luk: 1},
    ]
  ),
  ScrollName.weaponAttLuk70: Scroll(
    scrollName: ScrollName.weaponAttLuk70, 
    scrollStats: [
      {StatType.attack: 2}, 
      {StatType.attack: 3, StatType.luk: 1},
      {StatType.attack: 5, StatType.luk: 2},
    ]
  ),
  ScrollName.weaponAttLuk30: Scroll(
    scrollName: ScrollName.weaponAttLuk30, 
    scrollStats: [
      {StatType.attack: 3, StatType.luk: 1}, 
      {StatType.attack: 5, StatType.luk: 2},
      {StatType.attack: 7, StatType.luk: 3}, 
    ]
  ),
  ScrollName.weaponAttLuk15: Scroll(
    scrollName: ScrollName.weaponAttLuk15, 
    scrollStats: [
      {StatType.attack: 5, StatType.luk: 2}, 
      {StatType.attack: 7, StatType.luk: 3},
      {StatType.attack: 9, StatType.luk: 4},
    ]
  ),
  ScrollName.weaponAttHP100: Scroll(
    scrollName: ScrollName.weaponAttHP100, 
    scrollStats: [
      {StatType.attack: 1}, 
      {StatType.attack: 2},
      {StatType.attack: 3, StatType.hp: 50},
    ]
  ),
  ScrollName.weaponAttHP70: Scroll(
    scrollName: ScrollName.weaponAttHP70, 
    scrollStats: [
      {StatType.attack: 2}, 
      {StatType.attack: 3, StatType.hp: 50},
      {StatType.attack: 5, StatType.hp: 100}, 
    ]
  ),
  ScrollName.weaponAttHP30: Scroll(
    scrollName: ScrollName.weaponAttHP30, 
    scrollStats: [
      {StatType.attack: 3, StatType.hp: 50}, 
      {StatType.attack: 5, StatType.hp: 100},
      {StatType.attack: 7, StatType.hp: 150},
    ]
  ),
  ScrollName.weaponAttHP15: Scroll(
    scrollName: ScrollName.weaponAttHP15, 
    scrollStats: [
      {StatType.attack: 5, StatType.hp: 100}, 
      {StatType.attack: 7, StatType.hp: 150},
      {StatType.attack: 9, StatType.hp: 200},
    ]
  ),
  ScrollName.magicalWeaponAtt50: ScrollWithRange(
    scrollName: ScrollName.magicalWeaponAtt50, 
    scrollStats: {
      StatType.attack: ScrollRange(minRange: 9, maxRange: 11, divisions: 2),
      StatType.allStats: ScrollRange(minRange: 3, maxRange: 3)
    }
  ),
  ScrollName.magicalWeaponMatt50: ScrollWithRange(
    scrollName: ScrollName.magicalWeaponMatt50, 
    scrollStats: {
      StatType.mattack: ScrollRange(minRange: 9, maxRange: 11, divisions: 2),
      StatType.allStats: ScrollRange(minRange: 3, maxRange: 3)
    }
  ),
  ScrollName.miracleWeaponAtt50: ScrollWithRange(
    scrollName: ScrollName.miracleWeaponAtt50, 
    scrollStats: {
      StatType.attack: ScrollRange(minRange: 2, maxRange: 5, divisions: 3),
      StatType.allStats: ScrollRange(minRange: 3, maxRange: 3)
    }
  ),
  ScrollName.miracleWeaponMatt50: ScrollWithRange(
    scrollName: ScrollName.miracleWeaponMatt50, 
    scrollStats: {
      StatType.mattack: ScrollRange(minRange: 2, maxRange: 5, divisions: 3),
      StatType.allStats: ScrollRange(minRange: 3, maxRange: 3)
    }
  ),
};