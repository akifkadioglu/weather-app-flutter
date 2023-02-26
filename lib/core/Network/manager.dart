import 'dart:convert';

import 'package:get/get.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:get/get_connect/http/src/status/http_status.dart';
import 'package:http/http.dart' as http;
import 'package:weather_app_flutter/core/Localization/keys.dart';
import 'package:weather_app_flutter/core/Network/routes.dart';
import 'package:weather_app_flutter/core/Snackbar/snackbar_manager.dart';

class NetworkManager {
  Future<T?> getMethod<T>(String path, {Function? modelFromJson, Map<String, String>? parameter}) async {
    bool isConnect = await InternetConnectionChecker().hasConnection;
    T? result;

    if (isConnect == false) {
      SnackbarManager.snackbar(
        I18nKeys.ERROR.tr,
        I18nKeys.SOMETHING_WENT_WRONG.tr,
      );
      return result;
    }
    try {
      var response = await http.get(
        Uri.parse(HTTPRoutes.BASE_URL + path).replace(queryParameters: parameter),
        headers: HTTPSettings.headers,
      );
      switch (response.statusCode) {
        case HttpStatus.ok:
          if (modelFromJson != null) {
            result = modelFromJson(utf8.decode(response.bodyBytes));
          }
          break;
        case HttpStatus.unprocessableEntity:
          final errors = jsonDecode(response.body)['errors'];
          SnackbarManager.snackbar(I18nKeys.ERROR.tr, errors[errors.keys.elementAt(0)][0]);
          break;
        case HttpStatus.forbidden:
          SnackbarManager.snackbar(I18nKeys.ERROR.tr, jsonDecode(response.body)['message']);
          break;
        case HttpStatus.badRequest:
          SnackbarManager.snackbar(I18nKeys.ERROR.tr, jsonDecode(response.body)['error']['message']);
          break;
        default:
          SnackbarManager.snackbar(I18nKeys.ERROR.tr, I18nKeys.SOMETHING_WENT_WRONG.tr);
      }
    } catch (e) {
      SnackbarManager.snackbar(
        I18nKeys.ERROR.tr,
        I18nKeys.SOMETHING_WENT_WRONG.tr,
      );
    }
    return result;
  }
}
