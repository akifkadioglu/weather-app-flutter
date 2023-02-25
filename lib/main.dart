import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:weather_app_flutter/core/Localization/languages.dart';
import 'UI/Home/home.dart';
import 'color_schemes.g.dart';
import 'core/Localization/messages.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
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
        useMaterial3: true,
        colorScheme: lightColorScheme,
      ),
      darkTheme: ThemeData(useMaterial3: true, colorScheme: darkColorScheme),
      home: const Home(),
      debugShowCheckedModeBanner: false,
    );
  }
}
