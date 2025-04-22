import os.path

import pythonnet
from clr_loader import get_coreclr

__DIR_NAME = os.path.dirname(__file__)
rt = get_coreclr(runtime_config=os.path.join(__DIR_NAME, "lib", "WzComparerR2.runtimeconfig.json"))
pythonnet.load(rt)

import clr

clr.AddReference(os.path.join(__DIR_NAME, "lib", "Lib", "WzComparerR2.WzLib.dll"))
clr.AddReference(os.path.join(__DIR_NAME, "lib", "Lib", "WzComparerR2.Common.dll"))

from WzComparerR2.CharaSim import (
    GearPropType,
    HyperSkillType,
    Potential,
    SetItem,
    SetItemEffect,
    SetItemIDList,
    SetItemIDPart,
    Skill,
    SummaryParams,
    SummaryParser,
)
from WzComparerR2.Common import StringResult, StringResultSkill
from WzComparerR2.WzLib import Wz_File, Wz_Image, Wz_Node, Wz_NodeExtension, Wz_Png, Wz_Structure, Wz_Type, Wz_Uol, Wz_Vector
