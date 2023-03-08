// To parse this JSON data, do
//
//     final currentModel = currentModelFromJson(jsonString);

import 'dart:convert';

CurrentModel currentModelFromJson(String str) => CurrentModel.fromJson(json.decode(str));

String currentModelToJson(CurrentModel data) => json.encode(data.toJson());

class CurrentModel {
    CurrentModel({
        required this.location,
        required this.current,
    });

    final Location location;
    final Current current;

    factory CurrentModel.fromJson(Map<String, dynamic> json) => CurrentModel(
        location: Location.fromJson(json["location"]),
        current: Current.fromJson(json["current"]),
    );

    Map<String, dynamic> toJson() => {
        "location": location.toJson(),
        "current": current.toJson(),
    };
}

class Current {
    Current({
        required this.lastUpdatedEpoch,
        required this.lastUpdated,
        required this.tempC,
        required this.tempF,
        required this.isDay,
        required this.condition,
        required this.windMph,
        required this.windKph,
        required this.windDegree,
        required this.windDir,
        required this.pressureMb,
        required this.pressureIn,
        required this.precipMm,
        required this.precipIn,
        required this.humidity,
        required this.cloud,
        required this.feelslikeC,
        required this.feelslikeF,
        required this.visKm,
        required this.visMiles,
        required this.uv,
        required this.gustMph,
        required this.gustKph,
        required this.airQuality,
    });

    final num lastUpdatedEpoch;
    final String lastUpdated;
    final num tempC;
    final num tempF;
    final num isDay;
    final Condition condition;
    final num windMph;
    final num windKph;
    final num windDegree;
    final String windDir;
    final num pressureMb;
    final num pressureIn;
    final num precipMm;
    final num precipIn;
    final num humidity;
    final num cloud;
    final num feelslikeC;
    final num feelslikeF;
    final num visKm;
    final num visMiles;
    final num uv;
    final num gustMph;
    final num gustKph;
    final AirQuality airQuality;

    factory Current.fromJson(Map<String, dynamic> json) => Current(
        lastUpdatedEpoch: json["last_updated_epoch"],
        lastUpdated: json["last_updated"],
        tempC: json["temp_c"]?.toDouble(),
        tempF: json["temp_f"]?.toDouble(),
        isDay: json["is_day"],
        condition: Condition.fromJson(json["condition"]),
        windMph: json["wind_mph"]?.toDouble(),
        windKph: json["wind_kph"]?.toDouble(),
        windDegree: json["wind_degree"],
        windDir: json["wind_dir"],
        pressureMb: json["pressure_mb"],
        pressureIn: json["pressure_in"]?.toDouble(),
        precipMm: json["precip_mm"]?.toDouble(),
        precipIn: json["precip_in"]?.toDouble(),
        humidity: json["humidity"],
        cloud: json["cloud"],
        feelslikeC: json["feelslike_c"]?.toDouble(),
        feelslikeF: json["feelslike_f"]?.toDouble(),
        visKm: json["vis_km"]?.toDouble(),
        visMiles: json["vis_miles"]?.toDouble(),
        uv: json["uv"]?.toDouble(),
        gustMph: json["gust_mph"]?.toDouble(),
        gustKph: json["gust_kph"]?.toDouble(),
        airQuality: AirQuality.fromJson(json["air_quality"]),
    );

    Map<String, dynamic> toJson() => {
        "last_updated_epoch": lastUpdatedEpoch,
        "last_updated": lastUpdated,
        "temp_c": tempC,
        "temp_f": tempF,
        "is_day": isDay,
        "condition": condition.toJson(),
        "wind_mph": windMph,
        "wind_kph": windKph,
        "wind_degree": windDegree,
        "wind_dir": windDir,
        "pressure_mb": pressureMb,
        "pressure_in": pressureIn,
        "precip_mm": precipMm,
        "precip_in": precipIn,
        "humidity": humidity,
        "cloud": cloud,
        "feelslike_c": feelslikeC,
        "feelslike_f": feelslikeF,
        "vis_km": visKm,
        "vis_miles": visMiles,
        "uv": uv,
        "gust_mph": gustMph,
        "gust_kph": gustKph,
        "air_quality": airQuality.toJson(),
    };
}

class AirQuality {
    AirQuality({
        required this.co,
        required this.no2,
        required this.o3,
        required this.so2,
        required this.pm25,
        required this.pm10,
        required this.usEpaIndex,
        required this.gbDefraIndex,
    });

    final num co;
    final num no2;
    final num o3;
    final num so2;
    final num pm25;
    final num pm10;
    final num usEpaIndex;
    final num gbDefraIndex;

    factory AirQuality.fromJson(Map<String, dynamic> json) => AirQuality(
        co: json["co"]?.toDouble(),
        no2: json["no2"]?.toDouble(),
        o3: json["o3"]?.toDouble(),
        so2: json["so2"]?.toDouble(),
        pm25: json["pm2_5"]?.toDouble(),
        pm10: json["pm10"],
        usEpaIndex: json["us-epa-index"],
        gbDefraIndex: json["gb-defra-index"],
    );

    Map<String, dynamic> toJson() => {
        "co": co,
        "no2": no2,
        "o3": o3,
        "so2": so2,
        "pm2_5": pm25,
        "pm10": pm10,
        "us-epa-index": usEpaIndex,
        "gb-defra-index": gbDefraIndex,
    };
}

class Condition {
    Condition({
        required this.text,
        required this.icon,
        required this.code,
    });

    final String text;
    final String icon;
    final num code;

    factory Condition.fromJson(Map<String, dynamic> json) => Condition(
        text: json["text"],
        icon: json["icon"],
        code: json["code"],
    );

    Map<String, dynamic> toJson() => {
        "text": text,
        "icon": icon,
        "code": code,
    };
}

class Location {
    Location({
        required this.name,
        required this.region,
        required this.country,
        required this.lat,
        required this.lon,
        required this.tzId,
        required this.localtimeEpoch,
        required this.localtime,
    });

    final String name;
    final String region;
    final String country;
    final num lat;
    final num lon;
    final String tzId;
    final num localtimeEpoch;
    final String localtime;

    factory Location.fromJson(Map<String, dynamic> json) => Location(
        name: json["name"],
        region: json["region"],
        country: json["country"],
        lat: json["lat"]?.toDouble(),
        lon: json["lon"]?.toDouble(),
        tzId: json["tz_id"],
        localtimeEpoch: json["localtime_epoch"],
        localtime: json["localtime"],
    );

    Map<String, dynamic> toJson() => {
        "name": name,
        "region": region,
        "country": country,
        "lat": lat,
        "lon": lon,
        "tz_id": tzId,
        "localtime_epoch": localtimeEpoch,
        "localtime": localtime,
    };
}
