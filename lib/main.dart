import 'package:flutter/material.dart';
import 'package:weather_app/weather_screen.dart';

void main()
{
  runApp(WeatherApp());
}

class WeatherApp extends StatelessWidget {
  const WeatherApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark(useMaterial3: true),
      home : WeatherScreen(),
    );
  }
}




