import 'package:flutter/material.dart';
import 'package:weather_app/homepage.dart';

void main(){
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    title: 'Weather App',
    theme: ThemeData(
      fontFamily: 'Alata',

    ),
    home: HomePage(),
  ));
}