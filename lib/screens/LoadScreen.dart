import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import '../services/location.dart';
import 'package:weatherx/services/network.dart';

import 'package:weatherx/utilities/constants.dart';
import 'locationscreen.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {

  double lat;
  double long;


  @override
  void initState() {

    super.initState();
 getLocationData();


  }

  void getLocationData() async{
    Location location = new Location();
    await location.getCurrentLocation();
     long = location.longitude;
   lat =location.latitude;
    NetworkHelper networkhelper =NetworkHelper('https://api.openweathermap.org/data/2.5/weather?lat=$lat&lon=$long&appid=$kAPI&units=metric');

  var weatherData=await networkhelper.getData();

  Navigator.push(context, MaterialPageRoute(builder: (context)
    {
      return LocationScreen(locationweather: weatherData,);

    }
    ));


  }









  @override
  Widget build(BuildContext context)
  {

    return Scaffold(
      body: Center(
        child:  SpinKitCubeGrid(
        color: Colors.teal,
        size: 90.0,
      ),


    ),);
  }
}