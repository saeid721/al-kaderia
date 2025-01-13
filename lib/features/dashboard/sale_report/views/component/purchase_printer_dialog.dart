
import 'dart:developer';
import 'dart:io';
import 'package:esc_pos_utils_plus/esc_pos_utils_plus.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:print_bluetooth_thermal/print_bluetooth_thermal.dart';
import '../../../../../../../../global/constants/colors_resources.dart';
import '../../../../../../../../global/utils/show_toast.dart';
import '../../../../../../../../global/widget/global_sizedbox.dart';
import '../../../../../../../../global/widget/global_text.dart';
import '../../../../../../../../preferences/prefs_keys.dart';
import '../../../../../../../../preferences/shared_prefs.dart';
import '../../../../../getit_locator.dart';
import '../../../../../global/widget/global_container.dart';
import '../../../../base_widget/global_button.dart';
import 'print_cart_widget.dart';
import 'print_table.dart';


// class SuperPurchasePrinterScreen extends StatefulWidget {
//   final List<SuperLoadSinglePurchaseProductModel> superLoadSinglePurchaseProductList;
//   final SuperSystemSettingData? superUserProfileListData;
//   final SuperAddNewPurchaseModel? controller;
//   final double? grandTotal;
//   final Function() closeDialog;
//
//   const SuperPurchasePrinterScreen({
//     super.key,
//     required this.controller,
//     required this.superLoadSinglePurchaseProductList,
//     required this.superUserProfileListData,
//     required this.grandTotal,
//     required this.closeDialog
//   });
//
//   @override
//   State<SuperPurchasePrinterScreen> createState() => _SuperPurchasePrinterScreenState();
// }
//
// class _SuperPurchasePrinterScreenState extends State<SuperPurchasePrinterScreen> {
//
//   TextEditingController currentCustomerCon = TextEditingController();
//   TextEditingController phoneCon = TextEditingController();
//   String paymentVai = '0';
//
//   @override
//   Widget build(BuildContext context) {
//
//     return GetBuilder<SuperPurchaseController>(builder: (purchaseController){
//       return Container(
//         decoration: BoxDecoration(
//             color: ColorRes.white,
//             borderRadius: BorderRadius.circular(5)
//         ),
//         child: Column(
//           children: [
//             Expanded(
//               child: Container(
//                 width: Get.width,
//                 margin: const EdgeInsets.symmetric(vertical: 15, horizontal: 15),
//                 padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 15),
//                 decoration: BoxDecoration(
//                     border: Border.all(width: 1, color: ColorRes.black),
//                     borderRadius: BorderRadius.circular(5)
//                 ),
//
//                 child: SingleChildScrollView(
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.center,
//                     children: [
//                       GlobalText(
//                         str: widget.superUserProfileListData?.branchName ?? '',
//                         color: ColorRes.black,
//                         fontSize: 14,
//                         fontWeight: FontWeight.w700,
//                         fontFamily: 'Rubik',
//                         textAlign: TextAlign.center,
//                       ),
//                       GlobalText(
//                         str: widget.superUserProfileListData?.branchAddress ?? '',
//                         color: ColorRes.black,
//                         fontSize: 12,
//                         fontWeight: FontWeight.w400,
//                         textAlign: TextAlign.center,
//                         fontFamily: 'Rubik',
//                       ),
//                       Row(
//                         mainAxisAlignment: MainAxisAlignment.center,
//                         children: [
//                           const GlobalText(
//                             str: "Help Line: ",
//                             color: ColorRes.black,
//                             fontSize: 12,
//                             fontWeight: FontWeight.bold,
//                             textAlign: TextAlign.center,
//                             fontFamily: 'Rubik',
//                           ),
//                           GlobalText(
//                             str: widget.superUserProfileListData?.branchMobileNo ?? '',
//                             color: ColorRes.black,
//                             fontSize: 12,
//                             fontWeight: FontWeight.w400,
//                             textAlign: TextAlign.center,
//                             fontFamily: 'Rubik',
//                           ),
//                         ],
//                       ),
//                       Row(
//                         mainAxisAlignment: MainAxisAlignment.center,
//                         children: [
//                           const GlobalText(
//                             str: "Purchase No:",
//                             color: ColorRes.black,
//                             fontSize: 12,
//                             fontWeight: FontWeight.bold,
//                             textAlign: TextAlign.center,
//                             fontFamily: 'Rubik',
//                           ),
//                           GlobalText(
//                             str: widget.controller?.data?.purNo ?? '',
//                             color: ColorRes.black,
//                             fontSize: 12,
//                             fontWeight: FontWeight.w400,
//                             textAlign: TextAlign.center,
//                             fontFamily: 'Rubik',
//                           ),
//                         ],
//                       ),
//                       Row(
//                         mainAxisAlignment: MainAxisAlignment.center,
//                         children: [
//                           const GlobalText(
//                             str: "Invoice No: ",
//                             color: ColorRes.black,
//                             fontSize: 12,
//                             fontWeight: FontWeight.bold,
//                             textAlign: TextAlign.center,
//                             fontFamily: 'Rubik',
//                           ),
//                           GlobalText(
//                             str: widget.controller?.data?.supllierInvoiceNo ?? '',
//                             color: ColorRes.black,
//                             fontSize: 12,
//                             fontWeight: FontWeight.w400,
//                             textAlign: TextAlign.center,
//                             fontFamily: 'Rubik',
//                           ),
//                         ],
//                       ),
//
//                       Row(
//                         mainAxisAlignment: MainAxisAlignment.center,
//                         children: [
//                           const GlobalText(
//                             str: "Purchase By: ",
//                             color: ColorRes.black,
//                             fontSize: 12,
//                             fontWeight: FontWeight.bold,
//                             textAlign: TextAlign.center,
//                             fontFamily: 'Rubik',
//                           ),
//                           GlobalText(
//                             str: widget.superUserProfileListData?.userName ?? '',
//                             color: ColorRes.black,
//                             fontSize: 12,
//                             fontWeight: FontWeight.w400,
//                             textAlign: TextAlign.center,
//                             fontFamily: 'Rubik',
//                           ),
//                         ],
//                       ),
//                       sizeBoxH(10),
//                       GlobalContainer(
//                         width: Get.width,
//                         child: const PrintTableWidget(
//                           firstRow: 'SL No.',
//                           secondRow: 'Product',
//                           thirdRow: 'Qty',
//                           fourRow: 'Rate',
//                           fiveRow: "Total",
//                         ),
//                       ),
//
//                       ListView.builder(
//                           shrinkWrap: true,
//                           itemCount: widget.superLoadSinglePurchaseProductList.length,
//                           physics: const NeverScrollableScrollPhysics(),
//                           itemBuilder: (ctx, index){
//                             return PrintTableListValueWidget(
//                               firstColumn: '${index + 1}',
//                               secondColumn: '${widget.superLoadSinglePurchaseProductList[index].purchaseProduct?.productName}',
//                               thirdColumn: '${widget.superLoadSinglePurchaseProductList[index].purchaseProduct?.quantityCon?.text}',
//                               fourColumn: widget.superLoadSinglePurchaseProductList[index].purchaseProduct?.purchaseRate ?? '',
//                               fiveColumn: widget.superLoadSinglePurchaseProductList[index].purchaseProduct?.amount.toString() ?? '',
//                             );
//                           }
//                       ),
//
//                       sizeBoxH(10),
//                       PrintCardBoardWidget(
//                         name1: "Total Tk",
//                         value1: "${widget.grandTotal}",
//                       ),
//                     ],
//                   ),
//                 ),
//               ),
//             ),
//             Padding(
//               padding: const EdgeInsets.only(right: 20),
//               child: Row(
//                 mainAxisAlignment: MainAxisAlignment.end,
//                 children: [
//                   GlobalButtonWidget(
//                     str: 'Close',
//                     height: 35,
//                     width: 80,
//                     radius: 5,
//                     textSize: 11,
//                     buttomColor: Colors.white,
//                     textColor: ColorRes.red,
//                     borderColor: ColorRes.red,
//                     onTap: () async{
//                       setState(() {
//                         Navigator.pop(context);
//                         widget.closeDialog;
//                       });
//                     },
//                   ),
//
//                   sizeBoxW(10),
//                   GlobalButtonWidget(
//                     str: 'Print',
//                     height: 35,
//                     width: 80,
//                     radius: 5,
//                     textSize: 11,
//                     buttomColor: Colors.red,
//                     textColor: ColorRes.white,
//                     onTap: (){
//                       Get.dialog(Dialog(
//                           shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
//                           child: SuperSearchPurchasePrinterDialog(
//                             controller: widget.controller,
//                             superLoadSinglePurchaseProductList: widget.superLoadSinglePurchaseProductList,
//                             superUserProfileListData: widget.superUserProfileListData,
//                             grandTotal: widget.grandTotal,
//                             closeDialog: widget.closeDialog,
//                           )));
//                     },
//                     // onTap: _print,
//                     // onTap: widget.onPrint,
//                     // onTap: () async{
//                     //   setState(() {
//                     //     purchaseController.purchasePrintTicketFor58(widget.controller);
//                     //   });
//                     // },
//                   ),
//                 ],
//               ),
//             ),
//             sizeBoxH(10)
//           ],
//         ),
//       );
//     });
//   }
// }
//
//
// class SuperSearchPurchasePrinterDialog extends StatefulWidget {
//   final List<SuperLoadSinglePurchaseProductModel> superLoadSinglePurchaseProductList;
//   final SuperSystemSettingData? superUserProfileListData;
//   final SuperAddNewPurchaseModel? controller;
//   final double? grandTotal;
//   final Function() closeDialog;
//
//   const SuperSearchPurchasePrinterDialog({
//     super.key,
//     required this.controller,
//     required this.superLoadSinglePurchaseProductList,
//     required this.superUserProfileListData,
//     required this.grandTotal,
//     required this.closeDialog
//   });
//
//   @override
//   State<SuperSearchPurchasePrinterDialog> createState() => _SuperSearchPurchasePrinterDialogState();
// }
//
// class _SuperSearchPurchasePrinterDialogState extends State<SuperSearchPurchasePrinterDialog> {
//
//   List<BluetoothInfo> deviceList = [];
//
//   bool paper80MM = true;
//   bool searchingMode = true;
//
//   @override
//   void initState() {
//     // TODO: implement initState
//     super.initState();
//     getDeviceListPermission();
//     _loadPaperSize();
//   }
//
//   BluetoothInfo? selectedPrinter;
//   bool isConnected = true;
//
//   void _selectDevice(BluetoothInfo device) async {
//     if(selectedPrinter == null) {
//       await PrintBluetoothThermal.disconnect;
//     }
//
//     selectedPrinter = device;
//     log('Attempting to connect to printer with MAC Address: ${device.macAdress}');
//     isConnected = await PrintBluetoothThermal.connect(macPrinterAddress: device.macAdress);
//     log('Is Connected: $isConnected');
//
//     setState(() {
//       searchingMode = !isConnected;
//       _print();
//     });
//
//   }
//
//   /// method to scan devices according PrinterType
//   Future<void> getDeviceListPermission() async {
//     // Request Bluetooth permissions
//     await Permission.bluetooth.request();
//     await Permission.bluetoothScan.request();
//     await Permission.bluetoothConnect.request();
//     await Permission.locationWhenInUse.request();
//
//     // Check if the permissions are granted
//     if (await Permission.bluetooth.isGranted &&
//         await Permission.bluetoothScan.isGranted &&
//         await Permission.bluetoothConnect.isGranted &&
//         await Permission.locationWhenInUse.isGranted) {
//
//       deviceList = await PrintBluetoothThermal.pairedBluetooths;
//       log('==/@ Device Length: ${deviceList.length}');
//       getBluetoothEnabled();
//
//       setState(() {});
//
//     } else {
//       showCustomSnackBar("Please Enable Bluetooth Connection");
//     }
//   }
//
//
//   void getBluetoothEnabled() async {
//     bool isEnabled = await PrintBluetoothThermal.bluetoothEnabled;
//     if (!isEnabled) {
//       showCustomSnackBar("Please Enable Bluetooth Connection");
//     } else {
//       showCustomSnackBar("Bluetooth Enabled", isError: false);
//     }
//   }
//
//   void _print() async {
//     if (selectedPrinter == null) {
//       showCustomSnackBar("No printer selected");
//       return;
//     }
//
//     log('Attempting to connect to printer with MAC Address: ${selectedPrinter!.macAdress}');
//
//     try {
//       // Attempt to connect to the printer
//
//       log('Is Connected: $isConnected');
//       if (isConnected == false) {
//         showCustomSnackBar("Failed to connect to the printer");
//         return;
//       }
//
//       List<int> bytes = [];
//       CapabilityProfile profile = await CapabilityProfile.load();
//       final generator = Generator(paper80MM ? PaperSize.mm80 : PaperSize.mm58, profile);
//
//       // Print header
//       bytes += generator.text(widget.superUserProfileListData?.branchName ?? '',
//           styles: const PosStyles(
//             align: PosAlign.center,
//             height: PosTextSize.size2,
//             width: PosTextSize.size2,
//           ),
//           linesAfter: 1);
//
//       bytes += generator.text(widget.superUserProfileListData?.branchAddress ?? '',
//           styles: const PosStyles(align: PosAlign.center));
//
//       bytes += generator.text('Help Line: ${widget.superUserProfileListData?.branchMobileNo ?? ''}',
//           styles: const PosStyles(align: PosAlign.center));
//
//       bytes += generator.text('Purchase No: ${widget.controller?.data?.purNo ?? ''}',
//           styles: const PosStyles(align: PosAlign.center));
//
//       bytes += generator.text('Invoice No: ${widget.controller?.data?.supllierInvoiceNo ?? ''}',
//           styles: const PosStyles(align: PosAlign.center));
//
//       bytes += generator.text('Served By:  ${widget.superUserProfileListData?.userName ?? ''}',
//           styles: const PosStyles(align: PosAlign.center), linesAfter: 1);
//
//       // Print table header
//       bytes += generator.row([
//         PosColumn(text: 'SL', width: 1),
//         PosColumn(text: 'Product', width: 4),
//         PosColumn(text: 'Qty', width: 2),
//         PosColumn(text: 'Rate', width: 2),
//         PosColumn(text: 'Total', width: 3),
//       ]);
//
//       // Print table data
//       for (int i = 0; i < widget.superLoadSinglePurchaseProductList.length; i++) {
//         final product = widget.superLoadSinglePurchaseProductList[i];
//         bytes += generator.row([
//           PosColumn(text: '${i + 1}', width: 1),
//           PosColumn(text: '${product.purchaseProduct?.productName}', width: 4),
//           PosColumn(text: '${product.purchaseProduct?.quantityCon?.text}', width: 2),
//           PosColumn(text: '${product.purchaseProduct?.purchaseRate}', width: 2),
//           PosColumn(text: '${product.purchaseProduct?.amount}', width: 3),
//         ]);
//       }
//
//       bytes += generator.feed(2);
//       // Print total
//       bytes += generator.row([
//         PosColumn(text: 'Total Tk', width: 7, styles: const PosStyles(align: PosAlign.left)),
//         PosColumn(text: '${widget.grandTotal?.toStringAsFixed(2)}', width: 5, styles: const PosStyles(align: PosAlign.right)),
//       ]);
//
//       // Feed paper and cut
//       // bytes += generator.feed(2);
//       bytes += generator.cut();
//
//       // Send bytes to printer
//       await PrintBluetoothThermal.writeBytes(bytes);
//       showCustomSnackBar("Printing...", isError: false);
//
//     } catch (e) {
//       showCustomSnackBar("Printing failed: $e");
//       log('Printing failed: $e');
//     }
//   }
//
//   // ==@ Local Data Base Save Paper Size..
//
//   void _loadPaperSize() async{
//     setState(() {
//       paper80MM = locator<MyPrefs>().gettBool(key: PrefsKeys.paper80MM);
//     });
//   }
//
//   void _savePaperSize(bool value) async {
//     locator<MyPrefs>().settBool(key: PrefsKeys.paper80MM, value: value);
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return/* _searchingMode ?*/ SingleChildScrollView(
//       padding: const EdgeInsets.all(16),
//       child: Column(
//         mainAxisSize: MainAxisSize.min,
//         children: [
//
//           Text('Paper Size'.tr, style: robotoMedium),
//           Row(children: [
//             Expanded(child: RadioListTile(
//               title: Text('80 mm'.tr),
//               groupValue: paper80MM,
//               dense: true,
//               contentPadding: EdgeInsets.zero,
//               value: true,
//               onChanged: (bool? value) {
//                 paper80MM = true;
//                 _savePaperSize(paper80MM);
//                 setState(() {});
//               },
//             )),
//             Expanded(child: RadioListTile(
//               title: Text('58 mm'.tr),
//               groupValue: paper80MM,
//               contentPadding: EdgeInsets.zero,
//               dense: true,
//               value: false,
//               onChanged: (bool? value) {
//                 paper80MM = false;
//                 _savePaperSize(paper80MM);
//                 setState(() {});
//               },
//             )),
//           ]),
//           const SizedBox(height: 10),
//
//           ListView.builder(
//             itemCount: deviceList.isNotEmpty ? deviceList.length : 0,
//             shrinkWrap: true,
//             physics: const NeverScrollableScrollPhysics(),
//             itemBuilder: (context, index) {
//               return Padding(
//                 padding: const EdgeInsets.only(bottom: 10),
//                 child: InkWell(
//                   onTap: () {
//                     setState(() {
//                       _selectDevice(deviceList[index]);
//                       Get.back();
//                     });
//                   },
//                   child: Stack(
//                       children: [
//                         Column(
//                             crossAxisAlignment: CrossAxisAlignment.start,
//                             children: [
//                               Text(deviceList[index].name),
//
//                               Visibility(
//                                 visible: !Platform.isWindows,
//                                 child: Text(deviceList[index].macAdress),
//                               ),
//                               index != deviceList.length-1 ?
//                               Divider(
//                                   color: Theme.of(context).disabledColor
//                               ) : const SizedBox(),
//                             ]
//                         ),
//                         (selectedPrinter != null && selectedPrinter!.macAdress == deviceList[index].macAdress)
//                             ? const Positioned(
//                           top: 5, right: 5,
//                           child: Icon(Icons.check, color: Colors.green),
//                         ) : const SizedBox(),
//                       ]),
//                 ),
//               );
//             },
//           ),
//         ],
//       ),
//     );
//   }
// }
//



const robotoRegular = TextStyle(
  fontFamily: 'Roboto',
  fontWeight: FontWeight.w400,
);

const robotoMedium = TextStyle(
  fontFamily: 'Roboto',
  fontWeight: FontWeight.w500,
);

const robotoBold = TextStyle(
  fontFamily: 'Roboto',
  fontWeight: FontWeight.w700,
);

const robotoBlack = TextStyle(
  fontFamily: 'Roboto',
  fontWeight: FontWeight.w900,
);
