import 'package:flutter/material.dart';
import 'package:weather_app_flutter/UI/Components/custom_chip.dart';

class ForecastCard extends StatefulWidget {
  const ForecastCard({super.key});

  @override
  State<ForecastCard> createState() => _ForecastCardState();
}

class _ForecastCardState extends State<ForecastCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      color: Colors.red,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: [
          Container(
            color: Colors.blue,
            height: 100,
            width: 100,
          ),
          Container(
            color: Colors.green,
            height: 100,
            width: 100,
          ),
          Container(
            color: Colors.teal,
            height: 100,
            width: 100,
          ),
          Container(
            color: Colors.purple,
            height: 100,
            width: 100,
          ),
        ],
      ),
    );
  }
}
