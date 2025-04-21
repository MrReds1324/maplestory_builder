from developer_scripts.wz_utilities import GearPropType, SetItemEffect
from developer_scripts.wz_utilities.equipment.potential import PotentialWrapper


class SetItemEffectWrapper:
    def __init__(self, set_item_effect: SetItemEffect):
        self.set_item_effect: SetItemEffect = set_item_effect

    @property
    def props(self) -> dict:
        return {k: self.__gear_prop_helper(k, v) for k, v in dict(self.set_item_effect.Props).items()}

    @staticmethod
    def __gear_prop_helper(key, value):
        if key == GearPropType.Option:
            return [PotentialWrapper(x) for x in list(value)]
        return value

    def __str__(self) -> str:
        return str(self.props)

    def __repr__(self) -> str:
        return str(self.props)
