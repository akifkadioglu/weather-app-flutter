import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:weather_app_flutter/UI/Components/view_model.dart';
import 'package:weather_app_flutter/UI/Style/font_family.dart';

class NameOfPlaceAndStatu extends StatelessWidget {
  const NameOfPlaceAndStatu({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final ComponentController c = Get.put(ComponentController());
    var result = c.current.value;
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Column(
          children: [
            Text(
              result.location.name,
              style: const TextStyle(fontSize: 25, fontFamily: FontFamily.COURGETTE),
            ),
            Text(
              result.current.condition.text,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(fontFamily: FontFamily.JURA),
            ),
          ],
        ),
      ],
    );
  }
}
