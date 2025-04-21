from enum import StrEnum


class ConsPropType(StrEnum):
    # attack/magic attack
    magic_attack = "mad"
    attack = "pad"
    iattack = "indiePad"
    imagic_attack = "indieMad"

    # stats
    all_stat = "indieAllStat"
    int = "int"
    luk = "luk"
    dex = "dex"
    str = "str"
    speed = "speed"
    jump = "jump"
    defense = "pdd"
    defense2 = "mdd"
    defense3 = "indiePdd"
    defense4 = "indieMdd"
    iint = "indieINT"
    iluk = "indieLUK"
    idex = "indieDEX"
    istr = "indieSTR"
    ispeed = "indieSpeed"
    ijump = "indieJump"
    max_hp = "indieMhp"
    max_mp = "indieMmp"
    attack_speed = "booster"
    attack_speed2 = "indieBooster"
    star_force = "indieStarForce"
    arcane_force = "indieArc"
    hp_increase = "imhp"
    mp_increase = "immp"

    # Stat percentage
    all_stat_percentage = "indieStatR"
    max_hp_percentage = "mhpR"
    max_hp_percentage2 = "indieMhpR"
    max_mp_percentage = "mmpR"
    max_mp_percentage2 = "indieMmpR"
    boss_damage = "bdR"
    boss_damage2 = "indieBDR"
    damage = "indieDamR"
    ignore_enemy_defense = "ignoreMobpdpR"
    iignore_enemy_defense = "indieIgnoreMobpdpR"
    crit_rate = "criticalProb"
    icrit_rate = "indieCr"
    crit_damage = "indieCD"
    normal_monster_damage = "indieNBDR"
    magic_attack_percentage = "indieMadR"
    attack_percentage = "indiePadR"
    status_resistance = "asrR"
    status_resistance2 = "debuffTolerance"

    # duration of consumable
    duration = "time"
    duration2 = 'durationFieldAllUserBuff'
    end_use_date = "endUseDate"
    min_time = "minTime"
    max_time = "maxTime"

    # exp
    flat_exp = "flatExpRate"
    flat_exp2 = "indieExp"
    flat_exp3 = "plusExpRate"
    flat_exp4 = "worldExpBuff"
    flat_exp5 = "worldExpBuff2"
    exp = "expBuff"
    min_exp_buff = "minExpBuff"
    max_exp_buff = "maxExpBuff"
    exp_level_limit = "expBuffLevelLimit"
    exp_under_level_limit = "expBuffUnderLimitRate"

    # drop rate
    drop_rate = "dropRate"
    drop_rate2 = "indieDropPer"
    drop_rate3 = "prob"
    drop_rate4 = "dropPer"
    drop_rate5 = "worldDropBuff"
    drop_rate6 = "worldDropBuff2"

    # mesos
    meso_obtained = 'mesoAmountRate'
    meso_obtained2 = "indieMesoAmountRate"

    # give buff skill
    give_buff = "giveBuff"
    skill_id = "skillID"

IGNORED_PROPS = {
    # Recover a flat amount of hp or mp
    "hp",
    "mp",
    # Recover a percentage amount of hp or mp
    "hpR",
    "mpR",
    "exp", # A flat value of exp is given
    "inflation",  # giant potions
    # status effects
    "weakness",
    "poison",
    "deathmark",
    "seal",
    "darkness",
    "curse",
    "painmark",
    "notPickupByPet",  # Only you can pick up
    "consumeOnPickup",  # Item is used on pick up
    "itemInvincible",  # Item makes you invincible
    "awake",  # cleanses you of status effects
    "lifeId",
    "runOnPickup",
    "script",
    "npc",
    "indieScriptBuff",
    "grade",
'effectSkillID',
    "acc",  # accuracy is not used anymore
    "captureBuff",
    "FfatigueR",  # Familiar fatigue gauge percentage
    "itemupbyitem_WZ2",  # No idea??? maybe increases the item drop rate
    "thaw",
    "mesoupbyitem",  # Increases the drop of mesos?
    "cp",  # Carnival points
    "party",
    "nuffSkill",
    "barrier",
    "mob",
    "onlyPickup",  # Only you can pick up
    "expinc",  # Flat exp value
    "eventPoint",
    "eventRate",
    "BFSkill",
    "dojangshield",
    "berserk",
    "repeatEffect",
    "con",
    "mobID",
    "screenMsg",
    "otherParty",
    "attackMobID",
    "attackIndex",
    # traits
    "charismaEXP",
    "insightEXP",
    "willEXP",
    "craftEXP",
    "senseEXP",
    "charmEXP",
    "eva",
    "dojangLuckyBonus",
    "craftExp",
    "hue",
'incEffectHPPotion',
'incEffectMPPotion',
    "evadeProb",
    "itemupbyitem",  # No idea, applies to some drop rate potions
    "mobHp",
    "rechargeDropTime",
    "rechargeDrop",
    "gatherDropR",
    "gatherDropRCount",
    "indieStance",
    "consumeDummy",
    "realConsumeItems",
    "indieForceSpeed",
    "indieForceJump",
'indieQrPointTerm',
'indieMonsterCollectionR',
    "onlyPremium",
    "heavensDoor",
    "notSale",
    "tradeBlock",
    "indieAllSkill",
    "accountSharable",
    "indieWaterSmashBuff",
'plusFameExpRate',
'noTimeLimit',
'plusPurifyStone',
    "hyperUpgradeDiscountR",
    "indieNotDamaged",
    "time_create",
    "time_expired",
    "moveTo",  # Town scrolls/return scrolls
    "ignoreContinent",
    "mhpRRate",
    "mmpRRate",
'returnMapQR',
# Seen on pet food
'0',
    "1",
    "2",
    "3",
    "4",
    "5",
    "6",
    "7",
    "8",
    "9",
    "incRepleteness",
    "incTameness",
    "morph",
    "morphRandom",
    "ghost",
    "incFatigue",
    # Familiar Cards
    "defenseState",
    "defenseAtt",
    "itemCode",
    "respectFS",
    "itemRange",
    "respectPimmune",
    "respectMimmune",
    "recipe",
    "reqSkillLevel",
    "reqSkill",
    "reqSkillProficiency",
    "recipeUseCount",
    "fieldExpType",
    "dropRIncrease",
    "recipeValidDay",
    "cosmetic",
'ignoreMixHair_jp',
    "slotCount",
    "slotPerLine",
    "type",
"incFixedDamageR",  # PQ Consumable
    # More familiar things
    "interval",
    "startTime",
"familiarPassiveSkillTarget",
    "charColor",
    "familiar",  # will require some digging into
    "reward",
    'accRate', 'effectedOnAlly', 'evaRate', 'madRate', 'mddRate', 'padRate', 'pddRate', 'preventslip', 'speedRate',
    "incPVPDamage",
    "bs",
    "bsUp",
    "immortal",
'randomPickupConsume',
'randomPickup',
}