
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../../../global/widget/global_sizedbox.dart';
import '../../../../global/constants/colors_resources.dart';
import '../../../../global/constants/input_decoration.dart';
import '../../../../global/widget/global_container.dart';
import '../../../../global/widget/global_search_text_formfield.dart';
import '../../../../global/widget/global_textform_field.dart';
import '../../base_widget/custom_appbar.dart';
import '../../base_widget/global_button.dart';

class SaleEntrySearchScreen extends StatefulWidget {
  const SaleEntrySearchScreen({super.key});

  @override
  State<SaleEntrySearchScreen> createState() => _SaleEntrySearchScreenState();
}

class _SaleEntrySearchScreenState extends State<SaleEntrySearchScreen> {

  final GlobalKey<ScaffoldState> drawerKey = GlobalKey<ScaffoldState>();

  TextEditingController fromDateCon = TextEditingController();
  TextEditingController toDateCon = TextEditingController();
  TextEditingController invoiceCon = TextEditingController();
  TextEditingController  paidAmountCon = TextEditingController();

  String selectDiscountStatus = "0";
  String selectPaymentMode = "0";

  @override
  Widget build(BuildContext context) {
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
                                  controller: fromDateCon,
                                  titleText: 'From (Date)',
                                  hintText: 'From (Date)',
                                  decoration: borderDecoration,
                                  isDense: true,
                                ),
                              ),
                              sizeBoxW(5),
                              Expanded(
                                child: GlobalTextFormField(
                                  controller: toDateCon,
                                  titleText: 'To (Date)',
                                  hintText: 'To (Date)',
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
                                  item: const [],
                                  onSelect: (val) async{},
                                ),
                              ),

                            ],
                          ),

                          sizeBoxH(10),
                          Row(
                            children: [
                              Expanded(
                                child: GlobalTextFormField(
                                  controller: paidAmountCon,
                                  titleText: 'Amount',
                                  hintText: 'Amount',
                                  decoration: borderDecoration,
                                  isDense: true,
                                ),
                              ),
                              sizeBoxW(5),
                              Expanded(
                                child: GlobalSmallSearchTextFormField(
                                  text: selectPaymentMode,
                                  titleText: "Payment Mode",
                                  vertical: 10,
                                  color: ColorRes.black,
                                  item: const [],
                                  onSelect: (val) async{},
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
                          onTap: (){}
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
