import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:weather_app_flutter/UI/Components/custom_chip.dart';
import 'package:weather_app_flutter/UI/Components/view_model.dart';
import 'package:weather_app_flutter/UI/Style/font_family.dart';
import 'package:intl/intl.dart';
import 'package:url_launcher/url_launcher.dart';

import 'package:weather_app_flutter/core/Localization/keys.dart';

class InformationCard extends StatefulWidget {
  const InformationCard({super.key});

  @override
  State<InformationCard> createState() => _InformationCardState();
}

class _InformationCardState extends State<InformationCard> {
  @override
  Widget build(BuildContext context) {
    ComponentController c = Get.put(ComponentController());
    return Obx(() {
      return AnimatedContainer(
        width: context.mediaQuery.size.width,
        height: c.containerHeight.value,
        duration: const Duration(milliseconds: 500),
        curve: Curves.ease,
        child: Card(
          child: Padding(
            padding: const EdgeInsets.all(
              8.0,
            ),
            child: Obx(() {
              return SingleChildScrollView(
                child: !c.isSearching.value
                    ? Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          tempCAndImage(),
                          nameOfPlaceAndStatu(),
                          timeOfCity(),
                          locationOfPlace(),
                          windAndHumidity(),
                          Row(
                            children: [
                              Expanded(
                                child: FilledButton(
                                  onPressed: () {
                                    launchUrl(
                                      Uri.parse(
                                        'https://maps.google.com/maps?z=12&t=m&q=loc:${c.current.value.location.lat},${c.current.value.location.lon}',
                                      ),
                                      mode: LaunchMode.externalApplication,
                                    );
                                  },
                                  child: Text(I18nKeys.MAPS.tr),
                                ),
                              ),
                            ],
                          ),
                        ],
                      )
                    : const Center(
                        child: CircularProgressIndicator(),
                      ),
              );
            }),
          ),
        ),
      );
    });
  }

  Padding tempCAndImage() {
    final ComponentController c = Get.put(ComponentController());
    var result = c.current.value;
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            '${result.current.tempC}°C',
            style: const TextStyle(fontSize: 45),
          ),
          Image.network(height: 64, width: 64, 'http:${result.current.condition.icon}')
        ],
      ),
    );
  }

  Row nameOfPlaceAndStatu() {
    final ComponentController c = Get.put(ComponentController());
    var result = c.current.value;
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Column(
          children: [
            Text(
              result.location.name,
              style: const TextStyle(fontSize: 25, fontFamily: FontFamily.COURGETTE),
            ),
            Text(
              result.current.condition.text,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(fontFamily: FontFamily.JURA),
            ),
          ],
        ),
      ],
    );
  }

  Column timeOfCity() {
    final ComponentController c = Get.put(ComponentController());
    var result = c.current.value;
    String dateStr = result.location.localtime;
    String formattedDateStr = dateStr.replaceAllMapped(RegExp(r'(\d{4}-\d{2}-\d{2}\s)(\d{1,2}):(\d{2})'),
        (match) => '${match[1]}${match[2]?.padLeft(2, '0')}:${match[3]}');
    DateTime dateTime = DateTime.parse(formattedDateStr);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomChip(
          iconColor: Colors.teal,
          borderColor: const Color.fromARGB(50, 0, 150, 136),
          title: DateFormat('yyyy MMMM dd EEEE HH:mm', Get.locale?.languageCode)
              .format(DateTime.parse(dateTime.toString())),
          icon: Icons.schedule,
          func: () {
            print('pressed');
          },
        ),
        CustomChip(
          iconColor: Colors.teal,
          borderColor: const Color.fromARGB(50, 0, 150, 136),
          title: result.location.tzId.toString(),
          icon: Icons.schedule,
          func: () {
            print('pressed');
          },
        ),
      ],
    );
  }

  SizedBox locationOfPlace() {
    final ComponentController c = Get.put(ComponentController());
    var result = c.current.value;
    return SizedBox(
      height: 50,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: [
          CustomChip(
            iconColor: Colors.indigoAccent,
            borderColor: const Color.fromARGB(50, 83, 109, 254),
            title: result.location.country.toString(),
            icon: Icons.outlined_flag,
            func: () {
              print('pressed');
            },
          ),
          CustomChip(
            iconColor: Colors.indigoAccent,
            borderColor: const Color.fromARGB(50, 83, 109, 254),
            title: result.location.region.toString(),
            func: () {
              print('pressed');
            },
          ),
        ],
      ),
    );
  }

  SizedBox windAndHumidity() {
    final ComponentController c = Get.put(ComponentController());
    var result = c.current.value;
    return SizedBox(
      height: 50,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: [
          CustomChip(
            iconColor: Colors.red,
            borderColor: const Color.fromARGB(50, 255, 0, 0),
            title: result.current.windDir.tr,
            icon: Icons.air,
            func: () {
              print('pressed');
            },
          ),
          CustomChip(
            iconColor: Colors.red,
            borderColor: const Color.fromARGB(50, 255, 0, 0),
            title: "${result.current.windMph}mph",
            icon: Icons.wind_power,
            func: () {
              print('pressed');
            },
          ),
          CustomChip(
            iconColor: Colors.lightBlue,
            borderColor: const Color.fromARGB(45, 0, 174, 255),
            title: result.current.humidity.toString(),
            icon: Icons.water_drop_outlined,
            func: () {
              print('pressed');
            },
          ),
        ],
      ),
    );
  }
}
