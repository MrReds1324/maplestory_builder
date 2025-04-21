from developer_scripts.wz_utilities import SetItemIDList
from developer_scripts.wz_utilities.equipment.set_item_id_part import SetItemPartWrapper


class SetItemIDListWrapper:
    def __init__(self, set_item_id_list: SetItemIDList):
        self.set_item_id_list: SetItemIDList = set_item_id_list

    @property
    def parts(self) -> list[tuple[int, SetItemPartWrapper]]:
        return [(item.Key, SetItemPartWrapper(item.Value)) for item in self.set_item_id_list.Parts]

    def __str__(self):
        return str(self.parts)

    def __repr__(self):
        return str(self.parts)
