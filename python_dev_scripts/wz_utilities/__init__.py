import os.path
import clr

clr.AddReference(rf'{os.path.dirname(__file__)}/lib/WzComparerR2.WzLib.dll')

from WzComparerR2.WzLib import Wz_Structure, Wz_Node, Wz_NodeExtension, Wz_Type, Wz_File, Wz_Image, Wz_Vector