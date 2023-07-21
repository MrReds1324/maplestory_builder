
import 'package:flutter/material.dart';
import 'package:maplestory_builder/core/constants.dart';

import '../base.dart';

class Equip extends Base {
  final EquipType equipType;

  Equip({
    required super.name,
    required this.equipType,
    required super.str,
    required super.dex,
    required super.int,
    required super.luk,
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
  Equip(name: "Royal Ranger Beret", equipType: EquipType.hat, str: 40, dex: 40, int: 0, luk: 0),
  Equip(name: "TEST", equipType: EquipType.belt, str: 40, dex: 40, int: 0, luk: 0)
];