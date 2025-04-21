from developer_scripts.wz_utilities import Wz_Type
from developer_scripts.wz_utilities.consumable.consumable import Consumable
from developer_scripts.wz_utilities.consumable.prop_type import ConsPropType
from developer_scripts.wz_utilities.wz_finder import FindWzHelper
from developer_scripts.wz_utilities.wz_loader import WzLoader

wz_file_path = r"E:\Video Games\Nexon\Library\maplestory\appdata\Data\Base\Base.wz"
loader = WzLoader(wz_file_path)

loaded_consumables = {}


def load_consumables():
    string_wz = loader.find_wz(FindWzHelper(Wz_Type.String))
    if string_wz is None:
        return

    consumable_string_wz = string_wz.FindNodeByPath("Consume.img", True)
    if consumable_string_wz is None:
        return

    item_wz = loader.find_wz(FindWzHelper(Wz_Type.Item))
    if item_wz is None:
        return

    consumable_node = item_wz.FindNodeByPath("Consume", False)
    if consumable_node is None:
        return

    for top_node in consumable_node.Nodes:
        try:
            for consumable_sub_node in consumable_node.FindNodeByPath(top_node.Text, True).Nodes:
                try:
                    loaded_consumables[consumable_sub_node.Text] = Consumable(consumable_sub_node, consumable_string_wz)
                except Exception as e:
                    print(e)
        except Exception as e:
            print(e)

def write_consumables_to_file():
    filtered_consumables = {}
    familiar_buffs = {}

    for cons_id, consumable in loaded_consumables.items():
        if "Familiar Skill" in (consumable.name or ""):
            familiar_buffs[cons_id] = consumable
        elif consumable.effects:
            if len(consumable.effects) == 1 and (ConsPropType.duration in consumable.effects or ConsPropType.duration2 in consumable.effects):
                continue
            filtered_consumables[cons_id] = consumable
    ...

load_consumables()
write_consumables_to_file()
...