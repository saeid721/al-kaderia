import 'dart:developer';
import 'package:get/get.dart';
import '../model/category_model.dart';
import '../model/category_product_model.dart';
import '../model/payment_mode_model.dart';
import '../model/serve_type_model.dart';
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


  double? subTotalAmount;
  double? totalAmount;
  String? lessAmount;
  String? paymentVaiName;

  Future<void> calculationDataClear() async {
    subTotalAmount = null;
    totalAmount = null;
    lessAmount = null;
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

  String selectWaiterData = "Select One";
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


}
