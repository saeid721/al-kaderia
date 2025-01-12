import 'dart:developer';

import '../../../../domain/server/http_client/api_helper.dart';
import '../../../../domain/server/http_client/app_config.dart';
import '../../../../domain/server/http_client/request_handler.dart';
import '../model/category_model.dart';
import '../model/category_product_model.dart';
import '../model/payment_mode_model.dart';
import '../model/sales_model.dart';
import '../model/waiter_model.dart';

class SalesReportRepository extends ApiHelper {

  Future<CategoryModel> getCategoryList() async {
    return CategoryModel.fromJson(await requestHandler.get(AppConfig.categoryModelUrl.url));
  }

  Future<CategoryProductModel> getCategoryProductList({required String categoryId}) async {
    return CategoryProductModel.fromJson(await requestHandler.get("${AppConfig.categoryProductModelUrl.url}/$categoryId"));
  }

  Future<PaymentModeModel> getPaymentModeList() async {
    return PaymentModeModel.fromJson(await requestHandler.get(AppConfig.paymentModeUrl.url));
  }

  // Future<ServeTypeModel> getServeTypeList() async {
  //   return ServeTypeModel.fromJson(await requestHandler.get(AppConfig.serveTypeUrl.url));
  // }

  Future<WaiterModel> getWaiterList() async {
    return WaiterModel.fromJson(await requestHandler.get(AppConfig.waiterUrl.url));
  }


  ///  Sales Model
  Future<SalesModel> reqSalesModel({
    required String? tokenNo,
  }) async{
    try{
      Map<String, dynamic> params = {};
      params['token_no'] = tokenNo;


      final response = await requestHandler.post(AppConfig.salesModelUrl.url, params);

      // log('Response StatusCode: ${response}');
      // log('Response StatusCode: ${response}');

      if (response == 201) {
        return SalesModel.fromJson(response);
      } else {
        throw RequestException(
          url: AppConfig.salesModelUrl.url,
          method: '#POST',
          // res: response,
          data: params,
          error: response['message'],
          message: response['message'],
          trace: StackTrace.current,
        );
      }
    } catch (e, s) {
      log('Error: ', error: e, stackTrace: s);
      rethrow;
    }

  }


  // ///  Sales Model
  // Future<SalesModel> reqSalesModel({
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
  // }) async{
  //   try{
  //     Map<String, dynamic> params = {};
  //     params['customer_mobile'] = customerMobile;
  //     params['customer_occupation'] = customerOccupation;
  //     params['current_invoice_point'] = currentInvoicePoint;
  //     params['total_gift_point'] = totalGiftPoint;
  //     params['point_amount_use'] = pointAmountUse;
  //     params['grand_amount'] = grandAmount;
  //     params['discount_amount'] = discountAmount;
  //     params['flat_discount_amount'] = flatDiscountAmount;
  //     params['percentage_discount_amount'] = percentageDiscountAmount;
  //     params['vat_amount'] = vatAmount;
  //     params['payable_amount'] = payableAmount;
  //     params['paid_amount'] = paidAmount;
  //     params['change_amount'] = changeAmount;
  //     params['note'] = note;
  //     params['total_qty'] = totalQty;
  //     params['token_no'] = tokenNo;
  //     params['order_type'] = orderType;
  //     params['payment_method'] = paymentMethod;
  //     params['waiter_id'] = waiterId;
  //     params['product_cart[0][category_name]'] = categoryName;
  //     params['product_cart[0][product_id]'] = productId;
  //     params['product_cart[0][product_name]'] = productName;
  //     params['product_cart[0][qty]'] = qty;
  //     params['product_cart[0][price]'] = price;
  //     params['product_cart[0][vat]'] = vat;
  //     log('Params: $params');
  //
  //     final response = await requestHandler.post(AppConfig.salesModelUrl.url, params);
  //     if(response.statusCode == 200){
  //       return SalesModel.fromJson(response.data);
  //     } else{
  //       throw RequestException(
  //         url: AppConfig.salesModelUrl.url,
  //         method: '#POST',
  //         res: response,
  //         data: params,
  //         error: response.data['message'],
  //         message: response.data['message'],
  //         trace: StackTrace.current,
  //       );
  //     }
  //
  //   } catch(e, s){
  //     log('Error: ', error: e, stackTrace: s);
  //     rethrow;
  //   }
  // }
}
