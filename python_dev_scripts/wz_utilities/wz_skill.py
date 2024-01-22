# python implementation of WzComparerR2.CharaSim.Skill
from enum import IntEnum, Enum
from typing import Optional

from wz_utilities import Wz_Node, Skill, HyperSkillType


# mes = mob effect status?
class DebuffCategory(Enum):
    BURN = "burn"
    SEAL = "seal"
    STUN = "stun"


class SkillType(IntEnum):
    AREA_ATTACK = 1
    UNKNOWN_2 = 2
    INSTALL = 4  # Not very confident in this one, but seems reasonable - most of the skills leave something behind
    JUMP = 40
    PASSIVE = 50


class SkillElement(Enum):
    FIRE = "f"
    HOLY = "h"
    DARK = "d"
    LIGHTNING = "l"
    PHYSICAL = "p"  # This is the default element for skills that do not have an element


class SkillWrapper:
    def __init__(self):
        self.skill = Skill()
        self.skill_name: str = ''
        self.additional_modifiers: dict[str, str] = {}
        self.final_attacks: dict = {}
        self.level_descriptions: dict[int, str] = {}
        self.is_psd: bool = False
        self.skill_list: list[int] = []
        self.psd_skills: list[int] = []

    def __str__(self):
        return f"{self.skill_id}: {self.skill_name}"

    @property
    def level(self) -> int:
        return self.skill.Level

    @level.setter
    def level(self, value: int) -> None:
        self.skill.Level = value

    @property
    def max_level(self) -> int:
        return self.skill.MaxLevel

    @property
    def skill_id(self) -> int:
        return self.skill.SkillID

    @skill_id.setter
    def skill_id(self, value: int):
        self.skill.SkillId = value

    @property
    def common(self) -> dict:
        return self.skill.Common

    @property
    def req_skill(self) -> dict[int, int]:
        return self.skill.ReqSkill

    @property
    def req_amount(self) -> int:
        return self.skill.ReqAmount

    @property
    def req_level(self) -> int:
        return self.skill.ReqLevel

    @property
    def hyper(self) -> HyperSkillType:
        return self.skill.Hyper

    @property
    def action(self) -> list[str]:
        return self.skill.Action

    @property
    def is_pre_bb(self) -> bool:
        return self.skill.PreBBSkill

    @property
    def is_invisible(self) -> bool:
        return self.skill.Invisible

    @property
    def combat_orders_applies(self) -> bool:
        return self.skill.CombatOrders

    @property
    def is_not_removed(self) -> bool:
        return self.skill.NotRemoved

    @property
    def is_v_skill(self) -> bool:
        return self.skill.VSkill

    @property
    def is_origin_skill(self) -> bool:
        return self.skill.Origin

    @classmethod
    def create_from_node(cls, node: Wz_Node) -> Optional['SkillWrapper']:
        skill_wrapper = cls()
        try:
            skill_wrapper.skill = Skill.CreateFromNode(node, None)
        except Exception:
            return None

        for child_node in node.Nodes:
            if child_node.Text in ("icon", "iconMouseOver", "iconDisabled", "common", "level", "hyper", "invisible",
                                   "combatOrders", "notRemoved", "vSkill", "origin", "masterLevel", "reqLev", "req",
                                   "action", "effect", "effect0", "hit", "screen", "affected", "affected0", "repeat",
                                   "special", "special0", "mob", "mob0", "tile", "PVPCommon"):
                continue

            elif child_node.Text == "summon":
                ...

            elif child_node.Text == "finalAttack":
                for final_attack_node in child_node.Nodes:
                    try:
                        skill_wrapper.final_attacks[int(final_attack_node.Text)] = final_attack_node.Value
                    except Exception:
                        skill_wrapper.final_attacks[final_attack_node.Text] = "!ERROR GETTING VALUE!"

            elif child_node.Text == "skillList":
                for skill_node in child_node.Nodes:
                    try:
                        skill_wrapper.skill_list.append(int(skill_node.Value))
                    except Exception:
                        ...

            elif child_node.Text in ("info", "info2"):
                for info_node in child_node.Nodes:
                    try:
                        skill_wrapper.additional_modifiers[info_node.Text] = info_node.Value
                    except Exception:
                        skill_wrapper.additional_modifiers[info_node.Text] = "!ERROR GETTING VALUE!"

            elif child_node.Text == "psd":
                skill_wrapper.is_psd = bool(child_node.Value)

            elif child_node.Text == "psdSkill":
                for psd_node in child_node.Nodes:
                    try:
                        skill_wrapper.psd_skills.append(int(psd_node.Text))
                    except Exception:
                        ...

            else:
                skill_wrapper.additional_modifiers[child_node.Text] = child_node.Value

        return skill_wrapper
