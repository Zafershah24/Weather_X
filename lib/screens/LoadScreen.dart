import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import '../services/location.dart';
import 'package:http/http.dart';

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {


  @override
  void initState() {

    super.initState();



  }
  void getdata()async
  {
   Response response= await get('https://samples.openweathermap.org/data/2.5/weather?q=London,uk&appid=439d4b804bc8187953eb36d2a8c26a02');
    print(response.body);


  }
  void getLocation() async{
    Location location = new Location();
    await location.getCurrentLocation();
    print(location.longitude);
    print(location.latitude);
  }



  @override
  Widget build(BuildContext context)
  {
    getdata();
    return Scaffold(

    );
  }
}