import 'package:dio/dio.dart';
import 'package:get/get_core/src/get_main.dart';

import '../global/utils/show_toast.dart';

class ApiChecker {
  static void checkApi(Response response) {
    if(response.statusCode == 400 || response.statusCode == 401 || response.statusCode == 403 || response.statusCode == 404) {
      showCustomSnackBar(response.data['message']);
    } else if(response.statusCode == 200 || response.statusCode == 201){
      showCustomSnackBar(response.data['message'], isError: false);
    } else {
      showCustomSnackBar(response.data['message'].toString());
    }
  }
}
