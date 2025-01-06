import 'package:flutter/material.dart';

import '../../global/constants/colors_resources.dart';
import '../../global/widget/global_text.dart';

class TextValue extends StatelessWidget {
  final String name;
  final String value;
  const TextValue({
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

class TextValueTwo extends StatelessWidget {
  final String name;
  final String value;
  final Color? color;
  const TextValueTwo({
    super.key,
    required this.name,
    required this.value,
    this.color
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Flexible(
          flex: 5,
          child: GlobalText(
            str: name,
            color: ColorRes.deep100,
            fontSize: 11,
            fontWeight: FontWeight.w600,
            fontFamily: 'Rubik',
          ),
        ),
        Flexible(
          flex: 4,
          child: GlobalText(
            str: value,
            color: color ?? ColorRes.deep100,
            fontSize: 11,
            fontWeight: FontWeight.w400,
            fontFamily: 'Rubik',
          ),
        ),
      ],
    );
  }
}

class TextValueTwoBlack extends StatelessWidget {
  final String name;
  final String value;
  const TextValueTwoBlack({
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
            color: ColorRes.deep100,
            fontSize: 12,
            fontWeight: FontWeight.w700,
            fontFamily: 'Rubik',
          ),
        ),
        GlobalText(
          str: value,
          color: ColorRes.deep100,
          fontSize: 12,
          fontWeight: FontWeight.w400,
          textAlign: TextAlign.center,
          fontFamily: 'Rubik',
        ),
      ],
    );
  }
}