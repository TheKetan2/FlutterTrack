import 'package:flutter/material.dart';
import 'package:clima/services/location_helper.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
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
  void getData() async{
    http.Response responce = await http.get('http://samples.openweathermap.org/data/2.5/weather?lat=$lat&lon=$long&appid=b6907d289e10d714a6e88b30761fae22');
    if(responce.statusCode == 200){
        String data = responce.body;
        print(data);

        // var country = jsonDecode(data)['name'];
        // print(country);

        // var disc = jsonDecode(data)['weather'][0]['description'];
        // print(disc);
        var temp = jsonDecode(data)['main']['temp'];
        print(temp);
        var wID = jsonDecode(data)['weather'][0]['id'];
        print(wID);
        var city = jsonDecode(data)['name'];
        print(city);
    }
    else{
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
  }



  @override
  Widget build(BuildContext context) {
    getData();
    
    return Scaffold();
  }
}
