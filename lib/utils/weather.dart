import 'dart:convert';
import 'package:async/async.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:http/http.dart';
import 'location.dart';

const apiKey = "8427cd9e0afa8f9bf994681c16cc7aa5";

  class WeatherDisplayData{
  Icon weatherIcon;
  AssetImage weatherImage;

  WeatherDisplayData({required this.weatherIcon,  required this.weatherImage});


}

class WeatherData {

  WeatherData({required this.locationData});

  LocationHelper locationData;
  late double currentFeelsLike;
  late double currentTemperature;
  late int currentCondition;
  late String city;

  Future<void> getCurrentTemperature() async {
    Response response = await get(Uri.parse(
        "https://api.openweathermap.org/data/2.5/weather?lat=${locationData
            .latitude}&lon=${locationData
            .longitude}&appid=${apiKey}&units=metric"));
    if (response.statusCode == 200) {
      String data = response.body;

      var currentWeather = jsonDecode(data);
      try {
        currentTemperature = currentWeather['main']['temp'];
        currentFeelsLike = currentWeather['main']['feels_like'];
        currentCondition = currentWeather['weather'][0]['id'];
        city = currentWeather["name"];
      }
      catch (e) {
        print(e);
      }
    }
    else {
      print("API den değer gelmiyor");
    }
  }

  WeatherDisplayData getWeatherDisplayData() {
    if (currentCondition < 600) {
      return WeatherDisplayData(weatherIcon:
      Icon(FontAwesomeIcons.cloud, size: 65.0, color: Colors.white),
          weatherImage: AssetImage('lib/assets/images/bulutlu.jpg'));
    }
    else {
      var now = new DateTime.now();
      if (now.hour >= 19) {
        return WeatherDisplayData(weatherIcon:
        Icon(FontAwesomeIcons.moon, size: 65.0, color: Colors.white),
            weatherImage: AssetImage('lib/assets/images/gece.jpg'));
      }
      else {
        var now = new DateTime.now();
        if (now.hour <= 05) {
          return WeatherDisplayData(weatherIcon:
          Icon(FontAwesomeIcons.moon, size: 65.0, color: Colors.white),
              weatherImage: AssetImage('lib/assets/images/gece.jpg'));
        }
        else {
          return WeatherDisplayData(weatherIcon:
          Icon(FontAwesomeIcons.sun, size: 65.0, color: Colors.white,),
              weatherImage: AssetImage('lib/assets/images/gunes.jpg'));
        }
      }
    }
  }
}