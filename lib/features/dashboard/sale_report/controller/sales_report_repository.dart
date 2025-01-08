import '../../../../domain/server/http_client/api_helper.dart';
import '../../../../domain/server/http_client/app_config.dart';
import '../model/category_model.dart';
import '../model/category_product_model.dart';
import '../model/payment_mode_model.dart';
import '../model/waiter_model.dart';

class SalesReportRepository extends ApiHelper {

  Future<PaymentModeModel> getPaymentModeList() async {
    return PaymentModeModel.fromJson(await requestHandler.get(AppConfig.paymentModeUrl.url));
  }

  Future<CategoryModel> getCategoryList() async {
    return CategoryModel.fromJson(await requestHandler.get(AppConfig.categoryModelUrl.url));
  }

  Future<CategoryProductModel> getCategoryProductList() async {
    return CategoryProductModel.fromJson(await requestHandler.get(AppConfig.categoryProductModelUrl.url));
  }

  Future<WaiterModel> getWaiterList() async {
    return WaiterModel.fromJson(await requestHandler.get(AppConfig.waiterUrl.url));
  }

}
