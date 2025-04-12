from developer_scripts.wz_utilities import SetItem, Wz_Type
from developer_scripts.wz_utilities.items.set_item import SetItemWrapper
from developer_scripts.wz_utilities.wz_finder import FindWzHelper
from developer_scripts.wz_utilities.wz_loader import WzLoader

wz_file_path = r"E:\Video Games\Nexon\Library\maplestory\appdata\Data\Base\Base.wz"
loader = WzLoader(wz_file_path)

loaded_set_items = {}


def load_item_sets():
    etc_wz = loader.find_wz(FindWzHelper(Wz_Type.Etc))

    set_item_node = etc_wz.FindNodeByPath("SetItemInfo.img", True)
    if set_item_node is None:
        return

    item_wz = loader.find_wz(FindWzHelper(Wz_Type.Item))
    if item_wz is None:
        return

    option_node = item_wz.FindNodeByPath("ItemOption.img", True)
    if option_node is None:
        return

    for node in set_item_node.Nodes:
        try:
            if set_item_index := int(node.Text):
                set_item = SetItem.CreateFromNode(node, option_node)
                if set_item is not None:
                    loaded_set_items[set_item_index] = SetItemWrapper(set_item)
        except Exception:
            ...
def write_item_sets_to_file():
    target_item_set = loaded_set_items.get(677)

load_item_sets()
...