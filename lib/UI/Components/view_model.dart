import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:get/get.dart';
import 'package:path_provider/path_provider.dart';
import 'package:screenshot/screenshot.dart';
import 'package:share_plus/share_plus.dart';
import 'package:weather_app_flutter/core/Global/functions.dart';
import 'package:weather_app_flutter/core/Localization/keys.dart';
import 'package:weather_app_flutter/core/Mocks/json_mock.dart';
import 'package:weather_app_flutter/core/Models/current_model.dart';
import 'package:weather_app_flutter/core/Network/manager.dart';
import 'package:weather_app_flutter/core/Network/routes.dart';
import 'package:weather_app_flutter/core/storage/storage.dart';

class ComponentController extends GetxController {
  var isDarkMode = true.obs;
  var containerHeight = 100.0.obs;
  var isSearching = false.obs;
  var current = currentModelFromJson(JSONMocks().current_mock).obs;
  var adState = false.obs;
  var bottomSheetHeight = 0.0.obs;
  var bottomSheetColor = const Color.fromARGB(255, 231, 54, 42).obs;
  ScreenshotController screenshotController = ScreenshotController();

  void getInformation() {
    bottomSheetHeight.value = bottomSheetHeight.value == 0 ? 150 / 2 : 0;
    bottomSheetColor.value = bottomSheetHeight.value == 0
        ? const Color.fromARGB(255, 231, 54, 42)
        : const Color.fromARGB(255, 255, 255, 255);
  }

  void changeTheme() {
    Get.changeTheme(Get.isDarkMode ? ThemeData.light() : ThemeData.dark());
    isDarkMode.value = Get.isDarkMode;
  }

  Future<void> searchWeather(String value) async {
    adState.value = !adState.value;
    containerHeight.value = 70;
    isSearching.value = true;
    var lat = StorageManager.instance.getData(StorageManager.LAST_LAT);
    var long = StorageManager.instance.getData(StorageManager.LAST_LONG);
    current.value = await NetworkManager().getMethod(
          HTTPRoutes.CURRENT,
          modelFromJson: currentModelFromJson,
          parameter: {
            "q": GlobalFunctions.convertToLatin(value != '' ? value : '$lat, $long'),
            "lang": Get.locale?.languageCode ?? 'en',
          },
        ) ??
        currentModelFromJson(JSONMocks().current_mock);
    StorageManager.instance.setData(StorageManager.LAST_LAT, current.value.location.lat);
    StorageManager.instance.setData(StorageManager.LAST_LONG, current.value.location.lon);
    isSearching.value = false;
    containerHeight.value = 430;
  }

  void takeScreenshot(BuildContext context) async {
    await screenshotController.capture().then((bytes) async {
      final Directory output = await getTemporaryDirectory();
      final String screenshotFilePath = '${output.path}/image.png';
      final File screenshotFile = File(screenshotFilePath);
      await screenshotFile.writeAsBytes(bytes!);

      if (screenshotFilePath.isNotEmpty) {
        Share.shareXFiles(
          [
            XFile(screenshotFilePath),
          ],
          text: I18nKeys.SCREENSHOT_TEXT.tr,
          sharePositionOrigin: () {
            RenderBox? box = context.findRenderObject() as RenderBox?;
            return box!.localToGlobal(Offset.zero) & box.size;
          }(),
        );
      }
    }).catchError((onError) {
      print(onError);
    });
  }
}
