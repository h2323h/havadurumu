import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:havadurumu/utils/weather.dart';

class AnasayfaScreen extends StatefulWidget {
  final weatherData;

  AnasayfaScreen({required this.weatherData});


  @override
  _AnasayfaScreenState createState() => _AnasayfaScreenState();
}

class _AnasayfaScreenState extends State<AnasayfaScreen> {

  late int feelsLike;
  late int temperature;
  late Icon weatherDisplayIcon;
  late AssetImage backgroundImage;
  late String city;
  void updateDisplayInfo(WeatherData weatherData){
setState(() {
  temperature = weatherData.currentTemperature.round();
  city = weatherData.city;
   feelsLike = weatherData.currentFeelsLike.round();
  WeatherDisplayData weatherDisplayData = weatherData.getWeatherDisplayData()
  as
  WeatherDisplayData;
  backgroundImage = weatherDisplayData.weatherImage;
  weatherDisplayIcon = weatherDisplayData.weatherIcon;

});
  }
@override
  void initState() {
    // TODO: implement initState
    super.initState();
    updateDisplayInfo(widget.weatherData);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        //appBar: AppBar(centerTitle: true, title: Text("Profil"),),
       body:  Container(
        constraints: BoxConstraints.expand(),
    decoration: BoxDecoration(
    image: DecorationImage(
    image: backgroundImage,
    fit: BoxFit.cover,
    )
    ),
    child: Column(
    crossAxisAlignment: CrossAxisAlignment.stretch,
    children: [
    SizedBox(height: 80,),
    Container(
    child: weatherDisplayIcon,
    ),
    SizedBox(height: 15,),
    Center(
    child: Text("$temperature°",
    style: TextStyle(
    color: Colors.white,
    fontSize: 75.0,
    letterSpacing: -5
    ),)
    ),
      SizedBox(height: 10,),
      Center(
          child: Text("$city",
            style: TextStyle(
                color: Colors.white,

                fontSize: 55.0,
                letterSpacing: -5
            ),)
      ),
      SizedBox(height: 15,),
      Center(
          child: Text("Hissedilen Sıcaklık",
            style: TextStyle(
                color: Colors.white,
                fontSize: 35.0,
                letterSpacing: -5
            ),)
      ),
      Center(
          child: Text("$feelsLike°",
            style: TextStyle(
                color: Colors.white,
                fontSize: 30.0,
                letterSpacing: -5
            ),)
      ),
    ],

    )
    )
    );
  }
}
