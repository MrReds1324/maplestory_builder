import logging
from enum import StrEnum
from typing import Self

from developer_scripts.wz_utilities import GearPropType
from developer_scripts.wz_utilities.consumable.prop_type import ConsPropType

LOGGER = logging.getLogger(__name__)

class StatType(StrEnum):
    duration = "duration"
    arcaneForce = "arcaneForce"
    attack = "attack"
    attackMattack = "attackMattack"
    attackSpeed = "attackSpeed"
    bossDamage = "bossDamage"
    buffDuration = "buffDuration"
    critDamage = "critDamage"
    critRate = "critRate"
    damage = "damage"
    heal = "heal"
    healHP = "healHP"
    healMP = "healMP"
    healDamagePercentage = "healDamagePercentage"
    healHPPercentage = "healHPPercentage"
    healMPPercentage = "healMPPercentage"
    healHpMpPercentage = "healHpMpPercentage"
    damageNormalMobs = "damageNormalMobs"
    defense = "defense"
    dex = "dex"
    exp = "exp"
    expAdditional = "expAdditional"
    expMultiplicative = "expMultiplicative"
    finalAttack = "finalAttack"
    finalDamage = "finalDamage"
    finalDex = "finalDex"
    finalHp = "finalHp"
    finalInt = "finalInt"
    finalLuk = "finalLuk"
    finalMAttack = "finalMAttack"
    finalMp = "finalMp"
    finalStr = "finalStr"
    finalStrDex = "finalStrDex"
    finalStrInt = "finalStrInt"
    finalStrLuk = "finalStrLuk"
    finalDexInt = "finalDexInt"
    finalDexLuk = "finalDexLuk"
    finalIntLuk = "finalIntLuk"
    finalStrDexLuk = "finalStrDexLuk"
    hp = "hp"
    hpMp = "hpMp"
    ignoreDefense = "ignoreDefense"
    ignoreElementalDefense = "ignoreElementalDefense"
    int = "int"
    itemDropRate = "itemDropRate"
    jump = "jump"
    knockbackResistance = "knockbackResistance"
    level = "Level"
    luk = "luk"
    mattack = "mattack"
    mesosObtained = "mesosObtained"
    mp = "mp"
    specialMana = "specialMana"
    sacredPower = "sacredPower"
    speed = "speed"
    speedJump = "speedJump"
    starForce = "starForce"
    statusResistance = "statusResistance"
    str = "str"
    strPercentage = "strPercentage"
    dexPercentage = "dexPercentage"
    intPercentage = "intPercentage"
    lukPercentage = "lukPercentage"
    hpPercentage = "hpPercentage"
    mpPercentage = "mpPercentage"
    hpMpPercentage = "hpMpPercentage"
    defensePercentage = "defensePercentage"
    allStats = "allStats"
    allStatsPercentage = "allStatsPercentage"
    attackPercentage = "attackPercentage"
    mattackPercentage = "mattackPercentage"
    attackMattackPercentage = "attackMattackPercentage"
    hpRecovery = "hpRecovery"
    skill = "skill"
    skillLevel = "skillLevel"
    allSkillLevel = "allSkillLevel"
    skillCooldown = "skillCooldown"
    skillCooldownPercentage = "skillCooldownPercentage"
    skipCooldownChance = "skipCooldownChance"
    attackSkillTargetIncrease = "attackSkillTargetIncrease"
    summonDuration = "summonDuration"
    mastery = "mastery"
    finalAttackSkillDamage = "finalAttackSkillDamage"
    autoStealChance = "autoStealChance"
    mainStat = "mainStat"
    mainAttack = "mainAttack"
    procChance = "procChance"

    @classmethod
    def gear_prop_type_to_stat_type(cls, gear_prop_type: GearPropType, value) -> tuple[Self | None, float]:
        conversion = GearPropType_to_StatType.get(gear_prop_type)
        if conversion is None:
            LOGGER.debug(f"ENCOUNTERED UNHANDLED GEAR PROP TYPE {gear_prop_type}")
            return None, value

        stat_type, divisor = conversion

        if stat_type == StatType.attackSpeed:
            value = abs(value)

        if divisor == 100:
            return stat_type, value / divisor

        return stat_type, value

    @classmethod
    def cons_prop_type_to_stat_type(cls, cons_prop_type: ConsPropType, value) -> tuple[Self | None, float]:
        conversion = ConsPropType_to_StatType.get(cons_prop_type)
        if conversion is None:
            LOGGER.debug(f"ENCOUNTERED UNHANDLED CONS PROP TYPE {cons_prop_type}")
            return None, value

        stat_type, divisor = conversion
        if stat_type == StatType.attackSpeed:
            value = abs(value)

        if divisor == 100:
            return stat_type, int(value) / divisor

        return stat_type, int(value)

GearPropType_to_StatType: dict[GearPropType, tuple[StatType, int]] = {
GearPropType.incLUK: (StatType.luk, 1),
GearPropType.incDEX: (StatType.dex, 1),
GearPropType.incINT: (StatType.int, 1),
GearPropType.incSTR: (StatType.str, 1),
    GearPropType.incMHP: (StatType.hp, 1),
    GearPropType.incMMP: (StatType.mp, 1),
    GearPropType.incSpeed: (StatType.speed, 1),
    GearPropType.incJump: (StatType.jump, 1),
    GearPropType.incPDD: (StatType.defense, 1),
    GearPropType.incMDD: (StatType.defense, 1),
    GearPropType.incPAD: (StatType.attack, 1),
    GearPropType.incMAD: (StatType.mattack, 1),
    GearPropType.incAllskill: (StatType.allSkillLevel, 1),
GearPropType.incLUKr: (StatType.lukPercentage, 100),
GearPropType.incDEXr: (StatType.dexPercentage, 100),
GearPropType.incINTr: (StatType.intPercentage, 100),
GearPropType.incSTRr: (StatType.strPercentage, 100),
    GearPropType.incMHPr: (StatType.hpPercentage, 100),
    GearPropType.incMMPr: (StatType.mpPercentage, 100),
GearPropType.incPDDr: (StatType.defensePercentage, 100),
    GearPropType.incMDDr: (StatType.defensePercentage, 100),
    GearPropType.incPADr: (StatType.attackPercentage, 100),
    GearPropType.incMADr: (StatType.mattackPercentage, 100),
    GearPropType.incCr: (StatType.critRate, 100),
    GearPropType.incDAMr: (StatType.damage, 100),
    GearPropType.ignoreTargetDEF: (StatType.ignoreDefense, 100),
    GearPropType.HP: (StatType.healHP, 1),
    GearPropType.MP: (StatType.healMP, 1),
    GearPropType.prop: (StatType.procChance, 100),
}

ConsPropType_to_StatType: dict[ConsPropType, tuple[StatType, int]] = {
    ConsPropType.duration: (StatType.duration, 1),
    ConsPropType.duration2: (StatType.duration, 1),
    ConsPropType.status_resistance: (StatType.statusResistance, 1),
    ConsPropType.status_resistance2: (StatType.statusResistance, 1),
    ConsPropType.int: (StatType.int, 1),
    ConsPropType.int2: (StatType.int, 1),
    ConsPropType.luk: (StatType.luk, 1),
    ConsPropType.luk2: (StatType.luk, 1),
    ConsPropType.dex: (StatType.dex, 1),
    ConsPropType.dex2: (StatType.dex, 1),
    ConsPropType.str: (StatType.str, 1),
    ConsPropType.str2: (StatType.str, 1),
    ConsPropType.attack: (StatType.attack, 1),
    ConsPropType.attack2: (StatType.attack, 1),
    ConsPropType.magic_attack: (StatType.mattack, 1),
    ConsPropType.magic_attack2: (StatType.mattack, 1),
    ConsPropType.all_stat: (StatType.allStats, 1),
    ConsPropType.all_stat_percentage: (StatType.allStatsPercentage, 100),
    ConsPropType.allSkillLevels: (StatType.allSkillLevel, 1),
    ConsPropType.normal_monster_damage: (StatType.damageNormalMobs, 1),
    ConsPropType.defense: (StatType.defense, 1),
    ConsPropType.defense2: (StatType.defense, 1),
    ConsPropType.defense3: (StatType.defense, 1),
    ConsPropType.defense4: (StatType.defense, 1),
    ConsPropType.attack_speed: (StatType.attackSpeed, 1),
    ConsPropType.attack_speed2: (StatType.attackSpeed, 1),
    ConsPropType.speed: (StatType.speed, 1),
    ConsPropType.speed2: (StatType.speed, 1),
    ConsPropType.jump: (StatType.jump, 1),
    ConsPropType.jump2: (StatType.jump, 1),
    # ConsPropType.skill_id: (StatType.skill, 1),
    ConsPropType.max_hp: (StatType.hp, 1),
    ConsPropType.max_hp2: (StatType.hp, 1),
    ConsPropType.max_mp: (StatType.mp, 1),
    ConsPropType.max_mp2: (StatType.mp, 1),
    ConsPropType.max_hp_percentage: (StatType.hpPercentage, 100),
    ConsPropType.max_hp_percentage2: (StatType.hpPercentage, 100),
    ConsPropType.max_mp_percentage: (StatType.mpPercentage, 100),
    ConsPropType.max_mp_percentage2: (StatType.mpPercentage, 100),
    ConsPropType.attack_percentage: (StatType.attackPercentage, 100),
    ConsPropType.magic_attack_percentage: (StatType.mattackPercentage, 100),
    ConsPropType.ignore_enemy_defense: (StatType.ignoreDefense, 100),
    ConsPropType.ignore_enemy_defense2: (StatType.ignoreDefense, 100),
    ConsPropType.boss_damage: (StatType.bossDamage, 100),
    ConsPropType.boss_damage2: (StatType.bossDamage, 100),
    ConsPropType.damage: (StatType.damage, 100),
    ConsPropType.crit_rate: (StatType.critRate, 100),
    ConsPropType.crit_rate2: (StatType.critRate, 100),
    ConsPropType.crit_damage: (StatType.critDamage, 100),
    ConsPropType.flat_exp: (StatType.expAdditional, 100),
    ConsPropType.flat_exp2: (StatType.expAdditional, 100),
    ConsPropType.flat_exp3: (StatType.expAdditional, 100),
    ConsPropType.flat_exp4: (StatType.expAdditional, 100),
ConsPropType.flat_exp5: (StatType.expAdditional, 100),
    ConsPropType.exp: (StatType.expMultiplicative, 100),
    ConsPropType.drop_rate: (StatType.itemDropRate, 100),
    ConsPropType.drop_rate2: (StatType.itemDropRate, 100),
    ConsPropType.drop_rate3: (StatType.itemDropRate, 100),
    ConsPropType.drop_rate4: (StatType.itemDropRate, 100),
    ConsPropType.drop_rate5: (StatType.itemDropRate, 100),
    ConsPropType.drop_rate6: (StatType.itemDropRate, 100),
    ConsPropType.meso_obtained: (StatType.mesosObtained, 100),
    ConsPropType.meso_obtained2: (StatType.mesosObtained, 100),
    ConsPropType.star_force: (StatType.starForce, 1),
    ConsPropType.arcane_force: (StatType.arcaneForce, 1),
    ConsPropType.final_damage: (StatType.finalDamage, 100),
}
