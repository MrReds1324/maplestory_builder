from developer_scripts.wz_utilities import SetItem
from developer_scripts.wz_utilities.items.set_item_effect import SetItemEffectWrapper
from developer_scripts.wz_utilities.items.set_item_id_list import SetItemIDListWrapper


class SetItemWrapper:
    def __init__(self, set_item: SetItem):
        self.set_item: SetItem = set_item

    @property
    def set_item_id(self) -> int:
        return self.set_item.SetItemID

    @property
    def complete_count(self) -> int:
        return self.set_item.CompleteCount

    @property
    def parts(self) -> bool:
        return self.set_item.Parts

    @property
    def expand_tool_tip(self) -> bool:
        return self.set_item.ExpandToolTip

    @property
    def item_ids(self) -> SetItemIDListWrapper:
        return SetItemIDListWrapper(self.set_item.ItemIDs)

    @property
    def set_item_name(self) -> str:
        return self.set_item.SetItemName

    @property
    def effects(self) -> dict[int, SetItemEffectWrapper]:
        return {k: SetItemEffectWrapper(v) for k, v in dict(self.set_item.Effects).items()}

    def __str__(self) -> str:
        return self.set_item_name

    def __repr__(self) -> str:
        return self.set_item_name
