import 'package:flutter/material.dart';
import '../../../../../../../../../global/widget/global_sizedbox.dart';
import '../../../../base_widget/text_widget.dart';
class PrintCardBoardWidget extends StatefulWidget {
  final double? sizeBox;
  final String? value1;
  final String? value2;
  final String? value3;
  final String? value4;
  final String? value5;
  final String? value6;
  final String? value7;

  final String? name1;
  final String? name2;
  final String? name3;
  final String? name4;
  final String? name5;
  final String? name6;
  final String? name7;
  const PrintCardBoardWidget({Key? key,
    this.sizeBox = 5,
    this.value1,
    this.value2,
    this.value3,
    this.value4,
    this.value5,
    this.value6,
    this.value7,

    this.name1,
    this.name2,
    this.name3,
    this.name4,
    this.name5,
    this.name6,
    this.name7,
  }) : super(key: key);

  @override
  State<PrintCardBoardWidget> createState() => _PrintCardBoardWidgetState();
}

class _PrintCardBoardWidgetState extends State<PrintCardBoardWidget> {

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        widget.name1!= null ? TextValueTwoBlack(
          name: "${widget.name1}:",
          value: widget.value1??"0.0",
        )
            : const SizedBox.shrink(),
        widget.name2!= null ? sizeBoxH(widget.sizeBox)  : const SizedBox.shrink(),
        widget.name2!= null ? TextValueTwoBlack(
          name: "${widget.name2}:",
          value: widget.value2??"0.0",
        )
            : const SizedBox.shrink(),
        widget.name3!= null ? sizeBoxH(widget.sizeBox)  : const SizedBox.shrink(),
        widget.name3!= null ? TextValueTwoBlack(
          name: "${widget.name3}:",
          value: widget.value3??"0.0",
        )
            : const SizedBox.shrink(),
        widget.name4!= null ? sizeBoxH(widget.sizeBox)  : const SizedBox.shrink(),
        widget.name4!= null ? TextValueTwoBlack(
          name: "${widget.name4}:",
          value: widget.value4??"0.0",
        )
            : const SizedBox.shrink(),
        widget.name5!= null ? sizeBoxH(widget.sizeBox)  : const SizedBox.shrink(),
        widget.name5!= null ? TextValueTwoBlack(
          name: "${widget.name5}:",
          value: widget.value5??"0.0",
        )
            : const SizedBox.shrink(),
        widget.name6!= null ? sizeBoxH(widget.sizeBox)  : const SizedBox.shrink(),
        widget.name6!= null ? TextValueTwoBlack(
          name: "${widget.name6}:",
          value: widget.value6??"0.0",
        )
            : const SizedBox.shrink(),
        widget.name7!= null ? sizeBoxH(widget.sizeBox)  : const SizedBox.shrink(),
        widget.name7!= null ? TextValueTwoBlack(
          name: "${widget.name7}:",
          value: widget.value7??"0.0",
        )
            : const SizedBox.shrink(),
      ],
    );
  }
}
