
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:al_kaderia/global/constants/colors_resources.dart';
import '../../../global/constants/images.dart';
import '../../../global/widget/global_image_loader.dart';
import '../../../global/widget/global_sizedbox.dart';
import '../auth/opening_screen.dart';
import '../auth/signin_screen.dart';

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
      Get.offAll(()=> const SignInScreen());
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
