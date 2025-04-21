import logging
from typing import Any

from developer_scripts.wz_utilities import Wz_Node, Potential
from developer_scripts.wz_utilities.equipment.potential import PotentialWrapper
from developer_scripts.wz_utilities.utilities import potentials_list_to_stat_enum

LOGGER = logging.getLogger(__name__)

class FamiliarBadge:
    def __init__(self, familiar_node: Wz_Node, option_node: Wz_Node):
        self.set_name: str | None = None
        self.potentials = []

        self._familiar_node = familiar_node
        self._option_node = option_node

        self.icon_complete: Wz_Node | None = None

        self.__update_from_nodes()

    def __update_from_nodes(self):
        for sub_node in self._familiar_node.Nodes:
            match sub_node.Text:
                case "setName":
                    self.set_name = sub_node.Value
                case "iconComplete":
                    self.icon_complete = sub_node
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


    def save_icon(self, output_path):
        ...
