//
// import 'dart:developer';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:multi_project/data/controller/super_controller/product_menu_controller/super_product_controller.dart';
// import 'package:multi_project/data/controller/super_controller/purchase_menu_controller/super_purchase_menu_controller.dart';
// import 'package:multi_project/data/controller/super_controller/supplier_menu_controller/super_supplier_menu_controller.dart';
// import '../../../../../../../../data/controller/super_controller/product_menu_controller/model/super_product_menu/super_search_product_model.dart';
// import '../../../../../../../../global/constants/colors_resources.dart';
// import '../../../../../../../../global/constants/date_time_formatter.dart';
// import '../../../../../../../../global/constants/input_decoration.dart';
// import '../../../../../../../../global/method/show_date_time_picker.dart';
// import '../../../../../../../../global/utils/show_toast.dart';
// import '../../../../../../../../global/widget/global_drop_down_formfield.dart';
// import '../../../../../../../../global/widget/global_sizedbox.dart';
// import '../../../../../../../../global/widget/global_text.dart';
// import '../../../../../../../../global/widget/global_textform_field.dart';
// import '../../../../../../../base_widget/global_button.dart';
//
// class SuperAddPurchaseDialog extends StatefulWidget {
//   final SuperProductController productController;
//   final SuperPurchaseController purchaseController;
//   final SuperSupplierController supplierController;
//   const SuperAddPurchaseDialog({
//     super.key,
//     required this.productController,
//     required this.purchaseController,
//     required this.supplierController
//   });
//
//   @override
//   State<SuperAddPurchaseDialog> createState() => _SuperAddPurchaseDialogState();
// }
//
// class _SuperAddPurchaseDialogState extends State<SuperAddPurchaseDialog> {
//
//   SuperSearchProductData? selectedProductData;
//
//   String product = '0';
//   TextEditingController? productNameCon;
//   // TextEditingController? barCodeCon;
//   TextEditingController? rateCon;
//   // TextEditingController? stockQuantityCon = TextEditingController();
//   TextEditingController? quantityCon;
//   String branch = '0';
//   String supplier = '0';
//   TextEditingController? salesRate;
//   TextEditingController? expiryCon;
//
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
//                   str: 'Add Purchase',
//                   color: ColorRes.shoesPrimaryColor,
//                   fontSize: 22,
//                   fontWeight: FontWeight.w500,
//                   textAlign: TextAlign.center,
//                   fontFamily: 'Rubik',
//                 ),
//
//                 sizeBoxH(15),
//                 GlobalDropDownFormField(
//                   value: product,
//                   titleText: "Product",
//                   hintText: "Select Product",
//                   decoration: borderDecoration,
//                   isDense: true,
//                   items: widget.productController.searchProductList
//                       ?.where((item) => item.productName != null)
//                       .map((item) => item.productName ?? '')
//                       .toList() ?? [],
//                   sufixIcon: const Icon(Icons.keyboard_arrow_down_sharp),
//                   onChanged: (val) {
//
//                     // Find the corresponding product ID
//                     selectedProductData = widget.productController.searchProductList
//                         ?.firstWhere((item) => item.productName == val);
//
//                     if (selectedProductData != null) {
//                       product = selectedProductData?.productId ?? '';
//                       log('Product Id: $product');
//
//                       widget.productController.getSuperSearchSingleProduct(productId: product);
//
//                       final productList = widget.productController.searchSingleProductData;
//                       setState(() {
//                         product = val ?? '';
//
//                         // Update productNameCon here as well
//                         productNameCon = TextEditingController(text: selectedProductData?.productName ?? '');
//                         rateCon = TextEditingController(text: selectedProductData?.unitRate ?? '');
//                         quantityCon = TextEditingController(text: selectedProductData?.stockQty ?? '');
//                         branch = productList?.brandId ?? '';
//                         supplier = productList?.supplierId ?? '';
//                         salesRate = TextEditingController(text: selectedProductData?.productRate ?? '');
//                         expiryCon = TextEditingController(text: selectedProductData?.created ?? '');
//                       });
//
//                       log('Product Name: ${productList?.productName}');
//                     }
//                   },
//                 ),
//
//                 // sizeBoxH(15),
//                 // GlobalDropdownField2(
//                 //   value: product,
//                 //   titleText: "Product",
//                 //   hintText: "Select Products",
//                 //   decoration: borderDecoration,
//                 //   isDense: true,
//                 //   items: widget.productController.searchProductList?.map((e) => NameId(id: e.id!, value: e.productName??"")).toList()??[],
//                 //   // items: widget.productController.searchProductList
//                 //   //     ?.where((item) => item.productName != null)
//                 //   //     .map((item) => item.productName ?? '')
//                 //   //     .toList() ?? [],
//                 //   sufixIcon: const Icon(Icons.keyboard_arrow_down_sharp),
//                 //   onChanged: (val) {
//                 //     print('Print 0');
//                 //     log('Value: $val');
//                 //
//                 //     if (val != null) {
//                 //       product = val.id ?? '';
//                 //       log('Product Id: $product');
//                 //       print('Print 3');
//                 //
//                 //       widget.productController.getSuperSearchSingleProduct(productId: product);
//                 //
//                 //       final productList = widget.productController.searchSingleProductData;
//                 //       setState(() {
//                 //         product = val.id ?? '';
//                 //
//                 //         print('Print 4');
//                 //       });
//                 //       print('Print 5');
//                 //       log('Product Name: ${productList?.productName}');
//                 //     }
//                 //   },
//                 // ),
//
//                 if(product != '0')
//                   Column(
//                     children: [
//
//                       sizeBoxH(5),
//                       GlobalTextFormField(
//                         controller: productNameCon,
//                         titleText: 'Product Name',
//                         hintText: 'Enter your product Name',
//                         decoration: borderDecoration,
//                         isDense: true,
//                       ),
//
//                       // sizeBoxH(5),
//                       // GlobalTextFormField(
//                       //   controller: barCodeCon,
//                       //   titleText: 'Barcode',
//                       //   hintText: "Scan Product's Barcode",
//                       //   decoration: borderDecoration,
//                       //   sufixIcon: const Padding(
//                       //     padding: EdgeInsets.symmetric(vertical: 13, horizontal: 11),
//                       //     child: GlobalImageLoader(
//                       //       imagePath: Images.scanner,
//                       //       height: 16,
//                       //       width: 16,
//                       //       fit: BoxFit.fill,
//                       //     ),
//                       //   ),
//                       //   isDense: true,
//                       // ),
//
//                       sizeBoxH(5),
//                       GlobalTextFormField(
//                         controller: rateCon,
//                         titleText: 'Rate',
//                         decoration: borderDecoration,
//                         isDense: true,
//                       ),
//
//                       // sizeBoxH(5),
//                       // GlobalTextFormField(
//                       //   controller: stockQuantityCon,
//                       //   titleText: 'Stock Quantity',
//                       //   decoration: borderDecoration,
//                       //   isDense: true,
//                       // ),
//
//                       sizeBoxH(5),
//                       GlobalTextFormField(
//                         controller: quantityCon,
//                         titleText: 'Quantity',
//                         decoration: borderDecoration,
//                         isDense: true,
//                       ),
//
//                       sizeBoxH(5),
//                       GlobalDropDownFormField(
//                           value: branch,
//                           titleText: "Branch",
//                           hintText: "Select an Option",
//                           decoration: borderDecoration,
//                           isDense: true,
//                           items: widget.purchaseController.superBranchList?.map((item) => item.branchName)
//                               .where((name) => name != null)
//                               .map((name) => name!)
//                               .toList() ?? [],
//
//                           onChanged: (val){
//                             setState(() {
//                               branch == val;
//                             });
//
//                             // Find the corresponding category ID
//                             final selectBranch = widget.purchaseController.superBranchList?.firstWhere(
//                                     (item) => item.branchName == val
//                             );
//
//                             if(selectBranch != null){
//                               branch = selectBranch.branchId ?? '';
//                             }
//
//                             log('Supplier Id1: $branch');
//                           }
//                       ),
//
//                       sizeBoxH(5),
//                       GlobalDropDownFormField(
//                           value: supplier,
//                           titleText: "Supplier",
//                           hintText: "Select an Option",
//                           decoration: borderDecoration,
//                           isDense: true,
//                           items: widget.supplierController.superSupplierList?.map((item) => item.companyName)
//                               .where((name) => name != null)
//                               .map((name) => name!)
//                               .toList() ?? [],
//
//                           onChanged: (val){
//                             setState(() {
//                               supplier == val;
//                             });
//
//                             // Find the corresponding category ID
//                             final selectSupplier = widget.supplierController.superSupplierList?.firstWhere(
//                                     (item) => item.companyName == val
//                             );
//
//                             if(selectSupplier != null){
//                               supplier = selectSupplier.supplierId ?? '';
//                             }
//                             log('Supplier Id1: $supplier');
//                           }
//                       ),
//
//                       sizeBoxH(5),
//                       GlobalTextFormField(
//                         controller: salesRate,
//                         titleText: 'Sales Rate',
//                         decoration: borderDecoration,
//                         isDense: true,
//                       ),
//
//                       sizeBoxH(5),
//                       GlobalTextFormField(
//                         controller: expiryCon,
//                         titleText: 'Expiry Date',
//                         sufixIcon: GestureDetector(
//                             onTap: () async{
//                               var pickedDate = await showDateOnlyPicker(context);
//                               setState(() {
//                                 String formatedDate = DateTimeFormatter.showDateOnly.format(pickedDate);
//                                 expiryCon?.text = formatedDate;
//                               });
//                             },
//                             child: const Icon(Icons.calendar_month, color: ColorRes.grey, size: 20)
//                         ),
//                         decoration: borderDecoration,
//                         isDense: true,
//                       ),
//
//                       sizeBoxH(20),
//                       GlobalButtonWidget(
//                         str: 'Add',
//                         height: 50,
//                         radius: 8,
//                         horizontal: 40,
//                         buttomColor: ColorRes.shoesPrimaryColor,
//                         onTap: () async {
//
//                           log('Product: ${productNameCon!.text.trim()}');
//                           // if (productNameCon != null && productNameCon!.text.isNotEmpty) {
//                           //   if (productNameCon != null && rateCon!.text.isNotEmpty) {
//                           //     if (quantityCon != null && quantityCon!.text.isNotEmpty) {
//                           //       if (branch != '0') {
//                           //         if (supplier != '0') {
//                           //           if (salesRate != null && salesRate!.text.isNotEmpty) {
//                           //             if (productNameCon != null && expiryCon!.text.isNotEmpty) {
//                           //               await Get.showOverlay(
//                           //                 loadingWidget: const OverlayLoadingIndicator(),
//                           //                 asyncFunction: () async {
//                           //                   await widget.purchaseController.reqAddNewPurchase(
//                           //                     productName: productNameCon?.text.trim() ?? '',
//                           //                     unitRate: rateCon?.text.trim() ?? '',
//                           //                     supplierInvoiceNo: '8',
//                           //                     quantity: quantityCon?.text.trim() ?? '',
//                           //                     branchId: branch,
//                           //                     supplierId: supplier,
//                           //                     productRate: salesRate?.text.trim() ?? '',
//                           //                     expiredDate: expiryCon?.text.trim() ?? '',
//                           //                     closeDialog: () {
//                           //                       Navigator.pop(context);
//                           //                     },
//                           //                   );
//                           //                 },
//                           //               );
//                           //             } else {
//                           //               showCustomSnackBar("Expiry Date Is Required");
//                           //             }
//                           //           } else {
//                           //             showCustomSnackBar("Sales Rate Is Required");
//                           //           }
//                           //         } else {
//                           //           showCustomSnackBar("Supplier Is Required");
//                           //         }
//                           //       } else {
//                           //         showCustomSnackBar("Brand Is Required");
//                           //       }
//                           //     } else {
//                           //       showCustomSnackBar("Quantity Is Required");
//                           //     }
//                           //   } else {
//                           //     showCustomSnackBar("Rate Is Required");
//                           //   }
//                           // } else {
//                           //   showCustomSnackBar("Product Name Is Required");
//                           // }
//                         },
//                       ),
//                     ],
//                   )
//                 else
//                   const SizedBox.shrink()
//
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
