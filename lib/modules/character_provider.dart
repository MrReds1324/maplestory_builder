import 'package:flutter/material.dart';
import 'package:maplestory_builder/core/items/equips.dart';
import 'package:maplestory_builder/core/constants.dart';
import 'package:maplestory_builder/modules/ap_stats_mod.dart';
import 'package:maplestory_builder/modules/equip_mod.dart';
import 'package:maplestory_builder/modules/hyper_stats_mod.dart';

class CharacterModel with ChangeNotifier {
  String characterName = '';
  int characterLevel = 0;

  // Lower Critical Damage %: 20 + CriticalDamage%
  // Upper Critical Damage %: 50 + CriticalDamage%

  // Damage Range Calculation is as follows
  // TotalStat = ((apStat * AP%) + Stat) * Stat% + FinalStat
  // StatValue = TotalPrimaryStat * 4 + TotalSecondaryStat
  // StatValue if DemonAvenger = floor(APHP/3.5) + (0.8 * floor(TotalHP - APHP)/3.5)) + TotalStr
  // TotalAtt = Attack * Attack% + FinalAttack
  // UpperDamageRange = (WeaponMultiplier * StatValue * TotalATT/100) * (1 + Damage%) * (1 + FinalDamage%), rounded down
  // LowerDamageRange = UpperDamangeRange * Mastery%, rounded down
  double upperDamageRange = 0;
  double upperBossDamangeRange = 0;
  // Include things not normally shown in the damage range, ied, iedr, crit damage (crit rate)
  double upperEffectiveDamageRange = 0;
  double upperEffectiveBossDamangeRange = 0;
  double totalHp = 395;
  double totalMp = 395;
  double totalStr = 4;
  double totalDex = 4;
  double totalInt = 4;
  double totalLuk = 4;
  double totalDamage = 0.10;
  double totalDamageNormalMobs = 0;
  double totalBossDamage = 0.20;
  double totalFinalDamage = 0.30;
  double totalMastery = 0.8;
  double totalBuffDuration = 0.1;
  double totalIgnoreDefense = 0.9632;
  double totalElementalIgnoreDefense = 0.05;
  double totalItemDropRate = 0.5;
  double totalMesosObtained = 0.5;
  double totalCritRate = 1.23;
  double totalCritDamage = 1.53;
  int totalAttackSpeed = 10;
  double totalAttack = 6000;
  double totalMAttack = 500;
  int totalStatusResistance = 78;
  double totalKnockbackResistance = 1.00;
  double totalDefense = 60000;
  int totalStarForce = 600;
  double totalSpeed = 1.4;
  int totalArcaneForce = 100;
  double totalJump = 1.4;
  int totalSacredPower = 500;
  // Weapon Multiplier will change depending on equipped weapon, default (no weapon) is 1.4 
  double weaponMultiplier = 1.4;

  // This essentially is ap stats, but also includes multipliers that would effect it such as MW
  num pureHp = 0;
  num pureMP = 0;
  num pureStr = 0;
  num pureDex = 0;
  num pureInt = 0;
  num pureLuk = 0;
  num attack = 100;
  num mattack = 0;

  // Track flat stats that will be added later
  num flatHp = 0;
  num flatMP = 0;
  num flatStr = 0;
  num flatDex = 0;
  num flatInt = 0;
  num flatLuk = 0;
  num flatAttack = 0;
  num flatMAttack = 0;

  // Track the total percentage for stats
  double hpPercentage = .00;
  double mpPercentage = .00;
  double strPercentage = .00;
  double dexPercentage = .00;
  double intPercentage = .00;
  double lukPercentage = .00;
  double defensePercentage = .00;
  double attackPercentage = .00;
  double mattackPercentage = .00;
  
  HyperStatsModule hyperStatsModule = HyperStatsModule();
  APStatsModule apStatsModule = APStatsModule();
  EquipModule equipModule = EquipModule();

  Equip? editingEquip = Equip(name: "Royal Ranger Beret", equipType: EquipType.hat, classType: ClassType.bowman, itemLevel: 150, str: 40, dex: 40, hp: 360, mp: 360, attackPower: 2, defense: 300, ignoreDefense: .1);
  // Equip? editingEquip;
  List<Equip> unequippedEquips = <Equip>[];

  void updateStarforce(num newStarValue) {
    editingEquip?.starForceMod?.updateStarforce(newStarValue);
    notifyListeners();
  }

  void updateCharacterLevel(int selectedLevel) {
    apStatsModule.setAvailableAPFromLevel(selectedLevel);
    hyperStatsModule.setAvailableHyperStatsFromLevel(selectedLevel);
    characterLevel = selectedLevel;
    notifyListeners();
  }

  void addApToStat(int apAmount, StatType statType) {
    apStatsModule.addApToStat(apAmount, statType);
    calculateEverything();
    notifyListeners();
  }

  void subtractApToStat(int apAmount, StatType statType) {
    apStatsModule.subtractApToStat(apAmount, statType);
    calculateEverything();
    notifyListeners();
  }

  void equipEquip(Equip? equip, EquipType equipType, {int equipPosition = 0}) {
    equipModule.equipEquip(equip, equipType, equipPosition: equipPosition);
    calculateEverything();
    notifyListeners();
  }

  void calculateEverything(){
    totalStarForce = 0;
    totalAttackSpeed = 0;
    totalSpeed = 1;
    totalJump = 1;
    totalBossDamage = 0;
    totalElementalIgnoreDefense = 0;
    totalDamage = 0;
    totalDamageNormalMobs = 0;
    totalFinalDamage = 0;
    flatHp = 0;
    flatMP = 0;
    flatStr = 0;
    flatDex = 0;
    flatInt = 0;
    flatLuk = 0;
    flatAttack = 0;
    flatMAttack = 0;

    num tempStr = 0;
    num tempDex = 0;
    num tempInt = 0;
    num tempLuk = 0;
    num tempHp = 0;
    num tempMp = 0;
    num tempDefense = 0;
    num tempAttack = 0;
    num tempMattack = 0;
    num tempIgnoreDefense = 0;
    

    void updateTempStats(Map<StatType, num> stats) {
      for(MapEntry<StatType, num> entry in stats.entries) {
        switch(entry.key) {
          case StatType.hp:
            tempHp += entry.value;
          case StatType.mp:
            tempMp += entry.value;
          case StatType.str:
            tempStr += entry.value;
          case StatType.dex:
            tempDex += entry.value;
          case StatType.int:
            tempInt += entry.value;
          case StatType.luk:
            tempLuk += entry.value;
          case StatType.attack:
            tempAttack += entry.value;
          case StatType.mattack:
            tempMattack += entry.value;
          case StatType.starForce:
            totalStarForce += entry.value.toInt();
          case StatType.defense:
            tempDefense += entry.value;
          case StatType.ignoreDefense:
            tempIgnoreDefense = entry.value;
          case StatType.speed:
            totalSpeed += (entry.value / 100);
          case StatType.jump:
            totalJump += (entry.value / 100);
          case StatType.bossDamage:
            totalBossDamage += entry.value;
          case StatType.ignoreElementalDefense:
            totalBossDamage += entry.value;
          case StatType.damage:
            totalDamage += entry.value;
          case StatType.damageNormalMobs:
            totalDamageNormalMobs += entry.value;
          case StatType.finalDamage:
            totalFinalDamage *= entry.value;
          case StatType.finalHp:
            flatHp += entry.value;
          case StatType.finalMp:
            flatMP += entry.value;
          case StatType.finalStr:
            flatStr += entry.value;
          case StatType.finalDex:
            flatDex += entry.value;
          case StatType.finalInt:
            flatInt += entry.value;
          case StatType.finalLuk:
            flatLuk += entry.value;
          case StatType.finalAttack:
            flatAttack += entry.value;
          case StatType.finalMAttack:
            flatMAttack += entry.value;
          case StatType.attackSpeed:
            totalAttackSpeed += entry.value.toInt();
          default:
            throw Exception("Unhandled StatType for returned Stats: ${entry.key}");
        }
      }
    }

    updatePureStats(apStatsModule.calculateStats());
    for (Map<StatType, num> equipStats in equipModule.calculateStats()){
      updateTempStats(equipStats);
    }
    
    
    totalHp = (pureHp + tempHp) * (1 + hpPercentage) + flatHp;
    totalMp = (pureMP + tempMp) * (1 + mpPercentage) + flatMP;
    totalStr = (pureStr + tempStr) * (1 + strPercentage) + flatStr;
    totalDex = (pureDex + tempDex) * (1 + dexPercentage) + flatDex;
    totalInt = (pureInt + tempInt) * (1 + intPercentage) + flatInt;
    totalLuk = (pureLuk + tempLuk) * (1 + lukPercentage) + flatLuk;
    totalAttack = (attack + tempAttack) * (1 + attackPercentage) + flatAttack;
    totalMAttack = (mattack + tempMattack) * (1 + mattackPercentage) + flatMAttack;
    totalDefense = tempDefense.toDouble();
    totalIgnoreDefense = tempIgnoreDefense.toDouble();

    var statValue = ((4 * totalDex) + totalStr);
    var upperRange = weaponMultiplier * statValue * (totalAttack) * (1 + totalFinalDamage);
    upperDamageRange =  upperRange * (1 + totalDamage);
    upperBossDamangeRange =  upperRange * (1 + totalDamage + totalBossDamage);
  }

  void updatePureStats(Map<StatType, num> apStats) {
    for(MapEntry<StatType, num> entry in apStats.entries) {
      switch(entry.key) {
        case StatType.hp:
          pureHp = entry.value;
        case StatType.mp:
          pureMP = entry.value;
        case StatType.str:
          pureStr = entry.value;
        case StatType.dex:
          pureDex = entry.value;
        case StatType.int:
          pureInt = entry.value;
        case StatType.luk:
          pureLuk = entry.value;
        default:
          throw Exception("Unhandled StatType for BaseStats: ${entry.key}");
      }
    }
  }

  CharacterModel({APStatsModule? apStatsModule, HyperStatsModule? hyperStatsModule, EquipModule? equipModule}){
    this.apStatsModule = apStatsModule ?? APStatsModule();
    this.hyperStatsModule = hyperStatsModule ?? HyperStatsModule();
    this.equipModule = equipModule ?? EquipModule();
    calculateEverything();
  }

  CharacterModel copyWith({APStatsModule? apStatsModule, HyperStatsModule? hyperStatsModule, EquipModule? equipModule}){
    return CharacterModel(
      apStatsModule: apStatsModule ?? this.apStatsModule.copyWith(),
      hyperStatsModule: hyperStatsModule ?? this.hyperStatsModule.copyWith(),
      equipModule: equipModule ?? this.equipModule.copyWith(),
    );
  }
}