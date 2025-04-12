import argparse
import json
import os.path
import re
import sys
from concurrent.futures import ThreadPoolExecutor, as_completed
from copy import deepcopy
from threading import Lock

import requests
from bs4 import BeautifulSoup

PAGES_CATEGORIES: list[tuple[str, str]] = [
    ("https://maplestory.fandom.com/wiki/Category:All_Stats_Boost_Consumables", "ConsumableCategory.allStatsBoost"),
    ("https://maplestory.fandom.com/wiki/Category:Strength_Boost_Consumables", "ConsumableCategory.strBoost"),
    ("https://maplestory.fandom.com/wiki/Category:Dexterity_Boost_Consumables", "ConsumableCategory.dexBoost"),
    ("https://maplestory.fandom.com/wiki/Category:Intelligence_Boost_Consumables", "ConsumableCategory.intBoost"),
    ("https://maplestory.fandom.com/wiki/Category:Luck_Boost_Consumables", "ConsumableCategory.lukBoost"),
    ("https://maplestory.fandom.com/wiki/Category:HP_Boost_Consumables", "ConsumableCategory.hpBoost"),
    ("https://maplestory.fandom.com/wiki/Category:MP_Boost_Consumables", "ConsumableCategory.mpBoost"),
    ("https://maplestory.fandom.com/wiki/Category:Defense_Boost_Consumables", "ConsumableCategory.defenseBoost"),
    ("https://maplestory.fandom.com/wiki/Category:Weapon_Attack_Boost_Consumables", "ConsumableCategory.attackBoost"),
    ("https://maplestory.fandom.com/wiki/Category:Magic_Attack_Boost_Consumables", "ConsumableCategory.mattackBoost"),
    ("https://maplestory.fandom.com/wiki/Category:Speed_Boost_Consumables", "ConsumableCategory.sppedBoost"),
    ("https://maplestory.fandom.com/wiki/Category:Jump_Boost_Consumables", "ConsumableCategory.jumpBoost"),
    ("https://maplestory.fandom.com/wiki/Category:Attack_Speed_Boost_Consumables", "ConsumableCategory.attackSpeedBoost"),
    ("https://maplestory.fandom.com/wiki/Category:Boss_Damage_Boost_Consumables", "ConsumableCategory.bossDamageBoost"),
    ("https://maplestory.fandom.com/wiki/Category:Critical_Rate_Boost_Consumables", "ConsumableCategory.critRateBoost"),
    ("https://maplestory.fandom.com/wiki/Category:Damage_Boost_Consumables", "ConsumableCategory.damageBoost"),
    ("https://maplestory.fandom.com/wiki/Category:Ignored_Enemy_Defense_Boost_Consumables", "ConsumableCategory.ignoreDefenseBoost"),
    ("https://maplestory.fandom.com/wiki/Category:Meso_Drop_Rate_Boost_Consumables", "ConsumableCategory.mesosObtainedBoost"),
    ("https://maplestory.fandom.com/wiki/Category:Item_Drop_Rate_Boost_Consumables", "ConsumableCategory.itemDropRateBoost"),
    ("https://maplestory.fandom.com/wiki/Category:EXP_Boost_Consumables", "ConsumableCategory.expBoost"),
]

STRING_REPLACEMENTS: list[tuple[str, str]] = [
    ("formattedName", '"formattedName"'),
    ("description", '"description"'),
    ("statValues", '"statValues"'),
    ("consumableCategories", '"consumableCategories"'),
    ("duration", '"duration"'),
    ("ConsumableCategory.alchemyPotion", '"ConsumableCategory.alchemyPotion"'),
    ("ConsumableCategory.food", '"ConsumableCategory.food"'),
    ("ConsumableCategory.potion", '"ConsumableCategory.potion"'),
    ("ConsumableCategory.allStatsBoost", '"ConsumableCategory.allStatsBoost"'),
    ("ConsumableCategory.strBoost", '"ConsumableCategory.strBoost"'),
    ("ConsumableCategory.dexBoost", '"ConsumableCategory.dexBoost"'),
    ("ConsumableCategory.intBoost", '"ConsumableCategory.intBoost"'),
    ("ConsumableCategory.lukBoost", '"ConsumableCategory.lukBoost"'),
    ("ConsumableCategory.hpBoost", '"ConsumableCategory.hpBoost"'),
    ("ConsumableCategory.mpBoost", '"ConsumableCategory.mpBoost"'),
    ("ConsumableCategory.defenseBoost", '"ConsumableCategory.defenseBoost"'),
    ("ConsumableCategory.attackBoost", '"ConsumableCategory.attackBoost"'),
    ("ConsumableCategory.mattackBoost", '"ConsumableCategory.mattackBoost"'),
    ("ConsumableCategory.sppedBoost", '"ConsumableCategory.sppedBoost"'),
    ("ConsumableCategory.jumpBoost", '"ConsumableCategory.jumpBoost"'),
    ("ConsumableCategory.attackSpeedBoost", '"ConsumableCategory.attackSpeedBoost"'),
    ("ConsumableCategory.bossDamageBoost", '"ConsumableCategory.bossDamageBoost"'),
    ("ConsumableCategory.critRateBoost", '"ConsumableCategory.critRateBoost"'),
    ("ConsumableCategory.damageBoost", '"ConsumableCategory.damageBoost"'),
    ("ConsumableCategory.ignoreDefenseBoost", '"ConsumableCategory.ignoreDefenseBoost"'),
    ("ConsumableCategory.mesosObtainedBoost", '"ConsumableCategory.mesosObtainedBoost"'),
    ("ConsumableCategory.itemDropRateBoost", '"ConsumableCategory.itemDropRateBoost"'),
    ("ConsumableCategory.expBoost", '"ConsumableCategory.expBoost"'),
    ("StatType.allStatsPercentage", '"StatType.xallStatsPercentage"'),
    ("StatType.allStats", '"StatType.allStats"'),
    ("StatType.speedJump", '"StatType.xspeedJump"'),
    ("StatType.speed", '"StatType.speed"'),
    ("StatType.jump", '"StatType.jump"'),
    ("StatType.attackMattack", '"StatType.xattackMattack"'),
    ("StatType.attackSpeed", '"StatType.xattackSpeed"'),
    ("StatType.attack", '"StatType.attack"'),
    ("StatType.mattack", '"StatType.mattack"'),
    ("StatType.str", '"StatType.str"'),
    ("StatType.dex", '"StatType.dex"'),
    ("StatType.int", '"StatType.int"'),
    ("StatType.luk", '"StatType.luk"'),
    ("StatType.defense", '"StatType.defense"'),
    ("StatType.hp", '"StatType.hp"'),
    ("StatType.mp", '"StatType.mp"'),
    ("StatType.damage", '"StatType.damage"'),
    ("StatType.bossDamage", '"StatType.bossDamage"'),
    ("StatType.ignoreDefense", '"StatType.ignoreDefense"'),
    ("StatType.critRate", '"StatType.critRate"'),
    ("StatType.expAdditional", '"StatType.expAdditional"'),
    ("StatType.mesosObtained", '"StatType.mesosObtained"'),
    ("StatType.itemDropRate", '"StatType.itemDropRate"'),
    ("StatType.expMultiplicative", '"StatType.expMultiplicative"'),
]

OLD_ENUM_STRING_REPLACEMENTS: list[tuple[str, str]] = [
    (",}", "}"),
    (",\n    }", "}"),
    (",\n  )", ""),
    (",\n      }", "}"),
]

ENUM_DICT_TEMPLATE = {
    "formattedName": "",
    "description": "",
    "statValues": {},
    "stValues": "",
    "consumableCategories": [],
    "buffSlots": [],
    "duration": 0,
}
ENUM_DEFINITIONS = {}
SORTED_ENUM_DEFINITIONS = {}
UPDATE_DICT_LOCK = Lock()


def main() -> int:
    parser = argparse.ArgumentParser(
        prog="Update Consumable ENUMs", description="Parses the old ENUM file for definitions, and then scrapes for new consumable buffs"
    )

    parser.add_argument("-i", "--input", required=True, help="Input path to the old ENUM definitions")

    args = parser.parse_args()
    if not os.path.isfile(args.input):
        return 1

    load_old_enums(args.input)
    scrape_new_enums()
    output_new_eums(args.input)
    return None


def load_old_enums(input_path: str) -> None:
    with open(input_path) as _fh:
        file_contents = _fh.read()

    top_enum_defs = file_contents.split("enum ConsumableName {")[1]
    string_enum_defs = top_enum_defs.split(";")[0].split("),")
    # Format all the old definition into dictionaries
    for enum_definition in string_enum_defs:
        enum_name, enum_contents = enum_definition.split("(", 1)
        formatted_enum_name = enum_name.strip()
        for target, replacement in STRING_REPLACEMENTS + OLD_ENUM_STRING_REPLACEMENTS:
            enum_contents = enum_contents.replace(target, replacement)

        # Handles the last enum definition that does not have a trailing comma
        enum_contents = enum_contents.strip()
        if enum_contents[-1] == ")":
            enum_contents = enum_contents[:-1]

        try:
            loaded_enum_dict = json.loads(f"{{{enum_contents}}}")
        except Exception:
            raise

        if not isinstance(loaded_enum_dict["consumableCategories"], list):
            loaded_enum_dict["consumableCategories"] = []

        if not isinstance(loaded_enum_dict["consumableCategories"], list):
            loaded_enum_dict["consumableCategories"] = []

        ENUM_DEFINITIONS[formatted_enum_name] = loaded_enum_dict


def scrape_new_enums():
    futures = []
    with ThreadPoolExecutor(max_workers=5) as pool:
        for main_page_url, enum_category in PAGES_CATEGORIES:
            futures.append(pool.submit(_scrape_enum_page, main_page_url, enum_category))

    for future in as_completed(futures):
        future.result()  # Allows us to get any exceptions that may have been raised

    pool.shutdown()

    for enum_name, enum_dict in ENUM_DEFINITIONS.items():
        if enum_name not in SORTED_ENUM_DEFINITIONS:
            SORTED_ENUM_DEFINITIONS[enum_name] = enum_dict


def _scrape_enum_page(main_page_url: str, enum_category: str):
    local_enum_definitions = {}
    page = requests.get(main_page_url)

    main_page = BeautifulSoup(page.content, "html.parser")

    target_link_elements = main_page.find_all(class_="category-page__member-link")

    for _link_no, target_link_element in enumerate(target_link_elements, start=1):
        if "transformation" in target_link_element.text.lower():
            continue

        _scrape_subpage(target_link_element, local_enum_definitions, enum_category)

    with UPDATE_DICT_LOCK:
        for enum_name, enum_dict in local_enum_definitions.items():
            if enum_name not in SORTED_ENUM_DEFINITIONS:
                SORTED_ENUM_DEFINITIONS[enum_name] = enum_dict


def _scrape_subpage(target_link_element, local_enum_definitions: dict, enum_category: str) -> None:
    try:
        subpage_name = f"https://maplestory.fandom.com{target_link_element.attrs.get('href')}"
        sub_page_data = requests.get(subpage_name)
        sub_page = BeautifulSoup(sub_page_data.content, "html.parser")

        sub_page_target_search = sub_page.find("div", class_="mw-parser-output")

        for table_element in sub_page_target_search.find_all("tbody"):
            real_name = ""
            description = ""
            stat_effects = ""

            for index, next_element in enumerate(table_element.find_all("tr"), start=1):
                if index == 1:
                    if "recipe" in next_element.text.lower():
                        return
                    real_name = next_element.text.strip()
                elif "Description" in next_element.text:
                    description = next_element.text.strip().replace("Description\n\n", "")
                elif "Effects" in next_element.text:
                    stat_effects = next_element.text.strip().replace("Effects\n\n", "")
                elif index > 7:
                    break

            enum_name_parts = (
                real_name.replace("'", "").replace("&", "").replace("(", "").replace(")", "").replace(".", "").replace("%", "").replace("-", "").split(" ")
            )
            enum_name_parts[0] = enum_name_parts[0].lower()
            formatted_enum_name = "".join(enum_name_parts)
            if not formatted_enum_name or formatted_enum_name == "items" or "Growth" in formatted_enum_name:
                continue
            if formatted_enum_name[0].isdigit():
                formatted_enum_name = f"x{formatted_enum_name}"

            with UPDATE_DICT_LOCK:
                if formatted_enum_name not in ENUM_DEFINITIONS:
                    template = deepcopy(ENUM_DICT_TEMPLATE)
                    template["duration"] = handle_duration(stat_effects)
                    template["description"] = description
                    template["formattedName"] = real_name
                    template["stValues"] = stat_effects
                    template["consumableCategories"].append(enum_category)
                    handle_stat_effects(stat_effects, template, subpage_name)
                    ENUM_DEFINITIONS[formatted_enum_name] = template
                    local_enum_definitions[formatted_enum_name] = template
                else:
                    enum_dict = ENUM_DEFINITIONS[formatted_enum_name]
                    handle_stat_effects(stat_effects, enum_dict, subpage_name)
                    if enum_category not in enum_dict["consumableCategories"]:
                        enum_dict["consumableCategories"].append(enum_category)
                    local_enum_definitions[formatted_enum_name] = enum_dict
    except Exception:
        raise


DURATION_REGEX = re.compile(r"for \d* (seconds|minutes|hours|minute|second)")


def handle_duration(stat_effects_string: str) -> int:
    match = DURATION_REGEX.search(stat_effects_string)
    if not match:
        return 0
    duration = int(match.group().split(" ")[1])
    if "minutes" in match.group() or "minute" in match.group():
        return duration * 60
    if "seconds" in match.group() or "second" in match.group():
        return duration
    if "hours" in match.group() or "hour" in match.group():
        return duration * 3600
    return duration


STAT_REGEX_DICT = {
    "StatType.xallStatsPercentage": re.compile(r"All Stats: ([+|-]\d+)+%"),
    "StatType.allStats": re.compile(r"All Stats: ([+|-]\d+)(?!%)"),
    "StatType.speed": re.compile(r"Speed: ([+|-]\d+)(?!%)"),
    "StatType.jump": re.compile(r"Jump: ([+|-]\d+)(?!%)"),
    "StatType.str": re.compile(r"STR: ([+|-]\d+)(?!%)"),
    "StatType.dex": re.compile(r"DEX: ([+|-]\d+)(?!%)"),
    "StatType.int": re.compile(r"INT: ([+|-]\d+)(?!%)"),
    "StatType.luk": re.compile(r"LUK: ([+|-]\d+)(?!%)"),
    "StatType.defense": re.compile(r"DEF: ([+|-]\d+)(?!%)"),
    "StatType.hp": re.compile(r"Max HP: ([+|-]\d+)(?!%)"),
    "StatType.mp": re.compile(r"Max MP: ([+|-]\d+)(?!%)"),
    "StatType.attack": re.compile(r"Weapon Attack: ([+|-]\d+)(?!%)"),
    "StatType.mattack": re.compile(r"Magic Attack: ([+|-]\d+)(?!%)"),
    "StatType.critRate": re.compile(r"Critical Rate: ([+|-]\d+)%"),
    "StatType.bossDamage": re.compile(r"Boss Damage: ([+|-]\d+)%"),
    "StatType.damage": re.compile(r"(?<!Boss )Damage: ([+|-]\d+)%"),
    "StatType.ignoreDefense": re.compile(r"Ignored Enemy Defense: ([+|-]\d+)%"),
    "StatType.expAdditional": re.compile(r"EXP: ([+|-]\d+)%"),
}

PERCENTAGE_HANDLING = (
    "StatType.xallStatsPercentage",
    "StatType.critRate",
    "StatType.bossDamage",
    "StatType.damage",
    "StatType.ignoreDefense",
    "StatType.expAdditional",
)


def handle_stat_effects(stat_effects_string: str, target_enum_definition: dict, subpage_name: str):
    stat_effects_string = stat_effects_string.replace(",", "")
    for stat_type, stat_regex in STAT_REGEX_DICT.items():
        match = stat_regex.search(stat_effects_string)
        if not match:
            continue

        value = int(match.group(1)) / 100 if stat_type in PERCENTAGE_HANDLING else int(match.group(1))

        if subpage_name == "https://maplestory.fandom.com/wiki/EXP_Coupon" and "Legion" not in target_enum_definition["formattedName"]:
            stat_type = "StatType.expMultiplicative"

        target_enum_definition["statValues"].update({stat_type: value})


def output_new_eums(input_path: str) -> None:
    dirname = os.path.dirname(input_path)
    with open(os.path.join(dirname, "updated_enums"), "w") as _fh:
        all_defs = []
        for enum_name, enum_definition in SORTED_ENUM_DEFINITIONS.items():
            json_definition = json.dumps(enum_definition, indent=4)
            true_definition = f"    {enum_name}({json_definition[1:-1]}   )"
            for replacement, target in STRING_REPLACEMENTS:
                true_definition = true_definition.replace(target, replacement)

            all_defs.append(true_definition)

        _fh.write(",\n".join(all_defs))


if __name__ == "__main__":
    sys.exit(main())
