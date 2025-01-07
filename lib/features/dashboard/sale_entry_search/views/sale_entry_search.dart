import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../../../../global/widget/global_sizedbox.dart';
import '../../../../../global/constants/colors_resources.dart';
import '../../../../../global/constants/input_decoration.dart';
import '../../../../../global/widget/global_container.dart';
import '../../../../../global/widget/global_search_text_formfield.dart';
import '../../../../../global/widget/global_textform_field.dart';
import '../../../../global/constants/date_time_formatter.dart';
import '../../../../global/constants/images.dart';
import '../../../../global/method/show_date_time_picker.dart';
import '../../../../global/utils/show_toast.dart';
import '../../../../global/widget/global_image_loader.dart';
import '../../../../global/widget/global_text.dart';
import '../../../base_widget/custom_appbar.dart';
import '../../../base_widget/global_button.dart';
import '../controller/sales_report_controller.dart';
import 'component/table_widget.dart';

class SaleEntrySearchScreen extends StatefulWidget {
  const SaleEntrySearchScreen({super.key});

  @override
  State<SaleEntrySearchScreen> createState() => _SaleEntrySearchScreenState();
}

class _SaleEntrySearchScreenState extends State<SaleEntrySearchScreen> {

  final GlobalKey<ScaffoldState> drawerKey = GlobalKey<ScaffoldState>();

  TextEditingController selectFromDate = TextEditingController();
  TextEditingController selectToDate = TextEditingController();
  TextEditingController invoiceCon = TextEditingController();
  TextEditingController  amountCon = TextEditingController();

  String selectPaymentMode = "0";
  String selectDiscountStatus = "Select One";
  List<String> selectDiscountStatusList = ["Flat", "Percentage"];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    final reqController = SalesReportController.current;
    reqController.getPaymentModeList();

    String formattedToday = DateTimeFormatter.showDateOnlyYear.format(DateTime.now());
    selectFromDate = TextEditingController(text: formattedToday);
    selectToDate = TextEditingController(text: formattedToday);
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SalesReportController>(builder: (salesReportController) {
        return Scaffold(
            appBar: const PreferredSize(
                preferredSize: Size.fromHeight(60),
                child: GlobalAppBar(
                  title: 'Sales Report (Invoice)',
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
                          margin: const EdgeInsets.symmetric(horizontal: 10),
                          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              color: ColorRes.white,
                              boxShadow: [
                                BoxShadow(
                                    color: ColorRes.grey.withOpacity(0.3),
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
                                      controller: selectFromDate,
                                      titleText: "From (Date)",
                                      decoration: dateInputDecoration,
                                      prefixIcon: GestureDetector(
                                          onTap: () async{
                                            var pickedDate = await showDateOnlyPicker(context);
                                            setState(() {
                                              String formatedDate = DateTimeFormatter.showDateOnly.format(pickedDate);
                                              selectFromDate.text = formatedDate;
                                              salesReportController.getPaymentModeList();
                                            });
                                          },
                                          child: const Icon(Icons.calendar_month_outlined, color: ColorRes.grey, size: 20)
                                      ),
                                      isDense: true,
                                    ),
                                  ),
                                  sizeBoxW(5),
                                  Expanded(
                                    child: GlobalTextFormField(
                                      controller: selectToDate,
                                      titleText: "To (Date)",
                                      decoration: dateInputDecoration,
                                      prefixIcon: GestureDetector(
                                          onTap: () async{
                                            var pickedDate = await showDateOnlyPicker(context);
                                            setState(() {
                                              String formatedDate = DateTimeFormatter.showDateOnly.format(pickedDate);
                                              selectToDate.text = formatedDate;
                                              salesReportController.getPaymentModeList();
                                            });
                                          },
                                          child: const Icon(Icons.calendar_month_outlined, color: ColorRes.grey, size: 20)
                                      ),
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
                                      controller: invoiceCon,
                                      titleText: 'Invoice(Bill No)',
                                      hintText: 'Invoice(Bill No)',
                                      decoration: borderDecoration,
                                      isDense: true,
                                    ),
                                  ),
                                  sizeBoxW(5),
                                  Expanded(
                                    child: GlobalSmallSearchTextFormField(
                                      text: selectDiscountStatus,
                                      titleText: "Discount Status",
                                      vertical: 10,
                                      color: ColorRes.black,
                                      item: selectDiscountStatusList,
                                      onSelect: (val) async{
                                        setState(() {
                                          selectDiscountStatus = selectDiscountStatusList[val];
                                          log("Value: $selectDiscountStatus");
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
                                    child: GlobalTextFormField(
                                      controller: amountCon,
                                      titleText: 'Amount',
                                      hintText: 'Amount',
                                      decoration: borderDecoration,
                                      isDense: true,
                                    ),
                                  ),
                                  sizeBoxW(5),
                                  Expanded(
                                    child: GlobalSearchTextFormField(
                                      titleText: 'Payment Mode',
                                      text: salesReportController.selectPaymentMode,
                                      color: salesReportController.selectPaymentModeIndex > -1 ? ColorRes.black : ColorRes.grey,
                                      item: salesReportController.selectPaymentModeList ?? [], // List of items
                                      onSelect: (val) async {
                                        setState(() {
                                          Get.back();

                                          salesReportController.selectPaymentModeIndex = val;

                                          salesReportController.selectPaymentMode =
                                          salesReportController.selectPaymentModeList![val];

                                          final paymentType = salesReportController.paymentModeData?[
                                          salesReportController.selectPaymentModeList!.indexOf(
                                              salesReportController.selectPaymentMode)
                                          ].fundId?.toString();

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

                                  ],
                              ),
                            ],
                          ),
                        ),

                        sizeBoxH(30),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          child: GlobalButtonWidget(
                              str: 'Search',
                              height: 45,
                            onTap: () async{
                              if(selectPaymentMode != "0"){
                                if(amountCon.text.isNotEmpty){
                                  if(selectFromDate.text.isNotEmpty){
                                    if(selectToDate.text.isNotEmpty){
                                      await salesReportController.getPaymentModeList();
                                    } else{
                                      showCustomSnackBar("To Date Is Required");
                                    }
                                  } else{
                                    showCustomSnackBar("From Date Is Required");
                                  }
                                }else{
                                  showCustomSnackBar("Amount Is Required");
                                }
                              }else{
                              showCustomSnackBar("Payment Mode Is Required");
                              }
                            }
                          ),
                        ),
                        sizeBoxH(30),

                        const Padding(
                          padding: EdgeInsets.only(left: 15, right: 15),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Expanded(
                                child: Row(
                                  children: [
                                  Icon(
                                  Icons.calendar_month_outlined,
                                  size: 30,
                                  color: ColorRes.grey,
                                ),
                                GlobalText(
                                  str: "20/01/2025",
                                  color: ColorRes.deep300,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600,
                                  fontFamily: 'Roboto',
                                  overflow: TextOverflow.ellipsis,
                                  ),
                                  ]
                                ),
                              ),
                              Expanded(
                                child: Row(
                                    children: [
                                      Icon(
                                        Icons.calendar_month_outlined,
                                        size: 30,
                                        color: ColorRes.grey,
                                      ),
                                      GlobalText(
                                        str: "20/01/2025",
                                        color: ColorRes.deep300,
                                        fontSize: 16,
                                        fontWeight: FontWeight.w600,
                                        fontFamily: 'Roboto',
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                    ]
                                ),
                              ),
                              Expanded(
                                child: Row(
                                    children: [
                                      Icon(
                                        Icons.attach_money_outlined,
                                        size: 30,
                                        color: ColorRes.grey,
                                      ),
                                      GlobalText(
                                        str: "20/01/2025",
                                        color: ColorRes.deep300,
                                        fontSize: 16,
                                        fontWeight: FontWeight.w600,
                                        fontFamily: 'Roboto',
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                    ]
                                ),
                              ),

                            ],
                          ),
                        ),

                        Padding(
                          padding: const EdgeInsets.only(left: 15, right: 15, bottom: 15, top: 5),
                          child: Column(
                            children: [
                              const SaleTableTabBarWidget(
                                firstRow: 'SL',
                                secondRow: 'Date',
                                thirdRow: 'Invoice',
                                fourRow: 'Total',
                                fiveRow: 'Discount',
                                sixRow: 'Final',
                                sevenRow: 'Paid',
                                eightRow: 'Action',
                              ),
                              ListView.builder(
                                  shrinkWrap: true,
                                  itemCount: 2,
                                  physics: const NeverScrollableScrollPhysics(),
                                  itemBuilder: (ctx, index){
                                    return const SaleTableListValueWidget(
                                      firstColumn: '01',
                                      secondColumn: '07-01-2025',
                                      thirdColumn: '3250107053806',
                                      fourColumn: '415',
                                      fiveColumn: '0',
                                      sixColumn: '436',
                                      sevenColumn: '436.00',
                                      eightColumn: '',

                                    );
                                  }
                              ),
                            ],
                          ),
                        ),
                        sizeBoxH(5),
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
