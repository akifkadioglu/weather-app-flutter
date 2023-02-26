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
}
