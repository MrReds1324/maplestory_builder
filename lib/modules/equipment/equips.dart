// ignore_for_file: avoid_types_as_parameter_names

import 'package:flutter/material.dart';
import 'package:maplestory_builder/constants/constants.dart';
import 'package:maplestory_builder/modules/base.dart';
import 'package:maplestory_builder/constants/equipment/equip_constants.dart';
import 'package:maplestory_builder/constants/equipment/flame_stats.dart';
import 'package:maplestory_builder/constants/equipment/potential_stats.dart';
import 'package:maplestory_builder/constants/equipment/set_effect_stats.dart';
import 'package:maplestory_builder/modules/equipment/flames_mod.dart';
import 'package:maplestory_builder/modules/equipment/potentials_mod.dart';
import 'package:maplestory_builder/modules/equipment/scroll_mod.dart';
import 'package:maplestory_builder/modules/equipment/starforce_mod.dart';
import 'package:maplestory_builder/modules/equipment/tweak_mod.dart';
import 'package:maplestory_builder/providers/character_provider.dart';
import 'package:maplestory_builder/providers/difference_provider.dart';
import 'package:maplestory_builder/modules/utilities.dart';
import 'dart:math';

import 'package:provider/provider.dart';

class Equip extends Base {
  final EquipName equipName;
  final EquipType equipType;
  final ClassType classType;
  final EquipSet? equipSet;
  bool isEquipped = false;
  bool isUniqueItem = false;
  bool canStar = true;
  bool canFlame = true;
  bool isFlameAdvantaged = true;
  bool canPotential = true;
  final int maxScrollsSlots;
  StarForceModule? starForceModule;
  FlameModule? flameModule;
  PotentialModule? potentialModule;
  ScrollModule? scrollModule;
  TweakModule? tweakModule;
  int equipHash = -1;

  Equip({
    required this.equipName,
    required this.equipType,
    this.equipSet,
    this.classType = ClassType.all,
    this.isUniqueItem = false,
    this.canStar = true,
    this.canFlame = true,
    this.isFlameAdvantaged = true,
    this.canPotential = true,
    this.maxScrollsSlots = 0,
    super.itemLevel = 0,
    super.baseStats,
    this.starForceModule,
    this.flameModule,
    this.potentialModule,
    this.scrollModule,
    this.tweakModule,
    this.equipHash = -1,
  }) {
    if (starForceModule != null) {
      starForceModule = starForceModule;
      starForceModule!.updateStarforce(this, starForceModule!.currentStars);
    }
    else if (canStar) {
      starForceModule = StarForceModule(possibleStars: getStarforceLimit(itemLevel).toInt());
    }
    else {
      starForceModule = null;
    }

    if (flameModule != null) {
      flameModule = flameModule;
      flameModule!.calculateModuleStats(this);
    }
    else if (noFlameCategory.contains(equipType)){
      flameModule = null;
    }
    else if (canFlame) {
      flameModule = FlameModule();
    }
    else {
      flameModule = null;
    }

    if (potentialModule != null) {
      potentialModule = potentialModule;
      potentialModule!.calculateModuleStats();
    }
    else if (noPotentialCategory.contains(equipType)){
      potentialModule = null;
    }
    else if (canPotential) {
      potentialModule = PotentialModule(
        potentialOffset: getPotentialOffsetFromItemLevel(itemLevel)
      );
    }
    else {
      potentialModule = null;
    }

    if (scrollModule != null) {
      scrollModule = scrollModule;
      scrollModule!.calculateModuleStats();
    }
    else if (maxScrollsSlots == 0) {
      scrollModule = null;
    }
    else {
      scrollModule = ScrollModule(
        totalScrollSlots: maxScrollsSlots,
        scrollOffset: getScrollOffsetFromItemLevel(itemLevel)
      );
    }

    tweakModule = tweakModule ?? TweakModule();
  }

  Equip copyWith({
    EquipName? equipName,
    EquipType? equipType,
    EquipSet? equipSet,
    ClassType? classType,
    bool? isUniqueItem,
    bool? canStar,
    bool? canFlame,
    bool? isFlameAdvantaged,
    bool? canPotential,
    int? maxScrollsSlots,
    int? itemLevel,
    Map<StatType, num>? baseStats,
    StarForceModule? starForceModule,
    FlameModule? flameModule,
    PotentialModule? potentialModule,
    ScrollModule? scrollModule,
    TweakModule? tweakModule,
    int? equipHash,
  }) {
    return Equip(
      equipName: equipName ?? this.equipName,
      equipType: equipType ?? this.equipType,
      equipSet: equipSet ?? this.equipSet,
      classType: classType ?? this.classType,
      isUniqueItem: isUniqueItem ?? this.isUniqueItem,
      canStar: canStar ?? this.canStar,
      canFlame: canFlame ?? this.canFlame,
      isFlameAdvantaged: isFlameAdvantaged ?? this.isFlameAdvantaged,
      canPotential: canPotential ?? this.canPotential,
      maxScrollsSlots: maxScrollsSlots ?? this.maxScrollsSlots,
      itemLevel: itemLevel ?? this.itemLevel,
      baseStats: baseStats ?? Map<StatType, num>.from(this.baseStats),
      starForceModule: starForceModule ?? this.starForceModule?.copyWith(),
      flameModule: flameModule ?? this.flameModule?.copyWith(),
      potentialModule: potentialModule ?? this.potentialModule?.copyWith(),
      scrollModule: scrollModule ?? this.scrollModule?.copyWith(),
      tweakModule: tweakModule ?? this.tweakModule?.copyWith(),
      equipHash: equipHash ?? this.equipHash,
    );
  }

  num get(StatType statType) {
    return baseStats[statType] ?? 0;
  }

  num getTotalStat(StatType statType) {
    switch(statType) {
      case StatType.str:
      case StatType.dex:
      case StatType.int:
      case StatType.luk:  
        return get(StatType.allStats) + (potentialModule?.get(StatType.allStats) ?? 0) + get(statType) + (starForceModule?.get(statType) ?? 0) + (flameModule?.get(statType) ?? 0) + (potentialModule?.get(statType) ?? 0) + (scrollModule?.get(statType) ?? 0) + (tweakModule?.get(statType) ?? 0);
      // TODO fix these calculation
      case StatType.ignoreDefense:
      case StatType.ignoreElementalDefense:
      default:
        return get(statType) + (starForceModule?.get(statType) ?? 0) + (flameModule?.get(statType) ?? 0) + (potentialModule?.get(statType) ?? 0) + (scrollModule?.get(statType) ?? 0) + (tweakModule?.get(statType) ?? 0);
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
    return equipSet != null ? 535 : 310;
  }

  Row createEquipContainer(BuildContext context, {bool isEquipEditing=false}) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: 300,
          padding: const EdgeInsets.all(2.5),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              __createTextLine(context, StatType.starForce),
              Center(
                child: Text(
                  "${equipName.formattedName}${(scrollModule?.usedScrolls.length ?? 0) > 0 ? ' +${scrollModule?.usedScrolls.length}' : ''}", style: Theme.of(context).textTheme.headlineSmall
                )
              ),
              isUniqueItem ? const Center(child: Text("Unique Equipped Item", style: TextStyle(color: equipUniqueColor))) : const SizedBox.shrink(),
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
                "${(scrollModule?.usedScrollSlots ?? 0)}/${(scrollModule?.totalScrollSlots ?? 0)} Scrolls Enhancements Applied", 
                style: Theme.of(context).textTheme.bodyMedium
              ),
              isEquipEditing ? const SizedBox.shrink() : potentialModule?.buildPotentialWidget(context, this) ?? const SizedBox.shrink(),
            ],
          ),
        ),
        isEquipEditing ? const SizedBox.shrink() : createSetEffectContainer(context),
      ]
    );
  }

  Widget createSetEffectContainer(BuildContext context, {bool isEquipEditing = false, bool isAdding = false, bool isRemoving = false}) {
    // If we are editing an equip then we always want to target the difference character model
    SetEffect? setEffect;
    if (isEquipEditing) {
      setEffect = context.read<DifferenceCalculatorProvider>().diffCharacterModel.equipsProvider.activeEquipSet.setEffectModule.activeSetEffects[equipSet]!;
    }
    else {
      setEffect = context.read<CharacterProvider>().equipsProvider.setEffectModule.activeSetEffects[equipSet] ?? allSetEffects[equipSet]!;
    }
    return setEffect.createSetEffectContainer(context, addingEquip: isAdding && isEquipEditing ? this : null, removingEquip: isRemoving && isEquipEditing ? this : null);
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
              text: "Required Level: ${max(itemLevel - (flameModule?.get(StatType.level) ?? 0), 0).toInt()}",
              style: const TextStyle(color: starColor)
            )
          );
          levelText.add(
            TextSpan(
              text: "($itemLevel",
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
              text: "Required Level: $itemLevel",
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
        scrollStat = (scrollModule?.get(statType) ?? 0) + (scrollModule?.get(StatType.allStats) ?? 0);
        tweakStat = tweakModule?.get(statType) ?? 0;
      // TODO: Fix these calculations
      case StatType.ignoreDefense:
      case StatType.ignoreElementalDefense:
      default:
        baseStat = get(statType);
        starForceStat = starForceModule?.get(statType) ?? 0;
        flameStat = flameModule?.get(statType) ?? 0;
        scrollStat = scrollModule?.get(statType) ?? 0;
        tweakStat = tweakModule?.get(statType) ?? 0;
    }
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
  Equip(equipName: EquipName.dawnGuardianAngelRing, equipType: EquipType.ring, equipSet: EquipSet.dawnBossSet, maxScrollsSlots: 4, isUniqueItem: true, itemLevel: 160, baseStats: const {StatType.allStats: 5, StatType.hp: 200, StatType.mp: 200, StatType.attack: 2, StatType.mattack: 2}),
  Equip(equipName: EquipName.twilightMark, equipType: EquipType.face, equipSet: EquipSet.dawnBossSet, maxScrollsSlots: 8, itemLevel: 140, baseStats: const {StatType.allStats: 5, StatType.attack: 5, StatType.mattack: 5, StatType.defense: 100}),
  Equip(equipName: EquipName.estellaEarrings, equipType: EquipType.earrings, equipSet: EquipSet.dawnBossSet, maxScrollsSlots: 5, itemLevel: 160, baseStats: const {StatType.allStats: 7, StatType.hp: 300, StatType.mp: 300, StatType.attack: 2, StatType.mattack: 2, StatType.defense: 100}),
  Equip(equipName: EquipName.daybreakPendant, equipType: EquipType.pendant, equipSet: EquipSet.dawnBossSet, maxScrollsSlots: 7, isUniqueItem: true, itemLevel: 140, baseStats: const {StatType.allStats: 8, StatType.hpPercentage: 0.05, StatType.attack: 2, StatType.mattack: 2, StatType.defense: 100}),
  // Superior Gollux Items
  Equip(equipName: EquipName.superiorGolluxRing, equipType: EquipType.ring, equipSet: EquipSet.superiorGollux, maxScrollsSlots: 8, isUniqueItem: true, itemLevel: 150, baseStats: const {StatType.allStats: 10, StatType.hp: 250, StatType.mp: 250, StatType.attack: 8, StatType.mattack: 8, StatType.defense: 150, StatType.speed: 10}),
  Equip(equipName: EquipName.superiorGolluxPendant, equipType: EquipType.pendant, equipSet: EquipSet.superiorGollux, maxScrollsSlots: 8, isFlameAdvantaged: false,itemLevel: 150, baseStats: const {StatType.allStats: 28, StatType.hp: 300, StatType.mp: 300, StatType.attack: 5, StatType.mattack: 5, StatType.defense: 100}),
  Equip(equipName: EquipName.superiorGolluxBelt, equipType: EquipType.belt, equipSet: EquipSet.superiorGollux, maxScrollsSlots: 5, isFlameAdvantaged: false,itemLevel: 150, baseStats: const {StatType.allStats: 60, StatType.hp: 200, StatType.mp: 200, StatType.attack: 35, StatType.mattack: 35, StatType.defense: 100}),
  Equip(equipName: EquipName.superiorGolluxEarrings, equipType: EquipType.earrings, equipSet: EquipSet.superiorGollux, maxScrollsSlots: 9, isFlameAdvantaged: false, itemLevel: 150, baseStats: const {StatType.allStats: 15, StatType.hp: 150, StatType.mp: 150, StatType.attack: 10, StatType.mattack: 10, StatType.defense: 100}),
];