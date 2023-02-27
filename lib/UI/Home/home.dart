import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:path_provider/path_provider.dart';
import 'package:screenshot/screenshot.dart';
import 'package:share_plus/share_plus.dart';
import 'package:weather_app_flutter/UI/Components/custom_appbar.dart';
import 'package:weather_app_flutter/UI/Components/custom_bottom_sheet.dart';
import 'package:weather_app_flutter/UI/Components/custom_text_input.dart';
import 'package:weather_app_flutter/UI/Components/view_model.dart';
import 'package:weather_app_flutter/UI/Home/Components/information_card.dart';
import 'package:weather_app_flutter/core/Localization/keys.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  ScreenshotController screenshotController = ScreenshotController();
  ComponentController c = Get.put(ComponentController());
  @override
  void initState() {
    c.searchWeather('');
    super.initState();
  }

  void _takeScreenshot() async {
    await screenshotController.capture().then((bytes) async {
      final Directory output = await getTemporaryDirectory();
      final String screenshotFilePath = '${output.path}/image.png';
      final File screenshotFile = File(screenshotFilePath);
      await screenshotFile.writeAsBytes(bytes!);
      Share.shareXFiles(
        [XFile(screenshotFilePath)],
        text: I18nKeys.SCREENSHOT_TEXT.tr,
        sharePositionOrigin: () {
          RenderBox? box = context.findRenderObject() as RenderBox?;
          return box!.localToGlobal(Offset.zero) & box.size;
        }(),
      );
    }).catchError((onError) {
      print(onError);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(60.0),
        child: CustomAppBar(title: I18nKeys.APP_NAME),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const CustomTextInput(),
            Screenshot(
              controller: screenshotController,
              child: const InformationCard(),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _takeScreenshot,
        child: const Icon(Icons.gesture),
      ),
      resizeToAvoidBottomInset: false,
      bottomSheet: const CustomBottomSheet(),
    );
  }
}
