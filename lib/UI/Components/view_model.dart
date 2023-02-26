import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:weather_app_flutter/core/Global/functions.dart';
import 'package:weather_app_flutter/core/Mocks/json_mock.dart';
import 'package:weather_app_flutter/core/Models/current_model.dart';
import 'package:weather_app_flutter/core/Network/manager.dart';
import 'package:weather_app_flutter/core/Network/routes.dart';

class ComponentController extends GetxController {
  var isDarkMode = true.obs;
  changeTheme() {
    Get.changeTheme(Get.isDarkMode ? ThemeData.light() : ThemeData.dark());
    isDarkMode.value = Get.isDarkMode;
  }

  var current = currentModelFromJson(JSONMocks.current_mock).obs;
  Future<void> searchWeather(String value) async {
    current.value = await NetworkManager().getMethod(
          HTTPRoutes.CURRENT,
          modelFromJson: currentModelFromJson,
          parameter: {
            "q": GlobalFunctions.convertToLatin(value),
            "lang": Get.locale?.languageCode ?? 'en',
          },
        ) ??
        currentModelFromJson(JSONMocks.current_mock);
  }
}
