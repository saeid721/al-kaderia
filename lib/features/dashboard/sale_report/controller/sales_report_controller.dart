import 'dart:developer';
import 'package:get/get.dart';
import '../model/category_model.dart';
import '../model/category_product_model.dart';
import '../model/payment_mode_model.dart';
import '../model/sales_model.dart';
import '../model/waiter_model.dart';
import 'sales_report_repository.dart';

class SalesReportController extends GetxController implements GetxService {
  static SalesReportController get current => Get.find();
  final SalesReportRepository repository = SalesReportRepository();

  bool _isLoading = false;

  bool get isLoading => _isLoading;

  bool _hasError = false;

  bool get hasError => _hasError;

  // =/@ Category Model
  List<CategoryData>? categoryData;
  List<String>? selectCategoryDataList;

  String selectCategoryData = "Select One";
  int selectCategoryDataIndex = -1;

  Future getCategoryList() async {
    try {
      _isLoading = true;
      _hasError = false;
      update();

      final response = await repository.getCategoryList();

      // Initialize the data list
      categoryData = [];
      categoryData?.addAll(response.data ?? []);

      selectCategoryDataList = [];
      categoryData?.map((item){
        selectCategoryDataList?.add(item.categoryName ?? '');
      }).toList();

      log("Response: ${response.data}");
      log("Response: $selectCategoryDataList");

      _isLoading = false;
      update();
    } catch (e, s) {
      log('Error: ', error: e, stackTrace: s);
      _isLoading = false;
      _hasError = true;
      update();
    }
  }


  int cartCount = 0; // Add this variable to track cart count

  void incrementCartCount() {
    cartCount++;
    update(); // Notify GetBuilder to rebuild
  }

  double? subTotalAmount;
  double? grandTotalAmount;
  String? discountAmount;
  String? vatAmount;
  double? payableAmount;
  double? changeAmount;
  double? totalAmount;
  double? currentPoint;
  String paymentVai = '0';
  String? paymentVaiName;

  Future<void> calculationDataClear() async {
    subTotalAmount = null;
    grandTotalAmount = null;
    discountAmount = null;
    vatAmount = null;
    payableAmount = null;
    changeAmount = null;
    totalAmount = null;
    currentPoint = null;
    paymentVai = '0';
    paymentVaiName = null;
  }

  List<CategoryProductData> selectedProducts = [];

  // =/@ Category Product Model
  CategoryProductModel? categoryProductModel;
  Future getCategoryProductList({required String categoryId}) async {
    try {
      _isLoading = true;
      _hasError = false;
      update();

      final response = await repository.getCategoryProductList(categoryId: categoryId);

      categoryProductModel = response;

      _isLoading = false;
      update();
    } catch (e, s) {
      log('Error: ', error: e, stackTrace: s);
      _isLoading = false;
      _hasError = true;
      update();
    }
  }


  // =/@ Payment Mode
  List<PaymentModeData>? paymentModeData;
  List<String>? selectPaymentModeList;

  String selectPaymentMode = "Select One";
  int selectPaymentModeIndex = -1;

  Future getPaymentModeList() async {
    try {
      _isLoading = true;
      _hasError = false;
      update();

      final response = await repository.getPaymentModeList();

      // Initialize the data list
      paymentModeData = [];
      paymentModeData?.addAll(response.data ?? []);

      selectPaymentModeList = [];
      paymentModeData?.map((item){
        selectPaymentModeList?.add(item.fundName ?? '');
      }).toList();

      log("Response: ${response.data}");
      log("Response: $selectPaymentModeList");

      _isLoading = false;
      update();
    } catch (e, s) {
      log('Error: ', error: e, stackTrace: s);
      _isLoading = false;
      _hasError = true;
      update();
    }
  }

  // =/@ Serve Type Model
  // List<ServeTypeData>? serveTypeData;
  // List<String>? selectServeTypeList;
  //
  // String selectServeTypeData = "Select One";
  // int selectServeTypeDataIndex = -1;
  //
  // Future getServeTypeList() async {
  //   try {
  //     _isLoading = true;
  //     _hasError = false;
  //     update();
  //
  //     final response = await repository.getServeTypeList();
  //
  //     // ServeTypeData = [];
  //     // ServeTypeData?.addAll(response.data ?? []);
  //     //
  //     // selectServeTypeList = [];
  //     // ServeTypeData?.map((item){
  //     //   selectServeTypeList?.add(item.waiterName ?? '');
  //     // }).toList();
  //     //
  //     // log("Response: ${response.data}");
  //     // log("Response: $selectServeTypeList");
  //
  //     _isLoading = false;
  //     update();
  //   } catch (e, s) {
  //     log('Error: ', error: e, stackTrace: s);
  //     _isLoading = false;
  //     _hasError = true;
  //     update();
  //   }
  // }

  // =/@ Waiter Model
  List<WaiterData>? waiterData;
  List<String>? selectWaiterList;

  String selectWaiterData = "Select Waiter";
  int selectWaiterDataIndex = -1;

  Future getWaiterList() async {
    try {
      _isLoading = true;
      _hasError = false;
      update();

      final response = await repository.getWaiterList();

      // Initialize the data list
      waiterData = [];
      waiterData?.addAll(response.data ?? []);

      selectWaiterList = [];
      waiterData?.map((item){
        selectWaiterList?.add(item.waiterName ?? '');
      }).toList();

      log("Response: ${response.data}");
      log("Response: $selectWaiterList");

      _isLoading = false;
      update();
    } catch (e, s) {
      log('Error: ', error: e, stackTrace: s);
      _isLoading = false;
      _hasError = true;
      update();
    }
  }


  /// Sales Model
  SalesModel? salesModel;
  Future reqSalesModel({
    required String? tokenNo,
  }) async {
    try {
      final response = await repository.reqSalesModel(
        tokenNo: tokenNo,
      );
      salesModel = response;
      update();
    } catch (e, s) {
      log('Error: ', error: e, stackTrace: s);
    }
  }

  // /// Sales Model
  // SalesModel? salesModel;
  // Future reqSalesModel({
  //   required String? customerMobile,
  //   required String? customerOccupation,
  //   required String? currentInvoicePoint,
  //   required String? totalGiftPoint,
  //   required String? pointAmountUse,
  //   required String? grandAmount,
  //   required String? discountAmount,
  //   required String? flatDiscountAmount,
  //   required String? percentageDiscountAmount,
  //   required String? vatAmount,
  //   required String? payableAmount,
  //   required String? paidAmount,
  //   required String? changeAmount,
  //   required String? note,
  //   required String? totalQty,
  //   required String? tokenNo,
  //   required String? orderType,
  //   required String? paymentMethod,
  //   required String? waiterId,
  //   required String? categoryName,
  //   required String? productId,
  //   required String? productName,
  //   required String? qty,
  //   required String? price,
  //   required String? vat,
  // }) async {
  //   try {
  //     final response = await repository.reqSalesModel(
  //       customerMobile: customerMobile,
  //       customerOccupation: customerOccupation,
  //       currentInvoicePoint: currentInvoicePoint,
  //       totalGiftPoint: totalGiftPoint,
  //       pointAmountUse: pointAmountUse,
  //       grandAmount: grandAmount,
  //       discountAmount: discountAmount,
  //       flatDiscountAmount: flatDiscountAmount,
  //       percentageDiscountAmount: percentageDiscountAmount,
  //       vatAmount: vatAmount,
  //       payableAmount: payableAmount,
  //       paidAmount: paidAmount,
  //       changeAmount: changeAmount,
  //       note: note,
  //       totalQty: totalQty,
  //       tokenNo: tokenNo,
  //       orderType: orderType,
  //       paymentMethod: paymentMethod,
  //       waiterId: waiterId,
  //       categoryName: categoryName,
  //       productId: productId,
  //       productName: productName,
  //       qty: qty,
  //       price: price,
  //       vat: vat,
  //     );
  //     salesModel = response;
  //     update();
  //   } catch (e, s) {
  //     log('Error: ', error: e, stackTrace: s);
  //   }
  // }
}
