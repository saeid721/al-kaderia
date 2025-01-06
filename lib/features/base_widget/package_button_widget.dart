
import 'package:flutter/material.dart';
import '../../global/constants/colors_resources.dart';
import '../../global/widget/global_sizedbox.dart';
import '../../global/widget/global_text.dart';
class PackageButtonWidget extends StatelessWidget {
  final String text;
  final String? selectIndex;
  final String? selectValue;
  final Function() onTap;

  const PackageButtonWidget({
    Key? key, // Corrected parameter name
    required this.text,
    required this.selectIndex,
    required this.selectValue,
    required this.onTap
  }) : super(key: key); // Corrected super call

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        GlobalText(
          str: 'Package $selectValue',
          color: ColorRes.deep200,
          fontSize: 16,
          fontWeight: FontWeight.w500,
          textAlign: TextAlign.center,
          fontFamily: 'Rubik',
        ),
        sizeBoxH(8),
        GestureDetector(
          onTap: onTap,
          child: Container(
            width: size(context).width,
            margin: const EdgeInsets.only(bottom: 30),
            padding: const EdgeInsets.only(left: 20, top: 15, bottom: 15),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                color: selectValue == selectIndex // Compare without conversion
                    ? ColorRes.blueColor : ColorRes.white,
                boxShadow: [
                  BoxShadow(
                      color: ColorRes.grey.withOpacity(0.3),
                      blurRadius: 4,
                      offset: const Offset(0, 2)
                  )
                ]
            ),
            child: Row(
              children: [
                Flexible(
                  child: GlobalText(
                    str: text,
                    color: selectValue == selectIndex
                        ? ColorRes.white
                        : ColorRes.primaryColor,
                    fontSize: 24,
                    fontWeight: FontWeight.w600,
                    fontFamily: 'Rubik',
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
