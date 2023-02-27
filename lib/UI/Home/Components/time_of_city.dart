import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:weather_app_flutter/UI/Components/custom_chip.dart';
import 'package:weather_app_flutter/UI/Components/view_model.dart';
import 'package:intl/intl.dart';

class TimeOfCity extends StatelessWidget {
  const TimeOfCity({super.key});

  @override
  Widget build(BuildContext context) {
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
          func: c.getInformation,
        ),
        CustomChip(
          iconColor: Colors.teal,
          borderColor: const Color.fromARGB(50, 0, 150, 136),
          title: result.location.tzId.toString(),
          icon: Icons.schedule,
          func: c.getInformation,
        ),
      ],
    );
  }
}
