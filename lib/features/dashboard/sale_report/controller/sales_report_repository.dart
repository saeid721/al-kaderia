import '../../../../domain/server/http_client/api_helper.dart';
import '../../../../domain/server/http_client/app_config.dart';
import '../model/category_model.dart';
import '../model/payment_mode_model.dart';

class SalesReportRepository extends ApiHelper {

  Future<PaymentModeModel> getPaymentModeList() async {
    return PaymentModeModel.fromJson(await requestHandler.get(AppConfig.paymentModeUrl.url));
  }

  Future<CategoryModel> getCategoryList() async {
    return CategoryModel.fromJson(await requestHandler.get(AppConfig.categoryModelUrl.url));
  }

}
