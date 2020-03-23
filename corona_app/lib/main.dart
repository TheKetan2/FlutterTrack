import 'package:flutter/material.dart';
import "dart:convert";
import "package:http/http.dart" as http;
import "package:flutter_vector_icons/flutter_vector_icons.dart";
import "package:flutter_map/flutter_map.dart" as flutterMap;
import "package:latlong/latlong.dart" as latLng;

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData.dark(),
      home: MyHomePage(title: 'Corona Updates'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int total_cases = 0, recovered = 0, deaths = 0;
  bool isLoading = true;
  String imgUrl = "", countryName = "";
  List detailData = [];

  @override
  initState() {
    _getDetailedData();
    _getCovidData();
    super.initState();
  }

  void _getDetailedData() async {
    http.Response data =
        await http.get("https://covid19.mathdro.id/api/confirmed");
    dynamic coronaDetail = jsonDecode(data.body);

    setState(() {
      detailData = coronaDetail;
    });
    // for (var location in detailData) {
    //   print(location["countryRegion"]);
    // }
  }

// Method to generate all the markers on map from detailData
  List<flutterMap.Marker> generateMarker() {
    List<flutterMap.Marker> marker = [];
    for (var location in detailData) {
      marker.add(
        flutterMap.Marker(
          width: 80.0,
          height: 40.0,
          point: new latLng.LatLng(
            location["lat"].toDouble(),
            location["long"].toDouble(),
          ),
          builder: (context) => new Container(
            child: new Icon(
              Icons.pin_drop,
              color: Colors.red,
              size: 10,
            ),
          ),
        ),
      );
    }
    return marker;
  }

  void _getCovidData() async {
    setState(() {
      isLoading = true;
    });
    String url = countryName.length == 0
        ? "https://covid19.mathdro.id/api"
        : "https://covid19.mathdro.id/api/countries/$countryName";
    http.Response data = await http.get(url);
    dynamic coronaData = jsonDecode(data.body);
    // print(coronaData["image"]);
    setState(() {
      total_cases = coronaData["confirmed"]["value"];
      recovered = coronaData["recovered"]["value"];
      deaths = coronaData["deaths"]["value"];
      imgUrl = coronaData["image"];
      isLoading = false;
    });
  }

  List<DropdownMenuItem<String>> showDropDown() {
    List<DropdownMenuItem<String>> dropDownItem = [];
    countries.keys.forEach((key) => dropDownItem.add(DropdownMenuItem(
          child: Text(key),
          value: countries[key],
        )));

    print(dropDownItem.length);
    return dropDownItem;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        elevation: 0,
      ),
      body: isLoading
          ? Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Image.asset(
                    "assets/img/corona.png",
                    width: 100,
                    height: 100,
                  ),
                  CircularProgressIndicator(),
                  Container(
                    height: 10,
                  ),
                  Text("Loading..."),
                ],
              ),
            )
          : Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  DropdownButton<String>(
                    items: showDropDown(),
                    onChanged: (String value) {
                      setState(() {
                        countryName = value;
                      });
                      print(countryName);
                    },
                    hint: Text("Select country"),
                    value: countryName,
                  ),
                  Row(
                    children: <Widget>[
                      Expanded(
                        child: InfoCard(
                          icon: Entypo.emoji_sad,
                          total_cases: total_cases,
                          title: "TOTAL CASES",
                          color: Colors.orange,
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Expanded(
                        child: InfoCard(
                          icon: Entypo.emoji_happy,
                          total_cases: recovered,
                          title: "RECOVERED",
                          color: Colors.green,
                        ),
                      ),
                      Expanded(
                        child: InfoCard(
                          icon: Foundation.skull,
                          total_cases: deaths,
                          title: "DEATHS",
                          color: Colors.red,
                        ),
                      ),
                    ],
                  ),
                  Expanded(
                    child: flutterMap.FlutterMap(
                      options: new flutterMap.MapOptions(
                        center: new latLng.LatLng(51.5, -0.09),
                        zoom: 1.0,
                      ),
                      layers: [
                        new flutterMap.TileLayerOptions(
                          urlTemplate:
                              "https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png",
                          subdomains: ['a', 'b', 'c'],
                        ),
                        new flutterMap.MarkerLayerOptions(
                            markers: generateMarker()),
                      ],
                    ),
                  ),

                  // Container(
                  //   margin: EdgeInsets.all(10),
                  //   decoration: BoxDecoration(
                  //     borderRadius: BorderRadius.circular(5),
                  //   ),
                  //   child: Image.network(imgUrl),
                  // )
                ],
              ),
            ),
      floatingActionButton: FloatingActionButton(
        onPressed: _getCovidData,
        tooltip: 'Get Data',
        child: Icon(Icons.refresh),
      ),
    );
  }
}

class InfoCard extends StatelessWidget {
  const InfoCard({Key key, this.total_cases, this.title, this.color, this.icon})
      : super(key: key);

  final int total_cases;
  final String title;
  final Color color;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(vertical: 3, horizontal: 3),
      color: color,
      child: Container(
        height: 90.0,
        padding: EdgeInsets.all(5),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            Icon(
              icon,
              size: 25,
            ),
            Text(
              total_cases.toString(),
              style: TextStyle(fontSize: 25.0, fontWeight: FontWeight.bold),
            ),
            Text(
              title,
              style: TextStyle(fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }
}

class DropdownExample extends StatefulWidget {
  @override
  _DropdownExampleState createState() {
    return _DropdownExampleState();
  }
}

class _DropdownExampleState extends State<DropdownExample> {
  String _value;

  List<DropdownMenuItem<String>> showDropDown() {
    List<DropdownMenuItem<String>> dropDownItem = [];
    countries.keys.forEach((key) => dropDownItem.add(DropdownMenuItem(
          child: Text(key),
          value: countries[key],
        )));

    print(dropDownItem);
    return dropDownItem;
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: DropdownButton<String>(
        items: showDropDown(),
        onChanged: (String value) {
          setState(() {
            _value = value;
          });
        },
        hint: Text('Select Item'),
        value: _value,
      ),
    );
  }
}

Map<String, String> countries = {
  "Afghanistan": "AF",
  "Aland Islands": "AX",
  "Albania": "AL",
  "Algeria": "DZ",
  "American Samoa": "AS",
  "Andorra": "AD",
  "Angola": "AO",
  "Anguilla": "AI",
  "Antarctica": "AQ",
  "Antigua and Barbuda": "AG",
  "Argentina": "AR",
  "Armenia": "AM",
  "Aruba": "AW",
  "Australia": "AU",
  "Austria": "AT",
  "Azerbaijan": "AZ",
  "Bahamas": "BS",
  "Bahrain": "BH",
  "Bangladesh": "BD",
  "Barbados": "BB",
  "Belarus": "BY",
  "Belgium": "BE",
  "Belize": "BZ",
  "Benin": "BJ",
  "Bermuda": "BM",
  "Bhutan": "BT",
  "Bolivia": "BO",
  "Bonaire, Saint Eustatius and Saba ": "BQ",
  "Bosnia and Herzegovina": "BA",
  "Botswana": "BW",
  "Bouvet Island": "BV",
  "Brazil": "BR",
  "British Indian Ocean Territory": "IO",
  "British Virgin Islands": "VG",
  "Brunei": "BN",
  "Bulgaria": "BG",
  "Burkina Faso": "BF",
  "Burundi": "BI",
  "Cambodia": "KH",
  "Cameroon": "CM",
  "Canada": "CA",
  "Cape Verde": "CV",
  "Cayman Islands": "KY",
  "Central African Republic": "CF",
  "Chad": "TD",
  "Chile": "CL",
  "China": "CN",
  "Christmas Island": "CX",
  "Cocos Islands": "CC",
  "Colombia": "CO",
  "Comoros": "KM",
  "Cook Islands": "CK",
  "Costa Rica": "CR",
  "Croatia": "HR",
  "Cuba": "CU",
  "Curacao": "CW",
  "Cyprus": "CY",
  "Czech Republic": "CZ",
  "Czechia": "CZ",
  "Democratic Republic of the Congo": "CD",
  "Denmark": "DK",
  "Djibouti": "DJ",
  "Dominica": "DM",
  "Dominican Republic": "DO",
  "East Timor": "TL",
  "Ecuador": "EC",
  "Egypt": "EG",
  "El Salvador": "SV",
  "Equatorial Guinea": "GQ",
  "Eritrea": "ER",
  "Estonia": "EE",
  "Ethiopia": "ET",
  "Falkland Islands": "FK",
  "Faroe Islands": "FO",
  "Fiji": "FJ",
  "Finland": "FI",
  "France": "FR",
  "French Guiana": "GF",
  "French Polynesia": "PF",
  "French Southern Territories": "TF",
  "Gabon": "GA",
  "Gambia, The": "GM",
  "Georgia": "GE",
  "Germany": "DE",
  "Ghana": "GH",
  "Gibraltar": "GI",
  "Greece": "GR",
  "Greenland": "GL",
  "Grenada": "GD",
  "Guadeloupe": "GP",
  "Guam": "GU",
  "Guatemala": "GT",
  "Guernsey": "GG",
  "Guinea-Bissau": "GW",
  "Guinea": "GN",
  "Guyana": "GY",
  "Haiti": "HT",
  "Heard Island and McDonald Islands": "HM",
  "Honduras": "HN",
  "Hong Kong": "HK",
  "Hungary": "HU",
  "Iceland": "IS",
  "India": "IN",
  "Indonesia": "ID",
  "Iran": "IR",
  "Iraq": "IQ",
  "Ireland": "IE",
  "Isle of Man": "IM",
  "Israel": "IL",
  "Italy": "IT",
  "Ivory Coast": "CI",
  "Jamaica": "JM",
  "Japan": "JP",
  "Jersey": "JE",
  "Jordan": "JO",
  "Kazakhstan": "KZ",
  "Kenya": "KE",
  "Kiribati": "KI",
  "Korea, South": "KR",
  "Kosovo": "XK",
  "Kuwait": "KW",
  "Kyrgyzstan": "KG",
  "Laos": "LA",
  "Latvia": "LV",
  "Lebanon": "LB",
  "Lesotho": "LS",
  "Liberia": "LR",
  "Libya": "LY",
  "Liechtenstein": "LI",
  "Lithuania": "LT",
  "Luxembourg": "LU",
  "Macao": "MO",
  "Macedonia": "MK",
  "Madagascar": "MG",
  "Mainland China": "CN",
  "Malawi": "MW",
  "Malaysia": "MY",
  "Maldives": "MV",
  "Mali": "ML",
  "Malta": "MT",
  "Marshall Islands": "MH",
  "Martinique": "MQ",
  "Mauritania": "MR",
  "Mauritius": "MU",
  "Mayotte": "YT",
  "Mexico": "MX",
  "Micronesia": "FM",
  "Moldova": "MD",
  "Monaco": "MC",
  "Mongolia": "MN",
  "Montenegro": "ME",
  "Montserrat": "MS",
  "Morocco": "MA",
  "Mozambique": "MZ",
  "Myanmar": "MM",
  "Namibia": "NA",
  "Nauru": "NR",
  "Nepal": "NP",
  "Netherlands": "NL",
  "New Caledonia": "NC",
  "New Zealand": "NZ",
  "Nicaragua": "NI",
  "Niger": "NE",
  "Nigeria": "NG",
  "Niue": "NU",
  "Norfolk Island": "NF",
  "Northern Mariana Islands": "MP",
  "Norway": "NO",
  "Oman": "OM",
  "Pakistan": "PK",
  "Palau": "PW",
  "Palestinian Territory": "PS",
  "Panama": "PA",
  "Papua New Guinea": "PG",
  "Paraguay": "PY",
  "People's Republic of Korea": "KP",
  "Peru": "PE",
  "Philippines": "PH",
  "Pitcairn": "PN",
  "Poland": "PL",
  "Portugal": "PT",
  "Puerto Rico": "PR",
  "Qatar": "QA",
  "Republic of the Congo": "CG",
  "Reunion": "RE",
  "Romania": "RO",
  "Russia": "RU",
  "Rwanda": "RW",
  "Saint Barthelemy": "BL",
  "Saint Helena": "SH",
  "Saint Kitts and Nevis": "KN",
  "Saint Lucia": "LC",
  "Saint Martin": "MF",
  "Saint Pierre and Miquelon": "PM",
  "Saint Vincent and the Grenadines": "VC",
  "Samoa": "WS",
  "San Marino": "SM",
  "Sao Tome and Principe": "ST",
  "Saudi Arabia": "SA",
  "Senegal": "SN",
  "Serbia": "RS",
  "Seychelles": "SC",
  "Sierra Leone": "SL",
  "Singapore": "SG",
  "Sint Maarten": "SX",
  "Slovakia": "SK",
  "Slovenia": "SI",
  "Solomon Islands": "SB",
  "Somalia": "SO",
  "South Africa": "ZA",
  "South Georgia and the South Sandwich Islands": "GS",
  "South Sudan": "SS",
  "Spain": "ES",
  "Sri Lanka": "LK",
  "Sudan": "SD",
  "Suriname": "SR",
  "Svalbard and Jan Mayen": "SJ",
  "Swaziland": "SZ",
  "Sweden": "SE",
  "Switzerland": "CH",
  "Syria": "SY",
  "Taiwan*": "TW",
  "Tajikistan": "TJ",
  "Tanzania": "TZ",
  "Thailand": "TH",
  "Togo": "TG",
  "Tokelau": "TK",
  "Tonga": "TO",
  "Trinidad and Tobago": "TT",
  "Tunisia": "TN",
  "Turkey": "TR",
  "Turkmenistan": "TM",
  "Turks and Caicos Islands": "TC",
  "Tuvalu": "TV",
  "U.S. Virgin Islands": "VI",
  "Uganda": "UG",
  "Ukraine": "UA",
  "United Arab Emirates": "AE",
  "United Kingdom": "GB",
  "United States Minor Outlying Islands": "UM",
  "Uruguay": "UY",
  "US": "US",
  "Uzbekistan": "UZ",
  "Vanuatu": "VU",
  "Vatican": "VA",
  "Venezuela": "VE",
  "Vietnam": "VN",
  "Wallis and Futuna": "WF",
  "Western Sahara": "EH",
  "Yemen": "YE",
  "Zambia": "ZM",
  "Zimbabwe": "ZW"
};
