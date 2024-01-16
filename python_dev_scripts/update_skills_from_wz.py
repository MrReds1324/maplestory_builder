import re

from wz_utilities.wz_finder import FindWzHelper
from wz_utilities.wz_loader import WzLoader
from wz_utilities import Wz_Type, Wz_Image

JOB_IDS_TO_NAME: dict[str, str] = {}




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
        JOB_IDS_TO_NAME[job_id] = str_result.all_values.get('bookName')
    else:
        JOB_IDS_TO_NAME[job_id] = None

    skill_list_node = img.Node.FindNodeByPath("skill")
    if skill_list_node is None or skill_list_node.Nodes.Count == 0:
        continue

    for skill_node in skill_list_node.Nodes:
       ...
    ...
    ...
