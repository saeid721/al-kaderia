import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../global/constants/colors_resources.dart';
import '../../../../global/constants/images.dart';
import '../../../../global/widget/global_container.dart';
import '../../../../global/widget/global_image_loader.dart';
import '../../../../global/widget/global_sizedbox.dart';
import '../../../../global/widget/global_text.dart';
import '../../../base_widget/custom_appbar.dart';
import '../controller/sales_report_controller.dart';
import 'component/invoice_details_widget.dart';

class InvoiceDetailsScreen extends StatefulWidget {
  const InvoiceDetailsScreen({super.key});

  @override
  State<InvoiceDetailsScreen> createState() => _InvoiceDetailsScreenState();
}

class _InvoiceDetailsScreenState extends State<InvoiceDetailsScreen> {

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
                  child: Padding(
                    padding: const EdgeInsets.only(left: 15, right: 15),
                    child: Column(
                      children: [
                        sizeBoxH(10),
                        const Center(
                          child: GlobalImageLoader(
                            imagePath: Images.logo,
                            height: 100,
                            fit: BoxFit.fitWidth,
                          ),
                        ),
                        sizeBoxH(20),
                         const Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      GlobalText(
                                        str: "Al-Kaderia Express",
                                        color: ColorRes.deep300,
                                        fontSize: 16,
                                        fontWeight: FontWeight.w600,
                                        fontFamily: 'Roboto',
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                      GlobalText(
                                        str: "Dhaka, Bangladesh",
                                        color: ColorRes.deep300,
                                        fontSize: 14,
                                        fontWeight: FontWeight.w400,
                                        fontFamily: 'Roboto',
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                      GlobalText(
                                        str: "Cell: 01721-497089",
                                        color: ColorRes.deep300,
                                        fontSize: 14,
                                        fontWeight: FontWeight.w400,
                                        fontFamily: 'Roboto',
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                    ],
                                  ),
                                ),
                                Expanded(
                                  child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.end,
                                      children: [
                                        GlobalText(
                                          str: "Token No : 12345",
                                          color: ColorRes.deep300,
                                          fontSize: 14,
                                          fontWeight: FontWeight.w400,
                                          fontFamily: 'Roboto',
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                        GlobalText(
                                          str: "Order Type : dine-in",
                                          color: ColorRes.deep300,
                                          fontSize: 14,
                                          fontWeight: FontWeight.w400,
                                          fontFamily: 'Roboto',
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                        GlobalText(
                                          str: "Served By : Asif",
                                          color: ColorRes.deep300,
                                          fontSize: 14,
                                          fontWeight: FontWeight.w400,
                                          fontFamily: 'Roboto',
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                      ]
                                  ),
                                ),

                              ],
                            ),
                            Row(
                              children: [
                                Expanded(
                                  child: Row(
                                      children: [
                                        Icon(
                                          Icons.calendar_month_outlined,
                                          size: 20,
                                          color: ColorRes.grey,
                                        ),
                                        GlobalText(
                                          str: "20/01/2025",
                                          color: ColorRes.deep300,
                                          fontSize: 14,
                                          fontWeight: FontWeight.w400,
                                          fontFamily: 'Roboto',
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                      ]
                                  ),
                                ),
                                Expanded(
                                  child: Row(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        Icon(
                                          Icons.access_time,
                                          size: 20,
                                          color: ColorRes.grey,
                                        ),
                                        GlobalText(
                                          str: "10:51:21 AM",
                                          color: ColorRes.deep300,
                                          fontSize: 14,
                                          fontWeight: FontWeight.w400,
                                          fontFamily: 'Roboto',
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                      ]
                                  ),
                                ),

                              ],
                            ),
                          ],
                        ),

                        sizeBoxH(20),
                        Column(
                          children: [
                            const InvoiceDetailsWidget(
                              firstRow: 'SL',
                              secondRow: 'Item',
                              thirdRow: 'Qty',
                              fourRow: 'Rate',
                              fiveRow: 'Subtotal',
                            ),
                            ListView.builder(
                                shrinkWrap: true,
                                itemCount: 2,
                                physics: const NeverScrollableScrollPhysics(),
                                itemBuilder: (ctx, index){
                                  return const InvoiceDetailsValueWidget(
                                    firstColumn: '01',
                                    secondColumn: 'Al Kaderia Special Chicken Corn Soup',
                                    thirdColumn: '1',
                                    fourColumn: '365',
                                    fiveColumn: '365',
                                  );
                                }
                            ),
                            const InvoiceDetailsTotalWidget(
                              firstColumn: '365.00',
                              secondColumn: '18.25',
                              thirdColumn: '383.00',
                              fourColumn: '383.00',
                              fiveColumn: ' 0.00',
                            ),
                          ],
                        ),

                        sizeBoxH(5),
                        const GlobalText(
                          str: "Powered By Alkaderia",
                          color: ColorRes.deep300,
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                          fontFamily: 'Roboto',
                          overflow: TextOverflow.ellipsis,
                        ),
                      ],
                    ),
                  ),
                ),
              )
          )
      );
    }
    );
  }
}