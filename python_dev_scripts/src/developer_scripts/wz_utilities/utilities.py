import logging
from pathlib import Path
from typing import TYPE_CHECKING

from System.Drawing.Imaging import ImageFormat

from developer_scripts.conversion.maplestory_builder_stat_enums import StatType
from developer_scripts.wz_utilities import GearPropType, Wz_Node, Wz_Png, Wz_Type, Wz_Uol
from developer_scripts.wz_utilities.equipment.potential import PotentialWrapper
from developer_scripts.wz_utilities.wz_finder import FindWzHelper

if TYPE_CHECKING:
    from developer_scripts.wz_utilities.wz_loader import WzLoader

LOGGER = logging.getLogger(__name__)

def wz_type_parse(string: str) -> Wz_Type:
    if "." in string:
        string = string.split(".")[0]
    return getattr(Wz_Type, string)

def potentials_list_to_stat_enum(values: list[PotentialWrapper]) -> tuple[dict[StatType, float], list[dict[StatType, float]]]:
    stat_values = {}
    random_stats = []

    for value in values:
        if len(value.props) >= 2 and GearPropType.prop in value.props:
            proc_stats = {}
            for gear_prop_type_proc, prop_value_proc in value.props.items():
                stat_type, prop_value = StatType.gear_prop_type_to_stat_type(gear_prop_type_proc, prop_value_proc)
                if not stat_type:
                    continue

                if stat_type in proc_stats:
                    LOGGER.debug("ENCOUNTERED DUPLICATE STAT IN POTENTIALS")
                    continue

                proc_stats[stat_type] = prop_value

            random_stats.append(proc_stats)
            continue

        for gear_prop_type, prop_value_loop in value.props.items():
            stat_type, prop_value = StatType.gear_prop_type_to_stat_type(gear_prop_type, prop_value_loop)
            if not stat_type:
                continue

            if stat_type in stat_values:
                LOGGER.debug("ENCOUNTERED DUPLICATE STAT IN POTENTIALS")
                continue

            stat_values[stat_type] = prop_value

    return stat_values, random_stats

def save_icon_from_node(node: Wz_Node | None, output_path: Path, loader: "WzLoader"):
    if node is None:
        LOGGER.warning(f"No node image to save to {output_path}")

    LOGGER.info(f"Saving image to {output_path}")

    try:
        if isinstance(node.Value, Wz_Png):
            node.Value.ExtractPng().Save(str(output_path), ImageFormat.Png)
            return

        if isinstance(node.Value, Wz_Uol):
            resolved_node = node.ResolveUol()
            outlink = resolved_node.FindNodeByPath("_outlink", True).Value

        else:
            outlink = node.FindNodeByPath("_outlink", True).Value

        search_node = loader.find_wz(FindWzHelper(full_path=outlink))
        if search_node is not None and isinstance(search_node.Value, Wz_Png):
            search_node.Value.ExtractPng().Save(str(output_path), ImageFormat.Png)
    except Exception:
        LOGGER.exception("Failed to save node image")