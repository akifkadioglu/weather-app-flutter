import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:weather_app_flutter/core/Admob/admob_serice.dart';
import 'package:weather_app_flutter/core/Global/functions.dart';
import 'package:weather_app_flutter/core/Mocks/json_mock.dart';
import 'package:weather_app_flutter/core/Models/current_model.dart';
import 'package:weather_app_flutter/core/Network/manager.dart';
import 'package:weather_app_flutter/core/Network/routes.dart';

class ComponentController extends GetxController {
  InterstitialAd? _interstitialAd;

  var isDarkMode = true.obs;
  var containerHeight = 100.0.obs;
  var isSearching = false.obs;
  var current = currentModelFromJson(JSONMocks().current_mock).obs;
  var searchCount = 0.obs;
  changeTheme() {
    Get.changeTheme(Get.isDarkMode ? ThemeData.light() : ThemeData.dark());
    isDarkMode.value = Get.isDarkMode;
  }

  Future<void> searchWeather(String value) async {
    searchCount.value += 1;
    containerHeight.value = 100;
    isSearching.value = true;
    current.value = await NetworkManager().getMethod(
          HTTPRoutes.CURRENT,
          modelFromJson: currentModelFromJson,
          parameter: {
            "q": GlobalFunctions.convertToLatin(
                value != '' ? value : '${JSONMocks.location[0]}, ${JSONMocks.location[1]}'),
            "lang": Get.locale?.languageCode ?? 'en',
          },
        ) ??
        currentModelFromJson(JSONMocks().current_mock);
    isSearching.value = false;
    containerHeight.value = 450;
    if (searchCount.value % 2 == 0) {
      _loadInterstitialAd();
    }
  }

  void _loadInterstitialAd() {
    InterstitialAd.load(
      adUnitId: AdMobService.interstitialAdUnitID!,
      request: const AdRequest(),
      adLoadCallback: InterstitialAdLoadCallback(
        onAdLoaded: onAdLoaded,
        onAdFailedToLoad: (error) => _interstitialAd = null,
      ),
    );
  }

  void onAdLoaded(InterstitialAd ad) {
    _interstitialAd = ad;
    _interstitialAd!.show();
  }
}
