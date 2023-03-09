import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:weather_app_flutter/UI/Components/custom_chip.dart';
import 'package:weather_app_flutter/UI/Components/view_model.dart';
import 'package:weather_app_flutter/core/Localization/keys.dart';

class LocationOfPlace extends StatelessWidget {
  const LocationOfPlace({super.key});

  @override
  Widget build(BuildContext context) {
    final ComponentController c = Get.put(ComponentController());
    var result = c.current.value;
    return SizedBox(
      height: 50,
      child: ListView(
        physics: const BouncingScrollPhysics(),
        scrollDirection: Axis.horizontal,
        children: [
          CustomChip(
            iconColor: Colors.indigoAccent,
            borderColor: const Color.fromARGB(50, 83, 109, 254),
            title: result.location.country.toString(),
            icon: Icons.outlined_flag,
            description: I18nKeys.COUNTRY.tr,
          ),
          CustomChip(
            iconColor: Colors.indigoAccent,
            borderColor: const Color.fromARGB(50, 83, 109, 254),
            title: result.location.region.toString(),
            description: I18nKeys.REGION.tr,
          ),
        ],
      ),
    );
  }
}
