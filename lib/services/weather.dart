import '../services/location.dart';
import 'package:weatherx/services/network.dart';
import 'package:weatherx/utilities/constants.dart';

import 'package:font_awesome_flutter/font_awesome_flutter.dart';

const openWeatherURL='https://api.openweathermap.org/data/2.5/weather';

class WeatherModel {

  Future<dynamic> cityWeather(String cityName)async{
    var URL='$openWeatherURL?q=$cityName&appid=$kAPI&units=metric';
    NetworkHelper networkHelper=NetworkHelper(URL);
    var weatherData=await networkHelper.getData();
    return weatherData;
  }

  Future<dynamic> locationWeather()async{
    Location location = new Location();
    await location.getCurrentLocation();

    NetworkHelper networkhelper =NetworkHelper('$openWeatherURL?lat=${location.latitude}&lon=${location.longitude}&appid=$kAPI&units=metric');

    var weatherData=await networkhelper.getData();
    return weatherData;
  }

  String getMessage(int temp) {
    if (temp > 25) {
      return 'It\'s 🍦 time';
    } else if (temp > 20) {
      return 'Time for shorts,shades and 👕';
    } else if (temp < 10) {
      return 'You\'ll need 🧣 and 🧤';
    } else {
      return 'Bring a 🧥 & ☂ (just in case)';
    }
  }
  String getWeatherIcon(int condition){
    if (condition < 300) {
      return '    🌩';
    } else if (condition < 400) {
      return '    🌧';
    } else if (condition < 600) {
      return '    ☔';
    } else if (condition < 700) {
      return '    ☃';
    } else if (condition < 800) {

      return '    🌫';
    } else if (condition == 800) {
      return '    ☀';
    } else if (condition <= 804) {
      return '    ☁';
    } else
    return '    🤷‍';
  }
  String subtext(int condition){
    if (condition < 300) {
      return "Thunderstorm";

    } else if (condition < 400) {
      return "Drizzle";

    } else if (condition < 600) {
      return "Rain";

    } else if (condition < 700) {
      return "Snow";

    } else if (condition < 800) {
      return "Windy";

    } else if (condition == 800) {
      return "Sunny";

    } else if (condition <= 804) {
      return "Cloudy";

    } else
      return null;

  }
}