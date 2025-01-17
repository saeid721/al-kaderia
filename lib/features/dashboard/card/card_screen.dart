import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../../../global/widget/global_sizedbox.dart';
import '../../../../global/constants/colors_resources.dart';
import '../../../../global/constants/input_decoration.dart';
import '../../../../global/widget/dotted_line_painter.dart';
import '../../../../global/widget/global_container.dart';
import '../../../../global/widget/global_search_text_formfield.dart';
import '../../../../global/widget/global_text.dart';
import '../../../../global/widget/global_textform_field.dart';
import '../../../global/utils/show_toast.dart';
import '../../base_widget/custom_appbar.dart';
import '../../base_widget/global_button.dart';
import '../sale_report/controller/sales_report_controller.dart';

class CardScreen extends StatefulWidget {
  const CardScreen({super.key});

  @override
  State<CardScreen> createState() => _CardScreenState();
}

class _CardScreenState extends State<CardScreen> {

  final GlobalKey<ScaffoldState> drawerKey = GlobalKey<ScaffoldState>();

  TextEditingController discountAmountCon = TextEditingController();
  TextEditingController percentCon = TextEditingController();
  TextEditingController tokenNoCon = TextEditingController();
  TextEditingController paidAmountCon = TextEditingController();
  TextEditingController noteCon = TextEditingController();

  String selectPaymentMode = "0";
  List<String> selectServeTypeList = [
    "Take Away",
    "Home Delivery",
    "Pathao",
    "Food Panda",
    "Hungry Naki",
    "Foodie",
    "PandaGo",
    "Guest Complimentory",
    "Staff Complimentory",
    "Cafe",
    "Express",
  ];

  String selectProduct = "Select Addons";
  String payment = "Select Payment";
  String selectType = "Select Type";
  String selectWaiterData = "0";

  // Checkbox states
  bool isMoreHotSelected = false;
  bool isMoreSauceSelected = false;
  bool isSliceSelected = false;
  bool isTakeawaySelected = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    final reqController = SalesReportController.current;

  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SalesReportController>(builder: (salesReportController) {
        return Scaffold(
            appBar: const PreferredSize(
                preferredSize: Size.fromHeight(60),
                child: GlobalAppBar(
                  title: 'Card',
                )
            ),
            body: GlobalContainer(
                height: size(context).height,
                width: size(context).width,
                color: Colors.white,
                child: NotificationListener<OverscrollIndicatorNotification>(
                  onNotification: (overScroll){
                    overScroll.disallowIndicator();
                    return true;
                  },
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        sizeBoxH(20),
                        Container(
                          width: Get.width,
                          margin: const EdgeInsets.only(bottom: 10, left: 10, right: 10),
                          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
                          decoration: const BoxDecoration(
                              color: ColorRes.blue100,
                              borderRadius: BorderRadius.only(topLeft: Radius.circular(5), topRight: Radius.circular(5))
                          ),
                          child: const Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Expanded(
                                child: SizedBox(
                                  child: Align(
                                    alignment: Alignment.centerLeft,
                                    child: GlobalText(
                                      str: "Item Info",
                                      color: ColorRes.primaryColor,
                                      fontSize: 13,
                                      fontWeight: FontWeight.w700,
                                      textAlign: TextAlign.center,
                                      fontFamily: 'Rubik',
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: 100,
                                child: GlobalText(
                                  str: "Qty",
                                  color: ColorRes.primaryColor,
                                  fontSize: 13,
                                  fontWeight: FontWeight.w700,
                                  textAlign: TextAlign.center,
                                  fontFamily: 'Rubik',
                                ),
                              ),
                              SizedBox(
                                width: 50,
                                child: GlobalText(
                                  str: "Rate",
                                  color: ColorRes.primaryColor,
                                  fontSize: 13,
                                  fontWeight: FontWeight.w700,
                                  textAlign: TextAlign.center,
                                  fontFamily: 'Rubik',
                                ),
                              ),
                              SizedBox(
                                width: 70,
                                child: GlobalText(
                                  str: "T. Price",
                                  color: ColorRes.primaryColor,
                                  fontSize: 13,
                                  fontWeight: FontWeight.w700,
                                  textAlign: TextAlign.center,
                                  fontFamily: 'Rubik',
                                ),
                              ),
                            ],
                          ),
                        ),

                        ListView.builder(
                          itemCount: salesReportController.categoryProductModel?.data?.length ?? 0,
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          itemBuilder: (context, index){
                            final productData = salesReportController.categoryProductModel?.data?[index];

                            double productRate = double.tryParse(productData?.productRate ?? '0') ?? 0.0;
                            double quantity = productData?.quantity?.toDouble() ?? 0.0;
                            productData?.subTotalAmount = quantity * productRate;

                            return Container(
                              width: Get.width,
                              margin: const EdgeInsets.only(bottom: 10),
                              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5),
                                  color: ColorRes.white,
                                  boxShadow: [
                                    BoxShadow(
                                        color: ColorRes.grey.withAlpha((0.3 * 255).toInt()),
                                        blurRadius: 5
                                    )
                                  ]
                              ),
                              child: Column(
                                children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Expanded(
                                        child: SizedBox(
                                          child: GlobalText(
                                            str: productData?.productName ?? '',
                                            color: ColorRes.black,
                                            fontSize: 12,
                                            fontWeight: FontWeight.w500,
                                            fontFamily: 'Rubik',
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        width: 100,
                                        child: Row(
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          children: [
                                            // Decrease Quantity Button
                                            GestureDetector(
                                              onTap: () {
                                                setState(() {
                                                  if (productData?.quantity! == 1) {
                                                    productData?.quantity = productData.quantity! - 1;

                                                    // Update subTotalAmount
                                                    double productRate = double.tryParse(productData?.productRate ?? '0') ?? 0.0;
                                                    productData?.subTotalAmount = productData.quantity! * productRate;

                                                    // Update totalAmount if needed
                                                    salesReportController.totalAmount = salesReportController.subTotalAmount;
                                                  }
                                                });
                                              },
                                              child: const Icon(Icons.remove_circle_outline, size: 20, color: ColorRes.primaryColor),
                                            ),
                                            sizeBoxW(3),
                                            Container(
                                              width: 30,
                                              margin: const EdgeInsets.symmetric(vertical: 3),
                                              decoration: BoxDecoration(
                                                borderRadius: BorderRadius.circular(5),
                                                border: Border.all(width: 1, color: ColorRes.primaryColor),
                                              ),
                                              child: GlobalText(
                                                str: productData?.quantity.toString() ?? '',
                                                color: ColorRes.primaryColor,
                                                fontSize: 12,
                                                fontWeight: FontWeight.w700,
                                                textAlign: TextAlign.center,
                                                fontFamily: 'Rubik',
                                              ),
                                            ),
                                            sizeBoxW(3),
                                            // Increase Quantity Button
                                            GestureDetector(
                                              onTap: () {
                                                setState(() {
                                                  productData?.quantity = productData.quantity! + 1;

                                                  // Update subTotalAmount
                                                  double productRate = double.tryParse(productData?.productRate ?? '0') ?? 0.0;
                                                  productData?.subTotalAmount = productData.quantity! * productRate;

                                                  // Update totalAmount if needed
                                                  salesReportController.totalAmount = salesReportController.subTotalAmount;
                                                });
                                              },
                                              child: const Icon(Icons.add_circle_outline, size: 20, color: ColorRes.primaryColor),
                                            ),
                                          ],
                                        ),
                                      ),
                                      SizedBox(
                                        width: 50,
                                        child: GlobalText(
                                          str: productData?.productRate ?? '',
                                          color: ColorRes.deep100,
                                          fontSize: 12,
                                          fontWeight: FontWeight.w700,
                                          textAlign: TextAlign.center,
                                          fontFamily: 'Rubik',
                                        ),
                                      ),
                                      SizedBox(
                                        width: 70,
                                        child: GlobalText(
                                          str: productData?.subTotalAmount?.toStringAsFixed(0) ?? '',
                                          color: ColorRes.deep100,
                                          fontSize: 12,
                                          fontWeight: FontWeight.w700,
                                          textAlign: TextAlign.center,
                                          fontFamily: 'Rubik',
                                        ),
                                      ),
                                    ],
                                  ),

                                  sizeBoxH(10),
                                  CustomPaint(
                                    size: Size(MediaQuery.of(context).size.width, 1),
                                    painter: DottedLinePainter(),
                                  ),

                                  sizeBoxH(10),
                                  GlobalSmallSearchTextFormField(
                                    text: selectProduct,
                                    color: ColorRes.black,
                                    item: const [],
                                    onSelect: (val) async{},
                                  ),

                                  sizeBoxH(10),
                                  Row(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Expanded(
                                        child: Row(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            SizedBox(
                                              height: 13,
                                              width: 13,
                                              child: Transform.scale(
                                                scale: 0.7,
                                                child: Checkbox(
                                                  value: isMoreHotSelected,
                                                  onChanged: (value) {
                                                    setState(() {
                                                      isMoreHotSelected = value ?? false;
                                                    });
                                                  },
                                                ),
                                              ),
                                            ),

                                            sizeBoxW(5),
                                            const Flexible(
                                              child: GlobalText(
                                                str: "More Hot",
                                                color: ColorRes.black,
                                                fontSize: 12,
                                                fontWeight: FontWeight.w500,
                                                textAlign: TextAlign.center,
                                                fontFamily: 'Rubik',
                                              ),
                                            ),

                                          ],
                                        ),
                                      ),

                                      Expanded(
                                        child: Row(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            SizedBox(
                                              height: 13,
                                              width: 13,
                                              child: Transform.scale(
                                                scale: 0.7,
                                                child: Checkbox(
                                                  value: isMoreSauceSelected,
                                                  onChanged: (value) {
                                                    setState(() {
                                                      isMoreSauceSelected = value ?? false;
                                                    });
                                                  },
                                                ),
                                              ),
                                            ),

                                            sizeBoxW(5),
                                            const Flexible(
                                              child: GlobalText(
                                                str: "More Sauce",
                                                color: ColorRes.black,
                                                fontSize: 12,
                                                fontWeight: FontWeight.w500,
                                                textAlign: TextAlign.center,
                                                fontFamily: 'Rubik',
                                              ),
                                            ),

                                          ],
                                        ),
                                      ),

                                      Expanded(
                                        child: Row(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            SizedBox(
                                              height: 13,
                                              width: 13,
                                              child: Transform.scale(
                                                scale: 0.7, // Adjust the scale factor to make the checkbox smaller or larger
                                                child: Checkbox(
                                                  value: isSliceSelected,
                                                  onChanged: (value) {
                                                    setState(() {
                                                      isSliceSelected = value ?? false;
                                                    });
                                                  },
                                                ),
                                              ),
                                            ),

                                            sizeBoxW(5),
                                            const Flexible(
                                              child: GlobalText(
                                                str: "Slice",
                                                color: ColorRes.black,
                                                fontSize: 12,
                                                fontWeight: FontWeight.w500,
                                                textAlign: TextAlign.center,
                                                fontFamily: 'Rubik',
                                              ),
                                            ),

                                          ],
                                        ),
                                      ),
                                    ],
                                  ),

                                  sizeBoxH(10),
                                  Row(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      SizedBox(
                                        height: 13,
                                        width: 13,
                                        child: Transform.scale(
                                          scale: 0.7, // Adjust the scale factor to make the checkbox smaller or larger
                                          child: Checkbox(
                                            value: isTakeawaySelected,
                                            onChanged: (value) {
                                              setState(() {
                                                isTakeawaySelected = value ?? false;
                                              });
                                            },
                                          ),
                                        ),
                                      ),

                                      sizeBoxW(5),
                                      const GlobalText(
                                        str: "Takeaway",
                                        color: ColorRes.black,
                                        fontSize: 12,
                                        fontWeight: FontWeight.w500,
                                        textAlign: TextAlign.center,
                                        fontFamily: 'Rubik',
                                      ),

                                    ],
                                  ),
                                ],
                              ),
                            );
                          },
                        ),

                        Container(
                          width: Get.width,
                          margin: const EdgeInsets.symmetric(horizontal: 10),
                          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              color: ColorRes.white,
                              boxShadow: [
                                BoxShadow(
                                    color: ColorRes.grey.withAlpha((0.3 * 255).toInt()),
                                    blurRadius: 5
                                )
                              ]
                          ),
                          child: Column(
                            children: [
                              const Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  GlobalText(
                                    str: "Grand Amount ",
                                    color: ColorRes.grey,
                                    fontSize: 13,
                                    fontWeight: FontWeight.w400,
                                    textAlign: TextAlign.center,
                                    fontFamily: 'Rubik',
                                  ),
                                  GlobalText(
                                    str: '2200',
                                    color: ColorRes.grey,
                                    fontSize: 13,
                                    fontWeight: FontWeight.w400,
                                    textAlign: TextAlign.center,
                                    fontFamily: 'Rubik',
                                  ),
                                ],
                              ),

                              sizeBoxH(10),
                              const Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  GlobalText(
                                    str: "Discount Amount	",
                                    color: ColorRes.grey,
                                    fontSize: 13,
                                    fontWeight: FontWeight.w400,
                                    textAlign: TextAlign.center,
                                    fontFamily: 'Rubik',
                                  ),
                                  GlobalText(
                                    str: "100",
                                    color: ColorRes.grey,
                                    fontSize: 13,
                                    fontWeight: FontWeight.w400,
                                    textAlign: TextAlign.center,
                                    fontFamily: 'Rubik',
                                  ),
                                ],
                              ),

                              sizeBoxH(10),
                              const Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  GlobalText(
                                    str: "Vat Amount(5%) ",
                                    color: ColorRes.grey,
                                    fontSize: 13,
                                    fontWeight: FontWeight.w400,
                                    textAlign: TextAlign.center,
                                    fontFamily: 'Rubik',
                                  ),
                                  GlobalText(
                                    str: "10",
                                    color: ColorRes.grey,
                                    fontSize: 13,
                                    fontWeight: FontWeight.w400,
                                    textAlign: TextAlign.center,
                                    fontFamily: 'Rubik',
                                  ),
                                ],
                              ),

                              sizeBoxH(10),
                              const Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  GlobalText(
                                    str: "Payable Amount	",
                                    color: ColorRes.grey,
                                    fontSize: 13,
                                    fontWeight: FontWeight.w400,
                                    textAlign: TextAlign.center,
                                    fontFamily: 'Rubik',
                                  ),
                                  GlobalText(
                                    str: "50",
                                    color: ColorRes.grey,
                                    fontSize: 13,
                                    fontWeight: FontWeight.w400,
                                    textAlign: TextAlign.center,
                                    fontFamily: 'Rubik',
                                  ),
                                ],
                              ),

                              sizeBoxH(10),
                              const Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  GlobalText(
                                    str: "Change Amount",
                                    color: ColorRes.grey,
                                    fontSize: 13,
                                    fontWeight: FontWeight.w400,
                                    textAlign: TextAlign.center,
                                    fontFamily: 'Rubik',
                                  ),
                                  GlobalText(
                                    str: "40",
                                    color: ColorRes.grey,
                                    fontSize: 13,
                                    fontWeight: FontWeight.w400,
                                    textAlign: TextAlign.center,
                                    fontFamily: 'Rubik',
                                  ),
                                ],
                              ),

                              sizeBoxH(10),
                              const Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  GlobalText(
                                    str: "Current Point",
                                    color: ColorRes.grey,
                                    fontSize: 13,
                                    fontWeight: FontWeight.w400,
                                    textAlign: TextAlign.center,
                                    fontFamily: 'Rubik',
                                  ),
                                  GlobalText(
                                    str: "40",
                                    color: ColorRes.grey,
                                    fontSize: 13,
                                    fontWeight: FontWeight.w400,
                                    textAlign: TextAlign.center,
                                    fontFamily: 'Rubik',
                                  ),
                                ],
                              ),

                              sizeBoxH(10),
                              CustomPaint(
                                size: Size(MediaQuery.of(context).size.width, 1),
                                painter: DottedLinePainter(),
                              ),
                              sizeBoxH(10),

                              const Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  GlobalText(
                                    str: "Total Amount",
                                    color: ColorRes.black,
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold,
                                    fontFamily: 'Rubik',
                                  ),
                                  GlobalText(
                                    str: "2000",
                                    color: ColorRes.black,
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold,
                                    fontFamily: 'Rubik',
                                  ),
                                ],
                              ),

                            ],
                          ),
                        ),

                        sizeBoxH(15),
                        Container(
                          width: Get.width,
                          margin: const EdgeInsets.symmetric(horizontal: 10),
                          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              color: ColorRes.white,
                              boxShadow: [
                                BoxShadow(
                                    color: ColorRes.grey.withAlpha((0.3 * 255).toInt()),
                                    blurRadius: 5
                                )
                              ]
                          ),
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  Expanded(
                                    child: GlobalTextFormField(
                                      controller: discountAmountCon,
                                      titleText: 'Discount Amount',
                                      hintText: 'Discount Amount',
                                      decoration: borderDecoration,
                                      isDense: true,
                                    ),
                                  ),
                                  sizeBoxW(5),
                                  Expanded(
                                    child: GlobalTextFormField(
                                      controller: percentCon,
                                      titleText: 'Percent (%)',
                                      hintText: 'Percent (%)',
                                      decoration: borderDecoration,
                                      isDense: true,
                                    ),
                                  ),
                                ],
                              ),

                              sizeBoxH(10),
                              Row(
                                children: [
                                  Expanded(
                                    child: GlobalTextFormField(
                                      controller: tokenNoCon,
                                      titleText: 'Token No.',
                                      hintText: 'Token No.',
                                      decoration: borderDecoration,
                                      isDense: true,
                                    ),
                                  ),
                                  sizeBoxW(5),
                                  Expanded(
                                    child: GlobalSmallSearchTextFormField(
                                      text: selectType,
                                      titleText: "Type",
                                      vertical: 13,
                                      color: ColorRes.black,
                                      item: selectServeTypeList,
                                      onSelect: (val) async {
                                        setState(() {
                                          selectType = selectServeTypeList[val];
                                          log("Value: $selectType");
                                        });
                                        Get.back();
                                      },
                                    ),
                                  ),

                                ],
                              ),

                              sizeBoxH(10),
                              Row(
                                children: [
                                  Expanded(
                                    child: GlobalSmallSearchTextFormField(
                                      titleText: 'Payment Mode',
                                      vertical: 13,
                                      text: salesReportController.selectPaymentMode,
                                      color: salesReportController.selectPaymentModeIndex > -1 ? ColorRes.black : ColorRes.grey,
                                      item: salesReportController.selectPaymentModeList ?? [],
                                      onSelect: (val) async {
                                        setState(() {
                                          Get.back();

                                          salesReportController.selectPaymentModeIndex = val;

                                          salesReportController.selectPaymentMode = salesReportController.selectPaymentModeList![val];

                                          final paymentType = salesReportController.paymentModeData?[salesReportController.selectPaymentModeList!.indexOf(salesReportController.selectPaymentMode)].fundId?.toString();

                                          log('Drop Main Id: $paymentType');

                                          if (paymentType != null) {
                                            selectPaymentMode = paymentType;
                                            salesReportController.getPaymentModeList();
                                          } else {
                                            log('Drop Id: $selectPaymentMode');
                                          }
                                        });
                                      },
                                    ),
                                  ),
                                  sizeBoxW(5),
                                  Expanded(
                                    child: GlobalTextFormField(
                                      controller: paidAmountCon,
                                      titleText: 'Paid Amount',
                                      hintText: 'Paid Amount',
                                      decoration: borderDecoration,
                                      isDense: true,
                                    ),
                                  ),
                                ],
                              ),
                              sizeBoxH(10),
                              GlobalSearchTextFormField(
                                text: salesReportController.selectWaiterData,
                                color: salesReportController.selectWaiterDataIndex > -1 ? ColorRes.black : ColorRes.grey,
                                item: salesReportController.selectWaiterList ?? [],
                                onSelect: (val) async {
                                  setState(() {
                                    Get.back();

                                    salesReportController.selectWaiterDataIndex = val;
                                    salesReportController.selectWaiterData = salesReportController.selectWaiterList![val];

                                    final waiterType = salesReportController
                                        .waiterData?[salesReportController.selectWaiterList!.indexOf(
                                        salesReportController.selectWaiterData)]
                                        .waiterId
                                        ?.toString();

                                    log('Drop Main Id: $waiterType');

                                    if (waiterType != null) {
                                      selectType = waiterType;
                                      salesReportController.getWaiterList();
                                    } else {
                                      log('Drop Id: $selectType');
                                    }
                                  });
                                },
                              ),
                              sizeBoxH(10),
                              GlobalTextFormField(
                                controller: noteCon,
                                hintText: 'If you have to note anything..',
                                decoration: borderDecoration,
                                isDense: true,
                                maxLine: 2,
                              ),

                            ],
                          ),
                        ),

                        sizeBoxH(30),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          child: GlobalButtonWidget(
                              str: 'Confirm Invoice',
                              height: 45,
                              onTap: (){
                                  if(tokenNoCon.text.isNotEmpty){
                                    salesReportController.reqSalesModel(
                                      tokenNo: tokenNoCon.text.trim(),
                                    );
                                  } else{
                                    showCustomSnackBar("Required Token No.");
                                  }
                              }
                          ),
                        ),
                        sizeBoxH(30),
                      ],
                    ),
                  ),
                )
            )
        );
      }
    );
  }
}


// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:al_kaderia/view/base_widget/custom_appbar.dart';
// import '../../../../../../global/widget/global_sizedbox.dart';
// import '../../../../global/constants/colors_resources.dart';
// import '../../../../global/widget/dotted_line_painter.dart';
// import '../../../../global/widget/global_container.dart';
// import '../../../../global/widget/global_text.dart';
// import '../../../base_widget/global_button.dart';
//
// class CardScreen extends StatefulWidget {
//   const CardScreen({super.key});
//
//   @override
//   State<CardScreen> createState() => _CardScreenState();
// }
//
// class _CardScreenState extends State<CardScreen> {
//
//   final GlobalKey<ScaffoldState> drawerKey = GlobalKey<ScaffoldState>();
//   String selectProduct = "Select Items";
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         resizeToAvoidBottomInset: false,
//         key: drawerKey,
//         appBar: const PreferredSize(
//             preferredSize: Size.fromHeight(60),
//             child: GlobalAppBar(
//               title: 'Card',
//             )
//         ),
//         body: GlobalContainer(
//             height: size(context).height,
//             width: size(context).width,
//             color: Colors.white,
//             child: Column(
//               children: [
//                 Column(
//                   children: [
//                     sizeBoxH(20),
//                     Container(
//                       width: Get.width,
//                       margin: const EdgeInsets.only(bottom: 10, left: 10, right: 10),
//                       padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
//                       decoration: const BoxDecoration(
//                           color: ColorRes.blue100,
//                           borderRadius: BorderRadius.only(topLeft: Radius.circular(5), topRight: Radius.circular(5))
//                       ),
//                       child: const Row(
//                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                         children: [
//                           Expanded(
//                             child: SizedBox(
//                               child: Align(
//                                 alignment: Alignment.centerLeft,
//                                 child: GlobalText(
//                                   str: "Item Info",
//                                   color: ColorRes.primaryColor,
//                                   fontSize: 13,
//                                   fontWeight: FontWeight.w700,
//                                   textAlign: TextAlign.center,
//                                   fontFamily: 'Rubik',
//                                 ),
//                               ),
//                             ),
//                           ),
//                           SizedBox(
//                             width: 100,
//                             child: GlobalText(
//                               str: "Quantity",
//                               color: ColorRes.primaryColor,
//                               fontSize: 13,
//                               fontWeight: FontWeight.w700,
//                               textAlign: TextAlign.center,
//                               fontFamily: 'Rubik',
//                             ),
//                           ),
//                           SizedBox(
//                             width: 70,
//                             child: GlobalText(
//                               str: "Amount",
//                               color: ColorRes.primaryColor,
//                               fontSize: 13,
//                               fontWeight: FontWeight.w700,
//                               textAlign: TextAlign.center,
//                               fontFamily: 'Rubik',
//                             ),
//                           ),
//                         ],
//                       ),
//                     ),
//
//                     Container(
//                       width: Get.width,
//                       margin: const EdgeInsets.symmetric(horizontal: 10),
//                       padding: const EdgeInsets.symmetric(vertical: 8),
//                       decoration: BoxDecoration(
//                           borderRadius: BorderRadius.circular(5),
//                           color: ColorRes.white,
//                           boxShadow: [
//                             BoxShadow(
//                                 color: ColorRes.grey.withOpacity(0.3),
//                                 blurRadius: 5
//                             )
//                           ]
//                       ),
//                       child: Column(
//                         children: [
//                           ListView.builder(
//                             itemCount: 4,
//                             shrinkWrap: true,
//                             physics: const NeverScrollableScrollPhysics(),
//                             padding: const EdgeInsets.symmetric(horizontal: 10),
//                             itemBuilder: (context, index){
//                               return Container(
//                                 padding: const EdgeInsets.only(bottom: 10, top: 5),
//                                 child: Column(
//                                   children: [
//                                     Row(
//                                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                                       children: [
//                                         const Expanded(
//                                           child: SizedBox(
//                                             child: GlobalText(
//                                               str: 'Beef & Bacon Burger',
//                                               color: ColorRes.black,
//                                               fontSize: 12,
//                                               fontWeight: FontWeight.w500,
//                                               fontFamily: 'Rubik',
//                                             ),
//                                           ),
//                                         ),
//                                         SizedBox(
//                                           width: 100,
//                                           child: Row(
//                                             mainAxisAlignment: MainAxisAlignment.center,
//                                             children: [
//                                               GestureDetector(
//                                                   onTap:(){
//
//                                                   },
//                                                   child: const Icon(Icons.remove_circle_outline, size: 20, color:ColorRes.primaryColor)),
//                                               sizeBoxW(3),
//                                               Container(
//                                                 width: 30,
//                                                 margin: const EdgeInsets.symmetric(vertical: 3),
//                                                 decoration: BoxDecoration(
//                                                     borderRadius: BorderRadius.circular(5),
//                                                     border: Border.all(width: 1, color: ColorRes.primaryColor)
//                                                 ),
//                                                 child: const GlobalText(
//                                                   str: "2",
//                                                   color: ColorRes.primaryColor,
//                                                   fontSize: 12,
//                                                   fontWeight: FontWeight.w700,
//                                                   textAlign: TextAlign.center,
//                                                   fontFamily: 'Rubik',
//                                                 ),
//                                               ),
//                                               sizeBoxW(3),
//                                               GestureDetector(
//                                                   onTap:(){},
//                                                   child: const Icon(Icons.add_circle_outline, size: 20, color: ColorRes.primaryColor,)),
//                                             ],
//                                           ),
//                                         ),
//                                         const SizedBox(
//                                           width: 70,
//                                           child: GlobalText(
//                                             str: "2000",
//                                             color: ColorRes.deep100,
//                                             fontSize: 12,
//                                             fontWeight: FontWeight.w700,
//                                             textAlign: TextAlign.center,
//                                             fontFamily: 'Rubik',
//                                           ),
//                                         ),
//                                       ],
//                                     ),
//                                   ],
//                                 ),
//                               );
//                             },
//                           ),
//
//                           sizeBoxH(10),
//                           Padding(
//                             padding: const EdgeInsets.symmetric(horizontal: 10),
//                             child: CustomPaint(
//                               size: Size(MediaQuery.of(context).size.width, 1),
//                               painter: DottedLinePainter(),
//                             ),
//                           ),
//                           sizeBoxH(10),
//
//                           const Padding(
//                             padding: EdgeInsets.only(left: 10, right: 30),
//                             child: Row(
//                               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                               children: [
//                                 GlobalText(
//                                   str: "Total Amount",
//                                   color: ColorRes.black,
//                                   fontSize: 13,
//                                   fontWeight: FontWeight.bold,
//                                   fontFamily: 'Rubik',
//                                 ),
//                                 GlobalText(
//                                   str: "2000",
//                                   color: ColorRes.black,
//                                   fontSize: 13,
//                                   fontWeight: FontWeight.bold,
//                                   fontFamily: 'Rubik',
//                                 ),
//                               ],
//                             ),
//                           ),
//
//                           sizeBoxH(10),
//                         ],
//                       ),
//                     )
//                   ],
//                 ),
//                 Expanded(child: Container()),
//                 Padding(
//                   padding: const EdgeInsets.symmetric(horizontal: 10),
//                   child: GlobalButtonWidget(
//                       str: 'Charge',
//                       height: 45,
//                       onTap: (){}
//                   ),
//                 ),
//                 sizeBoxH(20),
//               ],
//             )
//         )
//     );
//   }
// }
//
