
import 'package:flutter/material.dart';
import 'package:maplestory_builder/core/constants.dart';
import 'package:maplestory_builder/core/base.dart';

class Equip extends Base {
  final EquipType equipType;
  final ClassType classType;
  bool equipped = false;

  Equip({
    required super.name,
    required this.equipType,
    this.classType = ClassType.all,
    super.str = 0,
    super.dex = 0,
    super.int = 0,
    super.luk = 0,
  });

  @override
  String toString() {
    return name;
  }

  Container createEquipContainer(){
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: Colors.red)
      ),
      child: Text(name)
    );
  }
}

final List<Equip> equipList = [
  Equip(name: "Royal Ranger Beret", equipType: EquipType.hat, classType: ClassType.bowman, str: 40, dex: 40, int: 0, luk: 0),
  Equip(name: "Royal Warrior Helm", equipType: EquipType.hat, classType: ClassType.warrior, str: 40, dex: 40, int: 0, luk: 0),
  Equip(name: "TEST", equipType: EquipType.belt, str: 40, dex: 40, int: 0, luk: 0),
  Equip(name: "Royal Ranger Beret", equipType: EquipType.hat, classType: ClassType.bowman, str: 40, dex: 40, int: 0, luk: 0),
  Equip(name: "Royal Warrior Helm", equipType: EquipType.hat, classType: ClassType.warrior, str: 40, dex: 40, int: 0, luk: 0),
  Equip(name: "TEST", equipType: EquipType.belt, str: 40, dex: 40, int: 0, luk: 0),
  Equip(name: "Royal Ranger Beret", equipType: EquipType.hat, classType: ClassType.bowman, str: 40, dex: 40, int: 0, luk: 0),
  Equip(name: "Royal Warrior Helm", equipType: EquipType.hat, classType: ClassType.warrior, str: 40, dex: 40, int: 0, luk: 0),
  Equip(name: "TEST", equipType: EquipType.belt, str: 40, dex: 40, int: 0, luk: 0)
];