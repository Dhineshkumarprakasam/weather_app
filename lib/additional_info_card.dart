import 'package:flutter/material.dart';

//colors
const primary_color = Colors.redAccent;
const text_color = Color.fromRGBO(100, 181, 246, 1);
const card_color =Color.fromRGBO(44, 50, 39, 1);

class additionalInfoCard extends StatelessWidget {
  final data;
  const additionalInfoCard({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 20),
      child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            additionalInfoItem(icon: Icons.water_drop, label: 'Humidity', value: data["list"][0]["main"]["humidity"].toString()),
            additionalInfoItem(icon: Icons.air, label: 'Wind Speed', value: data["list"][0]["wind"]["speed"].toString()),
            additionalInfoItem(icon: Icons.beach_access, label: 'Pressure', value: data["list"][0]["main"]["pressure"].toString()),
          ]
      ),
    );
  }
}

class additionalInfoItem extends StatelessWidget {
  final IconData icon;
  final String label;
  final String value;

  const additionalInfoItem({
    super.key,
    required this.icon,
    required this.label,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
        children: [
          Icon(
            icon,
            size: 32,
          ),

          const SizedBox(height: 8,),

          Text(
            label,
            style: TextStyle(
              fontSize: 16,
              color: text_color,
            ),
          ),
          const SizedBox(height: 8,),
          Text(
            value,
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: text_color,
            ),
          ),
          const SizedBox(height: 8,),
        ]
    );
  }
}