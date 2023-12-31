// ignore_for_file: constant_identifier_names

import 'package:flutter/material.dart';
import 'package:maplestory_builder/constants/constants.dart';
import 'package:maplestory_builder/modules/base.dart';
import 'package:maplestory_builder/modules/equipment/scroll_mod.dart';

enum ScrollName {
  // Pet Equipment Scrolls
  premiumPetAtt100(
    formattedName: "Premium Scroll for Pet Equip for Attack Power 100%", 
    scrollType: ScrollWithRange, 
    scrollStats: {
      StatType.attack: ScrollRange(minRange: 4, maxRange: 5, divisions: 1)
    }
  ),
  premiumPetMatt100(
    formattedName: "Premium Scroll for Pet Equip for Magic Attack 100%", 
    scrollType: ScrollWithRange, 
    scrollStats: {
      StatType.mattack: ScrollRange(minRange: 4, maxRange: 5, divisions: 1)
    }
  ),
  petAtt100(
    formattedName: "Scroll for Pet Equip for Attack Power 100%", 
    scrollType: ScrollWithRange, 
    scrollStats: {
      StatType.attack: ScrollRange(minRange: 2, maxRange: 4, divisions: 2)
    }
  ),
  petMatt100(
    formattedName: "Scroll for Pet Equip for Magic Attack 100%", 
    scrollType: ScrollWithRange, 
    scrollStats: {
      StatType.mattack: ScrollRange(minRange: 2, maxRange: 4, divisions: 2)
    }
  ),
  petAtt70(
    formattedName: "Scroll for Pet Equip for Attack Power 70%", 
    scrollType: ScrollWithRange, 
    scrollStats: {
      StatType.attack: ScrollRange(minRange: 1, maxRange: 2, divisions: 1)
    }
  ),
  petMatt70(
    formattedName: "Scroll for Pet Equip for Magic Attack 70%", 
    scrollType: ScrollWithRange, 
    scrollStats: {
      StatType.mattack: ScrollRange(minRange: 1, maxRange: 2, divisions: 1)
    }
  ),
  miraclePetAtt50(
    formattedName: "Miracle Scroll for Pet Equip for Attack Power 50%", 
    scrollType: ScrollWithRange, 
    scrollStats: {
      StatType.attack: ScrollRange(minRange: 1, maxRange: 4, divisions: 3)
    }
  ),
  miraclePetMatt50(
    formattedName: "Miracle Scroll for Pet Equip for Magic Attack 50%", 
    scrollType: ScrollWithRange, 
    scrollStats: {
      StatType.mattack: ScrollRange(minRange: 1, maxRange: 4, divisions: 3)
    }
  ),
  petSpeed100(
    formattedName: "Scroll for Pet Equip for Speed 100%", 
    scrollType: StaticScroll, 
    scrollStats: {
      StatType.speed: 1
    }
  ),
  petSpeed10(
    formattedName: "Scroll for Pet Equip for Speed 10%", 
    scrollType: StaticScroll, 
    scrollStats: {
      StatType.speed: 3
    }
  ),
  petJump100(
    formattedName: "Scroll for Pet Equip for Jump 100%", 
    scrollType: StaticScroll, 
    scrollStats: {
      StatType.jump: 1
    }
  ),
  petJump10(
    formattedName: "Scroll for Pet Equip for Jump 10%", 
    scrollType: StaticScroll, 
    scrollStats: {
      StatType.jump: 3
    }
  ),
  // Chaos Scrolls
  incredibleChaosScrollOfGoodness(
    formattedName: "Incredible Chaos Scroll of Goodness", 
    scrollType: ScrollWithRange, 
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
  chaosScrollOfGoodness(
    formattedName: "Chaos Scroll of Goodness", 
    scrollType: ScrollWithRange, 
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
  miraculousChaosScroll(
    formattedName: "Miraculous Chaos Scroll", 
    scrollType: ScrollWithRange, 
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
  chaosScroll(
    formattedName: "Chaos Scroll", 
    scrollType: ScrollWithRange, 
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
  miracleArmorAtt50(
    formattedName: "Miracle Scroll for Attack Power 50%", 
    scrollType: ScrollWithRange, 
    scrollStats: {
      StatType.attack: ScrollRange(minRange: 2, maxRange: 3, divisions: 1),
    }
  ),
  miracleArmorMatt50(
    formattedName: "Miracle Scroll for Magic Attack 50%", 
    scrollType: ScrollWithRange, 
    scrollStats: {
      StatType.mattack: ScrollRange(minRange: 2, maxRange: 3, divisions: 1),
    }
  ),
  armorAtt70(
    formattedName: "Armor Scroll for Attack Power 70%", 
    scrollType: ScrollWithRange, 
    scrollStats: {
      StatType.attack: ScrollRange(minRange: 1, maxRange: 2, divisions: 1),
    }
  ),
  armorMatt70(
    formattedName: "Armor Scroll for Magic Attack 70%", 
    scrollType: ScrollWithRange, 
    scrollStats: {
      StatType.mattack: ScrollRange(minRange: 1, maxRange: 2, divisions: 1),
    }
  ),
  // Armor and Shoulder
  armorAndShoulderStr100(
    formattedName: "STR 100%", 
    scrollType: Scroll, 
    scrollStats: [
      {StatType.str: 1, StatType.hp: 5, StatType.defense: 1}, 
      {StatType.str: 2, StatType.hp: 20, StatType.defense: 2}, 
      {StatType.str: 3, StatType.hp: 30, StatType.defense: 3}, 
    ]
  ),
  armorAndShoulderStr70(
    formattedName: "STR 70%", 
    scrollType: Scroll, 
    scrollStats: [
      {StatType.str: 2, StatType.hp: 15, StatType.defense: 2}, 
      {StatType.str: 3, StatType.hp: 50, StatType.defense: 4}, 
      {StatType.str: 4, StatType.hp: 70, StatType.defense: 5}, 
    ]
  ),
  armorAndShoulderStr30(
    formattedName: "STR 30%", 
    scrollType: Scroll, 
    scrollStats: [
      {StatType.str: 3, StatType.hp: 30, StatType.defense: 4}, 
      {StatType.str: 5, StatType.hp: 70, StatType.defense: 7}, 
      {StatType.str: 7, StatType.hp: 120, StatType.defense: 10}, 
    ]
  ),
  armorAndShoulderStr15(
    formattedName: "STR 15%", 
    scrollType: Scroll, 
    scrollStats: [
      {StatType.str: 4, StatType.hp: 45, StatType.defense: 6}, 
      {StatType.str: 7, StatType.hp: 110, StatType.defense: 10}, 
      {StatType.str: 10, StatType.hp: 170, StatType.defense: 15}, 
    ]
  ),
  armorAndShoulderDex100(
    formattedName: "DEX 100%", 
    scrollType: Scroll, 
    scrollStats: [
      {StatType.dex: 1, StatType.hp: 5, StatType.defense: 1}, 
      {StatType.dex: 2, StatType.hp: 20, StatType.defense: 2}, 
      {StatType.dex: 3, StatType.hp: 30, StatType.defense: 3}, 
    ]
  ),
  armorAndShoulderDex70(
    formattedName: "DEX 70%", 
    scrollType: Scroll, 
    scrollStats: [
      {StatType.dex: 2, StatType.hp: 15, StatType.defense: 2}, 
      {StatType.dex: 3, StatType.hp: 50, StatType.defense: 4}, 
      {StatType.dex: 4, StatType.hp: 70, StatType.defense: 5}, 
    ]
  ),
  armorAndShoulderDex30(
    formattedName: "DEX 30%", 
    scrollType: Scroll, 
    scrollStats: [
      {StatType.dex: 3, StatType.hp: 30, StatType.defense: 4}, 
      {StatType.dex: 5, StatType.hp: 70, StatType.defense: 7}, 
      {StatType.dex: 7, StatType.hp: 120, StatType.defense: 10}, 
    ]
  ),
  armorAndShoulderDex15(
    formattedName: "DEX 15%", 
    scrollType: Scroll, 
    scrollStats: [
      {StatType.dex: 4, StatType.hp: 45, StatType.defense: 6}, 
      {StatType.dex: 7, StatType.hp: 110, StatType.defense: 10}, 
      {StatType.dex: 10, StatType.hp: 170, StatType.defense: 15}, 
    ]
  ),
  armorAndShoulderInt100(
    formattedName: "INT 100%", 
    scrollType: Scroll, 
    scrollStats: [
      {StatType.int: 1, StatType.hp: 5, StatType.defense: 1}, 
      {StatType.int: 2, StatType.hp: 20, StatType.defense: 2}, 
      {StatType.int: 3, StatType.hp: 30, StatType.defense: 3}, 
    ]
  ),
  armorAndShoulderInt70(
    formattedName: "INT 70%", 
    scrollType: Scroll, 
    scrollStats: [
      {StatType.int: 2, StatType.hp: 15, StatType.defense: 2}, 
      {StatType.int: 3, StatType.hp: 50, StatType.defense: 4}, 
      {StatType.int: 4, StatType.hp: 70, StatType.defense: 5}, 
    ]
  ),
  armorAndShoulderInt30(
    formattedName: "INT 30%", 
    scrollType: Scroll, 
    scrollStats: [
      {StatType.int: 3, StatType.hp: 30, StatType.defense: 4}, 
      {StatType.int: 5, StatType.hp: 70, StatType.defense: 7}, 
      {StatType.int: 7, StatType.hp: 120, StatType.defense: 10}, 
    ]
  ),
  armorAndShoulderInt15(
    formattedName: "INT 15%", 
    scrollType: Scroll, 
    scrollStats: [
      {StatType.int: 4, StatType.hp: 45, StatType.defense: 6}, 
      {StatType.int: 7, StatType.hp: 110, StatType.defense: 10}, 
      {StatType.int: 10, StatType.hp: 170, StatType.defense: 15}, 
    ]
  ),
  armorAndShoulderLuk100(
    formattedName: "LUK 100%", 
    scrollType: Scroll, 
    scrollStats: [
      {StatType.luk: 1, StatType.hp: 5, StatType.defense: 1}, 
      {StatType.luk: 2, StatType.hp: 20, StatType.defense: 2}, 
      {StatType.luk: 3, StatType.hp: 30, StatType.defense: 3}, 
    ]
  ),
  armorAndShoulderLuk70(
    formattedName: "LUK 70%", 
    scrollType: Scroll, 
    scrollStats: [
      {StatType.luk: 2, StatType.hp: 15, StatType.defense: 2}, 
      {StatType.luk: 3, StatType.hp: 50, StatType.defense: 4}, 
      {StatType.luk: 4, StatType.hp: 70, StatType.defense: 5}, 
    ]
  ),
  armorAndShoulderLuk30(
    formattedName: "LUK 30%", 
    scrollType: Scroll, 
    scrollStats: [
      {StatType.luk: 3, StatType.hp: 30, StatType.defense: 4}, 
      {StatType.luk: 5, StatType.hp: 70, StatType.defense: 7}, 
      {StatType.luk: 7, StatType.hp: 120, StatType.defense: 10}, 
    ]
  ),
  armorAndShoulderLuk15(
    formattedName: "LUK 15%", 
    scrollType: Scroll, 
    scrollStats: [
      {StatType.luk: 4, StatType.hp: 45, StatType.defense: 6}, 
      {StatType.luk: 7, StatType.hp: 110, StatType.defense: 10}, 
      {StatType.luk: 10, StatType.hp: 170, StatType.defense: 15}, 
    ]
  ),
  armorAndShoulderAllStat30(
    formattedName: "All Stats 30%", 
    scrollType: Scroll, 
    scrollStats: [
      {StatType.allStats: 1, StatType.hp: 30, StatType.defense: 4}, 
      {StatType.allStats: 2, StatType.hp: 70, StatType.defense: 7}, 
      {StatType.allStats: 3, StatType.hp: 120, StatType.defense: 10}, 
    ]
  ),
  armorAndShoulderAllStat15(
    formattedName: "All Stats 15%", 
    scrollType: Scroll, 
    scrollStats: [
      {StatType.allStats: 2, StatType.hp: 45, StatType.defense: 6}, 
      {StatType.allStats: 3, StatType.hp: 110, StatType.defense: 10}, 
      {StatType.allStats: 4, StatType.hp: 170, StatType.defense: 15}, 
    ]
  ),
  armorAndShoulderHP100(
    formattedName: "HP 100%", 
    scrollType: Scroll, 
    scrollStats: [
      {StatType.hp: 55, StatType.defense: 1}, 
      {StatType.hp: 120, StatType.defense: 2}, 
      {StatType.hp: 180, StatType.defense: 3}, 
    ]
  ),
  armorAndShoulderHP70(
    formattedName: "HP 70%", 
    scrollType: Scroll, 
    scrollStats: [
      {StatType.hp: 115, StatType.defense: 2}, 
      {StatType.hp: 190, StatType.defense: 4}, 
      {StatType.hp: 270, StatType.defense: 5}, 
    ]
  ),
  armorAndShoulderHP30(
    formattedName: "HP 30%", 
    scrollType: Scroll, 
    scrollStats: [
      {StatType.hp: 180, StatType.defense: 4}, 
      {StatType.hp: 320, StatType.defense: 7}, 
      {StatType.hp: 470, StatType.defense: 10}, 
    ]
  ),
  armorAndShoulderHP15(
    formattedName: "HP 15%", 
    scrollType: Scroll, 
    scrollStats: [
      {StatType.hp: 245, StatType.defense: 6}, 
      {StatType.hp: 460, StatType.defense: 10}, 
      {StatType.hp: 670, StatType.defense: 15}, 
    ]
  ),
  // Gloves
  glovesAtt100(
    formattedName: "Attack Power 100%", 
    scrollType: Scroll, 
    scrollStats: [
      {StatType.attack: 0},
      {StatType.attack: 1}, 
    ]
  ),
  glovesAtt70(
    formattedName: "Attack Power 70%", 
    scrollType: Scroll, 
    scrollStats: [
      {StatType.attack: 1},
      {StatType.attack: 2}, 
    ]
  ),
  glovesAtt30(
    formattedName: "Attack Power 30%", 
    scrollType: Scroll, 
    scrollStats: [
      {StatType.attack: 2},
      {StatType.attack: 3}, 
    ]
  ),
  glovesAtt15(
    formattedName: "Attack Power 15%", 
    scrollType: Scroll, 
    scrollStats: [
      {StatType.attack: 3},
      {StatType.attack: 4}, 
    ]
  ),
  glovesMatt100(
    formattedName: "Magic Attack 100%", 
    scrollType: Scroll, 
    scrollStats: [
      {StatType.mattack: 0},
      {StatType.mattack: 1}, 
    ]
  ),
  glovesMatt70(
    formattedName: "Magic Attack 70%", 
    scrollType: Scroll, 
    scrollStats: [
      {StatType.mattack: 1},
      {StatType.mattack: 2}, 
    ]
  ),
  glovesMatt30(
    formattedName: "Magic Attack 30%", 
    scrollType: Scroll, 
    scrollStats: [
      {StatType.mattack: 2},
      {StatType.mattack: 3}, 
    ]
  ),
  glovesMatt15(
    formattedName: "Magic Attack 15%", 
    scrollType: Scroll, 
    scrollStats: [
      {StatType.mattack: 3},
      {StatType.mattack: 4}, 
    ]
  ),
  // Dominator
  fragmentOfDistortedTime(
    formattedName: "Fragment of Distorted Time", 
    scrollType: StaticScroll, 
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
  advancedGolluxScroll(
    formattedName: "Advanced Gollux Scroll", 
    scrollType: StaticScroll, 
    scrollStats: {
      StatType.allStats: 3,
      StatType.attack: 4,
      StatType.mattack: 4,
    }
  ),
  // Solid/Cracked Gollux
  basicGolluxScroll(
    formattedName: "Basic Gollux Scroll", 
    scrollType: StaticScroll, 
    scrollStats: {
      StatType.allStats: 1,
      StatType.attack: 2,
      StatType.mattack: 2,
    }
  ),
  // Masteria 
  // Glona's Heart, Delgrunds Honor, and Numenal's Willpower
  masteriaGrandmasterScroll(
    formattedName: "Masteria Grandmaster Accessory Exclusive Enhancement Scroll", 
    scrollType: StaticScroll, 
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
  legacyOfLightAndDarknessScroll(
    formattedName: "Legacy of Light／Darkness Exclusive Enhancement Scroll", 
    scrollType: StaticScroll, 
    scrollStats: {
      StatType.allStats: 6,
      StatType.attack: 2,
      StatType.mattack: 2,
    }
  ),
  // Chaos Horntail/Horntail Pendandt
  dragonStone(
    formattedName: "Dragon Stone", 
    scrollType: StaticScroll, 
    slotCost: 3,
    scrollStats: {
      StatType.allStats: 15,
      StatType.hp: 750,
      StatType.defense: 360,
    }
  ),
  // Accessory
  // Earring Only
  earringInt10(
    formattedName: "Scroll for Earring for INT 10%", 
    scrollType: StaticScroll, 
    scrollStats: {
      StatType.int: 3,
      StatType.mattack: 5,
    }
  ),
  accessoryStr100(
    formattedName: "STR 100%", 
    scrollType: Scroll, 
    scrollStats: [
      {StatType.str: 1}, 
      {StatType.str: 1}, 
      {StatType.str: 2}, 
    ]
  ),
  accessoryStr70(
    formattedName: "STR 70%", 
    scrollType: Scroll, 
    scrollStats: [
      {StatType.str: 2}, 
      {StatType.str: 2}, 
      {StatType.str: 3}, 
    ]
  ),
  accessoryStr30(
    formattedName: "STR 30%", 
    scrollType: Scroll, 
    scrollStats: [
      {StatType.str: 3}, 
      {StatType.str: 4}, 
      {StatType.str: 5}, 
    ]
  ),
  accessoryDex100(
    formattedName: "DEX 100%", 
    scrollType: Scroll, 
    scrollStats: [
      {StatType.dex: 1}, 
      {StatType.dex: 1}, 
      {StatType.dex: 2}, 
    ]
  ),
  accessoryDex70(
    formattedName: "DEX 70%", 
    scrollType: Scroll, 
    scrollStats: [
      {StatType.dex: 2}, 
      {StatType.dex: 2}, 
      {StatType.dex: 3},  
    ]
  ),
  accessoryDex30(
    formattedName: "DEX 30%", 
    scrollType: Scroll, 
    scrollStats: [
      {StatType.dex: 3}, 
      {StatType.dex: 4}, 
      {StatType.dex: 5},
    ]
  ),
  accessoryInt100(
    formattedName: "INT 100%", 
    scrollType: Scroll, 
    scrollStats: [
      {StatType.int: 1}, 
      {StatType.int: 1}, 
      {StatType.int: 2},
    ]
  ),
  accessoryInt70(
    formattedName: "INT 70%", 
    scrollType: Scroll, 
    scrollStats: [
      {StatType.int: 2}, 
      {StatType.int: 2}, 
      {StatType.int: 3},
    ]
  ),
  accessoryInt30(
    formattedName: "INT 30%", 
    scrollType: Scroll, 
    scrollStats: [
      {StatType.int: 3}, 
      {StatType.int: 4}, 
      {StatType.int: 5},
    ]
  ),
  accessoryLuk100(
    formattedName: "LUK 100%", 
    scrollType: Scroll, 
    scrollStats: [
      {StatType.luk: 1}, 
      {StatType.luk: 1}, 
      {StatType.luk: 2},
    ]
  ),
  accessoryLuk70(
    formattedName: "LUK 70%", 
    scrollType: Scroll, 
    scrollStats: [
      {StatType.luk: 2}, 
      {StatType.luk: 2}, 
      {StatType.luk: 3},
    ]
  ),
  accessoryLuk30(
    formattedName: "LUK 30%", 
    scrollType: Scroll, 
    scrollStats: [
      {StatType.luk: 3}, 
      {StatType.luk: 4}, 
      {StatType.luk: 5}, 
    ]
  ),
  accessoryAllStat30(
    formattedName: "All Stats 30%", 
    scrollType: Scroll, 
    scrollStats: [
      {StatType.allStats: 1}, 
      {StatType.allStats: 2}, 
      {StatType.allStats: 3}, 
    ]
  ),
  accessoryHP100(
    formattedName: "HP 100%", 
    scrollType: Scroll, 
    scrollStats: [
      {StatType.hp: 50}, 
      {StatType.hp: 50}, 
      {StatType.hp: 100}, 
    ]
  ),
  accessoryHP70(
    formattedName: "HP 70%", 
    scrollType: Scroll, 
    scrollStats: [
      {StatType.hp: 100}, 
      {StatType.hp: 100}, 
      {StatType.hp: 150}, 
    ]
  ),
  accessoryHP30(
    formattedName: "HP 30%", 
    scrollType: Scroll, 
    scrollStats: [
      {StatType.hp: 150}, 
      {StatType.hp: 200}, 
      {StatType.hp: 250}, 
    ]
  ),
  premiumAccessoryAtt(
    formattedName: "Premium Accessory Scroll for Attack Power", 
    scrollType: ScrollWithRange, 
    scrollStats: {
      StatType.attack: ScrollRange(minRange: 4, maxRange: 5, divisions: 1),
    }
  ),
  premiumAccessoryMatt(
    formattedName: "Premium Accessory Scroll for Magic Attack", 
    scrollType: ScrollWithRange, 
    scrollStats: {
      StatType.mattack: ScrollRange(minRange: 4, maxRange: 5, divisions: 1),
    }
  ),
  miracleAccessoryAtt50(
    formattedName: "Miracle Scroll for Accessory for Attack Power 50%", 
    scrollType: ScrollWithRange, 
    scrollStats: {
      StatType.attack: ScrollRange(minRange: 1, maxRange: 4, divisions: 3),
    }
  ),
  miracleAccessoryMatt50(
    formattedName: "Miracle Scroll for Accessory for Magic Attack 50%", 
    scrollType: ScrollWithRange, 
    scrollStats: {
      StatType.mattack: ScrollRange(minRange: 1, maxRange: 4, divisions: 3),
    }
  ),
  accessoryAtt(
    formattedName: "Accessory Scroll for Attack Power", 
    scrollType: ScrollWithRange, 
    scrollStats: {
      StatType.attack: ScrollRange(minRange: 2, maxRange: 4, divisions: 2),
    }
  ),
  accessoryMatt(
    formattedName: "Accessory Scroll for Magic Attack", 
    scrollType: ScrollWithRange, 
    scrollStats: {
      StatType.mattack: ScrollRange(minRange: 2, maxRange: 4, divisions: 2),
    }
  ),
  accessoryAtt70(
    formattedName: "Accessory Scroll for Attack Power 70%", 
    scrollType: ScrollWithRange, 
    scrollStats: {
      StatType.attack: ScrollRange(minRange: 1, maxRange: 2, divisions: 1),
    }
  ),
  accessoryMatt70(
    formattedName: "Accessory Scroll for Magic Attack 70%", 
    scrollType: ScrollWithRange, 
    scrollStats: {
      StatType.mattack: ScrollRange(minRange: 1, maxRange: 2, divisions: 1),
    }
  ),
  // Hearts
  heartAtt100(
    formattedName: "Attack Power 100%", 
    scrollType: Scroll, 
    scrollStats: [
      {StatType.attack: 1},
      {StatType.attack: 2}, 
      {StatType.attack: 3}, 
    ]
  ),
  heartAtt70(
    formattedName: "Attack Power 70%", 
    scrollType: Scroll, 
    scrollStats: [
      {StatType.attack: 2},
      {StatType.attack: 3}, 
      {StatType.attack: 4},  
    ]
  ),
  heartAtt30(
    formattedName: "Attack Power 30%", 
    scrollType: Scroll, 
    scrollStats: [
      {StatType.attack: 3},
      {StatType.attack: 5}, 
      {StatType.attack: 7},  
    ]
  ),
  heartMatt100(
    formattedName: "Magic Attack 100%", 
    scrollType: Scroll, 
    scrollStats: [
      {StatType.mattack: 1},
      {StatType.mattack: 2}, 
      {StatType.mattack: 3}, 
    ]
  ),
  heartMatt70(
    formattedName: "Magic Attack 70%", 
    scrollType: Scroll, 
    scrollStats: [
      {StatType.mattack: 2},
      {StatType.mattack: 3}, 
      {StatType.mattack: 4}, 
    ]
  ),
  heartMatt30(
    formattedName: "Magic Attack 30%", 
    scrollType: Scroll, 
    scrollStats: [
      {StatType.mattack: 3},
      {StatType.mattack: 5}, 
      {StatType.mattack: 7}, 
    ]
  ),
  // Weapons
  weaponAttStr100(
    formattedName: "Attack Power (STR) 100%", 
    scrollType: Scroll, 
    scrollStats: [
      {StatType.attack: 1}, 
      {StatType.attack: 2},
      {StatType.attack: 3, StatType.str: 1},
    ]
  ),
  weaponAttStr70(
    formattedName: "Attack Power (STR) 70%", 
    scrollType: Scroll, 
    scrollStats: [
      {StatType.attack: 2}, 
      {StatType.attack: 3, StatType.str: 1},
      {StatType.attack: 5, StatType.str: 2},
    ]
  ),
  weaponAttStr30(
    formattedName: "Attack Power (STR) 30%", 
    scrollType: Scroll, 
    scrollStats: [
      {StatType.attack: 3, StatType.str: 1}, 
      {StatType.attack: 5, StatType.str: 2},
      {StatType.attack: 7, StatType.str: 3},
    ]
  ),
  weaponAttStr15(
    formattedName: "Attack Power (STR) 15%", 
    scrollType: Scroll, 
    scrollStats: [
      {StatType.attack: 5, StatType.str: 2}, 
      {StatType.attack: 7, StatType.str: 3},
      {StatType.attack: 9, StatType.str: 4},
    ]
  ),
  weaponAttDex100(
    formattedName: "Attack Power (DEX) 100%", 
    scrollType: Scroll, 
    scrollStats: [
      {StatType.attack: 1}, 
      {StatType.attack: 2},
      {StatType.attack: 3, StatType.dex: 1}, 
    ]
  ),
  weaponAttDex70(
    formattedName: "Attack Power (DEX) 70%", 
    scrollType: Scroll, 
    scrollStats: [
      {StatType.attack: 2}, 
      {StatType.attack: 3, StatType.dex: 1},
      {StatType.attack: 5, StatType.dex: 2},
    ]
  ),
  weaponAttDex30(
    formattedName: "Attack Power (DEX) 30%", 
    scrollType: Scroll, 
    scrollStats: [
      {StatType.attack: 3, StatType.dex: 1}, 
      {StatType.attack: 5, StatType.dex: 2},
      {StatType.attack: 7, StatType.dex: 3}, 
    ]
  ),
  weaponAttDex15(
    formattedName: "Attack Power (DEX) 15%", 
    scrollType: Scroll, 
    scrollStats: [
      {StatType.attack: 5, StatType.dex: 2}, 
      {StatType.attack: 7, StatType.dex: 3},
      {StatType.attack: 9, StatType.dex: 4}, 
    ]
  ),
  weaponMattInt100(
    formattedName: "Magic Attack (INT) 100%", 
    scrollType: Scroll, 
    scrollStats: [
      {StatType.mattack: 1}, 
      {StatType.mattack: 2},
      {StatType.mattack: 3, StatType.int: 1},
    ]
  ),
  weaponMattInt70(
    formattedName: "Magic Attack (INT) 70%", 
    scrollType: Scroll, 
    scrollStats: [
      {StatType.mattack: 2}, 
      {StatType.mattack: 3, StatType.int: 1},
      {StatType.mattack: 5, StatType.int: 2},
    ]
  ),
  weaponMattInt30(
    formattedName: "Magic Attack (INT) 30%", 
    scrollType: Scroll, 
    scrollStats: [
      {StatType.mattack: 3, StatType.int: 1}, 
      {StatType.mattack: 5, StatType.int: 2},
      {StatType.mattack: 7, StatType.int: 3}, 
    ]
  ),
  weaponMattInt15(
    formattedName: "Magic Attack (INT) 15%", 
    scrollType: Scroll, 
    scrollStats: [
      {StatType.mattack: 5, StatType.int: 2}, 
      {StatType.mattack: 7, StatType.int: 3},
      {StatType.mattack: 9, StatType.int: 4},
    ]
  ),
  weaponAttLuk100(
    formattedName: "Attack Power (LUK) 100%", 
    scrollType: Scroll, 
    scrollStats: [
      {StatType.attack: 1}, 
      {StatType.attack: 2},
      {StatType.attack: 3, StatType.luk: 1},
    ]
  ),
  weaponAttLuk70(
    formattedName: "Attack Power (LUK) 70%", 
    scrollType: Scroll, 
    scrollStats: [
      {StatType.attack: 2}, 
      {StatType.attack: 3, StatType.luk: 1},
      {StatType.attack: 5, StatType.luk: 2},
    ]
  ),
  weaponAttLuk30(
    formattedName: "Attack Power (LUK) 30%", 
    scrollType: Scroll, 
    scrollStats: [
      {StatType.attack: 3, StatType.luk: 1}, 
      {StatType.attack: 5, StatType.luk: 2},
      {StatType.attack: 7, StatType.luk: 3}, 
    ]
  ),
  weaponAttLuk15(
    formattedName: "Attack Power (LUK) 15%", 
    scrollType: Scroll, 
    scrollStats: [
      {StatType.attack: 5, StatType.luk: 2}, 
      {StatType.attack: 7, StatType.luk: 3},
      {StatType.attack: 9, StatType.luk: 4},
    ]
  ),
  weaponAttHP100(
    formattedName: "Attack Power (HP) 100%", 
    scrollType: Scroll, 
    scrollStats: [
      {StatType.attack: 1}, 
      {StatType.attack: 2},
      {StatType.attack: 3, StatType.hp: 50},
    ]
  ),
  weaponAttHP70(
    formattedName: "Attack Power (HP) 70%", 
    scrollType: Scroll, 
    scrollStats:  [
      {StatType.attack: 2}, 
      {StatType.attack: 3, StatType.hp: 50},
      {StatType.attack: 5, StatType.hp: 100}, 
    ]
  ),
  weaponAttHP30(
    formattedName: "Attack Power (HP) 30%", 
    scrollType: Scroll, 
    scrollStats: [
      {StatType.attack: 3, StatType.hp: 50}, 
      {StatType.attack: 5, StatType.hp: 100},
      {StatType.attack: 7, StatType.hp: 150},
    ]
  ),
  weaponAttHP15(
    formattedName: "Attack Power (HP) 15%", 
    scrollType: Scroll, 
    scrollStats: [
      {StatType.attack: 5, StatType.hp: 100}, 
      {StatType.attack: 7, StatType.hp: 150},
      {StatType.attack: 9, StatType.hp: 200},
    ]
  ),
  magicalWeaponAtt50(
    formattedName: "Magical Scroll for Attack Power 50%", 
    scrollType: ScrollWithRange, 
    scrollStats: {
      StatType.attack: ScrollRange(minRange: 9, maxRange: 11, divisions: 2),
      StatType.allStats: ScrollRange(minRange: 3, maxRange: 3)
    }
  ),
  magicalWeaponMatt50(
    formattedName: "Magical Scroll for Magic Attack 50%", 
    scrollType: ScrollWithRange, 
    scrollStats: {
      StatType.mattack: ScrollRange(minRange: 9, maxRange: 11, divisions: 2),
      StatType.allStats: ScrollRange(minRange: 3, maxRange: 3)
    }
  ),
  miracleWeaponAtt50(
    formattedName: "Miracle Scroll for Attack Power 50%", 
    scrollType: ScrollWithRange, 
    scrollStats: {
      StatType.attack: ScrollRange(minRange: 2, maxRange: 5, divisions: 3),
      StatType.allStats: ScrollRange(minRange: 3, maxRange: 3)
    }
  ),
  miracleWeaponMatt50(
    formattedName: "Miracle Scroll for Magic Attack 50%", 
    scrollType: ScrollWithRange, 
    scrollStats: {
      StatType.mattack: ScrollRange(minRange: 2, maxRange: 5, divisions: 3),
      StatType.allStats: ScrollRange(minRange: 3, maxRange: 3)
    }
  ),
  ;

  const ScrollName({
    required this.formattedName,
    required this.scrollType,
    this.slotCost = 1,
    required this.scrollStats,
  });

  AbstractScroll createScrollObject() {
    if (scrollType == ScrollWithRange) {
      return ScrollWithRange(scrollName: this, scrollStats: scrollStats, slotCost: slotCost);
    }
    else if (scrollType == Scroll) {
      return Scroll(scrollName: this, scrollStats: scrollStats, slotCost: slotCost);
    }
    else if (scrollType == StaticScroll) {
      return StaticScroll(scrollName: this, scrollStats: scrollStats, slotCost: slotCost);
    }
    else {
      throw Exception("Unhandled Scroll Type");
    }
  }

  final String formattedName;
  final Type scrollType;
  final int slotCost;
  final dynamic scrollStats;
}

const INDEX_0 = 0; // 0-74
const INDEX_75 = 1; // 75-114
const INDEX_115 = 2; // 115+

abstract class AbstractScroll {
  final ScrollName scrollName;
  final int slotCost;

  const AbstractScroll({
    required this.scrollName,
    this.slotCost = 1,
  });

  Widget createScrollContainer(BuildContext context, int? itemLevel);
}

class Scroll extends AbstractScroll {
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

class StaticScroll extends AbstractScroll {
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

class ScrollWithRange extends AbstractScroll {
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

class SavedScrolledRange extends AbstractScroll implements Copyable {
  Map<StatType, int> scrollStats;
  bool isEditing = false;

  SavedScrolledRange({
    required super.scrollName,
    Map<StatType, int>? scrollStats,
    super.slotCost = 1,
  }) : scrollStats = scrollStats ?? {};

  @override
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

class SavedScroll extends AbstractScroll implements Copyable {

  SavedScroll({
    required super.scrollName,
    super.slotCost = 1,
  });

  @override
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
    return scrollName.createScrollObject().createScrollContainer(context, itemLevel);
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
const List<ScrollName> PET_SCROLLS = [
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
const List<ScrollName> CHAOS_SCROLLS = [
  ScrollName.incredibleChaosScrollOfGoodness,
  ScrollName.chaosScrollOfGoodness,
  ScrollName.miraculousChaosScroll,
  ScrollName.chaosScroll,
];

// Armor
const List<ScrollName> ARMOR_ONLY_SCROLLS = [
  ScrollName.miracleArmorAtt50,
  ScrollName.miracleArmorMatt50,
  ScrollName.armorAtt70,
  ScrollName.armorMatt70,
];

// Armor + Shoulder
const List<ScrollName> ARMOR_SHOULDER_SCROLLS = [
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
const List<ScrollName> GLOVES_SCROLLS = [
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
const List<ScrollName> EARRINGS_ONLY = [
  ScrollName.earringInt10,
];
const List<ScrollName> ACCESSORY_SCROLLS = [
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
const List<ScrollName> HEART_SCROLLS = [
  ScrollName.heartAtt100,
  ScrollName.heartAtt70,
  ScrollName.heartAtt30,
  ScrollName.heartMatt100,
  ScrollName.heartMatt70,
  ScrollName.heartMatt30,
];

// Weapons
const List<ScrollName> WEAPON_SCROLLS = [
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