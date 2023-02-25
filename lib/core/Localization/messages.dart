import 'package:get/get.dart';
import 'package:weather_app_flutter/core/Localization/en.dart';
import 'package:weather_app_flutter/core/Localization/tr.dart';

class AppTranslations extends Translations {
  static const List<String> rtlLanguages = [
    'tr',
    'en',
  ];
  @override
  Map<String, Map<String, String>> get keys => {
        'en_US': English.messages,
        'tr_TR': Turkish.messages,
      };
}
