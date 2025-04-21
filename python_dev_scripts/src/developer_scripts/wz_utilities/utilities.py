import logging

from developer_scripts.conversion.maplestory_builder_stat_enums import StatType
from developer_scripts.wz_utilities import GearPropType, Wz_Type
from developer_scripts.wz_utilities.equipment.potential import PotentialWrapper

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
