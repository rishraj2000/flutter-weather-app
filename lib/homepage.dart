import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'weatherpanel.dart';
import 'bottompanel.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  TextEditingController myController = new TextEditingController();

  Map weatherData;
  
  
  fetchWeatherData() async {
    http.Response response = await http.get('http://api.openweathermap.org/data/2.5/weather?q=' + myController.text +'&appid=817d08ef6f65cd87ee8f0b72b4c487d5');
    setState(() {
      weatherData = json.decode(response.body);
    });
  }
  List tempData;
  fetchtempData()async{
    http.Response response = await http.get('http://api.openweathermap.org/data/2.5/weather?q=' + myController.text +'&appid=817d08ef6f65cd87ee8f0b72b4c487d5');
    setState(() {
      tempData = json.decode(response.body);
    });
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[900],
      body: SingleChildScrollView(
              child: Column(
          children: <Widget>[
            Container(
              margin: EdgeInsets.fromLTRB(20, 20, 20, 20),
              width: 400,
              height: 56,
              decoration: BoxDecoration(borderRadius: BorderRadius.circular(16),
              color: Colors.white,
              boxShadow: kElevationToShadow[6],
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Expanded(child: Container(
                    padding: EdgeInsets.all(10),
                    child: TextField(
                      controller: myController,
                      
                      decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: 'Enter City',
                      hintStyle: TextStyle(color: Colors.grey)
                    ),)
                  ),
                  ),
                  IconButton(
                    icon:
                    Icon(Icons.search, color: Colors.grey,),
                    onPressed: (){
                      fetchWeatherData();
                      fetchtempData();

                    },),
                    
                    
                    
                ]
              ),
            ),
            SizedBox(height: 10,),
            weatherData==null? Center(child: CircularProgressIndicator()): WeatherPanel(weatherData: weatherData, tempData: tempData,),
            SizedBox(height: 5,),
            weatherData==null? Center(child: CircularProgressIndicator()):BottomPanel(weatherData: weatherData,),


          ],
        ),
      )
      
    );
  }
}