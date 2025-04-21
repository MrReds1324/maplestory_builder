import logging
from enum import StrEnum
from typing import Self

from developer_scripts.wz_utilities import GearPropType

LOGGER = logging.getLogger(__name__)

class StatType(StrEnum):
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
    def gear_prop_type_to_stat_type(cls, gear_prop_type: GearPropType, value: int) -> tuple[Self | None, float]:
        match gear_prop_type:
            case GearPropType.incLUK:
                return StatType.luk, value

            case GearPropType.incINT:
                return StatType.int, value

            case GearPropType.incDEX:
                return StatType.dex, value

            case GearPropType.incSTR:
                return StatType.str, value

            case GearPropType.incLUKr:
                return StatType.lukPercentage, value / 100

            case GearPropType.incINTr:
                return StatType.intPercentage, value / 100

            case GearPropType.incDEXr:
                return StatType.dexPercentage, value / 100

            case GearPropType.incSTRr:
                return StatType.strPercentage, value / 100

            case GearPropType.incSpeed:
                return StatType.speed, value

            case GearPropType.incCr:
                return StatType.critRate, value / 100

            case GearPropType.incPDD:
                return StatType.defense, value

            case GearPropType.incMDD:
                return StatType.defense, value

            case GearPropType.incMHP:
                return StatType.hp, value

            case GearPropType.incMHPr:
                return StatType.hpPercentage, value / 100

            case GearPropType.incMMPr:
                return StatType.mpPercentage, value / 100

            case GearPropType.incMMP:
                return StatType.mp, value

            case GearPropType.incPAD:
                return StatType.attack, value

            case GearPropType.incMAD:
                return StatType.mattack, value

            case GearPropType.incPADr:
                return StatType.attackPercentage, value / 100

            case GearPropType.incMADr:
                return StatType.mattackPercentage, value / 100

            case GearPropType.ignoreTargetDEF:
                return StatType.ignoreDefense, value / 100

            case GearPropType.incDAMr:
              return StatType.damage, value / 100

            case GearPropType.incAllskill:
                return StatType.allSkillLevel, value

            case GearPropType.HP:
                return StatType.healHP, value

            case GearPropType.MP:
                return StatType.healMP, value

            case GearPropType.incJump:
                return StatType.jump, value

            case GearPropType.incPDDr:
                return StatType.defensePercentage, value / 100

            case GearPropType.prop:
                return StatType.procChance, value / 100

            case _:
                LOGGER.debug(f"ENCOUNTERED UNHANDLED GEAR PROP TYPE {gear_prop_type}")
                return None, value
