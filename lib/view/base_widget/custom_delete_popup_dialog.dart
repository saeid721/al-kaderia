import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../global/constants/colors_resources.dart';
import '../../global/constants/images.dart';

class CustomAlertDialogForPermission extends StatelessWidget {
  final String title;
  final String description;
  final String yesButtonText;
  final String noButtonText;
  final bool isError;
  final Function() yesButtonTap;
  const CustomAlertDialogForPermission({super.key, required this.title, required this.yesButtonTap, required this.yesButtonText, required this.noButtonText, this.description=" ",  this.isError=false});
  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      insetPadding: const EdgeInsets.all(30),
      clipBehavior: Clip.antiAliasWithSaveLayer,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          const SizedBox(height: 20,),
          Image.asset(isError?Images.error:Images.confirmicon,height: 40,width: 40,) ,
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(child: Text(title,textAlign:TextAlign.center,style: TextStyle(color:isError?Colors.redAccent:Colors.green,fontSize: 18))),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(child: Text(description,textAlign:TextAlign.center,style: const TextStyle(fontSize: 18))),
              ],
            ),
          ),
          const SizedBox(height: 10,),
          Row(
            children: [
              Expanded(
                flex: 1,
                child: Container(
                  padding: const EdgeInsets.all(0),
                  decoration: const BoxDecoration(
                    color: ColorRes.red,
                    border: Border(
                      left: BorderSide(
                        color: Colors.black12,
                        width: 1.5,
                      ),
                      top: BorderSide(
                        color: Colors.black12,
                        width: 1.5,
                      ),
                    ),
                  ),
                  child: InkWell(
                    onTap:(){
                      Get.back();
                    },
                    child: Container(
                        padding: const EdgeInsets.all(5),
                        width: Get.width,
                        child: Text(noButtonText,textAlign:TextAlign.center,
                          style: const TextStyle(fontSize: 16,
                              color: ColorRes.white,fontWeight: FontWeight.w500),)),),
                ),
              ),
              Expanded(
                flex: 1,
                child: Container(
                  decoration: const BoxDecoration(
                    color: ColorRes.green,
                    border: Border(
                      top: BorderSide(
                        color: Colors.black12,
                        width: 1.5,
                      ),
                    ),
                  ),
                  padding: const EdgeInsets.all(0),
                  child: GestureDetector(
                    onTap: yesButtonTap,
                    child: Container(
                        padding: const EdgeInsets.all(5),
                        width: Get.width,
                        child: Text(yesButtonText,textAlign:TextAlign.center,
                          style: const TextStyle(fontSize: 16,
                              color: ColorRes.white,fontWeight: FontWeight.w500),)),),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
