
import 'package:flutter/material.dart';
import '../../../../../../../../../global/constants/colors_resources.dart';
import '../../../../../../../../../global/widget/global_sizedbox.dart';
import '../../../../../../../../../global/widget/global_text.dart';

class PrintTableWidget extends StatelessWidget {
  final String firstRow;
  final String secondRow;
  final String thirdRow;
  final String fourRow;
  final String fiveRow;

  const PrintTableWidget({
    super.key,
    required this.firstRow,
    required this.secondRow,
    required this.thirdRow,
    required this.fourRow,
    required this.fiveRow
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      width: size(context).width,
      decoration: const BoxDecoration(
          color: ColorRes.lavender,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(6),
              topRight: Radius.circular(6)
          )
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            width: 30,
            decoration: const BoxDecoration(
                border: Border(
                  left: BorderSide(
                      color: ColorRes.lavender,
                      width: 1
                  ),
                  right: BorderSide(
                      color: ColorRes.lavender,
                      width: 1
                  ),
                  top: BorderSide(
                      color: ColorRes.lavender,
                      width: 1
                  ),
                  bottom: BorderSide(
                      color: ColorRes.lavender,
                      width: 1
                  ),
                ),
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(6)
                )
            ),
            padding: const EdgeInsets.symmetric(horizontal: 5),
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
              decoration: const BoxDecoration(
                border: Border(
                  right: BorderSide(
                      color: ColorRes.lavender,
                      width: 1
                  ),
                  top: BorderSide(
                      color: ColorRes.lavender,
                      width: 1
                  ),
                  bottom: BorderSide(
                      color: ColorRes.lavender,
                      width: 1
                  ),
                ),
              ),
              padding: const EdgeInsets.symmetric(horizontal: 5),
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
          Container(
            width: 30,
            decoration: const BoxDecoration(
              border: Border(
                right: BorderSide(
                    color: ColorRes.lavender,
                    width: 1
                ),
                top: BorderSide(
                    color: ColorRes.lavender,
                    width: 1
                ),
                bottom: BorderSide(
                    color: ColorRes.lavender,
                    width: 1
                ),
              ),
            ),
            padding: const EdgeInsets.symmetric(horizontal: 5),
            child: Center(
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
          Container(
            width: 50,
            decoration: const BoxDecoration(
              border: Border(
                right: BorderSide(
                    color: ColorRes.lavender,
                    width: 1
                ),
                top: BorderSide(
                    color: ColorRes.lavender,
                    width: 1
                ),
                bottom: BorderSide(
                    color: ColorRes.lavender,
                    width: 1
                ),
              ),
            ),
            padding: const EdgeInsets.symmetric(horizontal: 5),
            child: Center(
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
          Container(
            width: 50,
            decoration: const BoxDecoration(
              border: Border(
                right: BorderSide(
                    color: ColorRes.lavender,
                    width: 1
                ),
                top: BorderSide(
                    color: ColorRes.lavender,
                    width: 1
                ),
                bottom: BorderSide(
                    color: ColorRes.lavender,
                    width: 1
                ),
              ),
                borderRadius: BorderRadius.only(
                    topRight: Radius.circular(6)
                )
            ),
            padding: const EdgeInsets.symmetric(horizontal: 5),
            child: Center(
              child: GlobalText(
                str: fiveRow,
                color: ColorRes.deep300,
                fontSize: 11,
                fontWeight: FontWeight.w700,
                fontFamily: 'Roboto',
                textAlign: TextAlign.center,
                overflow: TextOverflow.ellipsis,
                maxLines: 2,
              ),
            ),
          ),
        ],
      ),
    );
  }
}


class PrintTableListValueWidget extends StatelessWidget {
  final String firstColumn;
  final String secondColumn;
  final String thirdColumn;
  final String fourColumn;
  final String fiveColumn;

  const PrintTableListValueWidget({
    super.key,
    required this.firstColumn,
    required this.secondColumn,
    required this.thirdColumn,
    required this.fourColumn,
    required this.fiveColumn,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      width: size(context).width,
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(8),
          bottomRight: Radius.circular(8),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            width: 30,
            padding: const EdgeInsets.symmetric(horizontal: 5),
            decoration: const BoxDecoration(
                border: Border(
                    left: BorderSide(
                        color: ColorRes.lavender,
                        width: 1
                    ),
                    bottom: BorderSide(
                        color: ColorRes.lavender,
                        width: 1
                    )
                )
            ),
            child: Center(
              child: GlobalText(
                str: firstColumn,
                color: ColorRes.deep300,
                fontSize: 11,
                fontWeight: FontWeight.w400,
                fontFamily: 'Roboto',
                overflow: TextOverflow.ellipsis,
                maxLines: 3,
              ),
            ),
          ),
          Expanded(
            child: Container(
              decoration: const BoxDecoration(
                  border: Border(
                      left: BorderSide(
                          color: ColorRes.lavender,
                          width: 1
                      ),
                      bottom: BorderSide(
                          color: ColorRes.lavender,
                          width: 1
                      ),
                      right: BorderSide(
                          color: ColorRes.lavender,
                          width: 1
                      )
                  )
              ),
              padding: const EdgeInsets.symmetric(horizontal: 5),
              child: Align(
                alignment: Alignment.centerLeft,
                child: GlobalText(
                  str: secondColumn,
                  color: ColorRes.deep300,
                  fontSize: 11,
                  fontWeight: FontWeight.w400,
                  fontFamily: 'Roboto',
                  overflow: TextOverflow.ellipsis,
                  maxLines: 3,
                ),
              ),
            ),
          ),
          Container(
            width: 30,
            padding: const EdgeInsets.symmetric(horizontal: 5),
            decoration: const BoxDecoration(
                border: Border(
                    bottom: BorderSide(
                        color: ColorRes.lavender,
                        width: 1
                    ),
                    right: BorderSide(
                        color: ColorRes.lavender,
                        width: 1
                    )
                )
            ),
            child: Center(
              child: GlobalText(
                str: thirdColumn,
                color: ColorRes.deep300,
                fontSize: 11,
                fontWeight: FontWeight.w400,
                fontFamily: 'Roboto',
                overflow: TextOverflow.ellipsis,
                maxLines: 3,
              ),
            ),
          ),
          Container(
            width: 50,
            padding: const EdgeInsets.symmetric(horizontal: 5),
            decoration: const BoxDecoration(
                border: Border(
                    bottom: BorderSide(
                        color: ColorRes.lavender,
                        width: 1
                    ),
                    right: BorderSide(
                        color: ColorRes.lavender,
                        width: 1
                    )
                )
            ),
            child: Center(
              child: GlobalText(
                str: fourColumn,
                color: ColorRes.deep300,
                fontSize: 11,
                fontWeight: FontWeight.w400,
                fontFamily: 'Roboto',
                overflow: TextOverflow.ellipsis,
                maxLines: 3,
              ),
            ),
          ),
          Container(
            width: 50,
            padding: const EdgeInsets.symmetric(horizontal: 5),
            decoration: const BoxDecoration(
                border: Border(
                    bottom: BorderSide(
                        color: ColorRes.lavender,
                        width: 1
                    ),
                    right: BorderSide(
                        color: ColorRes.lavender,
                        width: 1
                    )
                )
            ),
            child: Center(
              child: GlobalText(
                str: fiveColumn,
                color: ColorRes.deep300,
                fontSize: 11,
                fontWeight: FontWeight.w400,
                fontFamily: 'Roboto',
                textAlign: TextAlign.center,
                overflow: TextOverflow.ellipsis,
                maxLines: 3,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
