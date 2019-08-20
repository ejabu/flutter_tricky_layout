import 'package:flutter/material.dart';

List<Map> regions = [
  {
    "region_id": 4,
    "name": {"ar": "حائل", "en": "Hail"}
  },
  {
    "region_id": 5,
    "name": {"ar": "القصيم", "en": "Al Qassim"}
  },
  {
    "region_id": 6,
    "name": {"ar": "الرياض", "en": "Ar Riyadh"}
  },
  {
    "region_id": 7,
    "name": {"ar": "المدينة المنورة", "en": "Al Madinah"}
  }
];

List<Map> cities = [
  {
    "city_id": 295,
    "region_name": "Ar Riyadh",
    "name": {"ar": "حفر العتك", "en": "Hafr Al Atk"}
  },
  {
    "city_id": 296,
    "region_name": "Ar Riyadh",
    "name": {"ar": "المزيرع", "en": "Al Muzayri"}
  },
  {
    "city_id": 297,
    "region_name": "Ar Riyadh",
    "name": {"ar": "شوية", "en": "Shawyah"}
  },
  {
    "city_id": 306,
    "region_name": "Ar Riyadh",
    "name": {"ar": "الغاط", "en": "Al Ghat"}
  },
  {
    "city_id": 307,
    "region_name": "Ar Riyadh",
    "name": {"ar": "مليح", "en": "Mulayh"}
  },
];

class DropdownScreen extends StatefulWidget {
  @override
  _DropdownScreenState createState() => _DropdownScreenState();
}

class _DropdownScreenState extends State<DropdownScreen> {
  List<Map> _citiesList;
  String _selectedCity;
  String _selectedRegion;

  Future _loadCityData() async {
    // String jsonCities = await rootBundle.loadString("assets/json/cities.json");
    setState(() {
      _citiesList = cities;
    });
  }

  @override
  void initState() {
    super.initState();
    // * Load Data
    _loadCityData();
  }

  Widget _buildCitiesRun(BuildContext context) {
    return DropdownMenuItem(
      child: DropdownButton<String>(
        hint: Text(
          "Select City",
        ),
        isExpanded: true,
        value: _selectedCity,
        isDense: true,
        onChanged: (String newValue) {
          setState(() {
            _selectedCity = newValue;
            print('Selected City $_selectedCity');
          });
        },
        items: _citiesList.map((cities) {
          return DropdownMenuItem<String>(
            value: cities.toString(),
            child: Visibility(
              visible: _selectedRegion == cities["region_name"] ? true : true,
              child: Row(
                children: <Widget>[
                  // lanCode() is to get device language code
                  Text(
                    cities["name"]['en'],
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
          );
        }).toList(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Screen'),
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            _buildCitiesRun(context),
          ],
        ),
      ),
    );
  }
}
