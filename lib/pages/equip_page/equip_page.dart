import 'package:flutter/material.dart';
import 'package:maplestory_builder/core/constants.dart';
import 'package:maplestory_builder/core/items/equips.dart';



class SearchableListView extends StatefulWidget {
  const SearchableListView({Key? key, required this.listItems}) : super(key: key);
  final List<Equip> listItems;

  @override
  State<SearchableListView> createState() => _SearchableListViewState();
}

class _SearchableListViewState extends State<SearchableListView> {
  TextEditingController editingController = TextEditingController();
  var items = <Equip>[];
  var stringQuery = '';
  final ValueNotifier<EquipType> selectedEquipType = ValueNotifier<EquipType>(EquipType.all);

  @override
  void initState() {
    items = widget.listItems;
    selectedEquipType.addListener(filterSearchResultsEquip);
    stringQuery = '';
    super.initState();
  }

  void filterSearchResultsEquip() {
    setState(() {
      var tempItems = selectedEquipType.value == EquipType.all ? widget.listItems : widget.listItems.where((element) => 
        selectedEquipType.value == EquipType.all ? true : element.equipType == selectedEquipType.value
      ).toList();
      items = stringQuery.isEmpty ? tempItems : tempItems.where((element) => 
        element.name.toLowerCase().contains(stringQuery.toLowerCase())
      ).toList();
    });
  }

  void filterSearchResultsText(String query) {
    setState(() {
      stringQuery = query;
      var tempItems = selectedEquipType.value == EquipType.all ? widget.listItems : widget.listItems.where((element) => 
        selectedEquipType.value == EquipType.all ? true : element.equipType == selectedEquipType.value
      ).toList();
      items = stringQuery.isEmpty ? tempItems : tempItems.where((element) => 
        element.name.toLowerCase().contains(stringQuery.toLowerCase())
      ).toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Row(
          children: [
            Expanded(
              child: TextField(
                onChanged: (value) {
                  filterSearchResultsText(value);
                },
                controller: editingController,
                decoration: const InputDecoration(
                  labelText: "Search",
                  hintText: "Search",
                  prefixIcon: Icon(Icons.search),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(25.0))
                  )
                ),
              ),
            ),
            DropDownSelector(
              selectedValue: selectedEquipType,
              menuItems: EquipType.values.map((equipType) {
                return DropdownMenuItem(
                  value: equipType,
                  child: Text(equipType.name),
                );
              }).toList(),
            )
          ]
        ),
        Expanded(
          child: ListView.builder(
            itemCount: items.length,
            itemBuilder: (context, index) {
              return ExpansionTile(
                  title: Text(items[index].name),
                  children: [items[index].createEquipContainer()],
                );
            },
          ),
        ),
      ],
    );
  }
}

class DropDownSelector extends StatelessWidget {
  final ValueNotifier<EquipType> selectedValue;
  final List<DropdownMenuItem> menuItems;

  const DropDownSelector({
    super.key, 
    required this.selectedValue,
    required this.menuItems
  });

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: selectedValue,
      builder: (context, v, _) {
        return DropdownButton(
          value: v,
          onChanged: (newValue) {
            if (newValue != null) {
              selectedValue.value = newValue;
            }
          },
          items: menuItems,
        );
      }
    );
  }
}
