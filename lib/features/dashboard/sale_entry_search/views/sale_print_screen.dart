// import 'dart:developer';
// import 'dart:io';
// import 'package:esc_pos_utils_plus/esc_pos_utils_plus.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:get/get.dart';
// import 'package:permission_handler/permission_handler.dart';
// import 'package:print_bluetooth_thermal/print_bluetooth_thermal.dart';
// import '../../../../../../../../global/constants/colors_resources.dart';
// import '../../../../../../../../global/constants/date_time_formatter.dart';
// import '../../../../../../../../global/constants/images.dart';
// import '../../../../../../../../global/utils/show_toast.dart';
// import '../../../../../../../../global/widget/global_image_loader.dart';
// import '../../../../../../../../global/widget/global_sizedbox.dart';
// import '../../../../../../../../global/widget/global_text.dart';
// import '../../../../global/widget/global_container.dart';
// import '../../../base_widget/global_button.dart';
// import 'component/print_cart_widget.dart';
// import 'component/print_table.dart';
//
//
//
// class SalesPrinterDialog extends StatefulWidget {
//   final List<SuperSearchSingleProductData> selectedProducts;
//   final SuperSystemSettingData? superUserProfileListData;
//   final SuperAddNewEasySalesModel? superAddNewEasySalesModel;
//   final String? customerName;
//   final double? eleGrandTotal;
//   final double? eleTotalAmount;
//   final String? eleLessAmount;
//   final String? eleDeliveryChgAmount;
//   final String? eleServiceChgAmount;
//   final String? eleCollectedAmount;
//   final String? eleChangeAmount;
//   final String? elePaymentVaiName;
//
//   const SalesPrinterDialog({
//     super.key,
//     required this.superAddNewEasySalesModel,
//     required this.selectedProducts,
//     required this.superUserProfileListData,
//     required this.customerName,
//     required this.eleGrandTotal,
//     required this.eleTotalAmount,
//     required this.eleLessAmount,
//     required this.eleDeliveryChgAmount,
//     required this.eleServiceChgAmount,
//     required this.eleCollectedAmount,
//     required this.eleChangeAmount,
//     required this.elePaymentVaiName,
//   });
//
//   @override
//   State<SalesPrinterDialog> createState() => _SalesPrinterDialogState();
// }
//
// class _SalesPrinterDialogState extends State<SalesPrinterDialog> {
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
//   }
//
//   BluetoothInfo? selectedPrinter;
//   bool isConnected = true;
//   String time = DateTimeFormatter.dbFormatDateTime.format(DateTime.now());
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
//       bytes += generator.text('Val Reg No. #: ${widget.superUserProfileListData?.vat ?? ''}',
//           styles: const PosStyles(align: PosAlign.center));
//
//       bytes += generator.text('Help Line: ${widget.superUserProfileListData?.branchMobileNo ?? ''}',
//           styles: const PosStyles(align: PosAlign.center));
//
//       bytes += generator.text('Invoice No: ${widget.superAddNewEasySalesModel?.data?.invNo ?? ''}',
//           styles: const PosStyles(align: PosAlign.center));
//
//       bytes += generator.text('Date: $time',
//           styles: const PosStyles(align: PosAlign.center));
//
//       bytes += generator.text('Customer: ${widget.customerName ?? ''}',
//           styles: const PosStyles(align: PosAlign.center));
//
//       bytes += generator.text('Served By: ',
//           styles: const PosStyles(align: PosAlign.center),
//           linesAfter: 1);
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
//       for (int i = 0; i < widget.selectedProducts.length; i++) {
//         final product = widget.selectedProducts[i];
//         bytes += generator.row([
//           PosColumn(text: '${i + 1}', width: 1),
//           PosColumn(text: '${product.productName}', width: 4),
//           PosColumn(text: product.quantity.toString(), width: 2),
//           PosColumn(text: '${product.productRate}', width: 2),
//           PosColumn(text: '${product.amount}', width: 3),
//         ]);
//       }
//
//       bytes += generator.feed(2);
//       // Print totals and charges
//       bytes += generator.row([
//         PosColumn(text: 'Grand Amount:', width: 7, styles: const PosStyles(align: PosAlign.left)),
//         PosColumn(text: '${widget.eleGrandTotal ?? "0.00"}', width: 5, styles: const PosStyles(align: PosAlign.right)),
//       ]);
//
//       // bytes += generator.row([
//       //   PosColumn(text: 'Total Amount:', width: 10, styles: const PosStyles(align: PosAlign.left)),
//       //   PosColumn(text: '${widget.eleTotalAmount ?? "0.00"}', width: 2, styles: const PosStyles(align: PosAlign.right)),
//       // ]);
//
//       bytes += generator.row([
//         PosColumn(text: 'Discount:', width: 7, styles: const PosStyles(align: PosAlign.left)),
//         PosColumn(text: widget.eleLessAmount != 'null' ? widget.eleLessAmount.toString() : '0.00', width: 5, styles: const PosStyles(align: PosAlign.right)),
//       ]);
//
//       bytes += generator.row([
//         PosColumn(text: 'Delivery Charge:', width: 7, styles: const PosStyles(align: PosAlign.left)),
//         PosColumn(text: widget.eleDeliveryChgAmount != 'null' ? widget.eleDeliveryChgAmount.toString() : '0.00', width: 5, styles: const PosStyles(align: PosAlign.right)),
//       ]);
//
//       bytes += generator.row([
//         PosColumn(text: 'Service Charge:', width: 7, styles: const PosStyles(align: PosAlign.left)),
//         PosColumn(text: widget.eleServiceChgAmount != 'null' ? widget.eleServiceChgAmount.toString() : '0.00', width: 5, styles: const PosStyles(align: PosAlign.right)),
//       ]);
//
//       bytes += generator.feed(2);
//
//       bytes += generator.row([
//         PosColumn(text: 'Total Amount:', width: 7, styles: const PosStyles(align: PosAlign.left)),
//         PosColumn(text: '${widget.eleTotalAmount ?? "0.00"}', width: 5, styles: const PosStyles(align: PosAlign.right)),
//       ]);
//
//       bytes += generator.row([
//         PosColumn(text: 'Collected:', width: 7, styles: const PosStyles(align: PosAlign.left)),
//         PosColumn(text: widget.eleCollectedAmount != 'null' ? widget.eleCollectedAmount.toString() : '0.00', width: 5, styles: const PosStyles(align: PosAlign.right)),
//       ]);
//
//       bytes += generator.row([
//         PosColumn(text: 'Change:', width: 7, styles: const PosStyles(align: PosAlign.left)),
//         PosColumn(text: widget.eleChangeAmount != 'null' ? widget.eleChangeAmount.toString() : '0.00', width: 5, styles: const PosStyles(align: PosAlign.right)),
//       ]);
//
//       bytes += generator.row([
//         PosColumn(text: 'Paid By:', width: 7, styles: const PosStyles(align: PosAlign.left)),
//         PosColumn(text: widget.elePaymentVaiName ?? '', width: 5, styles: const PosStyles(align: PosAlign.right)),
//       ]);
//
//       bytes += generator.text('Thank You',
//           styles: const PosStyles(align: PosAlign.center));
//
//       bytes += generator.text(widget.superUserProfileListData?.note ?? '',
//           styles: const PosStyles(align: PosAlign.center));
//
//       // Feed paper and cut
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
//   // void _selectDevice(BluetoothInfo device) async {
//   //   if (_selectedPrinter != null) {
//   //     await PrintBluetoothThermal.disconnect;
//   //     log('Disconnected previous printer.');
//   //   }
//   //
//   //   _selectedPrinter = device;
//   //   log('Attempting to connect to printer with MAC Address: ${device.macAdress}');
//   //
//   //   // Retry connection logic
//   //   for (int i = 0; i < 3; i++) {
//   //     isConnected = await PrintBluetoothThermal.connect(macPrinterAddress: device.macAdress);
//   //     log('Is Connected (Attempt ${i + 1}): $isConnected');
//   //     if (isConnected == true) break;
//   //     await Future.delayed(const Duration(seconds: 1));
//   //   }
//   //
//   //   if (isConnected == false) {
//   //     log('Failed to connect to printer after multiple attempts.');
//   //     showCustomSnackBar("Failed to connect to the printer");
//   //   }
//   //
//   //   setState(() {
//   //     _searchingMode = !isConnected!;
//   //   });
//   // }
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
//   @override
//   Widget build(BuildContext context) {
//     return SingleChildScrollView(
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
//
// class SalesPrinterScreen extends StatefulWidget {
//   final List<SuperSearchSingleProductData> selectedProducts;
//   final SuperSystemSettingData? superUserProfileListData;
//   final SuperAddNewEasySalesModel? superAddNewEasySalesModel;
//   final String? customerName;
//   final double? eleGrandTotal;
//   final double? eleTotalAmount;
//   final String? eleLessAmount;
//   final String? eleDeliveryChgAmount;
//   final String? eleServiceChgAmount;
//   final String? eleCollectedAmount;
//   final String? eleChangeAmount;
//   final String? elePaymentVaiName;
//   final Function() closeDialog;
//
//   const SalesPrinterScreen({
//     super.key,
//     required this.superAddNewEasySalesModel,
//     required this.selectedProducts,
//     required this.superUserProfileListData,
//     required this.customerName,
//     required this.eleGrandTotal,
//     required this.eleTotalAmount,
//     required this.eleLessAmount,
//     required this.eleDeliveryChgAmount,
//     required this.eleServiceChgAmount,
//     required this.eleCollectedAmount,
//     required this.eleChangeAmount,
//     required this.elePaymentVaiName,
//     required this.closeDialog,
//
//   });
//
//   @override
//   State<SalesPrinterScreen> createState() => _SalesPrinterScreenState();
// }
//
// class _SalesPrinterScreenState extends State<SalesPrinterScreen> {
//
//   TextEditingController currentCustomerCon = TextEditingController();
//   TextEditingController phoneCon = TextEditingController();
//   String paymentVai = '0';
//   String time = DateTimeFormatter.dbFormatDateTime.format(DateTime.now());
//   final authController = AuthController.current;
//
//   Future<void> generatePdfAndShare() async {
//     // Load the image from assets as bytes
//     final ByteData bytes = await rootBundle.load('assets/images/logo2.png');
//     final Uint8List byteList = bytes.buffer.asUint8List();
//
//     final pdf = pw.Document();
//     pdf.addPage(
//       pw.Page(
//         build: (pw.Context context) {
//           return pw.Column(
//             children: [
//               // Add your image
//               // Add your image
//               pw.Container(
//                 alignment: pw.Alignment.center,
//                 child: pw.Image(
//                   pw.MemoryImage(byteList),
//                   width: 100, // Adjust width as needed
//                 ),
//               ),
//               pw.Container(height: 10),
//               pw.Text(widget.superUserProfileListData?.branchName ?? '', style: pw.TextStyle(fontSize: 14, fontWeight: pw.FontWeight.bold)),
//               pw.Text(widget.superUserProfileListData?.branchAddress ?? '', style: const pw.TextStyle(fontSize: 12)),
//               pw.Row(
//                 mainAxisAlignment: pw.MainAxisAlignment.center,
//                 children: [
//                   pw.Text("Val Reg No. #", style: pw.TextStyle(fontSize: 12, fontWeight: pw.FontWeight.bold)),
//                   pw.Text(widget.superUserProfileListData?.vat ?? '', style: const pw.TextStyle(fontSize: 12)),
//                 ],
//               ),
//               pw.Row(
//                 mainAxisAlignment: pw.MainAxisAlignment.center,
//                 children: [
//                   pw.Text("Help Line: ", style: pw.TextStyle(fontSize: 12, fontWeight: pw.FontWeight.bold)),
//                   pw.Text(widget.superUserProfileListData?.branchMobileNo ?? '', style: const pw.TextStyle(fontSize: 12)),
//                 ],
//               ),
//               pw.Row(
//                 mainAxisAlignment: pw.MainAxisAlignment.center,
//                 children: [
//                   pw.Text("Invoice No: ", style: pw.TextStyle(fontSize: 12, fontWeight: pw.FontWeight.bold)),
//                   pw.Text(widget.superAddNewEasySalesModel?.data?.invNo ?? '', style: const pw.TextStyle(fontSize: 12)),
//                 ],
//               ),
//               pw.Row(
//                 mainAxisAlignment: pw.MainAxisAlignment.center,
//                 children: [
//                   pw.Text("Date: ", style: pw.TextStyle(fontSize: 12, fontWeight: pw.FontWeight.bold)),
//                   pw.Text(time, style: const pw.TextStyle(fontSize: 12)),
//                 ],
//               ),
//               pw.Row(
//                 mainAxisAlignment: pw.MainAxisAlignment.center,
//                 children: [
//                   pw.Text("Customer: ", style: pw.TextStyle(fontSize: 12, fontWeight: pw.FontWeight.bold)),
//                   pw.Text(widget.customerName ?? '', style: const pw.TextStyle(fontSize: 12)),
//                 ],
//               ),
//               pw.SizedBox(height: 10),
//               pw.TableHelper.fromTextArray(data: <List<String>>[
//                 <String>['SL No.', 'Product', 'Qty', 'Rate', 'Total'],
//                 ...widget.selectedProducts.map((product) => [
//                   '${widget.selectedProducts.indexOf(product) + 1}',
//                   product.productName.toString(),
//                   product.quantity.toString(),
//                   product.productRate.toString(),
//                   product.amount.toString(),
//                 ])
//               ]),
//               pw.SizedBox(height: 10),
//               pw.Row(
//                 mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
//                 children: [
//                   pw.Text("Grand Amount:", style: const pw.TextStyle(fontSize: 12)),
//                   pw.Text(widget.eleGrandTotal.toString(), style: const pw.TextStyle(fontSize: 12)),
//                 ],
//               ),
//               pw.Row(
//                 mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
//                 children: [
//                   pw.Text("Discount:", style: const pw.TextStyle(fontSize: 12)),
//                   pw.Text(widget.eleLessAmount.toString(), style: const pw.TextStyle(fontSize: 12)),
//                 ],
//               ),
//               pw.Row(
//                 mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
//                 children: [
//                   pw.Text("Delivery Charge:", style: const pw.TextStyle(fontSize: 12)),
//                   pw.Text(widget.eleDeliveryChgAmount != 'null' ? widget.eleDeliveryChgAmount.toString() : '0.00', style: const pw.TextStyle(fontSize: 12)),
//                 ],
//               ),
//               pw.Row(
//                 mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
//                 children: [
//                   pw.Text("Service Charge:", style: const pw.TextStyle(fontSize: 12)),
//                   pw.Text(widget.eleServiceChgAmount != 'null' ? widget.eleServiceChgAmount.toString() : "0.00", style: const pw.TextStyle(fontSize: 12)),
//                 ],
//               ),
//               pw.Container(height: 1, color: PdfColors.grey),
//               pw.Row(
//                 mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
//                 children: [
//                   pw.Text("Total Amount:", style: pw.TextStyle(fontSize: 12, fontWeight: pw.FontWeight.bold)),
//                   pw.Text(widget.eleTotalAmount.toString(), style: pw.TextStyle(fontSize: 12, fontWeight: pw.FontWeight.bold)),
//                 ],
//               ),
//               pw.Row(
//                 mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
//                 children: [
//                   pw.Text("Collected:", style: const pw.TextStyle(fontSize: 12)),
//                   pw.Text(widget.eleCollectedAmount != 'null' ? widget.eleCollectedAmount.toString() : "0.00", style: const pw.TextStyle(fontSize: 12)),
//                 ],
//               ),
//               pw.Row(
//                 mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
//                 children: [
//                   pw.Text("Change:", style: const pw.TextStyle(fontSize: 12)),
//                   pw.Text(widget.eleChangeAmount != 'null' ? widget.eleChangeAmount.toString() : "0.00", style: const pw.TextStyle(fontSize: 12)),
//                 ],
//               ),
//               pw.Row(
//                 mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
//                 children: [
//                   pw.Text("Paid By:", style: const pw.TextStyle(fontSize: 12)),
//                   pw.Text(widget.elePaymentVaiName != 'null' ? widget.elePaymentVaiName.toString() : "", style: const pw.TextStyle(fontSize: 12)),
//                 ],
//               ),
//
//               pw.Text('Thank You', style: const pw.TextStyle(fontSize: 12)),
//               pw.Text(authController.superSystemSettingData?.note ?? '', style: const pw.TextStyle(fontSize: 12)),
//
//               // pw.Text("Grand Amount: ${widget.eleGrandTotal ?? "0.00"}", style: const pw.TextStyle(fontSize: 12)),
//               // pw.Text("Discount: ${widget.eleLessAmount ?? "0.00"}", style: const pw.TextStyle(fontSize: 12)),
//               // pw.Text("Delivery Charge: ${widget.eleDeliveryChgAmount != 'null' ? widget.eleDeliveryChgAmount : '0.00'}", style: const pw.TextStyle(fontSize: 12)),
//               // pw.Text("Service Charge: ${widget.eleServiceChgAmount != 'null' ? widget.eleServiceChgAmount : "0.00"}", style: const pw.TextStyle(fontSize: 12)),
//               // pw.Container(height: 1, color: PdfColors.grey),
//               // pw.SizedBox(height: 10),
//               // pw.Text("Total Amount: ${widget.eleTotalAmount ?? "0.00"}", style: const pw.TextStyle(fontSize: 12)),
//               // pw.Text("Collected: ${widget.eleCollectedAmount != 'null' ? widget.eleCollectedAmount : "0.00"}", style: const pw.TextStyle(fontSize: 12)),
//               // pw.Text("Change: ${widget.eleChangeAmount != 'null' ? widget.eleChangeAmount : "0.00"}", style: const pw.TextStyle(fontSize: 12)),
//               // pw.Text("Paid By: ${widget.elePaymentVaiName != 'null' ? widget.elePaymentVaiName : ""}", style: const pw.TextStyle(fontSize: 12)),
//             ],
//           );
//         },
//       ),
//     );
//
//     final output = await getTemporaryDirectory();
//     final file = File("${output.path}/swadhin_pos.pdf");
//     await file.writeAsBytes(await pdf.save());
//
//     Share.shareFiles([file.path], text: 'Here is your invoice');
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       decoration: BoxDecoration(
//           color: ColorRes.white,
//           borderRadius: BorderRadius.circular(5)
//       ),
//       child: Column(
//         children: [
//           Expanded(
//             child: Container(
//               width: Get.width,
//               margin: const EdgeInsets.only(top: 15, left: 15, right: 15, bottom: 10),
//               padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 10),
//               decoration: BoxDecoration(
//                   border: Border.all(width: 1, color: ColorRes.black)
//               ),
//               child: SingleChildScrollView(
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.center,
//                   children: [
//                     GlobalText(
//                       str: widget.superUserProfileListData?.branchName ?? '',
//                       color: ColorRes.black,
//                       fontSize: 14,
//                       fontWeight: FontWeight.w700,
//                       fontFamily: 'Rubik',
//                       textAlign: TextAlign.center,
//                     ),
//                     GlobalText(
//                       str: widget.superUserProfileListData?.branchAddress ?? '',
//                       color: ColorRes.black,
//                       fontSize: 12,
//                       fontWeight: FontWeight.w400,
//                       textAlign: TextAlign.center,
//                       fontFamily: 'Rubik',
//                     ),
//                     Row(
//                       mainAxisAlignment: MainAxisAlignment.center,
//                       children: [
//                         const GlobalText(
//                           str: "Val Reg No. #",
//                           color: ColorRes.black,
//                           fontSize: 12,
//                           fontWeight: FontWeight.bold,
//                           textAlign: TextAlign.center,
//                           fontFamily: 'Rubik',
//                         ),
//                         GlobalText(
//                           str: widget.superUserProfileListData?.vat ?? '',
//                           color: ColorRes.black,
//                           fontSize: 12,
//                           fontWeight: FontWeight.w400,
//                           textAlign: TextAlign.center,
//                           fontFamily: 'Rubik',
//                         ),
//                       ],
//                     ),
//                     Row(
//                       mainAxisAlignment: MainAxisAlignment.center,
//                       children: [
//                         const GlobalText(
//                           str: "Help Line: ",
//                           color: ColorRes.black,
//                           fontSize: 12,
//                           fontWeight: FontWeight.bold,
//                           textAlign: TextAlign.center,
//                           fontFamily: 'Rubik',
//                         ),
//                         GlobalText(
//                           str: widget.superUserProfileListData?.branchMobileNo ?? '',
//                           color: ColorRes.black,
//                           fontSize: 12,
//                           fontWeight: FontWeight.w400,
//                           textAlign: TextAlign.center,
//                           fontFamily: 'Rubik',
//                         ),
//                       ],
//                     ),
//                     Row(
//                       mainAxisAlignment: MainAxisAlignment.center,
//                       children: [
//                         const GlobalText(
//                           str: "Invoice No: ",
//                           color: ColorRes.black,
//                           fontSize: 12,
//                           fontWeight: FontWeight.bold,
//                           textAlign: TextAlign.center,
//                           fontFamily: 'Rubik',
//                         ),
//                         GlobalText(
//                           str: widget.superAddNewEasySalesModel?.data?.invNo ?? '',
//                           color: ColorRes.black,
//                           fontSize: 12,
//                           fontWeight: FontWeight.w400,
//                           textAlign: TextAlign.center,
//                           fontFamily: 'Rubik',
//                         ),
//                       ],
//                     ),
//                     Row(
//                       mainAxisAlignment: MainAxisAlignment.center,
//                       children: [
//                         const GlobalText(
//                           str: "Date: ",
//                           color: ColorRes.black,
//                           fontSize: 12,
//                           fontWeight: FontWeight.bold,
//                           textAlign: TextAlign.center,
//                           fontFamily: 'Rubik',
//                         ),
//                         GlobalText(
//                           str: time,
//                           color: ColorRes.black,
//                           fontSize: 12,
//                           fontWeight: FontWeight.w400,
//                           textAlign: TextAlign.center,
//                           fontFamily: 'Rubik',
//                         ),
//                       ],
//                     ),
//                     Row(
//                       mainAxisAlignment: MainAxisAlignment.center,
//                       children: [
//                         const GlobalText(
//                           str: "Customer: ",
//                           color: ColorRes.black,
//                           fontSize: 12,
//                           fontWeight: FontWeight.bold,
//                           textAlign: TextAlign.center,
//                           fontFamily: 'Rubik',
//                         ),
//                         GlobalText(
//                           str: widget.customerName ?? '',
//                           color: ColorRes.black,
//                           fontSize: 12,
//                           fontWeight: FontWeight.w400,
//                           textAlign: TextAlign.center,
//                           fontFamily: 'Rubik',
//                         ),
//                       ],
//                     ),
//
//                     Row(
//                       mainAxisAlignment: MainAxisAlignment.center,
//                       children: [
//                         const GlobalText(
//                           str: "Serve By: ",
//                           color: ColorRes.black,
//                           fontSize: 12,
//                           fontWeight: FontWeight.bold,
//                           textAlign: TextAlign.center,
//                           fontFamily: 'Rubik',
//                         ),
//                         GlobalText(
//                           str: widget.superUserProfileListData?.userName ?? '',
//                           color: ColorRes.black,
//                           fontSize: 12,
//                           fontWeight: FontWeight.w400,
//                           textAlign: TextAlign.center,
//                           fontFamily: 'Rubik',
//                         ),
//                       ],
//                     ),
//
//                     sizeBoxH(10),
//                     GlobalContainer(
//                       width: Get.width,
//                       child: const PrintTableWidget(
//                         firstRow: 'SL No.',
//                         secondRow: 'Product',
//                         thirdRow: 'Qty',
//                         fourRow: 'Rate',
//                         fiveRow: "Total",
//                       ),
//                     ),
//
//                     ListView.builder(
//                         shrinkWrap: true,
//                         itemCount: widget.selectedProducts.length,
//                         physics: const NeverScrollableScrollPhysics(),
//                         itemBuilder: (ctx, index){
//                           return PrintTableListValueWidget(
//                             firstColumn: '${index + 1}',
//                             secondColumn: '${widget.selectedProducts[index].productName}',
//                             thirdColumn: widget.selectedProducts[index].quantity.toString(),
//                             fourColumn: '${widget.selectedProducts[index].productRate}',
//                             fiveColumn: '${widget.selectedProducts[index].amount}',
//                           );
//                         }
//                     ),
//
//                     sizeBoxH(10),
//                     PrintCardBoardWidget(
//                         name1: "Grand Amount",
//                         name3: "Discount",
//                         name4: "Delivery Charge",
//                         name5: "Service Charge",
//                         value1: "${widget.eleGrandTotal ?? "0.00"}",
//                         value3: widget.eleLessAmount ?? "0.00",
//                         value4: widget.eleDeliveryChgAmount != 'null' ? widget.eleDeliveryChgAmount : '0.00',
//                         value5: widget.eleServiceChgAmount != 'null' ? widget.eleServiceChgAmount : "0.00"
//                     ),
//                     sizeBoxH(10),
//                     Container(
//                       height: 1,
//                       width: Get.width,
//                       color: ColorRes.primaryColor,
//                     ),
//                     sizeBoxH(10),
//                     PrintCardBoardWidget(
//                       name1: "Total Amount",
//                       name3: "Collected",
//                       name4: "Change",
//                       name5: "Paid By",
//                       value1: "${widget.eleTotalAmount ?? "0.00"}",
//                       value3: widget.eleCollectedAmount != 'null' ? widget.eleCollectedAmount : "0.00",
//                       value4: widget.eleChangeAmount != 'null' ? widget.eleChangeAmount : "0.00",
//                       value5: widget.elePaymentVaiName != 'null' ? widget.elePaymentVaiName : "",
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//           ),
//           Padding(
//             padding: const EdgeInsets.only(right: 20),
//             child: Row(
//               mainAxisAlignment: MainAxisAlignment.end,
//               children: [
//                 sizeBoxW(20),
//                 GestureDetector(
//                   onTap: () async {
//                     await generatePdfAndShare();
//                   },
//                   child: GlobalImageLoader(
//                     imagePath: Images.shareIc,
//                     height: 28,
//                     width: 28,
//                   ),
//                 ),
//                 Expanded(child: Container()),
//                 GlobalButtonWidget(
//                   str: 'Close',
//                   height: 35,
//                   width: 80,
//                   radius: 5,
//                   textSize: 11,
//                   buttomColor: Colors.white,
//                   textColor: ColorRes.red,
//                   borderColor: ColorRes.red,
//                   onTap: () async{
//                     setState(() {
//                       Navigator.pop(context);
//                       widget.closeDialog;
//                     });
//                   },
//                 ),
//                 sizeBoxW(10),
//                 GlobalButtonWidget(
//                   str: 'Print',
//                   height: 35,
//                   width: 80,
//                   radius: 5,
//                   textSize: 11,
//                   buttomColor: Colors.red,
//                   textColor: ColorRes.white,
//                   onTap: (){
//                     // Get.dialog(Dialog(
//                     //     shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
//                     //     child: SuperSearchPurchasePrinterDialog(
//                     //       controller: widget.controller,
//                     //       superLoadSinglePurchaseProductList: widget.superLoadSinglePurchaseProductList,
//                     //       superUserProfileListData: widget.superUserProfileListData,
//                     //       grandTotal: widget.grandTotal,
//                     //     )));
//
//                     Get.dialog(Dialog(
//                         shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
//                         child: SalesPrinterDialog(
//                           superAddNewEasySalesModel: widget.superAddNewEasySalesModel,
//                           selectedProducts: widget.selectedProducts,
//                           superUserProfileListData: widget.superUserProfileListData,
//                           eleGrandTotal: widget.eleGrandTotal,
//                           eleTotalAmount: widget.eleTotalAmount,
//                           eleLessAmount: widget.eleLessAmount,
//                           eleDeliveryChgAmount: widget.eleDeliveryChgAmount.toString(),
//                           eleServiceChgAmount: widget.eleServiceChgAmount.toString(),
//                           eleCollectedAmount: widget.eleCollectedAmount.toString(),
//                           eleChangeAmount: widget.eleChangeAmount.toString(),
//                           elePaymentVaiName: widget.elePaymentVaiName.toString(),
//                           customerName: widget.customerName,
//                         )
//                     ));
//                   },
//                   // onTap: widget.onPrint,
//                   // onTap: () async{
//                   //   setState(() {
//                   //     purchaseController.purchasePrintTicketFor58(widget.controller);
//                   //   });
//                   // },
//                 ),
//               ],
//             ),
//           ),
//           sizeBoxH(10)
//         ],
//       ),
//     );
//   }
// }
//
