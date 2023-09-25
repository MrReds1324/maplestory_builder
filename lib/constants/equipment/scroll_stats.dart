// ignore_for_file: constant_identifier_names

import 'package:maplestory_builder/constants/constants.dart';

const INDEX_0 = 0; // 0-74
const INDEX_75 = 1; // 75-114
const INDEX_115 = 2; // 115+

abstract class BaseScroll {
  final String scrollName;
  final int slotCost;

  const BaseScroll({
    required this.scrollName,
    this.slotCost = 1,
  });

  BaseScroll copyWith();
}

class Scroll extends BaseScroll {
  final List<Map<StatType, int>> scrollStats;

  const Scroll({
    required super.scrollName,
    required this.scrollStats,
    super.slotCost = 1,
  });

  @override
  Scroll copyWith({
    String? scrollName,
    List<Map<StatType, int>>? scrollStats,
    int? slotCost,
  }){
    return Scroll(
      scrollName: scrollName ?? this.scrollName, 
      scrollStats: scrollStats ?? this.scrollStats,
      slotCost: slotCost ?? this.slotCost,
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
  StaticScroll copyWith({
    String? scrollName,
    Map<StatType, int>? scrollStats,
    int? slotCost,
  }){
    return StaticScroll(
      scrollName: scrollName ?? this.scrollName, 
      scrollStats: scrollStats ?? this.scrollStats,
      slotCost: slotCost ?? this.slotCost,
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

  @override
  ScrollWithRange copyWith({
    String? scrollName,
    Map<StatType, ScrollRange>? scrollStats,
    int? slotCost,
  }){
    return ScrollWithRange(
      scrollName: scrollName ?? this.scrollName, 
      scrollStats: scrollStats ?? this.scrollStats,
      slotCost: slotCost ?? this.slotCost,
    );
  }
}

class ScrolledRange extends BaseScroll {
  Map<StatType, int> scrollStats;
  ScrollWithRange referenceScroll;
  bool isEditing = false;

  ScrolledRange({
    required super.scrollName,
    required this.referenceScroll,
    Map<StatType, int>? scrollStats,
    super.slotCost = 1,
  }) : scrollStats = scrollStats ?? {};

  @override
  ScrolledRange copyWith({
    String? scrollName,
    ScrollWithRange? referenceScroll,
    Map<StatType, int>? scrollStats,
    int? slotCost,
  }){
    return ScrolledRange(
      scrollName: scrollName ?? this.scrollName, 
      referenceScroll: referenceScroll ?? this.referenceScroll,
      scrollStats: scrollStats ?? this.scrollStats,
      slotCost: slotCost ?? this.slotCost,
    );
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
const List<BaseScroll> petScrolls = [
  ScrollWithRange(
    scrollName: "Premium Scroll for Pet Equip for Attack Power 100%", 
    scrollStats: {
      StatType.attack: ScrollRange(minRange: 4, maxRange: 5, divisions: 1)
    }
  ),
  ScrollWithRange(
    scrollName: "Premium Scroll for Pet Equip for Magic Attack 100%", 
    scrollStats: {
      StatType.mattack: ScrollRange(minRange: 4, maxRange: 5, divisions: 1)
    }
  ),
  ScrollWithRange(
    scrollName: "Scroll for Pet Equip for Attack Power 100%", 
    scrollStats: {
      StatType.attack: ScrollRange(minRange: 2, maxRange: 4, divisions: 2)
    }
  ),
  ScrollWithRange(
    scrollName: "Scroll for Pet Equip for Magic Attack 100%", 
    scrollStats: {
      StatType.mattack: ScrollRange(minRange: 2, maxRange: 4, divisions: 2)
    }
  ),
  ScrollWithRange(
    scrollName: "Scroll for Pet Equip for Attack Power 70%", 
    scrollStats: {
      StatType.attack: ScrollRange(minRange: 1, maxRange: 2, divisions: 1)
    }
  ),
  ScrollWithRange(
    scrollName: "Scroll for Pet Equip for Magic Attack 70%", 
    scrollStats: {
      StatType.mattack: ScrollRange(minRange: 1, maxRange: 2, divisions: 1)
    }
  ),
  ScrollWithRange(
    scrollName: "Miracle Scroll for Pet Equip for Attack Power 50%", 
    scrollStats: {
      StatType.attack: ScrollRange(minRange: 1, maxRange: 4, divisions: 3)
    }
  ),
  ScrollWithRange(
    scrollName: "Miracle Scroll for Pet Equip for Magic Attack 50%", 
    scrollStats: {
      StatType.mattack: ScrollRange(minRange: 1, maxRange: 4, divisions: 3)
    }
  ),
  StaticScroll(
    scrollName: "Scroll for Pet Equip for Speed 100%", 
    scrollStats: {
      StatType.speed: 1
    }
  ),
  StaticScroll(
    scrollName: "Scroll for Pet Equip for Speed 10%", 
    scrollStats: {
      StatType.speed: 3
    }
  ),
  StaticScroll(
    scrollName: "Scroll for Pet Equip for Jump 100%", 
    scrollStats: {
      StatType.jump: 1
    }
  ),
  StaticScroll(
    scrollName: "Scroll for Pet Equip for Jump 10%", 
    scrollStats: {
      StatType.jump: 3
    }
  ),
];

const List<BaseScroll> chaosScrolls = [
  // Incredible Chaos Scroll of Goodness
  ScrollWithRange(
    scrollName: "Incredible Chaos Scroll of Goodness", 
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
  // Chaos Scroll of Goodness
  ScrollWithRange(
    scrollName: "Chaos Scroll of Goodness", 
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
  // Miraculous Chaos Scroll
  ScrollWithRange(
    scrollName: "Miraculous Chaos Scroll", 
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
  // Chaos Scrolls
  ScrollWithRange(
    scrollName: "Chaos Scroll", 
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
];

// Armor
const List<BaseScroll> armorOnlyScrolls = [
  ScrollWithRange(
    scrollName: "Miracle Scroll for Attack Power 50%", 
    scrollStats: {
      StatType.attack: ScrollRange(minRange: 2, maxRange: 3, divisions: 1),
    }
  ),
  ScrollWithRange(
    scrollName: "Miracle Scroll for Magic Attack 50%", 
    scrollStats: {
      StatType.mattack: ScrollRange(minRange: 2, maxRange: 3, divisions: 1),
    }
  ),
  ScrollWithRange(
    scrollName: "Armor Scroll for Attack Power 70%", 
    scrollStats: {
      StatType.attack: ScrollRange(minRange: 1, maxRange: 2, divisions: 1),
    }
  ),
  ScrollWithRange(
    scrollName: "Armor Scroll for Magic Attack 70%", 
    scrollStats: {
      StatType.mattack: ScrollRange(minRange: 1, maxRange: 2, divisions: 1),
    }
  ),
];

// Armor + Shoulder
const List<BaseScroll> armorAndShoulderScrolls = [
  Scroll(scrollName: "STR 100%", scrollStats: [
      {StatType.str: 1, StatType.hp: 5, StatType.defense: 1}, 
      {StatType.str: 2, StatType.hp: 20, StatType.defense: 2}, 
      {StatType.str: 3, StatType.hp: 30, StatType.defense: 3}, 
    ]
  ),
  Scroll(scrollName: "STR 70%", scrollStats: [
      {StatType.str: 2, StatType.hp: 15, StatType.defense: 2}, 
      {StatType.str: 3, StatType.hp: 50, StatType.defense: 4}, 
      {StatType.str: 4, StatType.hp: 70, StatType.defense: 5}, 
    ]
  ),
  Scroll(scrollName: "STR 30%", scrollStats: [
      {StatType.str: 3, StatType.hp: 30, StatType.defense: 4}, 
      {StatType.str: 5, StatType.hp: 70, StatType.defense: 7}, 
      {StatType.str: 7, StatType.hp: 120, StatType.defense: 10}, 
    ]
  ),
  Scroll(scrollName: "STR 15%", scrollStats: [
      {StatType.str: 4, StatType.hp: 45, StatType.defense: 6}, 
      {StatType.str: 7, StatType.hp: 110, StatType.defense: 10}, 
      {StatType.str: 10, StatType.hp: 170, StatType.defense: 15}, 
    ]
  ),
  Scroll(scrollName: "DEX 100%", scrollStats: [
      {StatType.dex: 1, StatType.hp: 5, StatType.defense: 1}, 
      {StatType.dex: 2, StatType.hp: 20, StatType.defense: 2}, 
      {StatType.dex: 3, StatType.hp: 30, StatType.defense: 3}, 
    ]
  ),
  Scroll(scrollName: "DEX 70%", scrollStats: [
      {StatType.dex: 2, StatType.hp: 15, StatType.defense: 2}, 
      {StatType.dex: 3, StatType.hp: 50, StatType.defense: 4}, 
      {StatType.dex: 4, StatType.hp: 70, StatType.defense: 5}, 
    ]
  ),
  Scroll(scrollName: "DEX 30%", scrollStats: [
      {StatType.dex: 3, StatType.hp: 30, StatType.defense: 4}, 
      {StatType.dex: 5, StatType.hp: 70, StatType.defense: 7}, 
      {StatType.dex: 7, StatType.hp: 120, StatType.defense: 10}, 
    ]
  ),
  Scroll(scrollName: "DEX 15%", scrollStats: [
      {StatType.dex: 4, StatType.hp: 45, StatType.defense: 6}, 
      {StatType.dex: 7, StatType.hp: 110, StatType.defense: 10}, 
      {StatType.dex: 10, StatType.hp: 170, StatType.defense: 15}, 
    ]
  ),
  Scroll(scrollName: "INT 100%", scrollStats: [
      {StatType.int: 1, StatType.hp: 5, StatType.defense: 1}, 
      {StatType.int: 2, StatType.hp: 20, StatType.defense: 2}, 
      {StatType.int: 3, StatType.hp: 30, StatType.defense: 3}, 
    ]
  ),
  Scroll(scrollName: "INT 70%", scrollStats: [
      {StatType.int: 2, StatType.hp: 15, StatType.defense: 2}, 
      {StatType.int: 3, StatType.hp: 50, StatType.defense: 4}, 
      {StatType.int: 4, StatType.hp: 70, StatType.defense: 5}, 
    ]
  ),
  Scroll(scrollName: "INT 30%", scrollStats: [
      {StatType.int: 3, StatType.hp: 30, StatType.defense: 4}, 
      {StatType.int: 5, StatType.hp: 70, StatType.defense: 7}, 
      {StatType.int: 7, StatType.hp: 120, StatType.defense: 10}, 
    ]
  ),
  Scroll(scrollName: "INT 15%", scrollStats: [
      {StatType.int: 4, StatType.hp: 45, StatType.defense: 6}, 
      {StatType.int: 7, StatType.hp: 110, StatType.defense: 10}, 
      {StatType.int: 10, StatType.hp: 170, StatType.defense: 15}, 
    ]
  ),
  Scroll(scrollName: "LUK 100%", scrollStats: [
      {StatType.luk: 1, StatType.hp: 5, StatType.defense: 1}, 
      {StatType.luk: 2, StatType.hp: 20, StatType.defense: 2}, 
      {StatType.luk: 3, StatType.hp: 30, StatType.defense: 3}, 
    ]
  ),
  Scroll(scrollName: "LUK 70%", scrollStats: [
      {StatType.luk: 2, StatType.hp: 15, StatType.defense: 2}, 
      {StatType.luk: 3, StatType.hp: 50, StatType.defense: 4}, 
      {StatType.luk: 4, StatType.hp: 70, StatType.defense: 5}, 
    ]
  ),
  Scroll(scrollName: "LUK 30%", scrollStats: [
      {StatType.luk: 3, StatType.hp: 30, StatType.defense: 4}, 
      {StatType.luk: 5, StatType.hp: 70, StatType.defense: 7}, 
      {StatType.luk: 7, StatType.hp: 120, StatType.defense: 10}, 
    ]
  ),
  Scroll(scrollName: "LUK 15%", scrollStats: [
      {StatType.luk: 4, StatType.hp: 45, StatType.defense: 6}, 
      {StatType.luk: 7, StatType.hp: 110, StatType.defense: 10}, 
      {StatType.luk: 10, StatType.hp: 170, StatType.defense: 15}, 
    ]
  ),
  Scroll(scrollName: "All Stats 30%", scrollStats: [
      {StatType.allStats: 1, StatType.hp: 30, StatType.defense: 4}, 
      {StatType.allStats: 2, StatType.hp: 70, StatType.defense: 7}, 
      {StatType.allStats: 3, StatType.hp: 120, StatType.defense: 10}, 
    ]
  ),
  Scroll(scrollName: "All Stats 15%", scrollStats: [
      {StatType.allStats: 2, StatType.hp: 45, StatType.defense: 6}, 
      {StatType.allStats: 3, StatType.hp: 110, StatType.defense: 10}, 
      {StatType.allStats: 4, StatType.hp: 170, StatType.defense: 15}, 
    ]
  ),
  Scroll(scrollName: "HP 100%", scrollStats: [
      {StatType.hp: 55, StatType.defense: 1}, 
      {StatType.hp: 120, StatType.defense: 2}, 
      {StatType.hp: 180, StatType.defense: 3}, 
    ]
  ),
  Scroll(scrollName: "HP 70%", scrollStats: [
      {StatType.hp: 115, StatType.defense: 2}, 
      {StatType.hp: 190, StatType.defense: 4}, 
      {StatType.hp: 270, StatType.defense: 5}, 
    ]
  ),
  Scroll(scrollName: "HP 30%", scrollStats: [
      {StatType.hp: 180, StatType.defense: 4}, 
      {StatType.hp: 320, StatType.defense: 7}, 
      {StatType.hp: 470, StatType.defense: 10}, 
    ]
  ),
  Scroll(scrollName: "HP 15%", scrollStats: [
      {StatType.hp: 245, StatType.defense: 6}, 
      {StatType.hp: 460, StatType.defense: 10}, 
      {StatType.hp: 670, StatType.defense: 15}, 
    ]
  ),
];

// Gloves
const List<BaseScroll> gloveScrolls = [
  Scroll(scrollName: "Attack Power 100%", scrollStats: [
      {StatType.attack: 0},
      {StatType.attack: 1}, 
    ]
  ),
  Scroll(scrollName: "Attack Power 70%", scrollStats: [
      {StatType.attack: 1},
      {StatType.attack: 2}, 
    ]
  ),
  Scroll(scrollName: "Attack Power 30%", scrollStats: [
      {StatType.attack: 2},
      {StatType.attack: 3}, 
    ]
  ),
  Scroll(scrollName: "Attack Power 15%", scrollStats: [
      {StatType.attack: 3},
      {StatType.attack: 4}, 
    ]
  ),
  Scroll(scrollName: "Magic Attack 100%", scrollStats: [
      {StatType.mattack: 0},
      {StatType.mattack: 1}, 
    ]
  ),
  Scroll(scrollName: "Magic Attack 70%", scrollStats: [
      {StatType.mattack: 1},
      {StatType.mattack: 2}, 
    ]
  ),
  Scroll(scrollName: "Magic Attack 30%", scrollStats: [
      {StatType.mattack: 2},
      {StatType.mattack: 3}, 
    ]
  ),
  Scroll(scrollName: "Magic Attack 15%", scrollStats: [
      {StatType.mattack: 3},
      {StatType.mattack: 4}, 
    ]
  ),
];

// Accessories
// Dominator Pendant Only
const fragmentOfDistortedTime = StaticScroll(
  scrollName: "Fragment of Distorted Time", 
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
);
// Reinforced/Superior Gollux earrings, rings, pendant, belt
const advancedGolluxScroll = StaticScroll(
  scrollName: "Advanced Gollux Scroll", 
  scrollStats: {
    StatType.allStats: 3,
    StatType.attack: 4,
    StatType.mattack: 4,
  }
);
// Cracked/Solid Gollux earrings, rings, pendant, belt
const basicGolluxScroll = StaticScroll(
  scrollName: "Basic Gollux Scroll", 
  scrollStats: {
    StatType.allStats: 1,
    StatType.attack: 2,
    StatType.mattack: 2,
  }
);
// Glona's Heart, Delgrunds Honor, and Numenal's Willpower
const masteriaGrandmasterScroll = StaticScroll(
  scrollName: "Masteria Grandmaster Accessory Exclusive Enhancement Scroll", 
  scrollStats: {
    StatType.allStats: 13,
    StatType.attack: 5,
    StatType.mattack: 5,
    StatType.hp: 10,
    StatType.mp: 10,
    StatType.defense: 10,
  }
);
// Legacy of Light/Darkness
const legacyOfLightAndDarknessScroll = StaticScroll(
  scrollName: "Legacy of Light／Darkness Exclusive Enhancement Scroll", 
  scrollStats: {
    StatType.allStats: 6,
    StatType.attack: 2,
    StatType.mattack: 2,
  }
);
// Horntail and Chaos Horntail Necklace
const dragonStone = StaticScroll(
  scrollName: "Dragon Stone", 
  slotCost: 3,
  scrollStats: {
    StatType.allStats: 15,
    StatType.hp: 750,
    StatType.defense: 360,
  }
);
// Earring only
const earringInt10 = StaticScroll(
  scrollName: "Scroll for Earring for INT 10%", 
  scrollStats: {
    StatType.int: 3,
    StatType.mattack: 5,
  }
);

const List<BaseScroll> accessoryScrolls = [
  Scroll(scrollName: "STR 100%", scrollStats: [
      {StatType.str: 1}, 
      {StatType.str: 1}, 
      {StatType.str: 2}, 
    ]
  ),
  Scroll(scrollName: "STR 70%", scrollStats: [
      {StatType.str: 2}, 
      {StatType.str: 2}, 
      {StatType.str: 3}, 
    ]
  ),
  Scroll(scrollName: "STR 30%", scrollStats: [
      {StatType.str: 3}, 
      {StatType.str: 4}, 
      {StatType.str: 5}, 
    ]
  ),
  Scroll(scrollName: "DEX 100%", scrollStats: [
      {StatType.dex: 1}, 
      {StatType.dex: 1}, 
      {StatType.dex: 2}, 
    ]
  ),
  Scroll(scrollName: "DEX 70%", scrollStats: [
      {StatType.dex: 2}, 
      {StatType.dex: 2}, 
      {StatType.dex: 3},  
    ]
  ),
  Scroll(scrollName: "DEX 30%", scrollStats: [
      {StatType.dex: 3}, 
      {StatType.dex: 4}, 
      {StatType.dex: 5},
    ]
  ),
  Scroll(scrollName: "INT 100%", scrollStats: [
      {StatType.int: 1}, 
      {StatType.int: 1}, 
      {StatType.int: 2},
    ]
  ),
  Scroll(scrollName: "INT 70%", scrollStats: [
      {StatType.int: 2}, 
      {StatType.int: 2}, 
      {StatType.int: 3},
    ]
  ),
  Scroll(scrollName: "INT 30%", scrollStats: [
      {StatType.int: 3}, 
      {StatType.int: 4}, 
      {StatType.int: 5},
    ]
  ),
  Scroll(scrollName: "LUK 100%", scrollStats: [
      {StatType.luk: 1}, 
      {StatType.luk: 1}, 
      {StatType.luk: 2},
    ]
  ),
  Scroll(scrollName: "LUK 70%", scrollStats: [
      {StatType.luk: 2}, 
      {StatType.luk: 2}, 
      {StatType.luk: 3},
    ]
  ),
  Scroll(scrollName: "LUK 30%", scrollStats: [
      {StatType.luk: 3}, 
      {StatType.luk: 4}, 
      {StatType.luk: 5}, 
    ]
  ),
  Scroll(scrollName: "All Stats 30%", scrollStats: [
      {StatType.allStats: 1}, 
      {StatType.allStats: 2}, 
      {StatType.allStats: 3}, 
    ]
  ),
  Scroll(scrollName: "HP 100%", scrollStats: [
      {StatType.hp: 50}, 
      {StatType.hp: 50}, 
      {StatType.hp: 100}, 
    ]
  ),
  Scroll(scrollName: "HP 70%", scrollStats: [
      {StatType.hp: 100}, 
      {StatType.hp: 100}, 
      {StatType.hp: 150}, 
    ]
  ),
  Scroll(scrollName: "HP 30%", scrollStats: [
      {StatType.hp: 150}, 
      {StatType.hp: 200}, 
      {StatType.hp: 250}, 
    ]
  ),
  ScrollWithRange(
    scrollName: "Premium Accessory Scroll for Attack Power", 
    scrollStats: {
      StatType.attack: ScrollRange(minRange: 4, maxRange: 5, divisions: 1),
    }
  ),
  ScrollWithRange(
    scrollName: "Premium Accessory Scroll for Magic Attack", 
    scrollStats: {
      StatType.mattack: ScrollRange(minRange: 4, maxRange: 5, divisions: 1),
    }
  ),
  ScrollWithRange(
    scrollName: "Miracle Scroll for Accessory for Attack Power 50%", 
    scrollStats: {
      StatType.attack: ScrollRange(minRange: 1, maxRange: 4, divisions: 3),
    }
  ),
  ScrollWithRange(
    scrollName: "Miracle Scroll for Accessory for Magic Attack 50%", 
    scrollStats: {
      StatType.mattack: ScrollRange(minRange: 1, maxRange: 4, divisions: 3),
    }
  ),
  ScrollWithRange(
    scrollName: "Accessory Scroll for Attack Power", 
    scrollStats: {
      StatType.attack: ScrollRange(minRange: 2, maxRange: 4, divisions: 2),
    }
  ),
  ScrollWithRange(
    scrollName: "Accessory Scroll for Magic Attack", 
    scrollStats: {
      StatType.mattack: ScrollRange(minRange: 2, maxRange: 4, divisions: 2),
    }
  ),
  ScrollWithRange(
    scrollName: "Accessory Scroll for Attack Power 70%", 
    scrollStats: {
      StatType.attack: ScrollRange(minRange: 1, maxRange: 2, divisions: 1),
    }
  ),
  ScrollWithRange(
    scrollName: "Accessory Scroll for Magic Attack 70%", 
    scrollStats: {
      StatType.mattack: ScrollRange(minRange: 1, maxRange: 2, divisions: 1),
    }
  ),
];

// Hearts
const List<BaseScroll> heartScrolls = [
  Scroll(scrollName: "Attack Power 100%", scrollStats: [
      {StatType.attack: 1},
      {StatType.attack: 2}, 
      {StatType.attack: 3}, 
    ]
  ),
  Scroll(scrollName: "Attack Power 70%", scrollStats: [
      {StatType.attack: 2},
      {StatType.attack: 3}, 
      {StatType.attack: 4},  
    ]
  ),
  Scroll(scrollName: "Attack Power 30%", scrollStats: [
      {StatType.attack: 3},
      {StatType.attack: 5}, 
      {StatType.attack: 7},  
    ]
  ),
  Scroll(scrollName: "Magic Attack 100%", scrollStats: [
      {StatType.mattack: 1},
      {StatType.mattack: 2}, 
      {StatType.mattack: 3}, 
    ]
  ),
  Scroll(scrollName: "Magic Attack 70%", scrollStats: [
      {StatType.mattack: 2},
      {StatType.mattack: 3}, 
      {StatType.mattack: 4}, 
    ]
  ),
  Scroll(scrollName: "Magic Attack 30%", scrollStats: [
      {StatType.mattack: 3},
      {StatType.mattack: 5}, 
      {StatType.mattack: 7}, 
    ]
  ),
];

// Weapons
const List<BaseScroll> weaponScrolls = [
  Scroll(scrollName: "Attack Power (STR) 100%", scrollStats: [
      {StatType.attack: 1}, 
      {StatType.attack: 2},
      {StatType.attack: 3, StatType.str: 1},
    ]
  ),
  Scroll(scrollName: "Attack Power (STR) 70%", scrollStats: [
      {StatType.attack: 2}, 
      {StatType.attack: 3, StatType.str: 1},
      {StatType.attack: 5, StatType.str: 2},
    ]
  ),
  Scroll(scrollName: "Attack Power (STR) 30%", scrollStats: [
      {StatType.attack: 3, StatType.str: 1}, 
      {StatType.attack: 5, StatType.str: 2},
      {StatType.attack: 7, StatType.str: 3},
    ]
  ),
  Scroll(scrollName: "Attack Power (STR) 15%", scrollStats: [
      {StatType.attack: 5, StatType.str: 2}, 
      {StatType.attack: 7, StatType.str: 3},
      {StatType.attack: 9, StatType.str: 4},
    ]
  ),
  Scroll(scrollName: "Attack Power (DEX) 100%", scrollStats: [
      {StatType.attack: 1}, 
      {StatType.attack: 2},
      {StatType.attack: 3, StatType.dex: 1}, 
    ]
  ),
  Scroll(scrollName: "Attack Power (DEX) 70%", scrollStats: [
      {StatType.attack: 2}, 
      {StatType.attack: 3, StatType.dex: 1},
      {StatType.attack: 5, StatType.dex: 2},
    ]
  ),
  Scroll(scrollName: "Attack Power (DEX) 30%", scrollStats: [
      {StatType.attack: 3, StatType.dex: 1}, 
      {StatType.attack: 5, StatType.dex: 2},
      {StatType.attack: 7, StatType.dex: 3}, 
    ]
  ),
  Scroll(scrollName: "Attack Power (DEX) 15%", scrollStats: [
      {StatType.attack: 5, StatType.dex: 2}, 
      {StatType.attack: 7, StatType.dex: 3},
      {StatType.attack: 9, StatType.dex: 4}, 
    ]
  ),
  Scroll(scrollName: "Magic Attack (INT) 100%", scrollStats: [
      {StatType.mattack: 1}, 
      {StatType.mattack: 2},
      {StatType.mattack: 3, StatType.int: 1},
    ]
  ),
  Scroll(scrollName: "Magic Attack (INT) 70%", scrollStats: [
      {StatType.mattack: 2}, 
      {StatType.mattack: 3, StatType.int: 1},
      {StatType.mattack: 5, StatType.int: 2},
    ]
  ),
  Scroll(scrollName: "Magic Attack (INT) 30%", scrollStats: [
      {StatType.mattack: 3, StatType.int: 1}, 
      {StatType.mattack: 5, StatType.int: 2},
      {StatType.mattack: 7, StatType.int: 3}, 
    ]
  ),
  Scroll(scrollName: "Magic Attack (INT) 15%", scrollStats: [
      {StatType.mattack: 5, StatType.int: 2}, 
      {StatType.mattack: 7, StatType.int: 3},
      {StatType.mattack: 9, StatType.int: 4},
    ]
  ),
  Scroll(scrollName: "Attack Power (LUK) 100%", scrollStats: [
      {StatType.attack: 1}, 
      {StatType.attack: 2},
      {StatType.attack: 3, StatType.luk: 1},
    ]
  ),
  Scroll(scrollName: "Attack Power (LUK) 70%", scrollStats: [
      {StatType.attack: 2}, 
      {StatType.attack: 3, StatType.luk: 1},
      {StatType.attack: 5, StatType.luk: 2},
    ]
  ),
  Scroll(scrollName: "Attack Power (LUK) 30%", scrollStats: [
      {StatType.attack: 3, StatType.luk: 1}, 
      {StatType.attack: 5, StatType.luk: 2},
      {StatType.attack: 7, StatType.luk: 3}, 
    ]
  ),
  Scroll(scrollName: "Attack Power (LUK) 15%", scrollStats: [
      {StatType.attack: 5, StatType.luk: 2}, 
      {StatType.attack: 7, StatType.luk: 3},
      {StatType.attack: 9, StatType.luk: 4},
    ]
  ),
  Scroll(scrollName: "Attack Power (HP) 100%", scrollStats: [
      {StatType.attack: 1}, 
      {StatType.attack: 2},
      {StatType.attack: 3, StatType.hp: 50},
    ]
  ),
  Scroll(scrollName: "Attack Power (HP) 70%", scrollStats: [
      {StatType.attack: 2}, 
      {StatType.attack: 3, StatType.hp: 50},
      {StatType.attack: 5, StatType.hp: 100}, 
    ]
  ),
  Scroll(scrollName: "Attack Power (HP) 30%", scrollStats: [
      {StatType.attack: 3, StatType.hp: 50}, 
      {StatType.attack: 5, StatType.hp: 100},
      {StatType.attack: 7, StatType.hp: 150},
    ]
  ),
  Scroll(scrollName: "Attack Power (HP) 15%", scrollStats: [
      {StatType.attack: 5, StatType.hp: 100}, 
      {StatType.attack: 7, StatType.hp: 150},
      {StatType.attack: 9, StatType.hp: 200},
    ]
  ),
  ScrollWithRange(
    scrollName: "Magical Scroll for Attack Power 50%", 
    scrollStats: {
      StatType.attack: ScrollRange(minRange: 9, maxRange: 11, divisions: 2),
      StatType.allStats: ScrollRange(minRange: 3, maxRange: 3)
    }
  ),
  ScrollWithRange(
    scrollName: "Magical Scroll for Magic Attack 50%", 
    scrollStats: {
      StatType.mattack: ScrollRange(minRange: 9, maxRange: 11, divisions: 2),
      StatType.allStats: ScrollRange(minRange: 3, maxRange: 3)
    }
  ),
  ScrollWithRange(
    scrollName: "Miracle Scroll for Attack Power 50%", 
    scrollStats: {
      StatType.attack: ScrollRange(minRange: 2, maxRange: 5, divisions: 3),
      StatType.allStats: ScrollRange(minRange: 3, maxRange: 3)
    }
  ),
  ScrollWithRange(
    scrollName: "Miracle Scroll for Magic Attack 50%", 
    scrollStats: {
      StatType.mattack: ScrollRange(minRange: 2, maxRange: 5, divisions: 3),
      StatType.allStats: ScrollRange(minRange: 3, maxRange: 3)
    }
  ),
];