import 'package:flutter/material.dart';
import 'dart:ui';

import 'package:weather_app/additional_info_card.dart';

//colors
const primary_color = Colors.redAccent;
const text_color = Color.fromRGBO(100, 181, 246, 1);
const card_color = Color.fromRGBO(44, 50, 39, 1);

//this is a main card
class mainCard extends StatelessWidget {
  final double temp;
  final String curr_sky;
  const mainCard({
    super.key,
    required this.temp,
    required this.curr_sky,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child:Card(
      color: card_color,
        elevation: 20,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
            child: Column(
              children: [
                const SizedBox(height: 16,),

                Text(
                  temp.toStringAsFixed(2)+" °C",
                  style: TextStyle(
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                    color: text_color,
                  ),
                ),

                const SizedBox(height: 16,),

                curr_icon(curr_sky: curr_sky,),

                const SizedBox(height: 16,),

                Text(
                    curr_sky,
                    style: TextStyle(
                      fontSize: 20,
                      color: text_color,

                    )
                ),

                const SizedBox(height: 16,),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class curr_icon extends StatelessWidget {
  final String curr_sky;
  const curr_icon({
    super.key,
    required this.curr_sky,
  });

  @override
  Widget build(BuildContext context) {
    IconData weatherIcon;
    if (curr_sky == "Clouds")
    {
      weatherIcon = Icons.cloud;
    }
    else if (curr_sky == "Rain")
    {
      weatherIcon = Icons.cloudy_snowing;
    }
    else if (curr_sky == "Clear")
    {
      weatherIcon = Icons.wb_sunny;
    }
    else
    {
      weatherIcon = Icons.help_outline;
    }

    return Icon(
      weatherIcon,
      size: 64,
    );

  }
}

