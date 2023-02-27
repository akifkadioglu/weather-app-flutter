import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:weather_app_flutter/UI/Components/view_model.dart';

class TempCAndImage extends StatelessWidget {
  const TempCAndImage({super.key});

  @override
  Widget build(BuildContext context) {
    final ComponentController c = Get.put(ComponentController());
    var result = c.current.value;
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            '${result.current.tempC}°C',
            style: const TextStyle(fontSize: 45),
          ),
          Image.network(height: 64, width: 64, 'http:${result.current.condition.icon}')
        ],
      ),
    );
  }
}
