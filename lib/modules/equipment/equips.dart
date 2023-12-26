// ignore_for_file: avoid_types_as_parameter_names

import 'package:flutter/material.dart';
import 'package:maplestory_builder/constants/constants.dart';
import 'package:maplestory_builder/constants/equipment/pitched_boss_upgrades.dart';
import 'package:maplestory_builder/constants/equipment/starforce_stats.dart';
import 'package:maplestory_builder/constants/equipment/equip_constants.dart';
import 'package:maplestory_builder/constants/equipment/flame_stats.dart';
import 'package:maplestory_builder/constants/equipment/potential_stats.dart';
import 'package:maplestory_builder/constants/equipment/set_effect_stats.dart';
import 'package:maplestory_builder/modules/base.dart';
import 'package:maplestory_builder/modules/equipment/equip_sets_mod.dart';
import 'package:maplestory_builder/modules/equipment/flames_mod.dart';
import 'package:maplestory_builder/modules/equipment/pitched_boss_upgrade_mod.dart';
import 'package:maplestory_builder/modules/equipment/potentials_mod.dart';
import 'package:maplestory_builder/modules/equipment/scroll_mod.dart';
import 'package:maplestory_builder/modules/equipment/soul_mod.dart';
import 'package:maplestory_builder/modules/equipment/starforce_mod.dart';
import 'package:maplestory_builder/modules/equipment/tweak_mod.dart';
import 'package:maplestory_builder/providers/difference_provider.dart';
import 'package:maplestory_builder/modules/utilities/utilities.dart';
import 'package:maplestory_builder/providers/equipment/equips_provider.dart';
import 'dart:math';

import 'package:provider/provider.dart';

class Equip implements Copyable {
  final EquipName equipName;
  final EquipSet? equipSet;
  StarForceModule? starForceModule;
  FlameModule? flameModule;
  PotentialModule? potentialModule;
  ScrollModule? scrollModule;
  PitchedBossUpgradeModule? pitchedBossUpgradeModule;
  SoulModule? soulModule;
  TweakModule? tweakModule;
  int equipHash = -1;

  Equip({
    required this.equipName,
    this.equipSet,
    this.starForceModule,
    this.flameModule,
    this.potentialModule,
    this.scrollModule,
    this.pitchedBossUpgradeModule,
    this.soulModule,
    this.tweakModule,
    this.equipHash = -1,
  }) {
    if (starForceModule != null) {
      starForceModule = starForceModule;
      starForceModule!.updateStarforce(this, starForceModule!.currentStars);
    }
    else if (equipName.starForceCategory == StarForceCategory.player) {
      starForceModule = StarForceModule(possibleStars: StarForceModule.getStarforceLimit(equipName.itemLevel).toInt());
    }
    else {
      starForceModule = null;
    }

    if (flameModule != null) {
      flameModule = flameModule;
      flameModule!.calculateModuleStats(this);
    }
    else if (noFlameCategory.contains(equipName.equipType)){
      flameModule = null;
    }
    else if (equipName.flameCategory != FlameCategory.none) {
      flameModule = FlameModule();
    }
    else {
      flameModule = null;
    }

    if (potentialModule != null) {
      potentialModule = potentialModule;
      potentialModule!.calculateModuleStats();
    }
    else if (noPotentialCategory.contains(equipName.equipType)){
      potentialModule = null;
    }
    else if (equipName.potentialCategory == PotentialCategory.player) {
      potentialModule = PotentialModule(
        potentialOffset: getPotentialOffsetFromItemLevel(equipName.itemLevel)
      );
    }
    else {
      potentialModule = null;
    }

    if (scrollModule != null) {
      scrollModule = scrollModule;
      scrollModule!.calculateModuleStats();
    }
    else if (equipName.maxScrollsSlots == 0) {
      scrollModule = null;
    }
    else {
      scrollModule = ScrollModule(
        totalScrollSlots: equipName.maxScrollsSlots,
        scrollOffset: getScrollOffsetFromItemLevel(equipName.itemLevel)
      );
    }

    if (soulModule != null) {
      soulModule = soulModule;
    }
    else if (equipName.equipType == EquipType.weapon && equipName.itemLevel >= 75) {
      soulModule = SoulModule();
    }

    tweakModule = tweakModule ?? TweakModule();
  }

  @override
  Equip copyWith({
    EquipName? equipName,
    EquipSet? equipSet,
    StarForceModule? starForceModule,
    FlameModule? flameModule,
    PotentialModule? potentialModule,
    ScrollModule? scrollModule,
    PitchedBossUpgradeModule? pitchedBossUpgradeModule,
    SoulModule? soulModule,
    TweakModule? tweakModule,
    int? equipHash,
  }) {
    return Equip(
      equipName: equipName ?? this.equipName,
      equipSet: equipSet ?? this.equipSet,
      starForceModule: starForceModule ?? this.starForceModule?.copyWith(),
      flameModule: flameModule ?? this.flameModule?.copyWith(),
      potentialModule: potentialModule ?? this.potentialModule?.copyWith(),
      scrollModule: scrollModule ?? this.scrollModule?.copyWith(),
      pitchedBossUpgradeModule: pitchedBossUpgradeModule ?? this.pitchedBossUpgradeModule?.copyWith(),
      soulModule: soulModule ?? this.soulModule?.copyWith(),
      tweakModule: tweakModule ?? this.tweakModule?.copyWith(),
      equipHash: equipHash ?? this.equipHash,
    );
  }

  num get(StatType statType) {
    return equipName.baseStats[statType] ?? 0;
  }

  num getTotalStat(StatType statType) {
    switch(statType) {
      case StatType.str:
      case StatType.dex:
      case StatType.int:
      case StatType.luk:  
        return get(statType) + get(StatType.allStats) + 
          (potentialModule?.get(StatType.allStats) ?? 0) + (potentialModule?.get(statType) ?? 0) + 
          (starForceModule?.get(statType) ?? 0) + 
          (flameModule?.get(statType) ?? 0) + 
          (scrollModule?.get(statType) ?? 0) + 
          (pitchedBossUpgradeModule?.get(StatType.allStats) ?? 0) + (pitchedBossUpgradeModule?.get(statType) ?? 0) + 
          (soulModule?.get(StatType.allStats) ?? 0) + (soulModule?.get(statType) ?? 0) + 
          (tweakModule?.get(statType) ?? 0);
      case StatType.attack:
      case StatType.mattack:
        return get(statType) + get(StatType.attackMattack) + 
          (potentialModule?.get(statType) ?? 0) + 
          (starForceModule?.get(statType) ?? 0) + 
          (flameModule?.get(statType) ?? 0) + 
          (scrollModule?.get(statType) ?? 0) + 
          (pitchedBossUpgradeModule?.get(StatType.attackMattack) ?? 0) + (pitchedBossUpgradeModule?.get(statType) ?? 0) + 
          (soulModule?.get(statType) ?? 0) + 
          (tweakModule?.get(statType) ?? 0);
      case StatType.hp:
      case StatType.mp:
        return get(statType) + get(StatType.hpMp) + 
          (potentialModule?.get(statType) ?? 0) + 
          (starForceModule?.get(statType) ?? 0) + 
          (flameModule?.get(statType) ?? 0) + 
          (scrollModule?.get(statType) ?? 0) + 
          (pitchedBossUpgradeModule?.get(StatType.hpMp) ?? 0) + (pitchedBossUpgradeModule?.get(statType) ?? 0) + 
          (soulModule?.get(statType) ?? 0) + 
          (tweakModule?.get(statType) ?? 0);
      case StatType.ignoreDefense:
      case StatType.ignoreElementalDefense:
        return calculateIgnoreDefenseFromList([get(statType), (starForceModule?.get(statType) ?? 0), (flameModule?.get(statType) ?? 0) + (potentialModule?.get(statType) ?? 0), (scrollModule?.get(statType) ?? 0), (pitchedBossUpgradeModule?.get(statType) ?? 0), (soulModule?.get(statType) ?? 0), (tweakModule?.get(statType) ?? 0)]); 
      default:
        return get(statType) + (starForceModule?.get(statType) ?? 0) + (flameModule?.get(statType) ?? 0) + (potentialModule?.get(statType) ?? 0) + (scrollModule?.get(statType) ?? 0) + (pitchedBossUpgradeModule?.get(statType) ?? 0) + (soulModule?.get(statType) ?? 0) + (tweakModule?.get(statType) ?? 0);
    }
  }

  Map<StatType, num> calculateStats() {
    return <StatType, num>{
      StatType.attackSpeed: getTotalStat(StatType.attackSpeed),
      StatType.str: getTotalStat(StatType.str),
      StatType.dex: getTotalStat(StatType.dex),
      StatType.int: getTotalStat(StatType.int),
      StatType.luk: getTotalStat(StatType.luk),
      StatType.hp: getTotalStat(StatType.hp),
      StatType.mp: getTotalStat(StatType.mp),
      StatType.attack: getTotalStat(StatType.attack),
      StatType.mattack: getTotalStat(StatType.mattack),
      StatType.defense: getTotalStat(StatType.defense),
      StatType.starForce: starForceModule?.currentStars ?? 0,
      StatType.ignoreDefense: getTotalStat(StatType.ignoreDefense),
      StatType.speed: getTotalStat(StatType.speed),
      StatType.jump: getTotalStat(StatType.jump),
      StatType.bossDamage: getTotalStat(StatType.bossDamage),
      StatType.damage: getTotalStat(StatType.damage),
      StatType.damageNormalMobs: getTotalStat(StatType.damageNormalMobs),
      StatType.ignoreElementalDefense: getTotalStat(StatType.ignoreElementalDefense),
      StatType.finalStr: getTotalStat(StatType.finalStr),
      StatType.finalDex: getTotalStat(StatType.finalDex),
      StatType.finalInt: getTotalStat(StatType.finalInt),
      StatType.finalLuk: getTotalStat(StatType.finalLuk),
      StatType.finalHp: getTotalStat(StatType.finalHp),
      StatType.finalMp: getTotalStat(StatType.finalMp),
      StatType.finalAttack: getTotalStat(StatType.finalAttack),
      StatType.finalMAttack: getTotalStat(StatType.finalMAttack),
      StatType.strPercentage: getTotalStat(StatType.strPercentage),
      StatType.dexPercentage: getTotalStat(StatType.dexPercentage),
      StatType.intPercentage: getTotalStat(StatType.intPercentage),
      StatType.lukPercentage: getTotalStat(StatType.lukPercentage),
      StatType.allStatsPercentage: getTotalStat(StatType.allStatsPercentage),
      StatType.hpPercentage: getTotalStat(StatType.hpPercentage),
      StatType.mpPercentage: getTotalStat(StatType.mpPercentage),
      StatType.attackPercentage: getTotalStat(StatType.attackPercentage),
      StatType.mattackPercentage: getTotalStat(StatType.mattackPercentage),
      StatType.defensePercentage: getTotalStat(StatType.defensePercentage),
      StatType.critDamage: getTotalStat(StatType.critDamage),
      StatType.critRate: getTotalStat(StatType.critRate),
      StatType.mesosObtained: getTotalStat(StatType.mesosObtained),
      StatType.itemDropRate: getTotalStat(StatType.itemDropRate),
      StatType.hpRecovery: getTotalStat(StatType.hpRecovery),
      StatType.skillCooldown: getTotalStat(StatType.skillCooldown),
      StatType.skillCooldownPercentage: getTotalStat(StatType.skillCooldownPercentage),
    };
  }

  double getTooltipWidth() {
    return equipSet != null ? 610 : 310;
  }

  Row createEquipContainer(BuildContext context, {bool isEquipEditing = false}) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: 300,
          padding: const EdgeInsets.all(2.5),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              equipName.starForceCategory == StarForceCategory.none ? const SizedBox.shrink() : __createTextLine(context, StatType.starForce),
              Center(
                child: Text(
                  "${equipName.formattedName}${(scrollModule?.usedScrolls.length ?? 0) > 0 ? ' +${scrollModule?.usedScrolls.length}' : ''}", style: Theme.of(context).textTheme.headlineSmall
                )
              ),
              equipName.isUniqueItem ? const Center(child: Text("Unique Equipped Item", style: TextStyle(color: equipUniqueColor))) : const SizedBox.shrink(),
              __createTextLine(context, StatType.level),
              __createTextLine(context, StatType.attackSpeed),
              __createTextLine(context, StatType.str),
              __createTextLine(context, StatType.dex),
              __createTextLine(context, StatType.int),
              __createTextLine(context, StatType.luk),
              __createTextLine(context, StatType.hp),
              __createTextLine(context, StatType.hpPercentage),
              __createTextLine(context, StatType.mp),
              __createTextLine(context, StatType.mpPercentage),
              __createTextLine(context, StatType.attack),
              __createTextLine(context, StatType.mattack),
              __createTextLine(context, StatType.defense),
              __createTextLine(context, StatType.bossDamage),
              __createTextLine(context, StatType.speed),
              __createTextLine(context, StatType.jump),
              __createTextLine(context, StatType.ignoreDefense),
              __createTextLine(context, StatType.damage),
              __createTextLine(context, StatType.allStatsPercentage),
              __createTextLine(context, StatType.damageNormalMobs),
              __createTextLine(context, StatType.ignoreElementalDefense),
              __createTextLine(context, StatType.finalStr),
              __createTextLine(context, StatType.finalDex),
              __createTextLine(context, StatType.finalInt),
              __createTextLine(context, StatType.finalLuk),
              __createTextLine(context, StatType.finalHp),
              __createTextLine(context, StatType.finalMp),
              __createTextLine(context, StatType.finalAttack),
              __createTextLine(context, StatType.finalMAttack),
              __createTextLine(context, StatType.strPercentage),
              __createTextLine(context, StatType.dexPercentage),
              __createTextLine(context, StatType.intPercentage),
              __createTextLine(context, StatType.lukPercentage),
              __createTextLine(context, StatType.defensePercentage),
              __createTextLine(context, StatType.attackPercentage),
              __createTextLine(context, StatType.mattackPercentage),
              __createTextLine(context, StatType.critDamage),
              __createTextLine(context, StatType.critRate),
              __createTextLine(context, StatType.mesosObtained),
              __createTextLine(context, StatType.itemDropRate),
              __createTextLine(context, StatType.hpRecovery),
              __createTextLine(context, StatType.skillCooldown),
              __createTextLine(context, StatType.skillCooldownPercentage),
              Text(
                "${(scrollModule?.usedScrollSlots ?? 0)}/${(scrollModule?.totalScrollSlots ?? 0)} Scroll Enhancements Applied", 
                style: Theme.of(context).textTheme.bodyMedium
              ),
              isEquipEditing && equipName.potentialCategory == PotentialCategory.player ? const SizedBox.shrink() : potentialModule?.buildPotentialWidget(context, this) ?? const SizedBox.shrink(),
            ],
          ),
        ),
        isEquipEditing ? const SizedBox.shrink() : createSetEffectContainer(context),
      ]
    );
  }

  Widget createSetEffectContainer(BuildContext context, {bool isEquipComparing = false, bool isAdding = false, bool isRemoving = false}) {
    // If we are editing an equip then we always want to target the difference character model
    SetEffect? setEffect;
    if (isEquipComparing) {
      setEffect = context.read<DifferenceCalculatorProvider>().diffCalculatorProvider.equipsProvider.activeEquipSet.setEffectModule.activeSetEffects[equipSet];
    }
    else {
      setEffect = context.read<EquipsProvider>().activeEquipSet.setEffectModule.activeSetEffects[equipSet] ?? (equipSet != null ? SetEffect(equipSet: equipSet!) : null);
    }
    return setEffect?.createSetEffectContainer(context, addingEquip: isAdding && isEquipComparing ? this : null, removingEquip: isRemoving && isEquipComparing ? this : null) ?? const SizedBox.shrink();
  }

  Widget __createTextLine(BuildContext context, StatType statType) {
    var isPercentage = statType.isPercentage;
    num totalStat = 0;
    num baseStat = 0;
    num starForceStat = 0;
    num scrollStat = 0;
    num flameStat = 0;
    int tweakStat = 0;

    switch(statType){
      case StatType.starForce:
        return starForceModule?.buildStarForceWidget() ?? const SizedBox.shrink();
      case StatType.level:
        List<TextSpan> levelText = [];
        if ((flameModule?.get(StatType.level) ?? 0) > 0) {
          levelText.add(
            TextSpan(
              text: "Required Level: ${max(equipName.itemLevel - (flameModule?.get(StatType.level) ?? 0), 0).toInt()}",
              style: const TextStyle(color: starColor)
            )
          );
          levelText.add(
            TextSpan(
              text: "(${equipName.itemLevel}",
            )
          );
          levelText.add(
            TextSpan(
              text: "-${flameModule?.get(StatType.level).toInt() ?? 0}",
              style: const TextStyle(color: starColor)
            )
          );
          levelText.add(
            const TextSpan(
              text: ")",
            )
          );
        }
        else {
          levelText.add(
            TextSpan(
              text: "Required Level: ${equipName.itemLevel}",
              style: const TextStyle(color: starColor)
            )
          );
        }
        return RichText(
          text: TextSpan(
            style: DefaultTextStyle.of(context).style,
            children: levelText,
          ),
        );
      case StatType.str:
      case StatType.dex:
      case StatType.int:
      case StatType.luk:
        baseStat = get(statType) + get(StatType.allStats);
        starForceStat = starForceModule?.get(statType) ?? 0;
        flameStat = flameModule?.get(statType) ?? 0;
        scrollStat = (scrollModule?.get(statType) ?? 0) + (scrollModule?.get(StatType.allStats) ?? 0) + (pitchedBossUpgradeModule?.get(StatType.allStats) ?? 0) + (pitchedBossUpgradeModule?.get(statType) ?? 0);
        tweakStat = tweakModule?.get(statType) ?? 0;
      default:
        baseStat = get(statType);
        starForceStat = starForceModule?.get(statType) ?? 0;
        flameStat = flameModule?.get(statType) ?? 0;
        scrollStat = (scrollModule?.get(statType) ?? 0) + (pitchedBossUpgradeModule?.get(statType) ?? 0);
        tweakStat = tweakModule?.get(statType) ?? 0;
    }

    // Only need to figure this out if we can actually modify these stats in a meaningful way...
    // if (statType == StatType.ignoreDefense || statType == StatType.ignoreElementalDefense) {
    //   totalStat = calculateIgnoreDefenseFromList([baseStat, starForceStat, flameStat, scrollStat, tweakStat]);
    // }
    totalStat = baseStat + starForceStat + scrollStat + flameStat + tweakStat;
    
    List<TextSpan> childrenText = <TextSpan>[];

    if (totalStat != baseStat) {
      childrenText.add(
        TextSpan(
          text: "${statType.formattedName}: ${totalStat > 0 ? "+" : ""}${isPercentage ? doubleRoundPercentFormater.format(totalStat) : totalStat} ",
          style: const TextStyle(color: equipEnhancedColor)
        )
      );
      childrenText.add(TextSpan(text: "(${isPercentage ? doubleRoundPercentFormater.format(baseStat) : baseStat}",));
      if (flameStat != 0) {
        childrenText.add(
          TextSpan(
            text: " +${isPercentage ? doubleRoundPercentFormater.format(flameStat) : flameStat}",
            style: const TextStyle(color: equipFlameColor)
          )
        );
      }
      if (scrollStat != 0){
        childrenText.add(
          TextSpan(
            text: " ${scrollStat > 0 ? '+' : ''}${isPercentage ? doubleRoundPercentFormater.format(scrollStat) : scrollStat}",
            style: const TextStyle(
              color: equipScrollColor
            )
          )
        );
      }
      if (tweakStat != 0) {
        childrenText.add(
          TextSpan(
            text: " ${tweakStat > 0 ? '+' : ''}${isPercentage ? doubleRoundPercentFormater.format(tweakStat) : tweakStat}",
            style: TextStyle(color: tweakStat > 0 ? equipEnhancedColor : equipReductionColor)
          )
        );
      }
      if (starForceStat != 0) {
        childrenText.add(
          TextSpan(
            text: " +${isPercentage ? doubleRoundPercentFormater.format(starForceStat) : starForceStat}",
            style: const TextStyle(color: equipStarColor)
          )
        );
      }
      childrenText.add(const TextSpan(text: ")",));
    }
    else if (baseStat != 0) {
      childrenText.add(
        TextSpan(
          text: "${statType.formattedName}: +${isPercentage ? doubleRoundPercentFormater.format(totalStat) : totalStat}",
        )
      );
    }

    if (childrenText.isEmpty) {
      return const SizedBox.shrink();
    }
    else {
      return RichText(
        text: TextSpan(
          style: DefaultTextStyle.of(context).style,
          children: childrenText
        ),
      );
    }
  }

  @override
  operator ==(Object other){
    if (other is Equip){
      // If they are the exact same reference
      if (identical(this, other)){
        return true;
      }
      // If they are both non-editted items then compare their itemId
      else if (equipHash == -1 && other.equipHash == -1) {
        return equipName == other.equipName;
      }
      else {
        return equipHash == other.equipHash;
      }
    }
    return false;
  }

  @override
  int get hashCode => equipHash == -1 ? super.hashCode : equipHash.toInt();
}




final List<Equip> equipList = [
  // Equip(name: "Royal Ranger Beret", itemId: 1, equipType: EquipType.hat, classType: ClassType.bowman, itemLevel: 150, str: 40, dex: 40, hp: 360, mp: 360, attackPower: 2, defense: 300, ignoreDefense: .1),
  // Equip(name: "Sengoku Hakase Badge", itemId: 2, equipType: EquipType.badge, itemLevel: 160, allStats: 10, attackPower: 10, mattack: 10),
  // Dawn Boss Set Items
  Equip(equipName: EquipName.dawnGuardianAngelRing, equipSet: EquipSet.dawnBossSet),
  Equip(equipName: EquipName.twilightMark, equipSet: EquipSet.dawnBossSet),
  Equip(equipName: EquipName.estellaEarrings, equipSet: EquipSet.dawnBossSet),
  Equip(equipName: EquipName.daybreakPendant, equipSet: EquipSet.dawnBossSet),
  // Superior Gollux Items
  Equip(equipName: EquipName.superiorGolluxRing, equipSet: EquipSet.superiorGollux),
  Equip(equipName: EquipName.superiorGolluxPendant, equipSet: EquipSet.superiorGollux),
  Equip(equipName: EquipName.superiorGolluxBelt, equipSet: EquipSet.superiorGollux),
  Equip(equipName: EquipName.superiorGolluxEarrings, equipSet: EquipSet.superiorGollux),
  // Eternal Bowman Items
  Equip(equipName: EquipName.eternalArcherHat, equipSet: EquipSet.eternalSetBowman),
  Equip(equipName: EquipName.eternalArcherHood, equipSet: EquipSet.eternalSetBowman),
  Equip(equipName: EquipName.eternalArcherPants, equipSet: EquipSet.eternalSetBowman),
  Equip(equipName: EquipName.eternalArcherShoulder, equipSet: EquipSet.eternalSetBowman),
  // Genesis Weapons
  Equip(equipName: EquipName.genesisCrossbow, equipSet: EquipSet.eternalSetBowman, starForceModule: StarForceModule(possibleStars: 25, currentStars: 22)),
  // Arcane Bowman Items
  Equip(equipName: EquipName.arcaneUmbraArcherHat, equipSet: EquipSet.arcaneSetBowman),
  Equip(equipName: EquipName.arcaneUmbraArcherSuit, equipSet: EquipSet.arcaneSetBowman),
  Equip(equipName: EquipName.arcaneUmbraArcherShoes, equipSet: EquipSet.arcaneSetBowman),
  Equip(equipName: EquipName.arcaneUmbraArcherShoulder, equipSet: EquipSet.arcaneSetBowman),
  Equip(equipName: EquipName.arcaneUmbraArcherGloves, equipSet: EquipSet.arcaneSetBowman),
  Equip(equipName: EquipName.arcaneUmbraArcherCape, equipSet: EquipSet.arcaneSetBowman),
  // Arcane Weapons
  Equip(equipName: EquipName.arcaneUmbraCrossbow, equipSet: EquipSet.arcaneSetBowman),
  // Pitched Boss Set Items
  Equip(equipName: EquipName.blackHeart, equipSet: EquipSet.pitchedBoss, potentialModule: PotentialModule(potentialOffset: 0, mainPotential: PotentialTier.epic, mainPotentials: const {1: PotentialLine(statType: StatType.bossDamage, potentialName: PotentialName.uniquePrimeBossDamage), 2: PotentialLine(statType: StatType.ignoreDefense, potentialName: PotentialName.uniquePrimeIgnoreDefense)})),
  Equip(equipName: EquipName.berserked, equipSet: EquipSet.pitchedBoss, pitchedBossUpgradeModule: PitchedBossUpgradeModule(pitchedBossUpgrade: PitchedBossUpgrade.gravityModule)),
  Equip(equipName: EquipName.magicEyepatch, equipSet: EquipSet.pitchedBoss),
  Equip(equipName: EquipName.sourceOfSuffering, equipSet: EquipSet.pitchedBoss),
  Equip(equipName: EquipName.cursedRedSpellbook, equipSet: EquipSet.pitchedBoss),
  Equip(equipName: EquipName.cursedGreenSpellbook, equipSet: EquipSet.pitchedBoss),
  Equip(equipName: EquipName.cursedBlueSpellbook, equipSet: EquipSet.pitchedBoss),
  Equip(equipName: EquipName.cursedYellowSpellbook, equipSet: EquipSet.pitchedBoss),
  Equip(equipName: EquipName.commandingForceEarring, equipSet: EquipSet.pitchedBoss),
  Equip(equipName: EquipName.endlessTerror, equipSet: EquipSet.pitchedBoss),
  Equip(equipName: EquipName.dreamyBelt, equipSet: EquipSet.pitchedBoss, pitchedBossUpgradeModule: PitchedBossUpgradeModule(pitchedBossUpgrade: PitchedBossUpgrade.nightmareFragment)),
  Equip(equipName: EquipName.genesisBadge, equipSet: EquipSet.pitchedBoss),
  Equip(equipName: EquipName.mitrasRageWarrior, equipSet: EquipSet.pitchedBoss),
  Equip(equipName: EquipName.mitrasRageBowman, equipSet: EquipSet.pitchedBoss),
  Equip(equipName: EquipName.mitrasRagePirate, equipSet: EquipSet.pitchedBoss),
  Equip(equipName: EquipName.mitrasRageMagician, equipSet: EquipSet.pitchedBoss),
  Equip(equipName: EquipName.mitrasRageThief, equipSet: EquipSet.pitchedBoss),

];