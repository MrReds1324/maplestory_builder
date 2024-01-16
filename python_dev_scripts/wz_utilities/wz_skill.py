# python implementation of WzComparerR2.CharaSim.Skill
from enum import IntEnum
from typing import Callable, Optional

from wz_utilities import Wz_Node, Wz_Vector


class HyperSkillType(IntEnum):
    NONE = 0
    S = 1
    P = 2
    A = 3


class Skill:
    def __init__(self):
        self.level: int = 0
        self.master_level: int = 0
        self.skill_id: int = 0

        self.level_common: list[dict[str, str]] = []
        self.common: dict[str, str] = {}
        self.req_skill: dict[int, int] = {}
        self.action: list[str] = []

        self.hyper: HyperSkillType = HyperSkillType.NONE
        self.is_pre_bb: bool = False
        self.is_invisible: bool = False
        self.combat_orders_applies: bool = False
        self.is_not_removed: bool = False
        self.is_v_skill: bool = False
        self.is_origin_skill: bool = False
        self.req_level: int = 0
        self.req_amount: int = 0

    @property
    def max_level(self):
        if self.is_pre_bb:
            return len(self.level_common)
        else:
            try:
                return int(self.common.get('maxLevel'), 0)
            except Exception:
                return 0

    @classmethod
    def create_from_node(cls, node: Wz_Node, find_node: Callable) -> Optional['Skill']:
        skill = cls()
        try:
            skill.skill_id = int(node.Text)
        except Exception:
            return None

        for child_node in node.Nodes:
            if child_node.Text in ("icon", "iconMouseOver", "iconDisabled"):
                continue
            elif child_node.Text == "common":
                for common_node in child_node.Nodes:
                    if common_node.Value is not None and not isinstance(common_node.Value, Wz_Vector):
                        skill.common[common_node.Text] = common_node.Value.ToString()
            elif child_node.Text == "level":
                i = 1

#             foreach (Wz_Node childNode in node.Nodes)
#             {
#                 switch (childNode.Text)
#                 {
#                     case "level":
#                         for (int i = 1; ; i++)
#                         {
#                             Wz_Node levelNode = childNode.FindNodeByPath(i.ToString());
#                             if (levelNode == null)
#                                 break;
#                             Dictionary<string, string> levelInfo = new Dictionary<string, string>();
#
#                             foreach (Wz_Node commonNode in levelNode.Nodes)
#                             {
#                                 if (commonNode.Value != null && !(commonNode.Value is Wz_Vector))
#                                 {
#                                     levelInfo[commonNode.Text] = commonNode.Value.ToString();
#                                 }
#                             }
#
#                             skill.levelCommon.Add(levelInfo);
#                         }
#                         break;
#                     case "hyper":
#                         skill.Hyper = (HyperSkillType)childNode.GetValue<int>();
#                         break;
#                     case "invisible":
#                         skill.Invisible = childNode.GetValue<int>() != 0;
#                         break;
#                     case "combatOrders":
#                         skill.CombatOrders = childNode.GetValue<int>() != 0;
#                         break;
#                     case "notRemoved":
#                         skill.NotRemoved = childNode.GetValue<int>() != 0;
#                         break;
#                     case "vSkill":
#                         skill.VSkill = childNode.GetValue<int>() != 0;
#                         break;
#                     case "origin":
#                         skill.Origin = childNode.GetValue<int>() != 0;
#                         break;
#                     case "masterLevel":
#                         skill.MasterLevel = childNode.GetValue<int>();
#                         break;
#                     case "reqLev":
#                         skill.ReqLevel = childNode.GetValue<int>();
#                         break;
#                     case "req":
#                         foreach (Wz_Node reqNode in childNode.Nodes)
#                         {
#                             if (reqNode.Text == "level")
#                             {
#                                 skill.ReqLevel = reqNode.GetValue<int>();
#                             }
#                             else if (reqNode.Text == "reqAmount")
#                             {
#                                 skill.ReqAmount = reqNode.GetValue<int>();
#                             }
#                             else
#                             {
#                                 int reqSkill;
#                                 if (Int32.TryParse(reqNode.Text, out reqSkill))
#                                 {
#                                     skill.ReqSkill[reqSkill] = reqNode.GetValue<int>();
#                                 }
#                             }
#                         }
#                         break;
#                     case "action":
#                         for (int i = 0; ; i++)
#                         {
#                             Wz_Node idxNode = childNode.FindNodeByPath(i.ToString());
#                             if (idxNode == null)
#                                 break;
#                             skill.Action.Add(idxNode.GetValue<string>());
#                         }
#                         break;
#                 }
#             }
#
#             //判定技能声明版本
#             skill.PreBBSkill = false;
#             if (skill.levelCommon.Count > 0)
#             {
#                 if (skill.common.Count <= 0
#                     || (skill.common.Count == 1 && skill.common.ContainsKey("maxLevel")))
#                 {
#                     skill.PreBBSkill = true;
#                 }
#             }
#
#             return skill;
#         }
#     }
# }
