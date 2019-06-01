import 'package:flutter/material.dart';
import 'package:clima/services/location_helper.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

const String apiKey = 'a65fb3444216deb38e36e16b52e4521b';

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  double lat = 0;
  double long = 0;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getLocation();
  }

  void getData() async {
    http.Response responce = await http.get(
        'http://api.openweathermap.org/data/2.5/weather?lat=$lat&lon=$long&appid=$apiKey');
    if (responce.statusCode == 200) {
      String data = responce.body;
      print(data);

      // var country = jsonDecode(data)['name'];
      // print(country);

      // var disc = jsonDecode(data)['weather'][0]['description'];
      // print(disc);
      var temp = jsonDecode(data)['main']['temp'];
      print(temp);
      var condition = jsonDecode(data)['weather'][0]['id'];
      print(condition);
      var city = jsonDecode(data)['name'];
      print(city);
    } else {
      print(responce.statusCode);
    }
  }

  void getLocation() async {
    Location location = new Location();
    await location.getCurrentLocation();

    print(location.lat);
    lat = location.lat;
    print(location.long);
    long = location.long;
    getData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }
}
