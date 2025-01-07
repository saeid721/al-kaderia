import 'dart:developer';
import 'package:get/get.dart';
import '../model/payment_mode_model.dart';
import 'sales_report_repository.dart';

class SalesReportController extends GetxController implements GetxService {
  static SalesReportController get current => Get.find();
  final SalesReportRepository repository = SalesReportRepository();

  bool _isLoading = false;

  bool get isLoading => _isLoading;

  bool _hasError = false;

  bool get hasError => _hasError;

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


}
