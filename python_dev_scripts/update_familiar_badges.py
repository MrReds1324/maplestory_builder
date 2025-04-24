import argparse
import json
import logging
import sys
from pathlib import Path

from developer_scripts.wz_utilities import SetItem, Wz_Type
from developer_scripts.wz_utilities.familiars.familiar_badge import FamiliarBadge
from developer_scripts.wz_utilities.wz_finder import FindWzHelper
from developer_scripts.wz_utilities.wz_loader import WzLoader

logging.basicConfig(stream=sys.stdout, format="%(asctime)s - %(levelname)s: %(message)s", level=logging.INFO)
LOGGER = logging.getLogger()

LOADER: WzLoader = None

loaded_familiar_badges = {}


def load_familiar_badges():
    etc_wz = LOADER.find_wz(FindWzHelper(Wz_Type.Etc))

    familiar_badge_node = etc_wz.FindNodeByPath("FamiliarSet.img", True)
    if familiar_badge_node is None:
        return

    item_wz = LOADER.find_wz(FindWzHelper(Wz_Type.Item))
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


def dump_familiar_badges_to_file(output_stats: Path, output_images: Path):
    results = {}

    for badge_idx, badge in loaded_familiar_badges.items():
        results[badge_idx] = badge.to_dict_format()

        badge.save_icon(badge_idx, output_images, LOADER)

    output_stats_path = output_stats / "familiar_badges.json"
    LOGGER.info(f"Writing Badge Stats to {output_stats_path}")

    with output_stats_path.open("w") as _fh:
        json.dump(results, _fh, indent=4)


def main() -> int:
    parser = argparse.ArgumentParser(description="Parse the WZ files")
    parser.add_argument("-i", "--input", required=True, type=Path, help="Path to Base.wz")
    parser.add_argument("-os", "--output-stats", required=True, type=Path, help="Path to the output directory for badge stats")
    parser.add_argument("-oi", "--output-images", required=True, type=Path, help="Path to the output directory for badge images/icons")
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

    load_familiar_badges()

    LOGGER.info(f"LOADED {len(loaded_familiar_badges)} FAMILIAR BADGES")

    dump_familiar_badges_to_file(args.output_stats, args.output_images)

    return 0


if __name__ == "__main__":
    sys.exit(main())
