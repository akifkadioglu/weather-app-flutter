import 'package:flutter/material.dart';
import 'package:screenshot/screenshot.dart';
import 'package:weather_app_flutter/UI/Components/view_model.dart';
import 'package:weather_app_flutter/UI/Home/InformationComponents/air_quality.dart';
import 'package:weather_app_flutter/UI/Home/forecast_card.dart';
import 'package:weather_app_flutter/UI/Home/InformationComponents/location_of_place.dart';
import 'package:weather_app_flutter/UI/Home/InformationComponents/name_of_place_and_statu.dart';
import 'package:weather_app_flutter/UI/Home/InformationComponents/temp_c_and_image.dart';
import 'package:weather_app_flutter/UI/Home/InformationComponents/time_of_city.dart';
import 'package:weather_app_flutter/UI/Home/InformationComponents/wind_and_humidity.dart';
import 'package:weather_app_flutter/color_schemes.g.dart';
import 'package:weather_app_flutter/core/Localization/keys.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:get/get.dart';

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
        child: Obx(() {
          return SingleChildScrollView(
            child: !c.isSearching.value
                ? Screenshot(
                    controller: c.screenshotController,
                    child: Container(
                      color: lightColorScheme.background,
                      child: Card(
                        elevation: 0,
                        color: lightColorScheme.background,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const TempCAndImage(),
                              const NameOfPlaceAndStatu(),
                              const TimeOfCity(),
                              const LocationOfPlace(),
                              const WindAndHumidity(),
                              const AirQuality(),
                              mapsAndShareButton(c),
                            ],
                          ),
                        ),
                      ),
                    ),
                  )
                : const Center(
                    child: CircularProgressIndicator(),
                  ),
          );
        }),
      );
    });
  }

  Row mapsAndShareButton(ComponentController c) {
    return Row(
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
        GestureDetector(
          onTap: () {
            c.takeScreenshot(context);
          },
          child: Transform.scale(
            scaleX: -1,
            child: SizedBox(
              width: 50,
              child: Icon(
                color: lightColorScheme.secondary,
                Icons.reply_all,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
