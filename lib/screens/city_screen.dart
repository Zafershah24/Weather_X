import 'package:flutter/material.dart';
import 'package:weatherx/utilities/constants.dart';
import 'package:animated_text_kit/animated_text_kit.dart';

class CityScreen extends StatefulWidget {
  @override
  _CityScreenState createState() => _CityScreenState();
}

class _CityScreenState extends State<CityScreen> {
 String Cityname;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('images/pic.png'),
            fit: BoxFit.cover,
          ),
        ),
        constraints: BoxConstraints.expand(),
        child: SafeArea(
          child: Column(
            children: <Widget>[
              Align(
                alignment: Alignment.topLeft,
                child: FlatButton(
                  onPressed: () {Navigator.pop(context);},
                  child: Icon(
                    Icons.arrow_back_ios,
                    color:Colors.white,
                    size: 50.0,
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.all(20.0),
                child: TextField(
                  style: TextStyle(color: Colors.black),
                  onChanged: (value){
                    Cityname=value;
                  },
                  decoration: kTextfiedstyle,
                ),
              ),
              FlatButton(
                onPressed: () {Navigator.pop(context,Cityname);},
                child: TyperAnimatedTextKit(
                    text: [
                      "Get Weather ",
                    ],
                    textStyle: TextStyle(
                        fontSize: 30.0,
                        color: Colors.redAccent,
                    ),
                    textAlign: TextAlign.start,
                    alignment: AlignmentDirectional.topStart // or Alignment.topLeft
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

//Text(
//'Get Weather',
//style: kButtonTextStyle,
//),