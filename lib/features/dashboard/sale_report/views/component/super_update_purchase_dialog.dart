// import 'dart:developer';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import '../../../../../../../../data/controller/super_controller/product_menu_controller/model/super_product_menu/super_product_menu_model.dart';
// import '../../../../../../../../data/controller/super_controller/purchase_menu_controller/super_purchase_menu_controller.dart';
// import '../../../../../../../../data/controller/super_controller/supplier_menu_controller/super_supplier_menu_controller.dart';
// import '../../../../../../../../global/constants/colors_resources.dart';
// import '../../../../../../../../global/constants/date_time_formatter.dart';
// import '../../../../../../../../global/constants/input_decoration.dart';
// import '../../../../../../../../global/method/show_date_time_picker.dart';
// import '../../../../../../../../global/widget/global_drop_down_formfield.dart';
// import '../../../../../../../../global/widget/global_sizedbox.dart';
// import '../../../../../../../../global/widget/global_text.dart';
// import '../../../../../../../../global/widget/global_textform_field.dart';
// import '../../../../../../../base_widget/global_button.dart';
//
// class SuperUpdatePurchaseDialog extends StatefulWidget {
//   final SuperSearchSingleProductData productList;
//   final SuperPurchaseController purchaseController;
//   final SuperSupplierController supplierController;
//   // TextEditingController productNameCon;
//   // TextEditingController? stockQuantityCon;
//   // TextEditingController? quantityCon;
//   // TextEditingController? amountCon;
//   // TextEditingController? rateCon;
//   // TextEditingController? salesRateCon;
//   // Function() onButtonUpdate;
//   const SuperUpdatePurchaseDialog({
//     super.key,
//     required this.productList,
//     required this.purchaseController,
//     required this.supplierController,
//     // required this.productNameCon,
//     // required this.stockQuantityCon,
//     // required this.quantityCon,
//     // required this.amountCon,
//     // required this.rateCon,
//     // required this.salesRateCon,
//     // required this.onButtonUpdate
//   });
//
//   @override
//   State<SuperUpdatePurchaseDialog> createState() => _SuperUpdatePurchaseDialogState();
// }
//
// class _SuperUpdatePurchaseDialogState extends State<SuperUpdatePurchaseDialog> {
//
//   TextEditingController? productNameCon;
//   TextEditingController? stockQuantityCon;
//   TextEditingController? quantityCon;
//   TextEditingController? amountCon;
//   TextEditingController? rateCon;
//   TextEditingController? salesRateCon;
//   TextEditingController expiryDateCon = TextEditingController();
//
//   String supplier = '0';
//   String branch = '0';
//
//   @override
//   void initState() {
//     // TODO: implement initState
//     super.initState();
//     productNameCon = TextEditingController(text: widget.productList.productName ?? '');
//     stockQuantityCon = TextEditingController(text: widget.productList.stockQty ?? '');
//     rateCon = TextEditingController(text: widget.productList.purchaseRate ?? '');
//     amountCon = TextEditingController(text: "${(int.parse(widget.productList.purchaseRate ?? '') * int.parse(widget.productList.quantityCon.toString()))}");
//     quantityCon = TextEditingController(text: widget.productList.quantity.toString());
//     salesRateCon = TextEditingController(text: "${widget.productList.productRate}");
//
//     // Update the supplier dropdown value to the selected supplierName
//     supplier = widget.productList.supplierName ?? '';
//     branch = widget.productList.brandName ?? '';
//     log('Supplier Data: $supplier');
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return AlertDialog(
//       backgroundColor: Colors.white,
//       shape: RoundedRectangleBorder(
//         borderRadius: BorderRadius.circular(8),
//       ),
//       content: SizedBox(
//         height: Get.height,
//         width: Get.width,
//         child: NotificationListener<OverscrollIndicatorNotification>(
//           onNotification: (overScroll){
//             overScroll.disallowIndicator();
//             return true;
//           },
//           child: SingleChildScrollView(
//             child: Column(
//               children: [
//                 sizeBoxH(10),
//                 const GlobalText(
//                   str: 'Manage Purchase',
//                   color: ColorRes.shoesPrimaryColor,
//                   fontSize: 22,
//                   fontWeight: FontWeight.w500,
//                   textAlign: TextAlign.center,
//                   fontFamily: 'Rubik',
//                 ),
//
//                 sizeBoxH(10),
//                 GlobalTextFormField(
//                   controller: productNameCon,
//                   titleText: 'Product Name',
//                   hintText: 'Enter your product Name',
//                   decoration: borderDecoration,
//                   enabled: false,
//                   isDense: true,
//                 ),
//
//                 sizeBoxH(5),
//                 GlobalTextFormField(
//                   controller: rateCon,
//                   titleText: 'Rate',
//                   decoration: borderDecoration,
//                   isDense: true,
//                 ),
//
//                 sizeBoxH(5),
//                 GlobalTextFormField(
//                   controller: stockQuantityCon,
//                   titleText: 'Stock Quantity',
//                   decoration: borderDecoration,
//                   enabled: false,
//                   isDense: true,
//                 ),
//
//                 sizeBoxH(5),
//                 GlobalTextFormField(
//                   controller: quantityCon,
//                   titleText: 'Quantity',
//                   decoration: borderDecoration,
//                   isDense: true,
//                   onChanged: (val){
//                     if (val.isEmpty || int.tryParse(val.trim()) != null) {
//                       int quantity = int.parse(val.trim());
//                       int purchaseRate = int.parse(widget.productList.purchaseRate ?? '0');
//                       amountCon?.text = "${purchaseRate * quantity}";
//                     } else {
//                       // If the input is not valid, reset the amount field
//                       amountCon?.text = '';
//                     }
//                   },
//                 ),
//
//                 sizeBoxH(5),
//                 GlobalTextFormField(
//                   controller: amountCon,
//                   titleText: 'Amount',
//                   decoration: borderDecoration,
//                   enabled: false,
//                   isDense: true,
//                 ),
//
//                 sizeBoxH(5),
//                 GlobalDropDownFormField(
//                     value: supplier,
//                     titleText: "Supplier",
//                     hintText: "Select an Option",
//                     decoration: borderDecoration,
//                     isDense: true,
//                     items: widget.supplierController.superSupplierList
//                         ?.map((item) => item.name)
//                         .where((name) => name != null)
//                         .map((name) => name!)
//                         .toList() ?? [],
//                     onChanged: (val) {
//                       setState(() {
//                         supplier = val!;
//                       });
//
//                       // Find the corresponding category ID
//                       final selectSupplier = widget.supplierController.superSupplierList?.firstWhere(
//                               (item) => item.name == val
//                       );
//
//                       if (selectSupplier != null) {
//                         supplier = selectSupplier.supplierId ?? '';
//                       }
//                       log('Supplier Id1: $supplier');
//                     }
//                 ),
//
//
//                 sizeBoxH(5),
//                 GlobalDropDownFormField(
//                     value: branch,
//                     titleText: "Branch",
//                     hintText: "Select Branch",
//                     decoration: borderDecoration,
//                     isDense: true,
//                     items: widget.purchaseController.superBranchList?.map((item) => item.branchName).where((name) => name != null).map((name) => name!).toList() ?? [],
//                     sufixIcon: const Icon(Icons.keyboard_arrow_down_sharp),
//                     onChanged: (val){
//                       setState(() {
//                         branch == val;
//                       });
//                       final selectBranch = widget.purchaseController.superBranchList?.firstWhere((item) => item.branchName == val
//                       );
//                       if(selectBranch != null){
//                         branch = selectBranch.branchId ?? '';
//                       }
//                       log('Branch Id1: $branch');
//                     }
//                 ),
//
//                 sizeBoxH(5),
//                 GlobalTextFormField(
//                   controller: salesRateCon,
//                   titleText: 'Sales Rate',
//                   decoration: borderDecoration,
//                   isDense: true,
//                 ),
//
//                 sizeBoxH(5),
//                 GlobalTextFormField(
//                   controller: expiryDateCon,
//                   titleText: 'Expiry Date',
//                   prefixIcon: GestureDetector(
//                       onTap: () async{
//                         var pickedDate = await showDateOnlyPicker(context);
//                         setState(() {
//                           String formatedDate = DateTimeFormatter.showDateOnly.format(pickedDate);
//                           expiryDateCon.text = formatedDate;
//                         });
//                       },
//                       child: const Icon(Icons.calendar_month, color: ColorRes.grey, size: 20)
//                   ),
//                   decoration: borderDecoration,
//                   isDense: true,
//                 ),
//
//                 sizeBoxH(20),
//                 GlobalButtonWidget(
//                     str: 'Update',
//                     height: 50,
//                     radius: 8,
//                     horizontal: 40,
//                     buttomColor: ColorRes.shoesPrimaryColor,
//                     onTap: (){
//                         // log('Product: ${productNameCon!.text.trim()}');
//                         // if (productNameCon != null && productNameCon!.text.isNotEmpty) {
//                         //   if (rateCon != null && rateCon!.text.isNotEmpty) {
//                         //     if (quantityCon != null && quantityCon!.text.isNotEmpty) {
//                         //       if (amountCon != null && amountCon!.text.isNotEmpty) {
//                         //         if (supplier != '0') {
//                         //           if (branch != '0') {
//                         //             if (salesRateCon != null && salesRateCon!.text.isNotEmpty) {
//                         //               if (expiryDateCon.text.isNotEmpty) {
//                         //                 await Get.showOverlay(
//                         //                   loadingWidget: const OverlayLoadingIndicator(),
//                         //                   asyncFunction: () async {
//                         //                     await widget.purchaseController.reqAddNewPurchase(
//                         //                       productName: productNameCon?.text.trim() ?? '',
//                         //                       unitRate: rateCon?.text.trim() ?? '',
//                         //                       supplierInvoiceNo: '8',
//                         //                       quantity: quantityCon?.text.trim() ?? '',
//                         //                       supplierId: supplier,
//                         //                       branchId: branch,
//                         //                       productRate: salesRateCon?.text.trim() ?? '',
//                         //                       expiredDate: expiryDateCon.text.trim() ?? '',
//                         //                       closeDialog: () {
//                         //                         Navigator.pop(context);
//                         //                       },
//                         //                     );
//                         //                   },
//                         //                 );
//                         //               } else {
//                         //                 showCustomSnackBar("Branch Is Required");
//                         //               }
//                         //             } else {
//                         //               showCustomSnackBar("Branch Is Required");
//                         //             }
//                         //           } else {
//                         //             showCustomSnackBar("Branch Is Required");
//                         //           }
//                         //         } else {
//                         //           showCustomSnackBar("Supplier Rate Is Required");
//                         //         }
//                         //       } else {
//                         //         showCustomSnackBar("Amount Is Required");
//                         //       }
//                         //     } else {
//                         //       showCustomSnackBar("Quantity Is Required");
//                         //     }
//                         //   } else {
//                         //     showCustomSnackBar("Rate Is Required");
//                         //   }
//                         // } else {
//                         //   showCustomSnackBar("Product Name Is Required");
//                         // }
//                     },
//                 ),
//
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
//
// // log('Product: ${productNameCon!.text.trim()}');
// // if (productNameCon != null && productNameCon!.text.isNotEmpty) {
// //   if (rateCon != null && rateCon!.text.isNotEmpty) {
// //     if (quantityCon != null && quantityCon!.text.isNotEmpty) {
// //       if (amountCon != null && amountCon!.text.isNotEmpty) {
// //         if (supplier != '0') {
// //           if (branch != '0') {
// //             if (salesRateCon != null && salesRateCon!.text.isNotEmpty) {
// //               if (expiryDateCon.text.isNotEmpty) {
// //                 await Get.showOverlay(
// //                   loadingWidget: const OverlayLoadingIndicator(),
// //                   asyncFunction: () async {
// //                     await widget.purchaseController.reqAddNewPurchase(
// //                       productName: productNameCon?.text.trim() ?? '',
// //                       unitRate: rateCon?.text.trim() ?? '',
// //                       supplierInvoiceNo: '8',
// //                       quantity: quantityCon?.text.trim() ?? '',
// //                       supplierId: supplier,
// //                       branchId: branch,
// //                       productRate: salesRateCon?.text.trim() ?? '',
// //                       expiredDate: expiryDateCon.text.trim() ?? '',
// //                       closeDialog: () {
// //                         Navigator.pop(context);
// //                       },
// //                     );
// //                   },
// //                 );
// //               } else {
// //                 showCustomSnackBar("Branch Is Required");
// //               }
// //             } else {
// //               showCustomSnackBar("Branch Is Required");
// //             }
// //           } else {
// //             showCustomSnackBar("Branch Is Required");
// //           }
// //         } else {
// //           showCustomSnackBar("Supplier Rate Is Required");
// //         }
// //       } else {
// //         showCustomSnackBar("Amount Is Required");
// //       }
// //     } else {
// //       showCustomSnackBar("Quantity Is Required");
// //     }
// //   } else {
// //     showCustomSnackBar("Rate Is Required");
// //   }
// // } else {
// //   showCustomSnackBar("Product Name Is Required");
// // }