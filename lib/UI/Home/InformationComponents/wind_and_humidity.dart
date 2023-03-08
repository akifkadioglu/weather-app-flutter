import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:weather_app_flutter/UI/Components/custom_chip.dart';
import 'package:weather_app_flutter/UI/Components/view_model.dart';
import 'package:weather_app_flutter/core/Localization/keys.dart';

class WindAndHumidity extends StatelessWidget {
  const WindAndHumidity({super.key});

  @override
  Widget build(BuildContext context) {
    final ComponentController c = Get.put(ComponentController());
    var result = c.current.value;
    return SizedBox(
      height: 50,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: [
          CustomChip(
            iconColor: Colors.red,
            borderColor: const Color.fromARGB(50, 255, 0, 0),
            title: result.current.windDir.tr,
            icon: Icons.air,
            description: I18nKeys.WIND_DIRECTION.tr,
          ),
          CustomChip(
            iconColor: Colors.red,
            borderColor: const Color.fromARGB(50, 255, 0, 0),
            title: "${result.current.windMph}mph",
            icon: Icons.wind_power,
            description: I18nKeys.WIND_POWER.tr,
          ),
        ],
      ),
    );
  }
}
