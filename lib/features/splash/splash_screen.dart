import 'dart:async';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:al_kaderia/global/constants/colors_resources.dart';
import '../../../global/constants/images.dart';
import '../../../global/widget/global_image_loader.dart';
import '../../../global/widget/global_sizedbox.dart';
import '../../domain/local/preferences/local_storage.dart';
import '../../domain/local/preferences/local_storage_keys.dart';
import '../../getit_locator.dart';
import '../auth/views/signin_screen.dart';
import '../dashboard/dashboard_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    route();
  }

  void route(){
    Timer(const Duration(seconds: 3), () {
      final String? token = locator<LocalStorage>().getString(key: StorageKeys.accessToken);

      if(token == null){
        Get.offAll(()=> const SignInScreen());
      } else{
        Get.offAll(()=> const DashboardScreen());
      }
    });
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: Container(
        height: size(context).height,
        width: size(context).width,
        padding: const EdgeInsets.symmetric(horizontal: 60),
        decoration: const BoxDecoration(
          color: ColorRes.white
        ),
        child: const Center(
          child: GlobalImageLoader(
            imagePath: Images.appLogo,
            height: 140,
            fit: BoxFit.fill,
          ),
        ),
      ),
    );
  }
}
