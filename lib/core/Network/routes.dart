import 'package:weather_app_flutter/env.dart';

class HTTPRoutes {
  static const String CURRENT = '/current.json';
  static const String FUTURE = '/future.json';
  static const String BASE_URL = 'http://api.weatherapi.com/v1';
}

class HTTPSettings {
  static Map<String, String> headers = {
    'accept': 'Application/json',
    'content-type': 'Application/json',
    'key': Env.WEATHER_KEY,
  };
}
