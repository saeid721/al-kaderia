
import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:al_kaderia/global/widget/global_image_loader.dart';
import '../../../../../../global/widget/global_sizedbox.dart';
import '../../../global/constants/colors_resources.dart';
import '../../../global/constants/images.dart';
import '../../../global/widget/global_container.dart';
import '../../../global/widget/global_search_text_formfield.dart';
import '../../../global/widget/global_text.dart';
import '../custom_drawer_screen.dart';
import 'card/card_screen.dart';
import 'sale_report/controller/sales_report_controller.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({
    super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {

  final GlobalKey<ScaffoldState> drawerKey = GlobalKey<ScaffoldState>();

  final ScrollController scrollController = ScrollController();

  String selectProduct = "Select One";
  String selectCategoryData = "0";

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    final reqController = SalesReportController.current;
    reqController.getCategoryList();

  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SalesReportController>(builder: (salesReportController) {
        return Scaffold(
            resizeToAvoidBottomInset: false,
            appBar: PreferredSize(
                preferredSize: const Size.fromHeight(60),
                child: AppBar(
                  backgroundColor: ColorRes.primaryColor,
                  leading: GestureDetector(
                    onTap: (){
                      drawerKey.currentState!.isDrawerOpen
                          ? drawerKey.currentState!.closeDrawer()
                          : drawerKey.currentState!.openDrawer();
                    },
                    child: const Icon(Icons.menu, color: ColorRes.white,),
                  ),
                  title: const GlobalText(
                    str: 'Al-Kaderia Express',
                    color: ColorRes.white,
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    textAlign: TextAlign.center,
                    fontFamily: 'Rubik',
                  ),
                  actions: [
                    Stack(
                      children: [
                        const SizedBox(height: 30, width: 30),
                        Positioned(
                          top: 10,
                          right: 0,
                          child: Container(
                            height: 15,
                            width: 15,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(50),
                              color: ColorRes.white
                            ),
                            child: Center(
                              child: GlobalText(
                                str: salesReportController.cartCount.toString(),
                                color: ColorRes.primaryColor,
                                fontSize: 12,
                                fontWeight: FontWeight.w700,
                                textAlign: TextAlign.center,
                                fontFamily: 'Rubik',
                              ),
                            ),
                          ),
                        ),
                        Center(
                          child: GestureDetector(
                            onTap: (){
                              Get.to(()=> const CardScreen());
                            },
                            child: const Icon(
                              Icons.shopping_cart_outlined,
                              color: ColorRes.white
                            ),
                          ),
                        ),
                      ],
                    ),
                    sizeBoxW(15)
                  ],
                )
            ),
            key: drawerKey,
            drawer: const CustomDrawerScreen(),
            body: GlobalContainer(
              height: size(context).height,
              width: size(context).width,
              color: Colors.white,
              child: Column(
                children: [
                  Container(
                    width: size(context).width,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color: ColorRes.primaryColor
                    ),
                    margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                    padding: const EdgeInsets.symmetric(vertical: 20),
                    child: const Column(
                      children: [
                        GlobalText(
                          str: 'Charge',
                          color: ColorRes.white,
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                          textAlign: TextAlign.center,
                          fontFamily: 'Rubik',
                        ),
                        GlobalText(
                          str: 'TK \$2000',
                          color: ColorRes.white,
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          textAlign: TextAlign.center,
                          fontFamily: 'Rubik',
                        ),
                      ],
                    ),
                  ),

                  sizeBoxH(12),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Row(
                      children: [
                        Expanded(
                          child: GlobalSearchTextFormField(
                          text: salesReportController.selectCategoryData,
                            color: salesReportController.selectCategoryDataIndex > -1 ? ColorRes.black : ColorRes.grey,
                            item: salesReportController.selectCategoryDataList ?? [],
                            onSelect: (val) async {
                              setState(() {
                                Get.back();

                                salesReportController.selectCategoryDataIndex = val;
                                salesReportController.selectCategoryData = salesReportController.selectCategoryDataList![val];

                                final categoryType = salesReportController
                                    .categoryData?[salesReportController.selectCategoryDataList!.indexOf(
                                    salesReportController.selectCategoryData)]
                                    .categoryId
                                    ?.toString();

                                log('Drop Main Id: $categoryType');

                                if (categoryType != null) {
                                  selectCategoryData = categoryType;
                                  salesReportController.getCategoryProductList(categoryId: selectCategoryData);
                                } else {
                                  log('Drop Id: $selectCategoryData');
                                }
                              });
                            },
                          ),
                        ),
                        sizeBoxW(10),
                        Container(
                          decoration: BoxDecoration(
                            color: ColorRes.primaryColor,
                            borderRadius: BorderRadius.circular(5)
                          ),
                          padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
                          child: const Icon(
                            Icons.search,
                            color: ColorRes.white,
                            size: 28,
                          ),
                        )
                      ],
                    ),
                  ),

                  salesReportController.categoryProductModel?.data?.isNotEmpty ?? false
                      ? Expanded(
                      child: Container(
                        width: size(context).width,
                        margin: const EdgeInsets.symmetric(vertical: 15, horizontal: 10),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          color: ColorRes.grey.withAlpha((0.1 * 255).toInt()),
                        ),
                        child: NotificationListener<OverscrollIndicatorNotification>(
                          onNotification: (overScroll){
                            overScroll.disallowIndicator();
                            return true;
                          },
                          child: SingleChildScrollView(
                            controller: scrollController,
                            child: Column(
                              children: [
                                GridView.builder(
                                  itemCount: salesReportController.categoryProductModel?.data?.length ?? 0,
                                  shrinkWrap: true,
                                    physics: const NeverScrollableScrollPhysics(),
                                    padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                                      mainAxisSpacing: 10,
                                      crossAxisSpacing: 10,
                                      crossAxisCount: 3,
                                      childAspectRatio: (2.4 / 4)
                                    ),
                                    itemBuilder: (ctx, index){

                                      final productData = salesReportController.categoryProductModel?.data?[index];

                                      double productRate = double.tryParse(productData?.productRate ?? '0') ?? 0.0;
                                      double quantity = productData?.quantity?.toDouble() ?? 0.0;
                                      productData?.subTotalAmount = quantity * productRate;

                                      return GestureDetector(
                                        onTap: () {
                                          setState(() {
                                            // Increment product quantity
                                            productData?.quantity = productData.quantity! + 1;

                                            // Update subTotalAmount
                                            double productRate = double.tryParse(productData?.productRate ?? '0') ?? 0.0;
                                            productData?.subTotalAmount = productData.quantity! * productRate;

                                            // Update totalAmount if needed
                                            salesReportController.totalAmount = salesReportController.subTotalAmount;
                                          });

                                          // Increment cart count
                                          salesReportController.incrementCartCount();
                                        },
                                        child: Container(
                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(5),
                                            border: Border.all(
                                              width: 1,
                                              color: ColorRes.grey.withAlpha((0.30 * 255).toInt()),
                                            ),
                                          ),
                                          child: Column(
                                            children: [
                                              const ClipRRect(
                                                borderRadius: BorderRadius.only(
                                                  topRight: Radius.circular(5),
                                                  topLeft: Radius.circular(5)
                                                ),
                                                child: GlobalImageLoader(
                                                  imagePath: Images.burger,
                                                  fit: BoxFit.cover,
                                                ),
                                              ),
                                              sizeBoxH(5),
                                              GlobalText(
                                                str: productData?.productName ?? '',
                                                fontSize: 12,
                                                fontWeight: FontWeight.w500,
                                                color: ColorRes.black,
                                                textAlign: TextAlign.center,
                                                maxLines: 3,
                                              ),
                                              Expanded(child: Container()),
                                              Row(
                                                mainAxisAlignment: MainAxisAlignment.center,
                                                children: [
                                                  GestureDetector(
                                                    onTap:(){
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
                                                    child: const Icon(
                                                      Icons.remove_circle_outline,
                                                      color: ColorRes.primaryColor,
                                                      size: 18
                                                    ),
                                                  ),
                                                  sizeBoxW(5),
                                                  GlobalText(
                                                    str: productData?.quantity.toString() ?? '',
                                                    color: ColorRes.black,
                                                    fontSize: 13,
                                                    fontWeight: FontWeight.w300,
                                                  ),
                                                  sizeBoxW(5),
                                                  GestureDetector(
                                                    onTap:(){
                                                      setState(() {
                                                        productData?.quantity = productData.quantity! + 1;

                                                        // Update subTotalAmount
                                                        double productRate = double.tryParse(productData?.productRate ?? '0') ?? 0.0;
                                                        productData?.subTotalAmount = productData.quantity! * productRate;

                                                        // Update totalAmount if needed
                                                        salesReportController.totalAmount = salesReportController.subTotalAmount;
                                                      });
                                                    },
                                                    child: const Icon(
                                                      Icons.add_circle_outline,
                                                      color: ColorRes.primaryColor,
                                                      size: 18
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              sizeBoxW(5),
                                              GestureDetector(
                                                onTap: () {
                                                  setState(() {
                                                    // Increment product quantity
                                                    productData?.quantity = productData.quantity! + 1;

                                                    // Update subTotalAmount
                                                    double productRate = double.tryParse(productData?.productRate ?? '0') ?? 0.0;
                                                    productData?.subTotalAmount = productData.quantity! * productRate;

                                                    // Update totalAmount if needed
                                                    salesReportController.totalAmount = salesReportController.subTotalAmount;
                                                  });

                                                  // Increment cart count
                                                  salesReportController.incrementCartCount();
                                                },
                                                child: Container(
                                                  width: Get.width,
                                                  padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
                                                  decoration: const BoxDecoration(
                                                    borderRadius: BorderRadius.only(
                                                      bottomLeft: Radius.circular(5),
                                                      bottomRight: Radius.circular(5),
                                                    ),
                                                    color: ColorRes.primaryColor,
                                                  ),
                                                  child: const GlobalText(
                                                    str: 'Add',
                                                    color: ColorRes.white,
                                                    fontSize: 12,
                                                    fontWeight: FontWeight.w500,
                                                    fontFamily: 'Rubik',
                                                    textAlign: TextAlign.center,
                                                  ),
                                                ),
                                              ),

                                            ],
                                          ),
                                        ),
                                      );
                                    }
                                )
                              ],
                            ),
                          ),
                        ),
                      )
                  ) : const Expanded(
                    child: SizedBox(
                      child: Center(
                        child: GlobalText(
                          str: " ",
                          //str: "Not Data Found",
                          color: ColorRes.black,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),

                  // Expanded(
                  //     child: Container(
                  //       width: size(context).width,
                  //       margin: const EdgeInsets.symmetric(vertical: 15, horizontal: 10),
                  //       decoration: BoxDecoration(
                  //         borderRadius: BorderRadius.circular(5),
                  //         color: ColorRes.grey.withOpacity(0.1),
                  //       ),
                  //       child: Column(
                  //         mainAxisAlignment: MainAxisAlignment.center,
                  //         children: [
                  //           const GlobalText(
                  //             str: 'You have no discounts yet',
                  //             color: ColorRes.grey,
                  //             fontSize: 15,
                  //             fontWeight: FontWeight.w600,
                  //             textAlign: TextAlign.center,
                  //             fontFamily: 'Rubik',
                  //           ),
                  //           const GlobalText(
                  //             str: 'Go to items menu to add a discount',
                  //             color: ColorRes.grey,
                  //             fontSize: 13,
                  //             fontWeight: FontWeight.w400,
                  //             textAlign: TextAlign.center,
                  //             fontFamily: 'Rubik',
                  //           ),
                  //
                  //           sizeBoxH(10),
                  //           GlobalButtonWidget(
                  //               str: 'GO TO ITEMS',
                  //               height: 35,
                  //               width: 130,
                  //               textSize: 12,
                  //               onTap: (){
                  //                 Get.to(()=> const SuperHomeScreen());
                  //               }
                  //           ),
                  //         ],
                  //       ),
                  //     )
                  // )
                ],
              )
            )
        );
      }
    );
  }
}

