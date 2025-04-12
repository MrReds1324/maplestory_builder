# Rewriting the finding Wz stuff in python because the c# method required is not a public api within the built dlls
from developer_scripts.wz_utilities import Wz_File, Wz_Node, Wz_Type


class FindWzHelper:
    def __init__(self, wz_type: Wz_Type | None = None):
        self.wz_type: Wz_Type = wz_type
        self.full_path: str | None = None
        self.wz_file: Wz_File = None
        self.wz_node: Wz_Node = None
