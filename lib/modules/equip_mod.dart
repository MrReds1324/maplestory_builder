import 'package:maplestory_builder/core/constants.dart';

import 'package:maplestory_builder/core/items/equips.dart';

class EquipModule {
  List<Equip> allEquips = <Equip>[];

  // Totems
  Equip? totem1;
  Equip? totem2;
  Equip? totem3;
  // Rings
  Equip? ring1;
  Equip? ring2;
  Equip? ring3;
  Equip? ring4;
  // Pocket Item
  Equip? pocketItem;
  // Pendants
  Equip? pendant1;
  Equip? pendant2;
  // Weapon
  Equip? weapon;
  // Belt
  Equip? belt;
  // Hat
  Equip? hat;
  // Face
  Equip? face;
  // Eye
  Equip? eye;
  // Overall
  Equip? overall;
  // Top
  Equip? top;
  // Bottom
  Equip? bottom;
  // Shoes
  Equip? shoes;
  // Earring
  Equip? earrings;
  // Shoulder
  Equip? shoulder;
  // Gloves
  Equip? gloves;
  // Emblem
  Equip? emblem;
  // Badge
  Equip? badge;
  // Medal
  Equip? medal;
  // Secondary Weapon
  Equip? secondary;
  // Cape
  Equip? cape;
  // Heart
  Equip? heart;

  // Map<StatType, num> calculateStats() {
  //   return <EquipType, <StatType, num>>{{}
  //   };
  // }

  void equipEquip(Equip? equip, EquipType equipType, {int equipPosition = 0}) {
    equip?.equipped = true;
    switch(equipType) {
      case EquipType.totem:
        if (equipPosition == 1) {
          totem1?.equipped = false;
          totem1 = equip;
        }
        else if (equipPosition == 2) {
          totem2?.equipped = false;
          totem2 = equip;
        }
        else {
          totem3?.equipped = false;
          totem3 = equip;
        }
      case EquipType.ring:
        if (equipPosition == 1) {
          ring1?.equipped = false;
          ring1 = equip;
        }
        else if (equipPosition == 2) {
          ring2?.equipped = false;
          ring2 = equip;
        }
        else if (equipPosition == 3) {
          ring3?.equipped = false;
          ring3 = equip;
        }
        else {
          ring4?.equipped = false;
          ring4 = equip;
        }
      case EquipType.pocket:
        pocketItem?.equipped = false;
        pocketItem = equip;
      case EquipType.pendant:
        if (equipPosition == 1) {
          pendant1?.equipped = false;
          pendant1 = equip;
        }
        else {
          pendant2?.equipped = false;
          pendant2 = equip;
        }
      case EquipType.weapon:
        weapon?.equipped = false;
        weapon = equip;
      case EquipType.belt:
        belt?.equipped = false;
        belt = equip;
      case EquipType.hat:
        hat?.equipped = false;
        hat = equip;
      case EquipType.face:
        face?.equipped = false;
        face = equip;
      case EquipType.eye:
        eye?.equipped = false;
        eye = equip;
      case EquipType.overall:
        overall?.equipped = false;
        overall = equip;
        top?.equipped = false;
        top = null;
        bottom?.equipped = false;
        bottom = null;
      case EquipType.top:
        top?.equipped = false;
        top = equip;
        overall?.equipped = false;
        overall = null;
      case EquipType.bottom:
        bottom?.equipped = false;
        bottom = equip;
        overall?.equipped = false;
        overall = null;
      case EquipType.shoes:
        shoes?.equipped = false;
        shoes = equip;
      case EquipType.earrings:
        earrings?.equipped = false;
        earrings = equip;
      case EquipType.shoulder:
        shoulder?.equipped = false;
        shoulder = equip;
      case EquipType.gloves:
        gloves?.equipped = false;
        gloves = equip;
      case EquipType.emblem:
        emblem?.equipped = false;
        emblem = equip;
      case EquipType.badge:
        badge?.equipped = false;
        badge = equip;
      case EquipType.medal:
        medal?.equipped = false;
        medal = equip;
      case EquipType.secondary:
        secondary?.equipped = false;
        secondary = equip;
      case EquipType.cape:
        cape?.equipped = false;
        cape = equip;
      case EquipType.heart:
        heart?.equipped = false;
        heart = equip;
      default:
        throw Exception("Unhandled EquipType $equipType trying to be equipped");
    }
  }

  EquipModule({
    List<Equip>? allEquips,
    this.totem1,
    this.totem2,
    this.totem3,
    this.ring1,
    this.ring2,
    this.ring3,
    this.ring4,
    this.pocketItem,
    this.pendant1,
    this.pendant2,
    this.weapon,
    this.belt,
    this.hat,
    this.face,
    this.eye,
    this.overall,
    this.top,
    this.bottom,
    this.shoes,
    this.earrings,
    this.shoulder,
    this.gloves,
    this.emblem,
    this.badge,
    this.medal,
    this.secondary,
    this.cape,
    this.heart,
  }) {
    this.allEquips = allEquips ?? [
      Equip(name: "Royal Ranger Beret", equipType: EquipType.hat, classType: ClassType.bowman, str: 40, dex: 40, int: 0, luk: 0),
      Equip(name: "Royal Warrior Helm", equipType: EquipType.hat, classType: ClassType.warrior, str: 40, dex: 40, int: 0, luk: 0),
      Equip(name: "Royal Warrior Helm", equipType: EquipType.belt, classType: ClassType.warrior, str: 40, dex: 40, int: 0, luk: 0),
      Equip(name: "Cursed Red Spellbook", equipType: EquipType.pocket, classType: ClassType.warrior, str: 40, dex: 40, int: 0, luk: 0),
      Equip(name: "Princess No's Arrowhead", equipType: EquipType.secondary, classType: ClassType.warrior, str: 40, dex: 40, int: 0, luk: 0),
      Equip(name: "Royal Ranger Beret", equipType: EquipType.hat, classType: ClassType.bowman, str: 40, dex: 40, int: 0, luk: 0),
      Equip(name: "Royal Warrior Helm", equipType: EquipType.hat, classType: ClassType.warrior, str: 40, dex: 40, int: 0, luk: 0),
      Equip(name: "Royal Warrior Helm", equipType: EquipType.belt, classType: ClassType.warrior, str: 40, dex: 40, int: 0, luk: 0),
      Equip(name: "Cursed Red Spellbook", equipType: EquipType.pocket, classType: ClassType.warrior, str: 40, dex: 40, int: 0, luk: 0),
      Equip(name: "Princess No's Arrowhead", equipType: EquipType.secondary, classType: ClassType.warrior, str: 40, dex: 40, int: 0, luk: 0),
      Equip(name: "Royal Ranger Beret", equipType: EquipType.hat, classType: ClassType.bowman, str: 40, dex: 40, int: 0, luk: 0),
      Equip(name: "Royal Warrior Helm", equipType: EquipType.hat, classType: ClassType.warrior, str: 40, dex: 40, int: 0, luk: 0),
      Equip(name: "Royal Warrior Helm", equipType: EquipType.belt, classType: ClassType.warrior, str: 40, dex: 40, int: 0, luk: 0),
      Equip(name: "Cursed Red Spellbook", equipType: EquipType.pocket, classType: ClassType.warrior, str: 40, dex: 40, int: 0, luk: 0),
      Equip(name: "Princess No's Arrowhead", equipType: EquipType.secondary, classType: ClassType.warrior, str: 40, dex: 40, int: 0, luk: 0),
    ];
  }

  EquipModule copyWith({
    List<Equip>? allEquips,
    Equip? totem1,
    Equip? totem2,
    Equip? totem3,
    Equip? ring1,
    Equip? ring2,
    Equip? ring3,
    Equip? ring4,
    Equip? pocketItem,
    Equip? pendant1,
    Equip? pendant2,
    Equip? weapon,
    Equip? belt,
    Equip? hat,
    Equip? face,
    Equip? eye,
    Equip? overall,
    Equip? top,
    Equip? bottom,
    Equip? shoes,
    Equip? earrings,
    Equip? shoulder,
    Equip? gloves,
    Equip? emblem,
    Equip? badge,
    Equip? medal,
    Equip? secondary,
    Equip? cape,
    Equip? heart,
  }) {
    return EquipModule(
      allEquips: allEquips ?? List.from(this.allEquips),
      totem1: totem1 ?? this.totem1,
      totem2: totem2 ?? this.totem2,
      totem3: totem3 ?? this.totem3,
      ring1: ring1 ?? this.ring1,
      ring2: ring2 ?? this.ring2,
      ring3: ring3 ?? this.ring3,
      ring4: ring4 ?? this.ring4,
      pocketItem: pocketItem ?? this.pocketItem,
      pendant1: pendant1 ?? this.pendant1,
      pendant2: pendant2 ?? this.pendant2,
      weapon: weapon ?? this.weapon,
      belt: belt ?? this.belt,
      hat: hat ?? this.hat,
      face: face ?? this.face,
      eye: eye ?? this.eye,
      overall: overall ?? this.overall,
      top: top ?? this.top,
      bottom: bottom ?? this.bottom,
      shoes: shoes ?? this.shoes,
      earrings: earrings ?? this.earrings,
      shoulder: shoulder ?? this.shoulder,
      gloves: gloves ?? this.gloves,
      emblem: emblem ?? this.emblem,
      badge: badge ?? this.badge,
      medal: medal ?? this.medal,
      secondary: secondary ?? this.secondary,
      cape: cape ?? this.cape,
      heart: heart?? this.heart,
    );
  }
}
