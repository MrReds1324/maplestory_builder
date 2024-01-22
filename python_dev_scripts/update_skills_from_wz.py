import json
import re
from typing import Optional

from wz_utilities import Wz_Type, Wz_Image, SummaryParams, SummaryParser
from wz_utilities.wz_finder import FindWzHelper
from wz_utilities.wz_loader import WzLoader
from wz_utilities.wz_skill import SkillWrapper

JOB_IDS_TO_NAME: dict[str, str] = {}
PROCESSED_SKILLS: dict[str, SkillWrapper] = {}
SKILL_BY_TYPE: dict[int, dict[str, list[int]]] = {}
ALL_SKILLS_BY_ID: dict[int, SkillWrapper] = {}
ALL_COMMON_ATTRS: set[str] = set()
SKILLS_WITH_PSD: set[str] = set()
SKILLS_WITH_PSD_SKILL: dict[str, list[str]] = {}
SKILLS_WITH_PSD_SKILL_SET: set[int] = set()

wz_file_path = r'C:\Nexon\Library\maplestory\appdata\Data\Base\Base.wz'
loader = WzLoader(wz_file_path)

finder_helper = FindWzHelper(Wz_Type.Skill)
skill_wz = loader.find_wz(finder_helper)

search_regex = re.compile(r"^(\d+)\.img")

for node in skill_wz.Nodes:
    match = search_regex.match(node.Text)
    if not match:
        continue

    img = node.GetValue[Wz_Image](None)
    if img is not None:
        did_extract = img.TryExtract()
        if not did_extract:
            continue

    job_id = match.group(1)

    str_result = loader.string_linker.string_skill2.get(job_id)
    if str_result:
        JOB_IDS_TO_NAME[job_id] = str_result['bookName']
    else:
        JOB_IDS_TO_NAME[job_id] = None

    skill_list_node = img.Node.FindNodeByPath("skill")
    if skill_list_node is None or skill_list_node.Nodes.Count == 0:
        continue

    for skill_node in skill_list_node.Nodes:
        skill_wrapper = SkillWrapper.create_from_node(skill_node)
        if skill_wrapper is None:
            continue

        skill_id = skill_node.Text
        str_result = loader.string_linker.string_skill2.get(skill_id)
        if str_result:
            skill_wrapper.skill_name = str_result.Name
        else:
            skill_wrapper.skill_name = "!UNKNOWN!"

        for i in range(1, skill_wrapper.max_level + (2 if skill_wrapper.combat_orders_applies else 0) + 1):
            skill_wrapper.level = i
            try:
                level_desc = SummaryParser.GetSkillSummary(skill_wrapper.skill, str_result, SummaryParams.Default)
            except Exception as e:
                level_desc = f"!ERROR: {e}!"

            skill_wrapper.level_descriptions[skill_wrapper.level] = level_desc

        ALL_SKILLS_BY_ID[skill_wrapper.skill_id] = skill_wrapper

        ALL_COMMON_ATTRS.update(skill_wrapper.additional_modifiers.keys())

        skill_type: Optional[int] = skill_wrapper.additional_modifiers.get("type")
        if skill_type is not None:
            skill_type = int(skill_type)
            if skill_type not in SKILL_BY_TYPE:
                SKILL_BY_TYPE[skill_type][skill_wrapper.skill_name] = [skill_wrapper.skill_id]
            elif skill_wrapper.skill_name not in SKILL_BY_TYPE[skill_type]:
                SKILL_BY_TYPE[skill_type][skill_wrapper.skill_name] = [skill_wrapper.skill_id]
            else:
                SKILL_BY_TYPE[skill_type][skill_wrapper.skill_name].append(skill_wrapper.skill_id)

        if skill_wrapper.is_psd:
            SKILLS_WITH_PSD.add(str(skill_wrapper))

        if skill_wrapper.psd_skills:
            SKILLS_WITH_PSD_SKILL_SET.add(skill_wrapper.skill_id)

for skill_wrapper_id in SKILLS_WITH_PSD_SKILL_SET:
    skill_wrapper = ALL_SKILLS_BY_ID.get(skill_wrapper_id)
    if skill_wrapper is None:
        print(f"Unable to resolve skill for skill id: {skill_wrapper_id}")
        continue

    skill_wrapper_key = str(skill_wrapper)
    if skill_wrapper_key not in SKILLS_WITH_PSD_SKILL:
        SKILLS_WITH_PSD_SKILL[skill_wrapper_key] = []

    for psd_skill in skill_wrapper.psd_skills:
        resolved_skill = ALL_SKILLS_BY_ID.get(psd_skill)
        if resolved_skill is None:
            print(f"Unable to resolve psd skill for skill id: {skill_wrapper_id}")
            continue
        SKILLS_WITH_PSD_SKILL[skill_wrapper_key].append(str(resolved_skill))


with open("type_output.json", "w+") as _fh:
    json.dump(SKILL_BY_TYPE, _fh, indent=4)

with open("common_attrs.json", "w+") as _fh:
    json.dump(list(ALL_COMMON_ATTRS), _fh, indent=4)

with open("skills_with_psd.json", "w+") as _fh:
    json.dump(list(SKILLS_WITH_PSD), _fh, indent=4)

with open("skills_with_psd_skills.json", "w+") as _fh:
    json.dump(SKILLS_WITH_PSD, _fh, indent=4)
