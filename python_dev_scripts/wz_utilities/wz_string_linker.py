# For the life of me I could not get the c# load function to work for the StringLinker Class - implementing the API in python...
from typing import Optional
from wz_utilities import Wz_Node, Wz_File


class StringResult:
    def __init__(self):
        self.name: Optional[str] = None
        self.desc: Optional[str] = None
        self.pdesc: Optional[str] = None
        self.auto_desc: Optional[str] = None
        self.full_path: Optional[str] = None
        self.all_values: dict[str, str] = {}

    def __str__(self):
        return f"{self.name} - {self.desc}"

    def __repr__(self):
        return self.__str__()


class StringResultSkill(StringResult):
    def __init__(self):
        super(StringResultSkill, self).__init__()
        self.skill_h: list[str] = []
        self.skill_ph: list[str] = []
        self.skill_hch: list[str] = []


class StringLinker:
    def __init__(self):
        self.string_eqp: dict[int, StringResult] = {}
        self.string_item: dict[int, StringResult] = {}
        self.string_map: dict[int, StringResult] = {}
        self.string_mob: dict[int, StringResult] = {}
        self.string_npc: dict[int, StringResult] = {}
        self.string_skill: dict[int, StringResult] = {}
        self.string_skill2: dict[int, StringResult] = {}

    def load(self, string_wz: Wz_File) -> bool:
        if string_wz is None or string_wz.Node is None:
            return False

        self.clear()
        for node_ in string_wz.Node.Nodes:
            image = node_.Value
            if image is None:
                continue

            if not image.TryExtract():
                continue

            if node_.Text in ("Pet.img", "Cash.img", "Ins.img", "Consume.img"):
                for tree in image.Node.Nodes:
                    try:
                        tree_id = int(tree.Text)
                    except Exception:
                        continue

                    str_ressult = StringResult()
                    str_ressult.name = self._get_default_string(tree, "name")
                    str_ressult.desc = self._get_default_string(tree, "desc")
                    str_ressult.auto_desc = self._get_default_string(tree, "autodesc")
                    str_ressult.full_path = tree.FullPath

                    self._add_all_value(str_ressult, tree)
                    self.string_item[tree_id] = str_ressult

            elif node_.Text == "Etc.img":
                for tree0 in image.Node.Nodes:
                    for tree in tree0.Nodes:
                        try:
                            tree_id = int(tree.Text)
                        except Exception:
                            continue

                        str_result = StringResult()
                        str_result.name = self._get_default_string(tree, "name")
                        str_result.desc = self._get_default_string(tree, "desc")
                        str_result.full_path = tree.FullPath

                        self._add_all_value(str_result, tree)
                        self.string_item[tree_id] = str_result

            elif node_.Text == "Mob.img":
                for tree in image.Node.Nodes:
                    try:
                        tree_id = int(tree.Text)
                    except Exception:
                        continue

                    str_result = StringResult()
                    str_result.name = self._get_default_string(tree, "name")
                    str_result.full_path = tree.FullPath

                    self._add_all_value(str_result, tree)
                    self.string_mob[tree_id] = str_result

            elif node_.Text == "Npc.img":
                for tree in image.Node.Nodes:
                    try:
                        tree_id = int(tree.Text)
                    except Exception:
                        continue

                    str_result = StringResult()
                    str_result.name = self._get_default_string(tree, "name")
                    str_result.desc = self._get_default_string(tree, "desc")
                    str_result.full_path = tree.FullPath

                    self._add_all_value(str_result, tree)
                    self.string_npc[tree_id] = str_result

            elif node_.Text == "Map.img":
                for tree0 in image.Node.Nodes:
                    for tree in tree0.Nodes:
                        try:
                            tree_id = int(tree.Text)
                        except Exception:
                            continue

                        str_result = StringResult()
                        str_result.name = f"{self._get_default_string(tree, 'streetName')}: {self._get_default_string(tree, 'mapName')}"
                        str_result.desc = self._get_default_string(tree, "mapDesc")
                        str_result.full_path = tree.FullPath

                        self._add_all_value(str_result, tree)
                        self.string_map[tree_id] = str_result

            elif node_.Text == "Skill.img":
                for tree in image.Node.Nodes:
                    str_result = StringResultSkill()
                    str_result.name = self._get_default_string(tree, "name")
                    str_result.desc = self._get_default_string(tree, "desc")
                    str_result.pdesc = self._get_default_string(tree, "pdesc")
                    str_result.skill_h.append(self._get_default_string(tree, "h"))
                    str_result.skill_ph.append(self._get_default_string(tree, "ph"))
                    str_result.skill_hch.append(self._get_default_string(tree, "hch"))

                    if str_result.skill_h[0] is None:
                        str_result.skill_h = str_result.skill_h[1:]
                        i = 1
                        while True:
                            hi = self._get_default_string(tree, f"h{i}")
                            if not hi:
                                break

                            str_result.skill_h.append(hi)
                            i += 1

                    str_result.full_path = tree.FullPath

                    self._add_all_value(str_result, tree)

                    try:
                        tree_id = int(tree.Text)
                    except Exception:
                        tree_id = None
                    if len(tree.Text) >= 7 and tree_id:
                        self.string_skill[tree_id] = str_result
                    self.string_skill2[tree.Text] = str_result

            elif node_.Text == "Eqp.img":
                for tree0 in image.Node.Nodes:
                    for tree1 in tree0.Nodes:
                        for tree in tree1.Nodes:
                            try:
                                tree_id = int(tree.Text)
                            except Exception:
                                continue

                            str_result = StringResult()
                            str_result.name = self._get_default_string(tree, "name")
                            str_result.desc = self._get_default_string(tree, "desc")
                            str_result.full_path = tree.FullPath

                            self._add_all_value(str_result, tree)
                            self.string_eqp[tree_id] = str_result
            else:
                continue

    @staticmethod
    def _get_default_string(node_: Wz_Node, search_node_text: str):
        node_ = node_.FindNodeByPath(search_node_text)
        if node_ is None:
            return None
        else:
            return str(node_.Value)

    @staticmethod
    def _add_all_value(str_result: StringResult, node_: Wz_Node):
        for child in node_.Nodes:
            if child.Value is not None:
                str_result.all_values[child.Text] = child.GetValue[str]()

    def clear(self):
        self.string_eqp.clear()
        self.string_item.clear()
        self.string_map.clear()
        self.string_mob.clear()
        self.string_npc.clear()
        self.string_skill.clear()
        self.string_skill2.clear()