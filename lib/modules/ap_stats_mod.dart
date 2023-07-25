import 'package:maplestory_builder/core/constants.dart';
import 'dart:math';

class APStatsModule {
  // All relavent to calculating ap stats and ap usage
  int totalAvailableAP = 10; // 10 + 5 * CharacterLevel
  int availableAP = 10; 
  int assignedAP = 0;

  // Each ap into HP/MP increases by 15
  int apAssignedHP = 0;
  int apAssignedMP = 0;
  int apHP = 395; // Demon Avenger is 395 + (90 * pointsHP) 
  int apMP = 395;
  // Each ap into Stats increase by 1
  int apStr = 4;
  int apDex = 4;
  int apInt = 4;
  int apLuk = 4;

  void setAvailableAPFromLevel(int characterLevel) {
    totalAvailableAP = 10 + characterLevel * 5;
    availableAP = totalAvailableAP - assignedAP;
  }

  void addApToStat(int apAmount, StatType statType) {
    apAmount = min(availableAP, apAmount);
    if (apAmount <= 0) {return;}
    availableAP -= apAmount;
    assignedAP += apAmount;
    switch(statType) {
      case StatType.hp:
        apAssignedHP += apAmount;
        apHP = 395 + (apAssignedHP * 15);
      case StatType.mp:
        apAssignedMP += apAmount;
        apMP = 395 + (apAssignedMP * 15);
      case StatType.str:
        apStr += apAmount;
      case StatType.dex:
        apDex += apAmount;
      case StatType.int:
        apInt += apAmount;
      case StatType.luk:
        apLuk += apAmount;
      default:
        Exception("$statType is not something you can increase with Abilitiy Points"); 
    }
  }

  void subtractApToStat(int apAmount, StatType statType) {
    apAmount = min(assignedAP, apAmount);
    
    switch(statType) {
      case StatType.hp:
        apAmount = min(apAssignedHP, apAmount);
        apAssignedHP -= apAmount;
        apHP = 395 + (apAssignedHP * 15);
      case StatType.mp:
        apAmount = min(apAssignedMP, apAmount);
        apAssignedMP -= apAmount;
        apMP = 395 + (apAssignedMP * 15);
      // Cannot go below 4 points in these stats
      case StatType.str:
        if (apStr == 4) {return;}
        apAmount = min(apStr - 4, apAmount);
        apStr -= apAmount;
      case StatType.dex:
        if (apDex == 4) {return;}
        apAmount = min(apDex - 4, apAmount);
        apDex -= apAmount;
      case StatType.int:
        if (apInt == 4) {return;}
        apAmount = min(apInt - 4, apAmount);
        apInt -= apAmount;
      case StatType.luk:
        if (apLuk == 4) {return;}
        apAmount = min(apLuk - 4, apAmount);
        apLuk -= apAmount;
      default:
        Exception("$statType is not something you can increase with Abilitiy Points"); 
    }
    availableAP += apAmount;
    assignedAP -= apAmount;
  }

}