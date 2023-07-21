import 'package:flutter/material.dart';
import 'package:maplestory_builder/core/items/equips.dart';

class CharacterModel with ChangeNotifier {

  // Lower Critical Damage %: 20 + CriticalDamage%
  // Upper Critical Damage %: 50 + CriticalDamage%

  // Damage Range Calculation is as follows
  // TotalStat = ((apStat * AP%) + Stat) * Stat% + FinalStat
  // StatValue = TotalPrimaryStat * 4 + TotalSecondaryStat
  // StatValue if DemonAvenger = floor(APHP/3.5) + (0.8 * floor(TotalHP - APHP)/3.5)) + TotalStr
  // TotalAtt = Attack * Attack% + FinalAttack
  // UpperDamageRange = (WeaponMultiplier * StatValue * TotalATT/100) * (1 + Damage%) * (1 + FinalDamage%), rounded down
  // LowerDamageRange = UpperDamangeRange * Mastery%, rounded down
  var upperDamageRange = 100000000000000;
  var upperBossDamangeRange = 100000000000000;
  var totalStr = 0;
  var totalDex = 0;
  var totalInt = 0;
  var totalLuk = 0;
  var totalDamage = 0.10;
  var totalBossDmanage = 0.20;
  var totalFinalDamage = 0.30;
  var totalMastery = 0.8;
  var totalBuffDuration = 0.1;
  var totalIgnoreDefense = 0.9632;
  var totalElementalIgnoreDefense = 0.05;
  var totalItemDropRate = 0.5;
  var totalMesosObtained = 0.5;
  var totalCritRate = 1.23;
  var totalCritDamage = 1.53;
  var totalAttackSpeed = 10;
  var totalAttack = 6000;
  var totalMAttack = 500;
  var totalStatusResistance = 78;
  var totalKnockbackResistance = 1.00;
  var totalDefense = 60000;
  var totalStarForce = 600;
  var totalSpeed = 1.4;
  var totalArcaneForce = 100;
  var totalJump = 1.4;
  var totalSacredPower = 500;
  


  // Each ap into HP/MP increases by 15
  var pointsHp = 0;
  var pointsMp = 0;
  var apHP = 395; // Demon Avenger is 395 + (90 * pointsHP) 
  var apMP = 395;
  // Each ap into Stats increase by 1
  var apSTR = 4;
  var apDex = 4;
  var apInt = 4;
  var apLuk = 4;

  var unequippedEquips = <Equip>[];

}