import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../global/constants/colors_resources.dart';
import '../../global/constants/images.dart';
import '../../global/widget/global_image_loader.dart';
import '../../global/widget/global_sizedbox.dart';
import '../../global/widget/global_text.dart';

class GlobalAuthAppBar extends StatelessWidget {
  const GlobalAuthAppBar({
    super.key,
    required this.title
  });
  final String title;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        children: [
          sizeBoxH(10),
          Stack(
            children: [
              SizedBox(height: 80, width: size(context).width),
              Positioned(
                left: 10,
                bottom: 0,
                child: SizedBox(
                  height: 80,
                  child: Center(
                    child: GestureDetector(
                      onTap: (){
                        Get.back();
                      },
                      child: const GlobalImageLoader(
                        imagePath: Images.backImg,
                        height: 22,
                        width: 15,
                        fit: BoxFit.fitHeight,
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 80,
                child: Center(
                  child: GlobalText(
                    str: title,
                    color: ColorRes.primaryColor,
                    fontSize: 28,
                    fontWeight: FontWeight.w700,
                    textAlign: TextAlign.center,
                    fontFamily: 'Rubik',
                  ),
                ),
              ),
            ],
          ),
          sizeBoxH(10),
        ],
      ),
    );
  }
}


class GlobalAppBar extends StatelessWidget {
  const GlobalAppBar({
    super.key,
    required this.title,
    this.isBackIc = true,
    this.centerTitle,
    this.backColor,

    this.notiOnTap
  });
  final String title;
  final Color? backColor;
  final bool? isBackIc;
  final bool? centerTitle;
  final Function()? notiOnTap;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: backColor ?? ColorRes.primaryColor,
      automaticallyImplyLeading: false,
      leading: isBackIc == true ? IconButton(
        splashRadius: 0.1,
        icon: const Icon(Icons.arrow_back, color: ColorRes.white, size: 22),
        onPressed: (){
          Get.back();
        },
      ) : const SizedBox.shrink(),
      centerTitle: centerTitle,
      title: GlobalText(
        str: title,
        color: ColorRes.white,
        fontSize: 16,
        fontWeight: FontWeight.w500,
        textAlign: TextAlign.center,
        fontFamily: 'Rubik',
      ),
      // actions: [
      //   GestureDetector(
      //     onTap: notiOnTap,
      //     child: const GlobalImageLoader(
      //       imagePath: Images.notificationIc,
      //       height: 24,
      //       width: 24,
      //       fit: BoxFit.fitHeight,
      //     ),
      //   ),
      //   sizeBoxW(20)
      // ],
    );
  }
}