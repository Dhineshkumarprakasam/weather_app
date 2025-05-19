import 'package:flutter/material.dart';
import 'package:weather_app/additional_info_card.dart';

//colors
const primary_color = Colors.redAccent;
const text_color = Color.fromRGBO(100, 181, 246, 1);

IconData findIcon(String curr_sky) {
  IconData weatherIcon;
  if (curr_sky == "Clouds") {
    weatherIcon = Icons.cloud;
  }
  else if (curr_sky == "Rain") {
    weatherIcon = Icons.cloudy_snowing;
  }
  else if (curr_sky == "Clear") {
    weatherIcon = Icons.wb_sunny;
  }
  else {
    weatherIcon = Icons.help_outline;
  }

  return weatherIcon;
}


class weatherForecast extends StatelessWidget {
  final data;
  const weatherForecast({super.key,required this.data});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        for(int i=1;i<5;i++)
          forecastItem(icon: findIcon(data['list'][i]['weather'][0]['main']), time: data['list'][i]['dt_txt'].substring(11,16), value: (data['list'][i]['main']['temp']-273.15).toStringAsFixed(2)+" °C")
      ],
    );
  }
}

class forecastItem extends StatelessWidget {
  final IconData icon;
  final String time;
  final String value;
  const forecastItem({
    super.key,
    required this.icon,
    required this.time,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 107,
      child: Card(
        color: card_color,
        child: Column(
          children: [
            const SizedBox(height: 8,),

            Text(
              time,
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: text_color,
              ),
            ),

            const SizedBox(height: 8,),

            Icon(
              icon,
              size: 32,
            ),

            const SizedBox(height: 8,),

            Text(
              value,
              style: TextStyle(
                fontSize: 16,
                color: text_color,
              ),
            ),

            const SizedBox(height: 8,),

          ],
        ),
      ),
    );
  }
}


