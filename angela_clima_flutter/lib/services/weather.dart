import 'package:clima/services/location_helper.dart';
import 'package:clima/services/networking.dart';

const apiKey = 'a65fb3444216deb38e36e16b52e4521b';
const openWeatherMapURL = 'http://api.openweathermap.org/data/2.5/weather';

class WeatherModel {

  Future<dynamic> getCityWeather(String cityName) async{
    var url = '$openWeatherMapURL?q=$cityName&APPID=$apiKey&units=metric';
    NetworkHelper networkHelper = await NetworkHelper(url);
    var weatherData = networkHelper.getData();
    return weatherData;

  }

  Future<dynamic> getLocationWeather() async {
    Location location = new Location();
    await location.getCurrentLocation();
    NetworkHelper networkHelper = new NetworkHelper(
        '$openWeatherMapURL?lat=${location.lat}&lon=${location.long}&APPID=$apiKey&units=metric');

    var weatherData = await networkHelper.getData();
    return weatherData;
  }

  String getWeatherIcon(int condition) {
    if (condition < 300) {
      return '🌩';
    } else if (condition < 400) {
      return '🌧';
    } else if (condition < 600) {
      return '☔️';
    } else if (condition < 700) {
      return '☃️';
    } else if (condition < 800) {
      return '🌫';
    } else if (condition == 800) {
      return '☀️';
    } else if (condition <= 804) {
      return '☁️';
    } else {
      return '🤷‍';
    }
  }

  String getMessage(int temp) {
    if (temp > 25) {
      return 'It\'s 🍦 time';
    } else if (temp > 20) {
      return 'Time for shorts and 👕';
    } else if (temp < 10) {
      return 'You\'ll need 🧣 and 🧤';
    } else {
      return 'Bring a 🧥 just in case';
    }
  }
}
