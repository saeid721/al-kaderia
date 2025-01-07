import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../../../global/constants/images.dart';
import '../../../../../global/model.dart';
import '../../../../../global/widget/global_container.dart';
import '../../../../../global/widget/global_image_loader.dart';
import '../../../../../global/widget/global_text.dart';
import '../../global/constants/colors_resources.dart';
import '../../global/constants/enum.dart';
import '../domain/local/preferences/local_storage.dart';
import '../domain/local/preferences/local_storage_keys.dart';
import '../getit_locator.dart';
import 'auth/views/signin_screen.dart';
import 'dashboard/dashboard_screen.dart';
import 'dashboard/sale_entry_search/sale_entry_search.dart';

class CustomDrawerScreen extends StatefulWidget {
  const CustomDrawerScreen({super.key});

  @override
  State<CustomDrawerScreen> createState() => _CustomDrawerScreenState();
}

class _CustomDrawerScreenState extends State<CustomDrawerScreen> {
  int isClick = 0;
  List<GlobalMenuModel> menuItem = [
    GlobalMenuModel(img: Images.home, text: 'Home'),
    GlobalMenuModel(img: Images.searchSale, text: 'Sale Entry Search'),
    GlobalMenuModel(img: Images.logoutIc, text: 'Log Out'),
  ];

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: GlobalContainer(
        height: Get.height,
        width: Get.width,
        color: ColorRes.white,
        child: Column(
          children: [
            Container(
              width: Get.width,
              color: ColorRes.primaryColor,
              padding: const EdgeInsets.only(left: 20, right: 10, top: 50, bottom: 10),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(100),
                child: const GlobalImageLoader(imagePath: Images.logo, imageFor: ImageFor.asset, height: 100, fit: BoxFit.fitHeight),
                // GlobalText(
                //   str: "Al-Kaderia Express",
                //   color: ColorRes.white,
                //   fontSize: 24,
                //   fontWeight: FontWeight.w700,
                //   textAlign: TextAlign.center,
                //   fontFamily: 'Potta',
                // ),
              ),
            ),
            Expanded(
              child: SizedBox(
                child: ListView.builder(
                    itemCount: menuItem.length,
                    padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
                    shrinkWrap: true,
                    itemBuilder: (ctx, index) {
                      return GestureDetector(
                        onTap: () async {
                          setState(() {
                            isClick = index;
                          });
                          log('Index: $index');
                          switch (index) {
                            case 0:
                              Get.to(() => const DashboardScreen());
                              break;
                            case 1:
                              Get.to(() => const SaleEntrySearchScreen());
                              break;
                            case 2:
                              final String? token = locator<LocalStorage>().getString(key: StorageKeys.accessToken);
                              SharedPreferences preferences = await SharedPreferences.getInstance();
                              log("===/@ User Token Before Logout: $token");
                              await preferences.clear();
                              Get.offAll(() => const SignInScreen());
                              log("===/@ User Token After Logout: ${preferences.getString(StorageKeys.accessToken as String)}");
                              break;
                            default:
                              break;
                          }
                        },
                        child: Container(
                          width: Get.width,
                          margin: const EdgeInsets.only(bottom: 5),
                          padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 10),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              color: isClick == index ? ColorRes.primaryColor : Colors.white),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              GlobalImageLoader(
                                imagePath: menuItem[index].img,
                                color: isClick == index ? ColorRes.white : ColorRes.primaryColor,
                                height: 20,
                                width: 20,
                                fit: BoxFit.fill,
                              ),
                              const SizedBox(width: 10),
                              GlobalText(
                                str: menuItem[index].text,
                                color: isClick == index ? ColorRes.white : ColorRes.primaryColor,
                                fontSize: 16,
                                fontWeight: FontWeight.w400,
                                fontFamily: 'Rubik',
                              ),
                            ],
                          ),
                        ),
                      );
                    }),
              ),
            )
          ],
        ),
      ),
    );
  }
}
