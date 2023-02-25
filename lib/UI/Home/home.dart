import 'package:flutter/material.dart';
import 'package:weather_app_flutter/core/Localization/keys.dart';

import '../Components/custom_appbar.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(60.0),
        child: CustomAppBar(title: I18nKeys.APP_NAME),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Text(
              'Update with your UI',
            ),
          ],
        ),
      ),
    );
  }
}
