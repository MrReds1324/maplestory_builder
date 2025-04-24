import argparse
import json
import logging
import sys
from pathlib import Path

from developer_scripts.wz_utilities import Wz_Type
from developer_scripts.wz_utilities.consumable.consumable import Consumable
from developer_scripts.wz_utilities.consumable.prop_type import ConsPropType
from developer_scripts.wz_utilities.utilities import is_english
from developer_scripts.wz_utilities.wz_finder import FindWzHelper
from developer_scripts.wz_utilities.wz_loader import WzLoader

logging.basicConfig(stream=sys.stdout, format="%(asctime)s - %(levelname)s: %(message)s", level=logging.INFO)
LOGGER = logging.getLogger()

LOADER: WzLoader = None

loaded_consumables = {}


def load_consumables():
    string_wz = LOADER.find_wz(FindWzHelper(Wz_Type.String))
    if string_wz is None:
        return

    consumable_string_wz = string_wz.FindNodeByPath("Consume.img", True)
    if consumable_string_wz is None:
        return

    item_wz = LOADER.find_wz(FindWzHelper(Wz_Type.Item))
    if item_wz is None:
        return

    consumable_node = item_wz.FindNodeByPath("Consume", False)
    if consumable_node is None:
        return

    for top_node in consumable_node.Nodes:
        # _Canvas contains just the ui elements, 238 is for old familiar book cards
        if top_node.Text in ("_Canvas", "238.img"):
            continue

        try:
            for consumable_sub_node in consumable_node.FindNodeByPath(top_node.Text, True).Nodes:
                loaded_consumables[consumable_sub_node.Text] = Consumable(consumable_sub_node, consumable_string_wz)
        except Exception:  # noqa: PERF203
            LOGGER.exception("Something went wrong trying to load consumable img")


def dump_consumables_to_file(output_stats: Path, output_images: Path):
    filtered_consumables = {}
    familiar_buffs = {}
    scrolls = {}

    for cons_id, consumable in loaded_consumables.items():
        if "Familiar Skill" in (consumable.name or ""):
            familiar_buffs[cons_id] = consumable

        elif "Scroll" in (consumable.name or ""):
            scrolls[cons_id] = consumable

        elif not consumable.effects or not consumable.name or not is_english(consumable.name):
            continue

        else:
            # These are the ones we want to skip
            if ((len(consumable.effects) == 1 and (
                    ConsPropType.duration in consumable.effects or
                    ConsPropType.duration2 in consumable.effects or
                    ConsPropType.end_use_date in consumable.effects
            ))
                or ConsPropType.inflation in consumable.effects
                or ConsPropType.expire_time in consumable.effects
            ):
                continue

            # This is related to pq, specifically only filtering these ones out incase we encounter this
            # type again
            if ConsPropType.skill_id in consumable.effects and "Eye" in consumable.name:
                continue

            # There are some exp buffs that only apply to certain level ranges, or give a random exp buff
            # Doesnt seem worth it to try and include them currently
            if (ConsPropType.min_time in consumable.effects or
                    ConsPropType.max_time in consumable.effects or
                    ConsPropType.exp_level_limit in consumable.effects or
                    ConsPropType.exp_under_level_limit in consumable.effects
            ):
                continue

            filtered_consumables[cons_id] = consumable

    LOGGER.info(f"FILTERED TO {len(filtered_consumables)} TOTAL CONSUMABLES")

    consumable_stats = {}
    for consumable_id, consumable in filtered_consumables.items():
        consumable_stats[consumable_id] = consumable.to_dict_format()

        consumable.save_icon(output_images / f"{consumable_id}.png", LOADER)

    output_stats_path = output_stats / "consumables.json"
    LOGGER.info(f"Writing Consumable Stats to {output_stats_path}")

    with output_stats_path.open("w") as _fh:
        json.dump(consumable_stats, _fh, indent=4)

def main() -> int:
    parser = argparse.ArgumentParser(description="Parse the WZ files")
    parser.add_argument("-i", "--input", required=True, type=Path, help="Path to Base.wz")
    parser.add_argument("-os", "--output-stats", required=True, type=Path, help="Path to the output directory for consumable stats")
    parser.add_argument("-oi", "--output-images", required=True, type=Path, help="Path to the output directory for consumable images/icons")
    parser.add_argument("-d", "--debug", action="store_true", help="Run with debug log messages")

    args = parser.parse_args()
    if not args.input.exists():
        LOGGER.error(f"Input path to Base.wz {args.input} does not exist")
        return -1

    if args.output_stats.exists() and not args.output_stats.is_dir():
        LOGGER.error(f"{args.output_stats} is not a directory")
        return -1
    args.output_stats.mkdir(parents=True, exist_ok=True)

    if args.output_images.exists() and not args.output_images.is_dir():
        LOGGER.error(f"{args.output_images} is not a directory")
        return -1
    args.output_images.mkdir(parents=True, exist_ok=True)

    if args.debug:
        LOGGER.setLevel(logging.DEBUG)

    LOGGER.info("LOADING WZ FILES")

    global LOADER  # noqa: PLW0603
    LOADER = WzLoader(str(args.input))

    load_consumables()

    LOGGER.info(f"LOADED {len(loaded_consumables)} FAMILIAR BADGES")

    dump_consumables_to_file(args.output_stats, args.output_images)

    return 0


if __name__ == "__main__":
    sys.exit(main())
