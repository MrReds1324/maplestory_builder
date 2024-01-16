import re
from pathlib import Path

import clr
from typing import Optional, Union

# clr.AddReference(r'C:\Users\ryanb\Desktop\WzViewer\Lib\WzComparerR2.WzLib.dll')
from wz_utilities import Wz_Structure, Wz_Node, Wz_NodeExtension, Wz_Type, Wz_File, Wz_Image
from wz_utilities.utilities import wz_type_parse
from wz_utilities.wz_finder import FindWzHelper
from wz_utilities.wz_string_linker import StringLinker


class WzLoader:

    def __init__(self, path_to_base_wz: Union[str, Path]):
        self.opened_wz: list[Wz_Structure] = []
        self.wz_struct: Wz_Structure = Wz_Structure()
        self.string_linker: StringLinker = StringLinker()

        if self.wz_struct.IsKMST1125WzFormat(path_to_base_wz):
            self.wz_struct.LoadKMST1125DataWz(path_to_base_wz)
        else:
            self.wz_struct.Load(path_to_base_wz, True)

        self.opened_wz.append(self.wz_struct)
        self.string_linker.load(self.find_string_wz())

        self.sort_wz_node(self.wz_struct.WzNode)

    def find_string_wz(self) -> Optional[Wz_File]:
        for wzs in self.opened_wz:
            for wz_f in wzs.wz_files:
                if wz_f.Type == Wz_Type.String:
                    return wz_f

    @staticmethod
    def sort_wz_node(wz_node: Wz_Node, sort_by_img_id: bool = True):
        if wz_node.Nodes:
            if sort_by_img_id:
                Wz_NodeExtension.SortByImgID(wz_node.Nodes)
            else:
                wz_node.Nodes.Sort()

            for sub_node in wz_node.Nodes:
                WzLoader.sort_wz_node(sub_node, sort_by_img_id)

    def find_wz(self, find_wz_helper) -> Optional[Wz_Node]:
        self.search_for_wz(find_wz_helper)

        if find_wz_helper.wz_node is not None:
            return find_wz_helper.wz_node
        if find_wz_helper.wz_file is not None:
            return find_wz_helper.wz_file.Node

    def search_for_wz(self, find_wz_helper: FindWzHelper):
        full_path = []

        if find_wz_helper.full_path:
            full_path = re.split(r"/|\\", find_wz_helper.full_path)
            find_wz_helper.wz_type = wz_type_parse(full_path[0])

        pre_search: list[Wz_Node] = []
        if find_wz_helper.wz_type != Wz_Type.Unknown:

            if find_wz_helper.wz_file is not None and find_wz_helper.wz_file.WzStructure is not None:
                pre_search_wz = [find_wz_helper.wz_file.WzStructure]
            else:
                pre_search_wz = self.opened_wz

            for wzs in pre_search_wz:
                base_wz = None
                found = False

                for wz_f in wzs.wz_files:
                    if wz_f.Type == find_wz_helper.wz_type:
                        pre_search.append(wz_f.Node)
                        found = True
                    if wz_f.Type == Wz_Type.Base:
                        base_wz = wz_f

                if base_wz is not None and not found:
                    key = find_wz_helper.wz_type.ToString()
                    for node in base_wz.Node.Nodes:
                        if node.Text == key and node.Nodes.Count > 0:
                            pre_search.append(node)

        if len(full_path) <= 1:
            if find_wz_helper.wz_type != Wz_Type.Unknown and len(pre_search) > 0:
                find_wz_helper.wz_node = pre_search[0]
                find_wz_helper.wz_file = pre_search[0].Value
            return

        if len(pre_search) <= 0:
            return

        for wz_file_node in pre_search:
            search_node = wz_file_node
            i = 1
            while i < len(full_path) and search_node is not None:
                search_node = search_node.Nodes[full_path[i]]
                img = Wz_NodeExtension.GetValueEx[Wz_Image](None)
                if img is not None:
                    search_node = img.TryExtract()
                    if not search_node:
                        search_node = img.Node
                    else:
                        search_node = None
                i += 1

            if search_node is not None:
                find_wz_helper.wz_node = search_node
                find_wz_helper.wz_file = wz_file_node.Value
                return

        find_wz_helper.wz_node = None
