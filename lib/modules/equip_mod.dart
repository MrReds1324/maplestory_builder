import 'package:maplestory_builder/core/constants.dart';
import 'package:maplestory_builder/core/items/equip_sets.dart';

import 'package:maplestory_builder/core/items/equips.dart';

class EquipModule {
  // This is what we are going to use to set the equips hash value once it is saved here so that when 
  // rebuilding from json we can ensure the items stay "linked"
  int equipHash = 1;
  List<Equip> allEquips = <Equip>[];
  SetEffectModule setEffectModule = SetEffectModule();

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
  // Title
  Equip? title;
  // Pets and Pet equips
  Equip? pet1;
  Equip? pet2;
  Equip? pet3;
  Equip? petEquip1;
  Equip? petEquip2;
  Equip? petEquip3;

  EquipModule({
    List<Equip>? allEquips,
    SetEffectModule? setEffectModule,
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
    this.title,
    this.pet1,
    this.pet2,
    this.pet3,
    this.petEquip1,
    this.petEquip2,
    this.petEquip3,
    this.equipHash = 1,
  }) {
    this.allEquips = allEquips ?? [];
    this.setEffectModule = setEffectModule ?? SetEffectModule();
  }

  EquipModule copyWith({
    List<Equip>? allEquips,
    SetEffectModule? setEffectModule,
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
    Equip? title,
    Equip? pet1,
    Equip? pet2,
    Equip? pet3,
    Equip? petEquip1,
    Equip? petEquip2,
    Equip? petEquip3,
    int? equipHash,
  }) {
    return EquipModule(
      allEquips: allEquips ?? List.from(this.allEquips),
      setEffectModule: setEffectModule ?? this.setEffectModule.copyWith(),
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
      heart: heart ?? this.heart,
      title: title ?? this.title,
      pet1: pet1 ?? this.pet1,
      pet2: pet2 ?? this.pet2,
      pet3: pet3 ?? this.pet3,
      petEquip1: petEquip1 ?? this.petEquip1,
      petEquip2: petEquip2 ?? this.petEquip2,
      petEquip3: petEquip3 ?? this.petEquip3,
      equipHash: equipHash ?? this.equipHash,
    );
  }

  bool equipEquip(Equip? equip, EquipType equipType, {int equipPosition = 0, bool isCalculatingDifference = false}) {
    if (!isCalculatingDifference && (equip?.isEquipped ?? false) && (equip?.isUniqueItem ?? false)) {
      return false;
    }

    if (!isCalculatingDifference) {
      equip?.isEquipped = true;
    }
    Equip? replacedItem;

    switch(equipType) {
      case EquipType.totem:
        if (equipPosition == 1) {
          replacedItem = totem1;
          totem1 = equip;
        }
        else if (equipPosition == 2) {
          replacedItem = totem2;
          totem2 = equip;
        }
        else {
          replacedItem = totem3;
          totem3 = equip;
        }
      case EquipType.ring:
        if (equipPosition == 1) {
          replacedItem = ring1;
          ring1 = equip;
        }
        else if (equipPosition == 2) {
          replacedItem = ring2;
          ring2 = equip;
        }
        else if (equipPosition == 3) {
          replacedItem = ring3;
          ring3 = equip;
        }
        else {
          replacedItem = ring4;
          ring4 = equip;
        }
      case EquipType.pocket:
        replacedItem = pocketItem;
        pocketItem = equip;
      case EquipType.pendant:
        if (equipPosition == 1) {
          replacedItem = pendant1;
          pendant1 = equip;
        }
        else {
          replacedItem = pendant2;
          pendant2 = equip;
        }
      case EquipType.weapon:
        replacedItem = weapon;
        weapon = equip;
      case EquipType.belt:
        replacedItem = belt;
        belt = equip;
      case EquipType.hat:
        replacedItem = hat;
        hat = equip;
      case EquipType.face:
        replacedItem = face;
        face = equip;
      case EquipType.eye:
        replacedItem = eye;
        eye = equip;
      case EquipType.overall:
        replacedItem = overall;
        if (!isCalculatingDifference) {
          top?.isEquipped = false;
          bottom?.isEquipped = false;
        }
        setEffectModule.removeEquip(top, isCalculatingDifference: isCalculatingDifference);
        setEffectModule.removeEquip(bottom, isCalculatingDifference: isCalculatingDifference);
        overall = equip;
        top = null;
        bottom = null;
      case EquipType.top:
        replacedItem = top;
        top = equip;
        if (!isCalculatingDifference) {
          overall?.isEquipped = false;
        }
        setEffectModule.removeEquip(overall, isCalculatingDifference: isCalculatingDifference);
        overall = null;
      case EquipType.bottom:
        replacedItem = bottom;
        bottom = equip;
        if (!isCalculatingDifference) {
          overall?.isEquipped = false;
        }
        setEffectModule.removeEquip(overall, isCalculatingDifference: isCalculatingDifference);
        overall = null;
      case EquipType.shoes:
        replacedItem = shoes;
        shoes = equip;
      case EquipType.earrings:
        replacedItem = earrings;
        earrings = equip;
      case EquipType.shoulder:
        replacedItem = shoulder;
        shoulder = equip;
      case EquipType.gloves:
        replacedItem = gloves;
        gloves = equip;
      case EquipType.emblem:
        replacedItem = emblem;
        emblem = equip;
      case EquipType.badge:
        replacedItem = badge;
        badge = equip;
      case EquipType.medal:
        replacedItem =  medal;
        medal = equip;
      case EquipType.secondary:
      case EquipType.shield:
      case EquipType.katara:
        replacedItem = secondary;
        secondary = equip;
      case EquipType.cape:
        replacedItem = cape;
        cape = equip;
      case EquipType.heart:
        replacedItem = heart;
        heart = equip;
      case EquipType.title:
        replacedItem = title;
        title = equip;
      case EquipType.pet:
        if (equipPosition == 1) {
          replacedItem = pet1;
          pet1 = equip;
        }
        else if (equipPosition == 2) {
          replacedItem = pet2;
          pet2 = equip;
        }
        else {
          replacedItem = pet3;
          pet3 = equip;
        }
      case EquipType.petEquip:
        if (equipPosition == 1) {
          replacedItem = petEquip1;
          petEquip1 = equip;
        }
        else if (equipPosition == 2) {
          replacedItem = petEquip2;
          petEquip2 = equip;
        }
        else {
          replacedItem = petEquip3;
          petEquip3 = equip;
        }
      default:
        throw Exception("Unhandled EquipType $equipType trying to be equipped");
    }

    if (replacedItem != equip) {
      if (!isCalculatingDifference) {
        replacedItem?.isEquipped = false;
      }
      setEffectModule.removeEquip(replacedItem, isCalculatingDifference: isCalculatingDifference);
      setEffectModule.addEquip(equip, isCalculatingDifference: isCalculatingDifference);
    }
    return true;
  }
  
  bool _updateEquippedEquip(Equip targetEquip, {bool isRemoving=false}) {
    bool didUpdateEquipped = false;

    switch(targetEquip.equipType) {
      case EquipType.totem:
        if (totem1 == targetEquip) {
          totem1 = isRemoving ? null : targetEquip;
          didUpdateEquipped = true;
        }
        if (totem2 == targetEquip) {
          totem2 = isRemoving ? null : targetEquip;
          didUpdateEquipped = true;
        }
        if (totem3 == targetEquip) {
          totem3 = isRemoving ? null : targetEquip;
          didUpdateEquipped = true;
        }
      case EquipType.ring:
        if (ring1 == targetEquip) {
          ring1 = isRemoving ? null : targetEquip;
          didUpdateEquipped = true;
        }
        if (ring2 == targetEquip) {
          ring2 = isRemoving ? null : targetEquip;
          didUpdateEquipped = true;
        }
        if (ring3 == targetEquip) {
          ring3 = isRemoving ? null : targetEquip;
          didUpdateEquipped = true;
        }
        if (ring4 == targetEquip) {
          ring4 = isRemoving ? null : targetEquip;
          didUpdateEquipped = true;
        }
      case EquipType.pocket:
        if (pocketItem == targetEquip) {
          pocketItem = isRemoving ? null : targetEquip;
          didUpdateEquipped = true;
        }
      case EquipType.pendant:
        if (pendant1 == targetEquip) {
          pendant1 = isRemoving ? null : targetEquip;
          didUpdateEquipped = true;
        }
        if (pendant2 == targetEquip) {
          pendant2 = isRemoving ? null : targetEquip;
          didUpdateEquipped = true;
        }
      case EquipType.weapon:
        if (weapon == targetEquip) {
          weapon = isRemoving ? null : targetEquip;
          didUpdateEquipped = true;
        }
      case EquipType.belt:
        if (belt == targetEquip) {
          belt = isRemoving ? null : targetEquip;
          didUpdateEquipped = true;
        }
      case EquipType.hat:
        if (hat == targetEquip) {
          hat = isRemoving ? null : targetEquip;
          didUpdateEquipped = true;
        }
      case EquipType.face:
        if (face == targetEquip) {
          face = isRemoving ? null : targetEquip;
          didUpdateEquipped = true;
        }
      case EquipType.eye:
        if (eye == targetEquip) {
          eye = isRemoving ? null : targetEquip;
          didUpdateEquipped = true;
        }
      case EquipType.overall:
        if (overall == targetEquip) {
          overall = isRemoving ? null : targetEquip;
          didUpdateEquipped = true;
        }
      case EquipType.top:
        if (top == targetEquip) {
          top = isRemoving ? null : targetEquip;
          didUpdateEquipped = true;
        }
      case EquipType.bottom:
        if (bottom == targetEquip) {
          bottom = isRemoving ? null : targetEquip;
          didUpdateEquipped = true;
        }
      case EquipType.shoes:
        if (shoes == targetEquip) {
          shoes = isRemoving ? null : targetEquip;
          didUpdateEquipped = true;
        }
      case EquipType.earrings:
        if (earrings == targetEquip) {
          earrings = isRemoving ? null : targetEquip;
          didUpdateEquipped = true;
        }
      case EquipType.shoulder:
        if (shoulder == targetEquip) {
          shoulder = isRemoving ? null : targetEquip;
          didUpdateEquipped = true;
        }
      case EquipType.gloves:
        if (gloves == targetEquip) {
          gloves = isRemoving ? null : targetEquip;
          didUpdateEquipped = true;
        }
      case EquipType.emblem:
        if (emblem == targetEquip) {
          emblem = isRemoving ? null : targetEquip;
          didUpdateEquipped = true;
        }
      case EquipType.badge:
        if (badge == targetEquip) {
          badge = isRemoving ? null : targetEquip;
          didUpdateEquipped = true;
        }
      case EquipType.medal:
        if (medal == targetEquip) {
          medal = isRemoving ? null : targetEquip;
          didUpdateEquipped = true;
        }
      case EquipType.secondary:
      case EquipType.shield:
      case EquipType.katara:
        if (secondary == targetEquip) {
          secondary = isRemoving ? null : targetEquip;
          didUpdateEquipped = true;
        }
      case EquipType.cape:
        if (cape == targetEquip) {
          cape = isRemoving ? null : targetEquip;
          didUpdateEquipped = true;
        }
      case EquipType.heart:
        if (heart == targetEquip) {
          heart = isRemoving ? null : targetEquip;
          didUpdateEquipped = true;
        }
      case EquipType.title:
        if (title == targetEquip) {
          title = isRemoving ? null : targetEquip;
          didUpdateEquipped = true;
        }
      case EquipType.pet:
        if (pet1 == targetEquip) {
          pet1 = isRemoving ? null : targetEquip;
          didUpdateEquipped = true;
        }
        if (pet2 == targetEquip) {
          pet2 = isRemoving ? null : targetEquip;
          didUpdateEquipped = true;
        }
        if (pet3 == targetEquip) {
          pet3 = isRemoving ? null : targetEquip;
          didUpdateEquipped = true;
        }
      case EquipType.petEquip:
        if (petEquip1 == targetEquip) {
          petEquip1 = isRemoving ? null : targetEquip;
          didUpdateEquipped = true;
        }
        if (petEquip2 == targetEquip) {
          petEquip2 = isRemoving ? null : targetEquip;
          didUpdateEquipped = true;
        }
        if (petEquip3 == targetEquip) {
          petEquip3 = isRemoving ? null : targetEquip;
          didUpdateEquipped = true;
        }
      default:
        throw Exception("Unhandled EquipType ${targetEquip.equipType} trying to be updated");
    }

    if (isRemoving) {
      setEffectModule.removeEquip(targetEquip);
    }

    return didUpdateEquipped;
  }

  bool saveEditingEquip(Equip? editingEquip) {
    bool didUpdateEquipped = false;
    
    // Nothing to actually save
    if (editingEquip == null) {
      return didUpdateEquipped;
    }
    
    // New equip that cannot be equipped
    if (editingEquip.equipHash == -1) {
      editingEquip.equipHash = equipHash;
      equipHash++;
      allEquips.add(editingEquip);
      return didUpdateEquipped;
    }

    // Repalce the old version of the item with the new one if we updated one already
    for (var i = 0; i < allEquips.length; i ++) {
      if (allEquips[i] == editingEquip) {
        allEquips[i] = editingEquip;
        break;
      }
    }

    didUpdateEquipped = _updateEquippedEquip(editingEquip);
    return didUpdateEquipped;
  }

  bool deleteEquip(Equip deletingEquip) {
    bool didRemoveEquip = _updateEquippedEquip(deletingEquip, isRemoving: true);
    allEquips.remove(deletingEquip);
    return didRemoveEquip;
  }

  List<Map<StatType, num>> calculateStats({bool recalculateCache = false}) {
    var equipStats = <Map<StatType, num>>[];

    void addToList(Equip? equip){
      if (equip != null){
        equipStats.add(equip.calculateStats());
    }
    }

    addToList(totem1);
    addToList(totem2);
    addToList(totem3);
    addToList(ring1);
    addToList(ring2);
    addToList(ring3);
    addToList(ring4);
    addToList(pocketItem);
    addToList(pendant1);
    addToList(pendant2);
    addToList(weapon);
    addToList(belt);
    addToList(hat);
    addToList(face);
    addToList(eye);
    addToList(overall);
    addToList(top);
    addToList(bottom);
    addToList(shoes);
    addToList(earrings);
    addToList(shoulder);
    addToList(gloves);
    addToList(emblem);
    addToList(badge);
    addToList(medal);
    addToList(secondary);
    addToList(cape);
    addToList(heart);
    addToList(title);
    addToList(pet1);
    addToList(pet2);
    addToList(pet3);
    addToList(petEquip1);
    addToList(petEquip2);
    addToList(petEquip3);

    equipStats.addAll(setEffectModule.calculateStats(recalculateCache: recalculateCache));

    return equipStats;
  }
}
