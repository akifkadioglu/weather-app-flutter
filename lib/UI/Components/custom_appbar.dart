import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:weather_app_flutter/UI/Style/font_family.dart';
import 'package:weather_app_flutter/color_schemes.g.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({
    super.key,
    required this.title,
  });
  final String title;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(title.tr),
      elevation: 3,
      backgroundColor: lightColorScheme.primary,
      titleTextStyle: const TextStyle(
        fontSize: 22,
        fontFamily: FontFamily.JURA,
      ),
      centerTitle: true,
    );
  }
}
