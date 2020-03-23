import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
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
  String imgUrl = "";

  void _getCovidData() async {
    setState(() {
      isLoading = true;
    });
    http.Response data = await http.get("https://covid19.mathdro.id/api");
    dynamic coronaData = jsonDecode(data.body);
    print(coronaData["image"]);
    setState(() {
      total_cases = coronaData["confirmed"]["value"];
      recovered = coronaData["recovered"]["value"];
      deaths = coronaData["deaths"]["value"];
      imgUrl = coronaData["image"];
      isLoading = false;
    });
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
                  flutterMap.FlutterMap(
                    options: new flutterMap.MapOptions(
                      center: new latLng.LatLng(51.5, -0.09),
                      zoom: 13.0,
                    ),
                    layers: [
                      new flutterMap.TileLayerOptions(
                        urlTemplate: "https://api.tiles.mapbox.com/v4/"
                            "{id}/{z}/{x}/{y}@2x.png?access_token={accessToken}",
                        additionalOptions: {
                          'accessToken':
                              'pk.eyJ1IjoidGhla2V0YW4yIiwiYSI6ImNrODNzbjJhczFkOWEzZnBnY3hvZDEyc3oifQ.Sq0TnHXyfJgodPce7SBlJQ',
                          'id': 'mapbox.streets',
                        },
                      ),
                      new flutterMap.MarkerLayerOptions(
                        markers: [
                          new flutterMap.Marker(
                            width: 80.0,
                            height: 80.0,
                            point: new latLng.LatLng(51.5, -0.09),
                            builder: (ctx) => new Container(
                              child: new FlutterLogo(),
                            ),
                          ),
                        ],
                      ),
                    ],
                  )

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
