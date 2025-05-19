import 'dart:convert';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:weather_app/secret.dart';
import 'main_card.dart';
import 'weather_forecast.dart';
import 'additional_info_card.dart';
import 'package:http/http.dart' as http;


//colors
const primary_color = Colors.redAccent;
const text_color = Color.fromRGBO(100, 181, 246, 1);
const card_color = Color.fromRGBO(44, 50, 39, 1);

class WeatherScreen extends StatefulWidget {
  const WeatherScreen({super.key});

  @override
  State<WeatherScreen> createState() => _WeatherScreenState();
}

class _WeatherScreenState extends State<WeatherScreen> {
  Future getCurrentWeather() async
  {
    try
    {
      String city = "Vellore,IN";
      final result =  await http.get(
        Uri.parse("http://api.openweathermap.org/data/2.5/forecast?q=$city&APPID=$api_key"),
      );

      final data = jsonDecode(result.body);
      if(data['cod']!='200')
      {
        throw "An unexpected error occured";
      }
      return data;
    }
    catch (e)
    {
      throw e.toString();
    }
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Colors.black,

      appBar: AppBar(
          title: Text(
            "Weather App",
            style: TextStyle(
              color: primary_color,
              fontWeight: FontWeight.bold,
            ),
          ),
        actions: [
          IconButton(
            onPressed: () => setState(() {}),
            icon: Icon(
              Icons.refresh,
              color: primary_color,
            )
          )
        ],
        backgroundColor: Colors.black,
        elevation: 2,
        centerTitle: true,
      ),

      body:Center(
        child: FutureBuilder(
            future: getCurrentWeather(),
            builder:(context,snapshot) {
              if(snapshot.connectionState==ConnectionState.waiting)
                return const CircularProgressIndicator();
              else if(snapshot.hasData)
                return appBody(data: snapshot.data!);
              else
                return Text(snapshot.error.toString());
            }
        ),
      ),
    );
  }
}


// app body
class appBody extends StatelessWidget {
  final data;
  const appBody({
    super.key,
    required this.data
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          //main card
          mainCard(temp: data['list'][0]['main']['temp']-273.15,curr_sky: data['list'][0]['weather'][0]['main']),
          const SizedBox(height: 40,),

          //weather forecast card
          Text(
            "Weather Forecast",
            style: TextStyle(
              color: primary_color,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            )
          ),

          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: weatherForecast(data: data),
          ),

          const SizedBox(height: 40,),

          Text(
              "Additional Information",
              style: TextStyle(
                color: primary_color,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              )
          ),

          additionalInfoCard(data:data),
        ],
      ),
    );
  }
}




