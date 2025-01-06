import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'domain/local/preferences/storage_controller.dart';
import 'domain/server/http_client/request_handler.dart';
import 'features/auth/controller/auth_controller.dart';
import 'preferences/shared_prefs.dart';

final locator = GetIt.instance;

Future init(SharedPreferences prefs) async {
  Dio dio = Dio();

  locator.registerLazySingleton<MyPrefs>(() => MyPrefs());
  locator.registerLazySingleton<RequestHandler>(() => RequestHandler(dio: dio));

  Get.lazyPut<RequestHandler>(() => RequestHandler(dio: dio));

  Get.put(RequestHandler( dio: dio));
  Get.to(StorageController());
  Get.put(AuthController());
}
