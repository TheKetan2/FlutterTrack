
import 'package:geolocator/geolocator.dart';


class Location{
  double lat;
  double long;
  Future<void> getCurrentLocation() async {
    try{
    Position position = await Geolocator().getCurrentPosition(
        desiredAccuracy: LocationAccuracy.bestForNavigation);
    print(position);
    lat = position.latitude;
    long = position.longitude;
    }
    catch(e){
      print(e);
    }
  }

}