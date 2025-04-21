from developer_scripts.wz_utilities import Potential


class PotentialWrapper:
    def __init__(self, potential: Potential):
        self.potential = potential

    @property
    def code(self) -> int:
        return self.potential.code

    @property
    def option_type(self) -> int:
        return self.potential.optionType

    @property
    def required_level(self) -> int:
        return self.potential.reqLevel

    @property
    def weight(self) -> int:
        return self.potential.weight

    @property
    def string_summary(self) -> str:
        return self.potential.stringSummary

    @property
    def is_potential_ex(self):
        return self.potential.IsPotentialEx

    @property
    def props(self) -> dict:
        return dict(self.potential.props)
