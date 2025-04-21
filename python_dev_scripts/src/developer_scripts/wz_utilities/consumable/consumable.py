from developer_scripts.wz_utilities import Wz_Node
from developer_scripts.wz_utilities.consumable.prop_type import ConsPropType, IGNORED_PROPS


class Consumable:
    FAILED_PROP_TYPES = set()
    def __init__(self, consumable_node: Wz_Node, string_node: Wz_Node):
        self.consumable_node = consumable_node
        self.consumable_strings: Wz_Node | None = string_node.FindNodeByPath(consumable_node.Text[1:], False)

        self.description: str | None = None
        self.reboot_description: str | None = None
        self.description_left_aligned: str | None = None
        self.auto_description: str | None = None
        self.name: str | None = None

        self.effects: dict[ConsPropType, int] = {}
        self.map_bound: bool = False

        self.info_node: Wz_Node | None = None

        self.__parse_from_node()


    def __parse_from_node(self):
        for str_sub_node in (self.consumable_strings.Nodes if self.consumable_strings else ()):
            match str_sub_node.Text:
                case "desc":
                    self.description = str_sub_node.Value
                case "Desc":
                    self.description = str_sub_node.Value
                case "name":
                    self.name = str_sub_node.Value
                case "autodesc":
                    self.auto_description = str_sub_node.Value
                case 'desc_leftalign':
                    self.description_left_aligned = str_sub_node.Value
                case "desc_reboot":
                    self.reboot_description = str_sub_node.Value
                case _:
                    ...

        for sub_node in self.consumable_node.Nodes:
            match sub_node.Text:
                case "spec":
                    for spec_node in sub_node.Nodes:
                        if spec_node.Text in IGNORED_PROPS:
                            continue

                        try:
                            self.effects[ConsPropType(spec_node.Text)] = spec_node.Value
                        except Exception as e:
                            self.FAILED_PROP_TYPES.add(spec_node.Text)

                case "info":
                    self.info_node = sub_node

                case "map":
                    self.map_bound = True

    def __str__(self) -> str:
        return f"{self.name}: {self.description or self.reboot_description}"

    def __repr__(self) -> str:
        return f"{self.name}: {self.description or self.reboot_description}"
