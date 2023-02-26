import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:weather_app_flutter/UI/Components/view_model.dart';
import 'package:weather_app_flutter/core/Localization/keys.dart';

class CustomTextInput extends StatefulWidget {
  const CustomTextInput({super.key});

  @override
  State<CustomTextInput> createState() => _CustomTextInputState();
}

class _CustomTextInputState extends State<CustomTextInput> {
  @override
  Widget build(BuildContext context) {
    final ComponentController c = Get.put(ComponentController());
    var _controller = TextEditingController();

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Obx(() {
        return Container(
          width: context.mediaQuery.size.width,
          decoration: BoxDecoration(
            color:
                c.isDarkMode.value ? const Color.fromARGB(255, 228, 228, 228) : const Color.fromARGB(255, 66, 71, 78),
            borderRadius: BorderRadius.circular(32),
          ),
          child: TextField(
            controller: _controller,
            keyboardType: TextInputType.name,
            onSubmitted: c.searchWeather,
            textInputAction: TextInputAction.search,
            decoration: InputDecoration(
              hintText: I18nKeys.ENTER_CITY_NAME.tr,
              hintStyle: const TextStyle(fontWeight: FontWeight.w400),
              border: InputBorder.none,
              contentPadding: const EdgeInsets.only(top: 15, left: 15),
              suffixIcon: IconButton(
                icon: const Icon(Icons.search),
                onPressed: () {
                  c.searchWeather(_controller.text);
                },
              ),
            ),
          ),
        );
      }),
    );
  }
}
