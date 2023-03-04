import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SnackbarManager {
  static SnackbarController snackbar(String? title, String? message) {
    return Get.showSnackbar(
      GetSnackBar(
        title: title,
        message: message,
        duration: const Duration(seconds: 3),
      ),
    );
  }

  static SnackbarController infoSnackbar(String title, String message) {
    return Get.showSnackbar(
      GetSnackBar(
        backgroundColor: Colors.blue,
        forwardAnimationCurve: Curves.elasticInOut,
        animationDuration: const Duration(seconds: 2),
        title: title,
        message: message,
        duration: const Duration(seconds: 2),
      ),
    );
  }
}
