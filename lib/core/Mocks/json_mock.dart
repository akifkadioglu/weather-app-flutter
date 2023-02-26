class JSONMocks {
  static String current_mock = '''
              {
                "custom_id": "my-id-1",
                "q": "53,-0.12",
                "location": {
                    "name": "Boston",
                    "region": "Lincolnshire",
                    "country": "United Kingdom",
                    "lat": 53.0,
                    "lon": -0.12,
                    "tz_id": "Europe/London",
                    "localtime_epoch": 1673620218,
                    "localtime": "2023-01-13 14:30"
                },
                "current": {
                    "last_updated_epoch": 1673620200,
                    "last_updated": "2023-01-13 14:30",
                    "temp_c": 8.7,
                    "temp_f": 47.7,
                    "is_day": 1,
                    "condition": {
                        "text": "Partly cloudy",
                        "icon": "//cdn.weatherapi.com/weather/64x64/day/116.png",
                        "code": 1003
                    },
                    "wind_mph": 24.2,
                    "wind_kph": 38.9,
                    "wind_degree": 260,
                    "wind_dir": "W",
                    "pressure_mb": 1005.0,
                    "pressure_in": 29.68,
                    "precip_mm": 0.0,
                    "precip_in": 0.0,
                    "humidity": 74,
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
