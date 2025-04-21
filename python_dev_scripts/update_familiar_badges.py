import json
import logging
import sys

from developer_scripts.wz_utilities import SetItem, Wz_Type
from developer_scripts.wz_utilities.familiars.familiar_badge import FamiliarBadge
from developer_scripts.wz_utilities.wz_finder import FindWzHelper
from developer_scripts.wz_utilities.wz_loader import WzLoader

logging.basicConfig(stream=sys.stdout)
LOGGER = logging.getLogger()
LOGGER.setLevel(logging.DEBUG)

wz_file_path = r"E:\Video Games\Nexon\Library\maplestory\appdata\Data\Base\Base.wz"
loader = WzLoader(wz_file_path)

loaded_familiar_badges = {}


def load_familiar_badges():
    etc_wz = loader.find_wz(FindWzHelper(Wz_Type.Etc))

    familiar_badge_node = etc_wz.FindNodeByPath("FamiliarSet.img", True)
    if familiar_badge_node is None:
        return

    item_wz = loader.find_wz(FindWzHelper(Wz_Type.Item))
    if item_wz is None:
        return

    option_node = item_wz.FindNodeByPath("ItemOption.img", True)
    if option_node is None:
        return

    for node in familiar_badge_node.Nodes:
        try:
            if familiar_badge_index := int(node.Text):
                loaded_familiar_badges[familiar_badge_index] = FamiliarBadge(node, option_node)
        except Exception:  # noqa: PERF203
            LOGGER.exception("Something went wrong trying to load familiar badge")


def dump_familiar_badges_to_file():
    results = {}
    for badge_idx, badge in loaded_familiar_badges.items():
        results[badge_idx] = badge.to_dict_format()

    with open("badge_stats", "w") as _fh:
        json.dump(results, _fh, indent=4)

load_familiar_badges()

LOGGER.info(f"LOADED {len(loaded_familiar_badges)} FAMILIAR BADGES")

dump_familiar_badges_to_file()
...