import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:weather_app_flutter/UI/Components/custom_chip.dart';
import 'package:weather_app_flutter/UI/Components/view_model.dart';
import 'package:weather_app_flutter/core/Localization/keys.dart';

class AirQuality extends StatelessWidget {
  const AirQuality({super.key});

  @override
  Widget build(BuildContext context) {
    final ComponentController c = Get.put(ComponentController());
    var result = c.current.value;
    var healthColor = Color.fromARGB(255, 0, 255 - (40 * result.current.airQuality.usEpaIndex.toInt()), 0);

    return SizedBox(
      height: 50,
      child: Row(
        children: [
          Flexible(
            child: CustomChip(
              iconColor: healthColor,
              borderColor: healthColor,
              title: result.current.airQuality.usEpaIndex.toString().tr,
              icon: Icons.health_and_safety,
              description: I18nKeys.HEALTH.tr,
            ),
          ),
          CustomChip(
            iconColor: Colors.lightBlue,
            borderColor: const Color.fromARGB(45, 0, 174, 255),
            title: "%${result.current.humidity.toString()}",
            icon: Icons.water_drop_outlined,
            description: I18nKeys.HUMIDITY.tr,
          ),
        ],
      ),
    );
  }
}