import 'package:flutter/material.dart';
import 'homepage.dart';

class BottomPanel extends StatelessWidget {
  final Map weatherData;
  String getClockInUtcPlus3Hours(int timeSinceEpochInSec){
    final time = DateTime.fromMillisecondsSinceEpoch(timeSinceEpochInSec * 1000,
    isUtc: true).add(const Duration(hours: 5, minutes: 30));
    return '${time.hour}:${time.minute}';

  }

  const BottomPanel({Key key, this.weatherData}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(40),
          topRight: Radius.circular(40),
          bottomRight: Radius.circular(40),
          bottomLeft: Radius.circular(40),
        )
      ),
      child: Column(
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.fromLTRB(10, 20, 5, 0),
                child: Center(child: Text(weatherData['name']+','+weatherData['sys']['country'], style: TextStyle(color: Colors.black, fontSize: 30))),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 20, 5, 0),
                child: Image.asset('assets/city.png', height: 30,width:30),
              )
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
            
            Image.asset('assets/location.png', height: 20,width:20),
            Text(weatherData['coord']['lat'].toString()+','+weatherData['coord']['lon'].toString(),),
            
          ],),
          SizedBox(height: 15,),
          Wrap(
            alignment: WrapAlignment.center,
            children: <Widget>[
              Container(
                margin: EdgeInsets.symmetric(vertical: 5, horizontal: 5),
                padding: EdgeInsets.all(3),
                height: 90,
                width: 90,
                
                decoration: BoxDecoration(color: Colors.white,
                boxShadow: kElevationToShadow[6],
                borderRadius: BorderRadius.circular(8),
                ),
                child: Column(
                  children: <Widget>[
                    Text('Feels Like:', style: TextStyle(color: Colors.black87, fontSize: 17)),
                    SizedBox(height:14),
                    Text((weatherData['main']['feels_like']-272.15).round().toString()+ '°C', style: TextStyle(fontSize:25,color: Colors.blue),)
                  ]
                ),

              ),
              Container(
                margin: EdgeInsets.symmetric(vertical: 5, horizontal: 5),
                padding: EdgeInsets.all(3),
                height: 90,
                width: 90,
                
                decoration: BoxDecoration(color: Colors.white,
                boxShadow: kElevationToShadow[6],
                borderRadius: BorderRadius.circular(8),
                ),
                child: Column(
                  children: <Widget>[
                    Text('Visibility:', style: TextStyle(color: Colors.black87, fontSize: 19)),
                    SizedBox(height:14),
                    Text(weatherData['visibility'].toString(), style: TextStyle(fontSize:25,color: Colors.grey),)
                  ]
                ),

              ),
              Container(
                margin: EdgeInsets.symmetric(vertical: 5, horizontal: 5),
                padding: EdgeInsets.all(3),
                height: 90,
                width: 90,
                
                decoration: BoxDecoration(color: Colors.white,
                boxShadow: kElevationToShadow[6],
                borderRadius: BorderRadius.circular(8),
                ),
                child: Column(
                  children: <Widget>[
                    Text('Pressure:', style: TextStyle(color: Colors.black87, fontSize: 19)),
                    SizedBox(height:14),
                    Text(weatherData['main']['pressure'].toString()+ ' hPa', style: TextStyle(fontSize:19,color: Colors.grey),)
                  ]
                ),

              ),
              Container(
                margin: EdgeInsets.symmetric(vertical: 5, horizontal: 5),
                padding: EdgeInsets.all(3),
                height: 90,
                width: 90,
                
                decoration: BoxDecoration(color: Colors.white,
                boxShadow: kElevationToShadow[6],
                borderRadius: BorderRadius.circular(8),
                ),
                child: Column(
                  children: <Widget>[
                    Text('Humidity:', style: TextStyle(color: Colors.black87, fontSize: 19)),
                    SizedBox(height:14),
                    Text(weatherData['main']['humidity'].toString() +'%', style: TextStyle(fontSize:25,color: Colors.grey),)
                  ]
                ),

              ),
              Container(
                margin: EdgeInsets.symmetric(vertical: 5, horizontal: 5),
                padding: EdgeInsets.all(3),
                height: 90,
                width: 90,
                
                decoration: BoxDecoration(color: Colors.white,
                boxShadow: kElevationToShadow[6],
                borderRadius: BorderRadius.circular(8),
                ),
                child: Column(
                  children: <Widget>[
                    Text('Min Temp:', style: TextStyle(color: Colors.black87, fontSize: 17)),
                    SizedBox(height:14),
                    Text((weatherData['main']['temp_min']-272.15).round().toString()+ '°C', style: TextStyle(fontSize:25,color: Colors.blue),)
                  ]
                ),

              ),
              Container(
                margin: EdgeInsets.symmetric(vertical: 5, horizontal: 5),
                padding: EdgeInsets.all(3),
                height: 90,
                width: 90,
                
                decoration: BoxDecoration(color: Colors.white,
                boxShadow: kElevationToShadow[6],
                borderRadius: BorderRadius.circular(8),
                ),
                child: Column(
                  children: <Widget>[
                    Text('Max Temp:', style: TextStyle(color: Colors.black87, fontSize: 16)),
                    SizedBox(height:14),
                    Text((weatherData['main']['temp_max']-272.15).round().toString()+ '°C', style: TextStyle(fontSize:25,color: Colors.blue),)
                  ]
                ),

              )
            ]
          ),
          SizedBox(height: 5),
          Align(
            alignment: Alignment.centerLeft,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text('Sunrise and Sunset:', style: TextStyle(color: Colors.black,fontSize: 28,)),
            )),
          Wrap(
            alignment: WrapAlignment.center,
            children: <Widget>[
              Container(
                margin: EdgeInsets.fromLTRB(5, 10, 5, 70),
                padding: EdgeInsets.all(3),
                height: 120,
                width: 120,
                
                decoration: BoxDecoration(color: Colors.white,
                boxShadow: kElevationToShadow[6],
                borderRadius: BorderRadius.circular(8),
                ),
                child: Column(
                  children: <Widget>[
                    Image.asset('assets/sunrise.png', height: 50, width: 50),
                    SizedBox(height:14),
                    Text('${getClockInUtcPlus3Hours(weatherData['sys']['sunrise'])} AM IST', style: TextStyle(color: Colors.black87),),
                  ]
                ),

              ),
              Container(
                margin: EdgeInsets.fromLTRB(5, 10, 5, 70),
                padding: EdgeInsets.all(3),
                height: 120,
                width: 120,
                
                decoration: BoxDecoration(color: Colors.white,
                boxShadow: kElevationToShadow[6],
                borderRadius: BorderRadius.circular(8),
                ),
                child: Column(
                  children: <Widget>[
                    Image.asset('assets/sunset.png', height: 50, width: 50),
                    SizedBox(height:14),
                    Text('${getClockInUtcPlus3Hours(weatherData['sys']['sunset'])} PM IST',style: TextStyle(color: Colors.black87),),
                    
                  ]
                ),

              ),


            ]
          ),
          SizedBox(height: 20,)  
        ],
      ),
      
      
    );
  }
}
