import 'package:flutter/material.dart';
import 'package:hello_world/planets/ui/PlanetRow.dart';
import 'package:hello_world/planets/ui/home/planets.dart';

class HomePageBody extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new PlanetRow(planets[1]);
  }
  
}