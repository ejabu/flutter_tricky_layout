import 'package:flutter/material.dart';

class DropDown extends StatefulWidget {
  DropDown() : super();

  final String title = "DropDown Demo";

  @override
  DropDownState createState() => DropDownState();
}

class Province {
  int id;
  String name;

  Province(this.id, this.name);

  static List<Province> getProvinceList() {
    return <Province>[
      Province(1, 'Central Java'),
      Province(2, 'East kalimantan'),
      Province(3, 'East java'),
      Province(4, 'Bali'),
      Province(5, 'Borneo'),
    ];
  }
}

class District {
  int id;
  String name;

  District(this.id, this.name);

  static List<District> getDistrictList() {
    return <District>[
      District(1, 'Demak'),
      District(2, 'Solo'),
      District(3, 'Sidoarjo'),
      District(4, 'Bandung'),
    ];
  }
}

class DropDownState extends State<DropDown> {

  String finalUrl = '';

  List<Province> _provinces = Province.getProvinceList();
  List<DropdownMenuItem<Province>> _dropdownMenuItems;
  Province _selectedProvince;

  List<District> _disctricts = District.getDistrictList();
  List<DropdownMenuItem<District>> _dropdownMenuDistricts;
  District _selectedDistrict;

  @override
  void initState() {
    _dropdownMenuItems = buildDropdownMenuItems(_provinces);
    _dropdownMenuDistricts = buildDropdownDistricts(_disctricts);
    _selectedProvince = _dropdownMenuItems[0].value;
    _selectedDistrict = _dropdownMenuDistricts[0].value;
    super.initState();
  }

// here the url i wish can dynamicly edit by user input
//  final String url = 'https://onobang.com/flutter/index.php?'+'province=' + _selectedProvince.name+'district'some.district;
  List<DropdownMenuItem<Province>> buildDropdownMenuItems(List provinceses) {
    List<DropdownMenuItem<Province>> items = List();
    for (var province in provinceses) {
      items.add(
        DropdownMenuItem(
          value: province,
          child: Text(province.name),
        ),
      );
    }
    return items;
  }
  List<DropdownMenuItem<District>> buildDropdownDistricts(List<District> districts) {
    List<DropdownMenuItem<District>> items = List();
    for (var district in districts) {
      items.add(
        DropdownMenuItem(
          value: district,
          child: Text(district.name),
        ),
      );
    }
    return items;
  }

  onChangeDropdownItem(Province newProvince) {
    final String url = 'https://onobang.com/flutter/index.php?province=${newProvince.name}&district=${_selectedDistrict.name}';
    setState(() {
      _selectedProvince = newProvince;
      finalUrl = url;
    });
  }
  onChangeDistrict(District newDistrict) {
    final String url = 'https://onobang.com/flutter/index.php?province=${_selectedProvince.name}&district=${newDistrict.name}';
    setState(() {
      _selectedDistrict = newDistrict;
      finalUrl = url;
    });
  }

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      debugShowCheckedModeBanner: false,
      home: new Scaffold(
        appBar: new AppBar(
          title: new Text("DropDown Button Example"),
        ),
        body: new Container(
          child: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text("Select a province"),
                SizedBox(
                  height: 20.0,
                ),
                DropdownButton(
                  value: _selectedProvince,
                  items: _dropdownMenuItems,
                  onChanged: onChangeDropdownItem,
                ),
                SizedBox(
                  height: 20.0,
                ),
                Text('Selected: ${_selectedProvince.name}'),

                SizedBox(
                  height: 20.0,
                ),
                Text("Select a district"),
                SizedBox(
                  height: 20.0,
                ),
                DropdownButton(
                  value: _selectedDistrict,
                  items: _dropdownMenuDistricts,
                  onChanged: onChangeDistrict,
                ),
                SizedBox(
                  height: 20.0,
                ),
                Text('Selected: ${_selectedDistrict.name}'),
                SizedBox(
                  height: 30.0,
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text('$finalUrl'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
