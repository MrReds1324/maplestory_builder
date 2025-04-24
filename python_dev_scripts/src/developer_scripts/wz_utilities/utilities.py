import logging
import string
from pathlib import Path
from typing import TYPE_CHECKING

from developer_scripts.conversion.maplestory_builder_stat_enums import StatType
from developer_scripts.wz_utilities import GearPropType, Wz_Node, Wz_NodeExtension, Wz_Png, Wz_Type, Wz_Uol
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

            convert_to_all_stat(proc_stats)
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

    convert_to_all_stat(stat_values)
    return stat_values, random_stats

def convert_to_all_stat(stat_dict: dict):
    int_value = stat_dict.get(StatType.int)
    luk_value = stat_dict.get(StatType.luk)
    dex_value = stat_dict.get(StatType.dex)
    str_value = stat_dict.get(StatType.str)
    set_values = {int_value, luk_value, dex_value, str_value}

    if len(set_values) == 1 and (set_val := next(iter(set_values))) is not None:
        stat_dict[StatType.allStats] = set_val
        del stat_dict[StatType.int]
        del stat_dict[StatType.luk]
        del stat_dict[StatType.dex]
        del stat_dict[StatType.str]

    int_value_p = stat_dict.get(StatType.intPercentage)
    luk_value_p = stat_dict.get(StatType.lukPercentage)
    dex_value_p = stat_dict.get(StatType.dexPercentage)
    str_value_p = stat_dict.get(StatType.strPercentage)
    set_values_p = {int_value_p, luk_value_p, dex_value_p, str_value_p}

    if len(set_values_p) == 1 and (set_val_p := next(iter(set_values_p))) is not None:
        stat_dict[StatType.allStatsPercentage] = set_val_p
        del stat_dict[StatType.intPercentage]
        del stat_dict[StatType.lukPercentage]
        del stat_dict[StatType.dexPercentage]
        del stat_dict[StatType.strPercentage]

def save_icon_from_node(node: Wz_Node | None, output_path: Path, loader: "WzLoader"):
    if node is None:
        LOGGER.warning(f"No node icon image to save to {output_path}")

    LOGGER.info(f"Saving icon image to {output_path}")

    def save_png(png_node: Wz_Png) -> bool:
        if png_node.Width > 1 and png_node.Height > 1:
            png_node.ExtractPng().Save(str(output_path))
            return True
        return False

    try:
        if isinstance(node.Value, Wz_Png) and save_png(node.Value):
            return

        outlink = None

        if isinstance(node.Value, Wz_Uol):
            resolved_node = Wz_NodeExtension.ResolveUol(node)
            if isinstance(resolved_node.Value, Wz_Png) and save_png(resolved_node.Value):
                return

            if out_node := resolved_node.FindNodeByPath("_outlink", True):
                outlink = out_node.Value

        else:
            if out_node := node.FindNodeByPath("_outlink", True):
                outlink = out_node.Value

        if outlink is None:
            LOGGER.warning("Node has no outlink to search for, therefore there is no icon image")
            return

        search_node = loader.find_wz(FindWzHelper(full_path=outlink))
        if search_node is not None and isinstance(search_node.Value, Wz_Png):
            if not save_png(search_node.Value):
                LOGGER.error("Could not find a valid icon image to save")
        else:
            LOGGER.error(f"Search node path {outlink} did not return an icon image to save")
    except Exception:
        LOGGER.exception("Failed to save node icon image")

def is_english(value: str) -> bool:
    return all(char in string.printable for char in value)
