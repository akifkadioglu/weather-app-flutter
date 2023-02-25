import 'package:flutter/material.dart';
import 'package:get/get.dart';

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
      backgroundColor: const Color(0xFF00629D),
      titleTextStyle: const TextStyle(
        fontSize: 22,
        fontFamily: 'Jura',
      ),
      actions: [
        IconButton(
          icon: const Icon(Icons.dark_mode),
          color: Colors.white,
          onPressed: () {
            Get.changeTheme(Get.isDarkMode ? ThemeData.light() : ThemeData.dark());
          },
        ),
      ],
    );
  }
}
