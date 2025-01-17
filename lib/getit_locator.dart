import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:get_it/get_it.dart';
import 'domain/local/preferences/local_storage.dart';
import 'domain/local/preferences/storage_controller.dart';
import 'domain/server/http_client/request_handler.dart';
import 'features/auth/controller/auth_controller.dart';
import 'features/dashboard/sale_report/controller/sales_report_controller.dart';

final locator = GetIt.instance;

Future<void> init(LocalStorage localStorage) async {
  final prefs = localStorage.sharedPreference;

  // Register dependencies with GetIt
  locator.registerLazySingleton<LocalStorage>(() => localStorage);
  locator.registerLazySingleton<RequestHandler>(() => RequestHandler(dio: Dio()));
  locator.registerLazySingleton<StorageController>(() => StorageController(prefs: prefs));

  // Ensure all dependencies are available before GetX registration
  Get.lazyPut(() => AuthController(), fenix: true);
  Get.lazyPut(() => SalesReportController(), fenix: true);
  
  Get.lazyPut(() => locator<RequestHandler>(), fenix: true);
  Get.lazyPut(() => locator<StorageController>(), fenix: true);
}


