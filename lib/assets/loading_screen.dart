import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:havadurumu/assets/main.dart';
import 'package:havadurumu/utils/location.dart';
import 'package:havadurumu/utils/weather.dart';
import 'package:location/location.dart';
import 'anasayfa.dart';

class LoadingScreen extends StatefulWidget {
  const LoadingScreen({Key? key}) : super(key: key);

  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
late LocationHelper locationData;
Future<void> getLocationData() async{
  locationData = LocationHelper();
  await locationData.getCurrentLocation();
  if (locationData.latitude == null || locationData.longitude == null){
    print("konum bilgileri gelmiyor");
    
  }
  else{
    print("latitude: "+ locationData.latitude.toString());
    print("longitude: "+ locationData.longitude.toString());
  }
}
void getWeatherData() async{
  await getLocationData();
  
  WeatherData weatherData = WeatherData(locationData: locationData);
  await weatherData.getCurrentTemperature();
  if (weatherData.currentTemperature == null ||
  weatherData.currentCondition == null){
    print("API den sıcaklık veya durum bilgisi boş dönüyor");
  }

  Navigator.pushReplacement(context, MaterialPageRoute(builder: (context){
    return AnasayfaScreen(weatherData: weatherData,);
  }));

}
@override
  void initState() {
    // TODO: implement initState
    super.initState();
   getWeatherData();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(centerTitle: true, title: Text(""),),
        body: Container(decoration: BoxDecoration(gradient: LinearGradient(begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [Colors.black,Colors.white])),
          child: Center(
            child: SpinKitCubeGrid(
              color: Colors.black,

            ),
          ),

        ));
  }
}