# Rewriting the finding Wz stuff in python because the c# method required is not a public api within the built dlls
from typing import Optional
from wz_utilities import Wz_Type, Wz_Node, Wz_File


class FindWzHelper:
    def __init__(self, wz_type: Optional[Wz_Type] = None):
        self.wz_type: Wz_Type = wz_type
        self.full_path: Optional[str] = None
        self.wz_file: Wz_File = None
        self.wz_node: Wz_Node = None
