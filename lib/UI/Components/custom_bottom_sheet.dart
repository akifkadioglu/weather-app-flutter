import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:weather_app_flutter/UI/Components/view_model.dart';
import 'package:weather_app_flutter/core/Localization/keys.dart';

class CustomBottomSheet extends StatefulWidget {
  const CustomBottomSheet({super.key});

  @override
  State<CustomBottomSheet> createState() => _CustomBottomSheetState();
}

class _CustomBottomSheetState extends State<CustomBottomSheet> {
  ComponentController c = Get.put(ComponentController());
  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return AnimatedContainer(
        color: c.bottomSheetColor.value,
        curve: Curves.fastLinearToSlowEaseIn,
        height: c.bottomSheetHeight.value,
        width: context.mediaQuery.size.width,
        duration: const Duration(seconds: 1),
        child: Center(child: Text(I18nKeys.STAR_REQUEST.tr)),
      );
    });
  }
}
