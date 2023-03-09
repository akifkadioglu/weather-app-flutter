import 'package:bottom_sheet/bottom_sheet.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:weather_app_flutter/UI/Components/custom_appbar.dart';
import 'package:weather_app_flutter/UI/Components/custom_text_input.dart';
import 'package:weather_app_flutter/UI/Components/view_model.dart';
import 'package:weather_app_flutter/UI/Home/forecast_card.dart';
import 'package:weather_app_flutter/UI/Home/information_card.dart';
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
          body: Column(
            children: [
              Expanded(
                child: ListView(
                  physics: const BouncingScrollPhysics(),
                  children: const [
                    CustomTextInput(),
                    InformationCard(),
                  ],
                ),
              ),
              if (MediaQuery.of(context).viewInsets.bottom == 0.0)
                Obx(() {
                  return IconButton(
                    onPressed: c.isSearching.isFalse
                        ? () {
                            showFlexibleBottomSheet(
                              bottomSheetColor: Colors.white,
                              minHeight: 0,
                              initHeight: 120 / context.height,
                              maxHeight: 120 / context.height,
                              builder:
                                  (BuildContext context, ScrollController scrollController, double bottomSheetOffset) {
                                return Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: const [
                                    ForecastCard(),
                                  ],
                                );
                              },
                              context: context,
                            );
                          }
                        : null,
                    icon: c.isSearching.value
                        ? const SizedBox(
                            height: 15,
                            width: 15,
                            child: CircularProgressIndicator(
                              strokeWidth: 2,
                            ),
                          )
                        : const Icon(Icons.expand_less),
                  );
                }),
            ],
          ),
        );
      },
    );
  }
}
