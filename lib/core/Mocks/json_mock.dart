import 'package:get/get.dart';
import 'package:weather_app_flutter/core/Localization/keys.dart';

class JSONMocks {
  static var location = [37.73811198003289, 29.103935381582524];
  String currentMock = '''
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
                    "gust_kph": 53.3,
                    "air_quality": {
                        "co": 847.7999877929688,
                        "no2": 76.0999984741211,
                        "o3": 8.899999618530273,
                        "so2": 64.9000015258789,
                        "pm2_5": 76.5999984741211,
                        "pm10": 111.0,
                        "us-epa-index": 4,
                        "gb-defra-index": 10
                    }
                },
                "forecast": {
                  "forecastday": [
                    {
                      "date": "2023-03-09",
                      "date_epoch": 1678320000,
                      "day": {
                        "maxtemp_c": 19.3,
                        "maxtemp_f": 66.7,
                        "mintemp_c": 3.6,
                        "mintemp_f": 38.5,
                        "avgtemp_c": 10.2,
                        "avgtemp_f": 50.4,
                        "maxwind_mph": 11.9,
                        "maxwind_kph": 19.1,
                        "totalprecip_mm": 0.0,
                        "totalprecip_in": 0.0,
                        "totalsnow_cm": 0.0,
                        "avgvis_km": 10.0,
                        "avgvis_miles": 6.0,
                        "avghumidity": 57.0,
                        "daily_will_it_rain": 0,
                        "daily_chance_of_rain": 0,
                        "daily_will_it_snow": 0,
                        "daily_chance_of_snow": 0,
                        "condition": {
                          "text": "",
                          "icon": "",
                          "code": 1000
                        },
                        "uv": 4.0
                      },
                      "astro": {
                        "sunrise": "07:25 AM",
                        "sunset": "07:05 PM",
                        "moonrise": "09:03 PM",
                        "moonset": "08:25 AM",
                        "moon_phase": "Waning Gibbous",
                        "moon_illumination": "98",
                        "is_moon_up": 1,
                        "is_sun_up": 0
                      },
                      "hour": [
                        {
                          "time_epoch": 1678392000,
                          "time": "2023-03-09 23:00",
                          "temp_c": 6.4,
                          "temp_f": 43.5,
                          "is_day": 0,
                          "condition": {
                            "text": "",
                            "icon": "//cdn.weatherapi.com/weather/64x64/day/116.png",
                            "code": 1000
                          },
                          "wind_mph": 7.4,
                          "wind_kph": 11.9,
                          "wind_degree": 196,
                          "wind_dir": "",
                          "pressure_mb": 1015.0,
                          "pressure_in": 29.97,
                          "precip_mm": 0.0,
                          "precip_in": 0.0,
                          "humidity": 75,
                          "cloud": 5,
                          "feelslike_c": 4.0,
                          "feelslike_f": 39.2,
                          "windchill_c": 4.0,
                          "windchill_f": 39.2,
                          "heatindex_c": 6.4,
                          "heatindex_f": 43.5,
                          "dewpoint_c": 2.3,
                          "dewpoint_f": 36.1,
                          "will_it_rain": 0,
                          "chance_of_rain": 0,
                          "will_it_snow": 0,
                          "chance_of_snow": 0,
                          "vis_km": 10.0,
                          "vis_miles": 6.0,
                          "gust_mph": 15.4,
                          "gust_kph": 24.8,
                          "uv": 1.0
                        }
                      ]
                    }
                  ]
                }
            }''';
}
