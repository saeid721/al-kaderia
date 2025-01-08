import 'package:flutter/material.dart';
import '../../../../../../../../global/constants/colors_resources.dart';
import '../../../../../../../../global/widget/global_sizedbox.dart';
import '../../../../../../../../global/widget/global_text.dart';
import '../../../../../global/constants/images.dart';
import '../../../../../global/widget/global_image_loader.dart';

class SaleSummeryTableTabBarWidget extends StatelessWidget {
  final String firstRow;
  final String secondRow;
  final String thirdRow;
  final String fourRow;
  final String fiveRow;
  final String sixRow;
  final String sevenRow;
  final String eightRow;

  const SaleSummeryTableTabBarWidget({
    super.key,
    required this.firstRow,
    required this.secondRow,
    required this.thirdRow,
    required this.fourRow,
    required this.fiveRow,
    required this.sixRow,
    required this.sevenRow,
    required this.eightRow,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      width: size(context).width,
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(8),
          topRight: Radius.circular(8),
        ),
        color: ColorRes.primaryColor.withAlpha((0.2 * 255).toInt()),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            width: 40,
            padding: const EdgeInsets.symmetric(horizontal: 5),
            decoration: BoxDecoration(
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(8),
                ),
                border: Border(left: BorderSide(color: ColorRes.primaryColor.withAlpha((0.3 * 255).toInt()), width: 1), bottom: BorderSide(color: ColorRes.primaryColor.withAlpha((0.3 * 255).toInt()), width: 1))),
            child: Center(
              child: GlobalText(
                str: firstRow,
                color: ColorRes.deep300,
                fontSize: 11,
                fontWeight: FontWeight.w700,
                fontFamily: 'Roboto',
                overflow: TextOverflow.ellipsis,
                maxLines: 2,
              ),
            ),
          ),
          Expanded(
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 5),
              decoration: BoxDecoration(
                  border: Border(
                left: BorderSide(color: ColorRes.primaryColor.withAlpha((0.3 * 255).toInt()), width: 1),
                bottom: BorderSide(color: ColorRes.primaryColor.withAlpha((0.3 * 255).toInt()), width: 1),
                right: BorderSide(color: ColorRes.primaryColor.withAlpha((0.3 * 255).toInt()), width: 1),
              )),
              child: Center(
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: GlobalText(
                    str: secondRow,
                    color: ColorRes.deep300,
                    fontSize: 11,
                    fontWeight: FontWeight.w700,
                    fontFamily: 'Roboto',
                    overflow: TextOverflow.ellipsis,
                    maxLines: 2,
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 5),
              decoration: BoxDecoration(
                  border: Border(
                bottom: BorderSide(color: ColorRes.primaryColor.withAlpha((0.3 * 255).toInt()), width: 1),
                right: BorderSide(color: ColorRes.primaryColor.withAlpha((0.3 * 255).toInt()), width: 1),
              )),
              child: Center(
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: GlobalText(
                    str: thirdRow,
                    color: ColorRes.deep300,
                    fontSize: 11,
                    fontWeight: FontWeight.w700,
                    fontFamily: 'Roboto',
                    overflow: TextOverflow.ellipsis,
                    maxLines: 2,
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 5),
              decoration: BoxDecoration(
                  border: Border(
                bottom: BorderSide(color: ColorRes.primaryColor.withAlpha((0.3 * 255).toInt()), width: 1),
                right: BorderSide(color: ColorRes.primaryColor.withAlpha((0.3 * 255).toInt()), width: 1),
              )),
              child: Center(
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: GlobalText(
                    str: fourRow,
                    color: ColorRes.deep300,
                    fontSize: 11,
                    fontWeight: FontWeight.w700,
                    fontFamily: 'Roboto',
                    overflow: TextOverflow.ellipsis,
                    maxLines: 2,
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 5),
              decoration: BoxDecoration(
                  border: Border(
                bottom: BorderSide(color: ColorRes.primaryColor.withAlpha((0.3 * 255).toInt()), width: 1),
                right: BorderSide(color: ColorRes.primaryColor.withAlpha((0.3 * 255).toInt()), width: 1),
              )),
              child: Center(
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: GlobalText(
                    str: fiveRow,
                    color: ColorRes.deep300,
                    fontSize: 11,
                    fontWeight: FontWeight.w700,
                    fontFamily: 'Roboto',
                    overflow: TextOverflow.ellipsis,
                    maxLines: 2,
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 5),
              decoration: BoxDecoration(
                  border: Border(
                bottom: BorderSide(color: ColorRes.primaryColor.withAlpha((0.3 * 255).toInt()), width: 1),
                right: BorderSide(color: ColorRes.primaryColor.withAlpha((0.3 * 255).toInt()), width: 1),
              )),
              child: Center(
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: GlobalText(
                    str: sixRow,
                    color: ColorRes.deep300,
                    fontSize: 11,
                    fontWeight: FontWeight.w700,
                    fontFamily: 'Roboto',
                    overflow: TextOverflow.ellipsis,
                    maxLines: 2,
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 5),
              decoration: BoxDecoration(border: Border(right: BorderSide(color: ColorRes.primaryColor.withAlpha((0.3 * 255).toInt()), width: 1), bottom: BorderSide(color: ColorRes.primaryColor.withAlpha((0.3 * 255).toInt()), width: 1))),
              child: Center(
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: GlobalText(
                    str: sevenRow,
                    color: ColorRes.deep300,
                    fontSize: 11,
                    fontWeight: FontWeight.w700,
                    fontFamily: 'Roboto',
                    overflow: TextOverflow.ellipsis,
                    maxLines: 2,
                  ),
                ),
              ),
            ),
          ),
          Container(
            width: 50,
            padding: const EdgeInsets.symmetric(horizontal: 5),
            decoration: BoxDecoration(
                borderRadius: const BorderRadius.only(
                  topRight: Radius.circular(8),
                ),
                border: Border(right: BorderSide(color: ColorRes.primaryColor.withAlpha((0.3 * 255).toInt()), width: 1), bottom: BorderSide(color: ColorRes.primaryColor.withAlpha((0.3 * 255).toInt()), width: 1))),
            child: Center(
              child: GlobalText(
                str: eightRow,
                color: ColorRes.deep300,
                fontSize: 11,
                fontWeight: FontWeight.w700,
                fontFamily: 'Roboto',
                textAlign: TextAlign.center,
                // overflow: TextOverflow.ellipsis,
                // maxLines: 2,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class SaleSummeryTableListValueWidget extends StatelessWidget {
  final String firstColumn;
  final String secondColumn;
  final String thirdColumn;
  final String fourColumn;
  final String fiveColumn;
  final String sixColumn;
  final String sevenColumn;
  final String eightColumn;
  final Function() onTap;
  final Function() onTapPrint;

  const SaleSummeryTableListValueWidget({
    super.key,
    required this.firstColumn,
    required this.secondColumn,
    required this.thirdColumn,
    required this.fourColumn,
    required this.fiveColumn,
    required this.sixColumn,
    required this.sevenColumn,
    required this.eightColumn,
    required this.onTap,
    required this.onTapPrint,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
        height: 70,
        width: size(context).width,
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(8),
            topRight: Radius.circular(8),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              width: 40,
              padding: const EdgeInsets.symmetric(horizontal: 5),
              decoration: BoxDecoration(border: Border(left: BorderSide(color: ColorRes.primaryColor.withAlpha((0.3 * 255).toInt()), width: 1), bottom: BorderSide(color: ColorRes.primaryColor.withAlpha((0.3 * 255).toInt()), width: 1))),
              child: Center(
                child: GlobalText(
                  str: firstColumn,
                  color: ColorRes.deep300,
                  fontSize: 11,
                  fontWeight: FontWeight.w400,
                  fontFamily: 'Roboto',
                  textAlign: TextAlign.center,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 4,
                ),
              ),
            ),
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                    border: Border(
                        left: BorderSide(color: ColorRes.primaryColor.withAlpha((0.3 * 255).toInt()), width: 1), bottom: BorderSide(color: ColorRes.primaryColor.withAlpha((0.3 * 255).toInt()), width: 1), right: BorderSide(color: ColorRes.primaryColor.withAlpha((0.3 * 255).toInt()), width: 1))),
                padding: const EdgeInsets.symmetric(horizontal: 5),
                child: Align(
                  alignment: Alignment.center,
                  child: GlobalText(
                    str: secondColumn,
                    color: ColorRes.deep300,
                    fontSize: 11,
                    fontWeight: FontWeight.w400,
                    fontFamily: 'Roboto',
                    overflow: TextOverflow.ellipsis,
                    maxLines: 4,
                  ),
                ),
              ),
            ),
            Expanded(
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 5),
                decoration: BoxDecoration(border: Border(bottom: BorderSide(color: ColorRes.primaryColor.withAlpha((0.3 * 255).toInt()), width: 1), right: BorderSide(color: ColorRes.primaryColor.withAlpha((0.3 * 255).toInt()), width: 1))),
                child: Center(
                  child: Align(
                    alignment: Alignment.center,
                    child: GlobalText(
                      str: thirdColumn,
                      color: ColorRes.deep300,
                      fontSize: 11,
                      fontWeight: FontWeight.w400,
                      fontFamily: 'Roboto',
                      overflow: TextOverflow.ellipsis,
                      maxLines: 4,
                    ),
                  ),
                ),
              ),
            ),
            Expanded(
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 5),
                decoration: BoxDecoration(border: Border(bottom: BorderSide(color: ColorRes.primaryColor.withAlpha((0.3 * 255).toInt()), width: 1), right: BorderSide(color: ColorRes.primaryColor.withAlpha((0.3 * 255).toInt()), width: 1))),
                child: Center(
                  child: Align(
                    alignment: Alignment.center,
                    child: GlobalText(
                      str: fourColumn,
                      color: ColorRes.deep300,
                      fontSize: 11,
                      fontWeight: FontWeight.w400,
                      fontFamily: 'Roboto',
                      overflow: TextOverflow.ellipsis,
                      maxLines: 4,
                    ),
                  ),
                ),
              ),
            ),
            Expanded(
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 5),
                decoration: BoxDecoration(border: Border(bottom: BorderSide(color: ColorRes.primaryColor.withAlpha((0.3 * 255).toInt()), width: 1), right: BorderSide(color: ColorRes.primaryColor.withAlpha((0.3 * 255).toInt()), width: 1))),
                child: Center(
                  child: Align(
                    alignment: Alignment.center,
                    child: GlobalText(
                      str: fiveColumn,
                      color: ColorRes.deep300,
                      fontSize: 11,
                      fontWeight: FontWeight.w400,
                      fontFamily: 'Roboto',
                      overflow: TextOverflow.ellipsis,
                      maxLines: 4,
                    ),
                  ),
                ),
              ),
            ),
            Expanded(
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 5),
                decoration: BoxDecoration(border: Border(bottom: BorderSide(color: ColorRes.primaryColor.withAlpha((0.3 * 255).toInt()), width: 1), right: BorderSide(color: ColorRes.primaryColor.withAlpha((0.3 * 255).toInt()), width: 1))),
                child: Center(
                  child: Align(
                    alignment: Alignment.center,
                    child: GlobalText(
                      str: sixColumn,
                      color: ColorRes.deep300,
                      fontSize: 11,
                      fontWeight: FontWeight.w400,
                      fontFamily: 'Roboto',
                      overflow: TextOverflow.ellipsis,
                      maxLines: 4,
                    ),
                  ),
                ),
              ),
            ),
            Expanded(
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 5),
                decoration: BoxDecoration(border: Border(bottom: BorderSide(color: ColorRes.primaryColor.withAlpha((0.3 * 255).toInt()), width: 1), right: BorderSide(color: ColorRes.primaryColor.withAlpha((0.3 * 255).toInt()), width: 1))),
                child: Center(
                  child: Align(
                    alignment: Alignment.center,
                    child: GlobalText(
                      str: sevenColumn,
                      color: ColorRes.deep300,
                      fontSize: 11,
                      fontWeight: FontWeight.w400,
                      fontFamily: 'Roboto',
                      overflow: TextOverflow.ellipsis,
                      maxLines: 4,
                    ),
                  ),
                ),
              ),
            ),
            Expanded(
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 5),
                decoration: BoxDecoration(border: Border(bottom: BorderSide(color: ColorRes.primaryColor.withAlpha((0.3 * 255).toInt()), width: 1), right: BorderSide(color: ColorRes.primaryColor.withAlpha((0.3 * 255).toInt()), width: 1))),
                child: Center(
                  child: Align(
                    alignment: Alignment.center,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        GestureDetector(
                          onTap: onTap,
                          child: Container(
                            width: 40,
                            padding: const EdgeInsets.symmetric(horizontal: 5),
                            child: const Center(
                              child: GlobalImageLoader(
                                imagePath: Images.eye1,
                                height: 25,
                                fit: BoxFit.fitWidth,
                                color: ColorRes.grey,
                              ),
                            ),
                          ),
                        ),
                        GestureDetector(
                          onTap: onTapPrint,
                          child: Container(
                            width: 40,
                            padding: const EdgeInsets.symmetric(horizontal: 5),
                            child: const Center(
                              child: GlobalImageLoader(
                                imagePath: Images.printing,
                                height: 25,
                                fit: BoxFit.fitWidth,
                                color: ColorRes.grey,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
