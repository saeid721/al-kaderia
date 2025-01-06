import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../features/auth/views/signin_screen.dart';
import '../../../getit_locator.dart';
import '../../../global/utils/show_toast.dart';
import '../../local/preferences/local_storage.dart';
import '../../local/preferences/local_storage_keys.dart';

class ApiCheckerDec {
  static void checkApi(int statusCode, String message) async {
    if(statusCode == 401) {
      showCustomSnackBar(message, icon: Icons.info);
      final String? token = locator<LocalStorage>().getString(key: StorageKeys.accessToken);
      SharedPreferences preferences = await SharedPreferences.getInstance();
      log("===/@ User Token: $token");
      await preferences.clear().whenComplete(() => Get.offAll(()=> const SignInScreen()));
      log("===/@ User Token: $token");
    } else if(statusCode == 403){
      showCustomSnackBar(message, icon: Icons.info);
    } else if(statusCode == 404){
      showCustomSnackBar(message, icon: Icons.info);
    } else if(statusCode == 400){
      showCustomSnackBar(message, icon: Icons.info);
    } else if(statusCode == 500){
      locator<LocalStorage>().clearLocalStorage();
      showCustomSnackBar("Jwt Expired!! Please LogIn Again", icon: Icons.info);
    } else if(statusCode == 200 || statusCode == 201){
      showCustomSnackBar(message, icon: Icons.check_circle, isError: false);
    } else {
      showCustomSnackBar(message);
    }
  }
}
