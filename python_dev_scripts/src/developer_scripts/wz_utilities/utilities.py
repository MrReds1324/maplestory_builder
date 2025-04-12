from developer_scripts.wz_utilities import Wz_Type


def wz_type_parse(string: str) -> Wz_Type:
    if "." in string:
        string = string.split(".")[0]
    return getattr(Wz_Type, string)
