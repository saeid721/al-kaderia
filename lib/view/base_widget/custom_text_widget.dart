import 'package:flutter/material.dart';
import '../../global/constants/colors_resources.dart';
import '../../global/widget/global_text.dart';

class CustomTextWidget extends StatelessWidget {
  final String name;
  final String value;
  const CustomTextWidget({
    super.key,
    required this.name,
    required this.value
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Flexible(
          child: GlobalText(
            str: name,
            color: ColorRes.primaryColor,
            fontSize: 15,
            fontWeight: FontWeight.w700,
            fontFamily: 'Rubik',
          ),
        ),
        GlobalText(
          str: value,
          color: ColorRes.primaryColor,
          fontSize: 15,
          fontWeight: FontWeight.w400,
          textAlign: TextAlign.center,
          fontFamily: 'Rubik',
        ),
      ],
    );
  }
}

class CustomTextValueTwo extends StatelessWidget {
  final String name;
  final String value;
  const CustomTextValueTwo({
    super.key,
    required this.name,
    required this.value
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        GlobalText(
          str: name,
          color: ColorRes.deep100,
          fontSize: 11,
          fontWeight: FontWeight.w600,
          fontFamily: 'Rubik',
        ),
        Flexible(
          child: GlobalText(
            str: value,
            color: ColorRes.deep100,
            fontSize: 11,
            fontWeight: FontWeight.w400,
            fontFamily: 'Rubik',
          ),
        ),
      ],
    );
  }
}

class CustomTextValueTwoBlack extends StatelessWidget {
  final String name;
  final String value;
  final Color? color;
  const CustomTextValueTwoBlack({
    super.key,
    required this.name,
    required this.value,
    this.color = ColorRes.deep100
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        GlobalText(
          str: name,
          color: ColorRes.deep100,
          fontSize: 12,
          fontWeight: FontWeight.w700,
          fontFamily: 'Rubik',
        ),
        Flexible(
          child: GlobalText(
            str: value,
            color: color,
            fontSize: 12,
            fontWeight: FontWeight.w400,
            textAlign: TextAlign.center,
            fontFamily: 'Rubik',
          ),
        ),
      ],
    );
  }
}