
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'getit_locator.dart';
import 'global/constants/enum.dart';
import 'http_cleint/app_config.dart';
import 'preferences/shared_prefs.dart';
import 'view/screen/splash/splash_screen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences prefs = await SharedPreferences.getInstance();

  AppUrlExtention.setUrl(UrlLink.isDev);
  await init(prefs);
  await locator<MyPrefs>().initSharePrefs();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
    );
  }
}
