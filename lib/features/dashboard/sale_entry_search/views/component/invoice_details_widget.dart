
import 'package:flutter/material.dart';
import '../../../../../../../../global/constants/colors_resources.dart';
import '../../../../../../../../global/widget/global_sizedbox.dart';
import '../../../../../../../../global/widget/global_text.dart';

class InvoiceDetailsWidget extends StatelessWidget {
  final String firstRow;
  final String secondRow;
  final String thirdRow;
  final String fourRow;
  final String fiveRow;

  const InvoiceDetailsWidget({
    super.key,
    required this.firstRow,
    required this.secondRow,
    required this.thirdRow,
    required this.fourRow,
    required this.fiveRow,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      width: size(context).width,
      decoration:  BoxDecoration(
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
            decoration:  BoxDecoration(
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(8),
                ),
                border: Border(
                    left: BorderSide(
                        color: ColorRes.primaryColor.withAlpha((0.3 * 255).toInt()),
                        width: 1
                    ),
                    bottom: BorderSide(
                        color: ColorRes.primaryColor.withAlpha((0.3 * 255).toInt()),
                        width: 1
                    )
                )

            ),
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
                      left: BorderSide(
                          color: ColorRes.primaryColor.withAlpha((0.3 * 255).toInt()),
                          width: 1
                      ),
                      bottom: BorderSide(
                          color: ColorRes.primaryColor.withAlpha((0.3 * 255).toInt()),
                          width: 1
                      ),
                      right: BorderSide(
                          color: ColorRes.primaryColor.withAlpha((0.3 * 255).toInt()),
                          width: 1
                      )
                  )
              ),
              child: Center(
                child: Align(
                  alignment: Alignment.center,
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
            width: 45,
            padding: const EdgeInsets.symmetric(horizontal: 5),
            decoration: BoxDecoration(
                border: Border(
                    bottom: BorderSide(
                        color: ColorRes.primaryColor.withAlpha((0.3 * 255).toInt()),
                        width: 1
                    ),
                    right: BorderSide(
                        color: ColorRes.primaryColor.withAlpha((0.3 * 255).toInt()),
                        width: 1
                    )
                )
            ),
            child: Center(
              child: Align(
                alignment: Alignment.center,
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

          Container(
            width: 55,
            padding: const EdgeInsets.symmetric(horizontal: 5),
            decoration: BoxDecoration(
                border: Border(
                    bottom: BorderSide(
                        color: ColorRes.primaryColor.withAlpha((0.3 * 255).toInt()),
                        width: 1
                    ),
                    right: BorderSide(
                        color: ColorRes.primaryColor.withAlpha((0.3 * 255).toInt()),
                        width: 1
                    )
                )
            ),
            child: Center(
              child: Align(
                alignment: Alignment.center,
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
          Container(
            width: 55,
            padding: const EdgeInsets.symmetric(horizontal: 5),
            decoration: BoxDecoration(
                borderRadius: const BorderRadius.only(
                  topRight: Radius.circular(8),
                ),
                border: Border(
                    bottom: BorderSide(
                        color: ColorRes.primaryColor.withAlpha((0.3 * 255).toInt()),
                        width: 1
                    ),
                    right: BorderSide(
                        color: ColorRes.primaryColor.withAlpha((0.3 * 255).toInt()),
                        width: 1
                    )
                )
            ),
            child: Center(
              child: Align(
                alignment: Alignment.center,
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

        ],
      ),
    );
  }
}


class InvoiceDetailsValueWidget extends StatelessWidget {
  final String firstColumn;
  final String secondColumn;
  final String thirdColumn;
  final String fourColumn;
  final String fiveColumn;

  const InvoiceDetailsValueWidget({
    super.key,
    required this.firstColumn,
    required this.secondColumn,
    required this.thirdColumn,
    required this.fourColumn,
    required this.fiveColumn,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
        height: 50,
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
              decoration:  BoxDecoration(
                  border: Border(
                      left: BorderSide(
                          color: ColorRes.primaryColor.withAlpha((0.3 * 255).toInt()),
                          width: 1
                      ),
                      bottom: BorderSide(
                          color: ColorRes.primaryColor.withAlpha((0.3 * 255).toInt()),
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
                  textAlign: TextAlign.center,
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
                        left: BorderSide(
                            color: ColorRes.primaryColor.withAlpha((0.3 * 255).toInt()),
                            width: 1
                        ),
                        bottom: BorderSide(
                            color: ColorRes.primaryColor.withAlpha((0.3 * 255).toInt()),
                            width: 1
                        ),
                        right: BorderSide(
                            color: ColorRes.primaryColor.withAlpha((0.3 * 255).toInt()),
                            width: 1
                        )
                    )
                ),
                child: Align(
                  alignment: Alignment.centerLeft,
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
            Container(
              width: 45,
              padding: const EdgeInsets.symmetric(horizontal: 5),
              decoration: BoxDecoration(
                  border: Border(
                      bottom: BorderSide(
                          color: ColorRes.primaryColor.withAlpha((0.3 * 255).toInt()),
                          width: 1
                      ),
                      right: BorderSide(
                          color: ColorRes.primaryColor.withAlpha((0.3 * 255).toInt()),
                          width: 1
                      )
                  )
              ),
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
                    maxLines: 2,
                  ),
                ),
              ),
            ),
            Container(
              width: 55,
              padding: const EdgeInsets.symmetric(horizontal: 5),
              decoration: BoxDecoration(
                  border: Border(
                      bottom: BorderSide(
                          color: ColorRes.primaryColor.withAlpha((0.3 * 255).toInt()),
                          width: 1
                      ),
                      right: BorderSide(
                          color: ColorRes.primaryColor.withAlpha((0.3 * 255).toInt()),
                          width: 1
                      )
                  )
              ),
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
                    maxLines: 2,
                  ),
                ),
              ),
            ),
            Container(
              width: 55,
              padding: const EdgeInsets.symmetric(horizontal: 5),
              decoration: BoxDecoration(
                  border: Border(
                      bottom: BorderSide(
                          color: ColorRes.primaryColor.withAlpha((0.3 * 255).toInt()),
                          width: 1
                      ),
                      right: BorderSide(
                          color: ColorRes.primaryColor.withAlpha((0.3 * 255).toInt()),
                          width: 1
                      )
                  )
              ),
              child: Center(
                child: Align(
                  alignment: Alignment.centerRight,
                  child: GlobalText(
                    str: fiveColumn,
                    color: ColorRes.deep300,
                    fontSize: 11,
                    fontWeight: FontWeight.w400,
                    fontFamily: 'Roboto',
                    overflow: TextOverflow.ellipsis,
                    maxLines: 2,
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



class InvoiceDetailsTotalWidget extends StatelessWidget {
  final String firstColumn;
  final String secondColumn;
  final String thirdColumn;
  final String fourColumn;
  final String fiveColumn;

  const InvoiceDetailsTotalWidget({
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
      width: size(context).width,
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(8),
          topRight: Radius.circular(8),
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Expanded(
                child: Container(
                  height: 40,
                  padding: const EdgeInsets.symmetric(horizontal: 5),
                  decoration:  BoxDecoration(
                      border: Border(
                          left: BorderSide(
                              color: ColorRes.primaryColor.withAlpha((0.3 * 255).toInt()),
                              width: 1
                          ),
                          bottom: BorderSide(
                              color: ColorRes.primaryColor.withAlpha((0.3 * 255).toInt()),
                              width: 1
                          ),
                        top: BorderSide(
                            color: ColorRes.primaryColor.withAlpha((0.3 * 255).toInt()),
                            width: 1
                        ),
                      )

                  ),
                  child: const Align(
                    alignment: Alignment.centerRight,
                    child: GlobalText(
                      str: "Sub Amount (BDT):",
                      color: ColorRes.deep300,
                      fontSize: 11,
                      fontWeight: FontWeight.w700,
                      fontFamily: 'Roboto',
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ),
              ),
              Container(
                height: 40,
                width: 111,
                padding: const EdgeInsets.symmetric(horizontal: 5),
                decoration:  BoxDecoration(
                    border: Border(
                        left: BorderSide(
                            color: ColorRes.primaryColor.withAlpha((0.3 * 255).toInt()),
                            width: 1
                        ),

                        right: BorderSide(
                            color: ColorRes.primaryColor.withAlpha((0.3 * 255).toInt()),
                            width: 1
                        ),
                        bottom: BorderSide(
                            color: ColorRes.primaryColor.withAlpha((0.3 * 255).toInt()),
                            width: 1
                        ),
                      top: BorderSide(
                          color: ColorRes.primaryColor.withAlpha((0.3 * 255).toInt()),
                          width: 1
                      ),
                    )

                ),
                child: Align(
                  alignment: Alignment.centerRight,
                  child: GlobalText(
                    str: firstColumn,
                    color: ColorRes.deep300,
                    fontSize: 11,
                    fontWeight: FontWeight.w700,
                    fontFamily: 'Roboto',
                    overflow: TextOverflow.ellipsis,
                    maxLines: 2,
                  ),
                ),
              ),
            ],
          ),
          Row(
            children: [
              Expanded(
                child: Container(
                  height: 40,
                  padding: const EdgeInsets.symmetric(horizontal: 5),
                  decoration:  BoxDecoration(
                      border: Border(
                          left: BorderSide(
                              color: ColorRes.primaryColor.withAlpha((0.3 * 255).toInt()),
                              width: 1
                          ),
                          bottom: BorderSide(
                              color: ColorRes.primaryColor.withAlpha((0.3 * 255).toInt()),
                              width: 1
                          )
                      )

                  ),
                  child: const Align(
                    alignment: Alignment.centerRight,
                    child: GlobalText(
                      str: "Vat (BDT):",
                      color: ColorRes.deep300,
                      fontSize: 11,
                      fontWeight: FontWeight.w700,
                      fontFamily: 'Roboto',
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ),
              ),
              Container(
                height: 40,
                width: 111,
                padding: const EdgeInsets.symmetric(horizontal: 5),
                decoration:  BoxDecoration(
                    border: Border(
                        left: BorderSide(
                            color: ColorRes.primaryColor.withAlpha((0.3 * 255).toInt()),
                            width: 1
                        ),

                        right: BorderSide(
                            color: ColorRes.primaryColor.withAlpha((0.3 * 255).toInt()),
                            width: 1
                        ),
                        bottom: BorderSide(
                            color: ColorRes.primaryColor.withAlpha((0.3 * 255).toInt()),
                            width: 1
                        )
                    )

                ),
                child: Align(
                  alignment: Alignment.centerRight,
                  child: GlobalText(
                    str: secondColumn,
                    color: ColorRes.deep300,
                    fontSize: 11,
                    fontWeight: FontWeight.w700,
                    fontFamily: 'Roboto',
                    overflow: TextOverflow.ellipsis,
                    maxLines: 2,
                  ),
                ),
              ),
            ],
          ),
          Row(
            children: [
              Expanded(
                child: Container(
                  height: 40,
                  padding: const EdgeInsets.symmetric(horizontal: 5),
                  decoration:  BoxDecoration(
                      border: Border(
                          left: BorderSide(
                              color: ColorRes.primaryColor.withAlpha((0.3 * 255).toInt()),
                              width: 1
                          ),
                          bottom: BorderSide(
                              color: ColorRes.primaryColor.withAlpha((0.3 * 255).toInt()),
                              width: 1
                          )
                      )

                  ),
                  child: const Align(
                    alignment: Alignment.centerRight,
                    child: GlobalText(
                      str: "Total (BDT):",
                      color: ColorRes.deep300,
                      fontSize: 11,
                      fontWeight: FontWeight.w700,
                      fontFamily: 'Roboto',
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ),
              ),
              Container(
                height: 40,
                width: 111,
                padding: const EdgeInsets.symmetric(horizontal: 5),
                decoration:  BoxDecoration(
                    border: Border(
                        left: BorderSide(
                            color: ColorRes.primaryColor.withAlpha((0.3 * 255).toInt()),
                            width: 1
                        ),

                        right: BorderSide(
                            color: ColorRes.primaryColor.withAlpha((0.3 * 255).toInt()),
                            width: 1
                        ),
                        bottom: BorderSide(
                            color: ColorRes.primaryColor.withAlpha((0.3 * 255).toInt()),
                            width: 1
                        )
                    )

                ),
                child: Align(
                  alignment: Alignment.centerRight,
                  child: GlobalText(
                    str: thirdColumn,
                    color: ColorRes.deep300,
                    fontSize: 11,
                    fontWeight: FontWeight.w700,
                    fontFamily: 'Roboto',
                    overflow: TextOverflow.ellipsis,
                    maxLines: 2,
                  ),
                ),
              ),
            ],
          ),
          Row(
            children: [
              Expanded(
                child: Container(
                  height: 40,
                  padding: const EdgeInsets.symmetric(horizontal: 5),
                  decoration:  BoxDecoration(
                      border: Border(
                          left: BorderSide(
                              color: ColorRes.primaryColor.withAlpha((0.3 * 255).toInt()),
                              width: 1
                          ),
                          bottom: BorderSide(
                              color: ColorRes.primaryColor.withAlpha((0.3 * 255).toInt()),
                              width: 1
                          )
                      )

                  ),
                  child: const Align(
                    alignment: Alignment.centerRight,
                    child: GlobalText(
                      str: "Paid (BDT):",
                      color: ColorRes.deep300,
                      fontSize: 11,
                      fontWeight: FontWeight.w700,
                      fontFamily: 'Roboto',
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ),
              ),
              Container(
                height: 40,
                width: 111,
                padding: const EdgeInsets.symmetric(horizontal: 5),
                decoration:  BoxDecoration(
                    border: Border(
                        left: BorderSide(
                            color: ColorRes.primaryColor.withAlpha((0.3 * 255).toInt()),
                            width: 1
                        ),

                        right: BorderSide(
                            color: ColorRes.primaryColor.withAlpha((0.3 * 255).toInt()),
                            width: 1
                        ),
                        bottom: BorderSide(
                            color: ColorRes.primaryColor.withAlpha((0.3 * 255).toInt()),
                            width: 1
                        )
                    )

                ),
                child: Align(
                  alignment: Alignment.centerRight,
                  child: GlobalText(
                    str: fourColumn,
                    color: ColorRes.deep300,
                    fontSize: 11,
                    fontWeight: FontWeight.w700,
                    fontFamily: 'Roboto',
                    overflow: TextOverflow.ellipsis,
                    maxLines: 2,
                  ),
                ),
              ),
            ],
          ),
          Row(
            children: [
              Expanded(
                child: Container(
                  height: 40,
                  padding: const EdgeInsets.symmetric(horizontal: 5),
                  decoration:  BoxDecoration(
                      border: Border(
                          left: BorderSide(
                              color: ColorRes.primaryColor.withAlpha((0.3 * 255).toInt()),
                              width: 1
                          ),
                          bottom: BorderSide(
                              color: ColorRes.primaryColor.withAlpha((0.3 * 255).toInt()),
                              width: 1
                          )
                      )

                  ),
                  child: const Align(
                    alignment: Alignment.centerRight,
                    child: GlobalText(
                      str: "Change (BDT):",
                      color: ColorRes.deep300,
                      fontSize: 11,
                      fontWeight: FontWeight.w700,
                      fontFamily: 'Roboto',
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ),
              ),
              Container(
                height: 40,
                width: 111,
                padding: const EdgeInsets.symmetric(horizontal: 5),
                decoration:  BoxDecoration(
                    border: Border(
                        left: BorderSide(
                            color: ColorRes.primaryColor.withAlpha((0.3 * 255).toInt()),
                            width: 1
                        ),

                        right: BorderSide(
                            color: ColorRes.primaryColor.withAlpha((0.3 * 255).toInt()),
                            width: 1
                        ),
                        bottom: BorderSide(
                            color: ColorRes.primaryColor.withAlpha((0.3 * 255).toInt()),
                            width: 1
                        )
                    )

                ),
                child: Align(
                  alignment: Alignment.centerRight,
                  child: GlobalText(
                    str: fiveColumn,
                    color: ColorRes.deep300,
                    fontSize: 11,
                    fontWeight: FontWeight.w700,
                    fontFamily: 'Roboto',
                    overflow: TextOverflow.ellipsis,
                    maxLines: 2,
                  ),
                ),
              ),
            ],
          ),

        ],
      ),
    );
  }
}
