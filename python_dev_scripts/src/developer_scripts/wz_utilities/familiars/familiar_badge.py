import logging
from pathlib import Path
from typing import Any

from developer_scripts.wz_utilities import Wz_Node, Potential, Wz_Type
from developer_scripts.wz_utilities.equipment.potential import PotentialWrapper
from developer_scripts.wz_utilities.utilities import potentials_list_to_stat_enum, save_icon_from_node
from developer_scripts.wz_utilities.wz_finder import FindWzHelper
from developer_scripts.wz_utilities.wz_loader import WzLoader

LOGGER = logging.getLogger(__name__)


class FamiliarBadge:
    def __init__(self, familiar_node: Wz_Node, option_node: Wz_Node):
        self.set_name: str | None = None
        self.potentials = []

        self._familiar_node = familiar_node
        self._option_node = option_node

        self.__update_from_nodes()

    def __update_from_nodes(self):
        for sub_node in self._familiar_node.Nodes:
            match sub_node.Text:
                case "setName":
                    self.set_name = sub_node.Value
                case "stats":
                    if self._option_node is None:
                        continue

                    for n in sub_node.Nodes:
                        if n.Text == "potential":
                            for potential_node in n.Nodes:
                                potential_text = f"{potential_node.Value:06}"
                                option_node = self._option_node.FindNodeByPath(potential_text)
                                if option_node is None:
                                    LOGGER.debug(f"FAILED TO FIND OPTION NODE {potential_text}")
                                    continue
                                if potential := Potential.CreateFromNode(option_node, 1):
                                    self.potentials.append(PotentialWrapper(potential))

    def to_dict_format(self) -> dict[str, Any]:
        option_stats, random_stats = potentials_list_to_stat_enum(self.potentials)
        return {"badgeName": self.set_name, "badgeStats": option_stats, "randomStats": random_stats}

    @staticmethod
    def save_icon(badge_idx:int, output_path: Path, loader: WzLoader):

        ui_wz = loader.find_wz(FindWzHelper(Wz_Type.UI))
        badge_icon_node = ui_wz.FindNodeByPath(f"_Canvas\\UIWindowPL2.img\\Familiar\\viewPage\\badge\\@badge\\{badge_idx}\\complete\\normal\\0", True)

        save_icon_from_node(badge_icon_node, output_path / f"{badge_idx}.png", loader)