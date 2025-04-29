import logging
import re
from pathlib import Path

from developer_scripts.conversion.maplestory_builder_stat_enums import StatType
from developer_scripts.wz_utilities import Wz_Node
from developer_scripts.wz_utilities.consumable.prop_type import IGNORED_PROPS, ConsPropType
from developer_scripts.wz_utilities.utilities import save_icon_from_node
from developer_scripts.wz_utilities.wz_loader import WzLoader

LOGGER = logging.getLogger(__name__)

FAILED_PROP_TYPES = set()

DESCRIPTION_REGEX = re.compile(r"#c.*?#", flags=re.MULTILINE)

class Consumable:
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
        self.icon_node: Wz_Node | None = None

        self.__parse_from_node()

    def __parse_from_node(self):
        for str_sub_node in self.consumable_strings.Nodes if self.consumable_strings else ():
            match str_sub_node.Text:
                case "desc":
                    self.description = str_sub_node.Value
                case "Desc":
                    self.description = str_sub_node.Value
                case "name":
                    self.name = str(str_sub_node.Value or "").strip()
                case "autodesc":
                    self.auto_description = str_sub_node.Value
                case "desc_leftalign":
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
                        except Exception:
                            FAILED_PROP_TYPES.add(spec_node.Text)

                case "info":
                    self.info_node = sub_node

                case "map":
                    self.map_bound = True

        for sub_node in self.info_node.Nodes:
            match sub_node.Text:
                case "iconRaw":
                    self.icon_node = sub_node

    def __str__(self) -> str:
        return f"{self.name}: {self.description or self.reboot_description}"

    def __repr__(self) -> str:
        return f"{self.name}: {self.description or self.reboot_description}"

    def __eq__(self, other) -> bool:
        if not isinstance(other, Consumable):
            return NotImplemented

        return other.name == self.name and other.effects == self.effects

    def to_dict_format(self):
        stat_values = {}
        for cons_prop_type, value in self.effects.items():
            stat_type, converted_value = StatType.cons_prop_type_to_stat_type(cons_prop_type, value)
            if stat_type is None:
                continue

            if stat_type in stat_values:
                LOGGER.debug(f"ENCOUNTERED DUPLICATE STAT '{stat_type}' IN CONSUMABLE")

                # Update with the larger value if encountered, this is mainly for the drop/exp chef buffs
                if stat_values[stat_type] < converted_value:
                    stat_values[stat_type] = converted_value

                continue

            stat_values[stat_type] = converted_value

        return {"name": self.name, "description": self._convert_description(), "consumableStats": stat_values}

    def _convert_description(self) -> str:
        description: str = self.description or self.reboot_description or ""
        if results := DESCRIPTION_REGEX.findall(description):
            for replacing in results:
                replacement = replacing[2:-1]
                description = description.replace(replacing, replacement)

        return description.replace(r"\n", " ").strip()

    def save_icon(self, output_path: Path, loader: WzLoader):
        save_icon_from_node(self.icon_node, output_path, loader)
