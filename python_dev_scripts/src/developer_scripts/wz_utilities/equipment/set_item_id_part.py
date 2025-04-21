from developer_scripts.wz_utilities import SetItemIDPart


class SetItemPartWrapper:
    def __init__(self, set_item_id_part: SetItemIDPart):
        self.set_item_id_part: SetItemIDPart = set_item_id_part

    @property
    def item_ids(self) -> dict[int, bool]:
        return dict(self.set_item_id_part.ItemIDs)

    @property
    def represent_name(self) -> str:
        return self.set_item_id_part.RepresentName

    @property
    def type_name(self) -> str:
        return self.set_item_id_part.TypeName

    def __str__(self):
        return str(self.item_ids)

    def __repr__(self):
        return str(self.item_ids)
