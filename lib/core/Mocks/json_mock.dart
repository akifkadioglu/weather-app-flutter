import 'package:get/get.dart';
import 'package:weather_app_flutter/core/Localization/keys.dart';

class JSONMocks {
  static var location = [37.73811198003289, 29.103935381582524];
  String current_mock = '''
              {
                "custom_id": "my-id-1",
                "q": "53,-0.12",
                "location": {
                    "name": "${I18nKeys.SORRY.tr}",
                    "region": "Denizli",
                    "country": "Turkiye",
                    "lat": ${location[0]},
                    "lon": ${location[1]},
                    "tz_id": "www.akifkadioglu.dev",
                    "localtime_epoch": 1673620218,
                    "localtime": "${DateTime.now()}"
                },
                "current": {
                    "last_updated_epoch": 1673620200,
                    "last_updated": "2023-01-13 14:30",
                    "temp_c": 8.7,
                    "temp_f": 47.7,
                    "is_day": 1,
                    "condition": {
                        "text": "${I18nKeys.SOMETHING_WENT_WRONG.tr}",
                        "icon": "//cdn.weatherapi.com/weather/64x64/day/116.png",
                        "code": 1003
                    },
                    "wind_mph": 1.06,
                    "wind_kph": 38.9,
                    "wind_degree": 260,
                    "wind_dir": "W",
                    "pressure_mb": 1005.0,
                    "pressure_in": 29.68,
                    "precip_mm": 0.0,
                    "precip_in": 0.0,
                    "humidity": 21,
                    "cloud": 75,
                    "feelslike_c": 4.4,
                    "feelslike_f": 39.9,
                    "vis_km": 10.0,
                    "vis_miles": 6.0,
                    "uv": 2.0,
                    "gust_mph": 33.1,
                    "gust_kph": 53.3
                }
            }''';
}
