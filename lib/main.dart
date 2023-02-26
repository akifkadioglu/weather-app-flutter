import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:weather_app_flutter/core/Localization/keys.dart';
import 'package:weather_app_flutter/core/Localization/languages.dart';
import 'UI/Home/home.dart';
import 'color_schemes.g.dart';
import 'core/Localization/messages.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  MobileAds.instance.initialize();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: I18nKeys.APP_NAME.tr,
      translations: AppTranslations(),
      supportedLocales: const [
        Languages.ENGLISH,
        Languages.TURKISH,
      ],
      fallbackLocale: Languages.ENGLISH,
      locale: Get.deviceLocale,
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      theme: ThemeData(
        colorScheme: lightColorScheme,
      ),
      darkTheme: ThemeData(
        colorScheme: darkColorScheme,
      ),
      home: const Home(),
      debugShowCheckedModeBanner: false,
    );
  }
}
