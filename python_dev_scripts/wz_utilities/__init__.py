import os.path
import clr

__DIR_NAME = os.path.dirname(__file__)

clr.AddReference(os.path.join(__DIR_NAME, "lib", "WzComparerR2.WzLib.dll"))
clr.AddReference(os.path.join(__DIR_NAME, "lib", "WzComparerR2.Common.dll"))

from WzComparerR2.WzLib import Wz_Structure, Wz_Node, Wz_NodeExtension, Wz_Type, Wz_File, Wz_Image, Wz_Vector
from WzComparerR2.Common import StringResult, StringResultSkill
from WzComparerR2.CharaSim import SummaryParser, SummaryParams, Skill, HyperSkillType
