import 'package:maplestory_builder/core/constants.dart';

class PotentialModule {

  PotentialTier? mainPotential;
  PotentialTier? bonusPotential;

  num str = 0;
  num dex = 0;
  num int = 0;
  num luk = 0;
  num hp = 0;
  num mp = 0;
  num speed = 0;
  num jump = 0;
  num defense = 0;
  num attackPower = 0;
  num mattack = 0;

  PotentialModule({
    this.mainPotential,
    this.bonusPotential,
    this.str = 0,
    this.dex = 0,
    this.int = 0,
    this.luk = 0,
    this.hp = 0,
    this.mp = 0,
    this.speed = 0,
    this.jump = 0,
    this.defense = 0,
    this.attackPower = 0,
    this.mattack = 0,
  });

  PotentialModule copyWith({
    PotentialTier? mainPotential,
    PotentialTier? bonusPotential,
    num? str,
    num? dex,
    num? int,
    num? luk,
    num? hp,
    num? mp,
    num? speed,
    num? jump,
    num? defense,
    num? attackPower,
    num? mattack,
  }) {
    return PotentialModule(
      mainPotential: mainPotential ?? this.mainPotential, 
      bonusPotential: bonusPotential ?? this.bonusPotential,
      str: str ?? this.str,
      dex: dex ?? this.dex,
      int: int ?? this.int,
      luk: luk ?? this.luk,
      hp: hp ?? this.hp,
      mp: mp ?? this.mp,
      speed: speed ?? this.speed,
      jump: jump ?? this.jump,
      defense: defense ?? this.defense,
      attackPower: attackPower ?? this.attackPower,
      mattack: mattack ?? this.mattack,
    );
  }
}