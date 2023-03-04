import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:weather_app_flutter/UI/Components/custom_appbar.dart';
import 'package:weather_app_flutter/UI/Components/custom_text_input.dart';
import 'package:weather_app_flutter/UI/Components/view_model.dart';
import 'package:weather_app_flutter/UI/Home/Components/information_card.dart';
import 'package:weather_app_flutter/core/Localization/keys.dart';
import 'package:weather_app_flutter/core/base/state/base_state.dart';
import 'package:weather_app_flutter/core/base/view/base_view.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  BaseState<Home> createState() => _HomeState();
}

class _HomeState extends BaseState<Home> {
  ComponentController c = Get.put(ComponentController());
  @override
  void initState() {
    c.searchWeather('');
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BaseView(
      onPageBuilder: (context) {
        return Scaffold(
          appBar: const PreferredSize(
            preferredSize: Size.fromHeight(60.0),
            child: CustomAppBar(title: I18nKeys.APP_NAME),
          ),
          body: SingleChildScrollView(
            child: Column(
              children: const [
                CustomTextInput(),
                InformationCard(),
              ],
            ),
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: () => c.takeScreenshot(context),
            child: const Icon(Icons.gesture),
          ),
          resizeToAvoidBottomInset: false,
        );
      },
    );
  }
}
