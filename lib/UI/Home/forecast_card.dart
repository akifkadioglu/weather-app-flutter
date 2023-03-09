import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:weather_app_flutter/UI/Components/view_model.dart';
import 'package:intl/intl.dart';
import 'package:weather_app_flutter/UI/Style/font_family.dart';

class ForecastCard extends StatelessWidget {
  const ForecastCard({super.key});

  @override
  Widget build(BuildContext context) {
    ComponentController c = Get.put(ComponentController());
    return SizedBox(
      height: 120,
      child: Obx(
        () {
          var forecastday = c.current.value.forecast.forecastday[0];
          if (c.isSearching.isFalse) {
            return ListView.builder(
              physics: const BouncingScrollPhysics(),
              scrollDirection: Axis.horizontal,
              itemCount: c.current.value.forecast.forecastday[0].hour.length,
              itemBuilder: (BuildContext context, int index) {
                return Card(
                  child: Padding(
                    padding: const EdgeInsets.all(3.0),
                    child: SizedBox(
                      height: 90,
                      width: 90,
                      child: Stack(
                        children: [
                          SizedBox(
                            height: 32,
                            width: 32,
                            child: Image.network('http:${forecastday.hour[index].condition.icon}'),
                          ),
                          Center(
                            child: Text(
                              '${forecastday.hour[index].tempC.toString()}°C',
                              style: const TextStyle(
                                fontSize: 25,
                                fontFamily: FontFamily.JURA,
                              ),
                            ),
                          ),
                          Align(
                            alignment: Alignment.bottomCenter,
                            child: Text(
                              DateFormat('HH:mm', Get.locale?.languageCode).format(
                                DateTime.parse(
                                  forecastday.hour[index].time.toString(),
                                ),
                              ),
                              style: const TextStyle(fontSize: 12),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            );
          } else {
            return const SizedBox(
              height: 100,
            );
          }
        },
      ),
    );
  }
}
