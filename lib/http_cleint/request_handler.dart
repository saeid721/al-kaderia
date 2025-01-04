import 'dart:developer' show log;
import 'package:get/get.dart' hide Response hide FormData;
import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../getit_locator.dart';
import '../preferences/prefs_keys.dart';
import '../preferences/shared_prefs.dart';
import 'api_check.dart';
import 'app_config.dart';


class RequestHandler extends GetxController {
  RequestHandler({
    required Dio dio,
    required SharedPreferences prefs,
  })  : _dio = dio,
        _sharedPrefs = prefs;

  final mainUrl = AppConfig.base.url;

  final Dio _dio;
  Dio get dio => _dio;
  final SharedPreferences _sharedPrefs;
  SharedPreferences get shredPrefs => _sharedPrefs;

  void _initialize() {
    // Load token from shared preferences on startup
    final currentToken = locator<MyPrefs>().gettString(key: PrefsKeys.userToken);
    if (currentToken != null) {
      _updateDioHeaders(token: currentToken);
    } else{
      log("Token Not Found!! $currentToken");
    }
  }

  void _updateDioHeaders({required String token}) {
    dio.options.headers['Authorization'] = 'Bearer $token';
    dio.options.headers['Connection'] = 'keep-alive';
  }

  Future<void> updateHeader({required String token}) async {
    locator<MyPrefs>().settString(key: PrefsKeys.userToken, value: token);
    final currentToken = locator<MyPrefs>().gettString(key: PrefsKeys.userToken);

    log("#UpdatedHeader: \$TOKEN => $currentToken");
    _updateDioHeaders(token: currentToken.toString());
  }

  // updateHeader({required String token}) async {
  //   locator<MyPrefs>().settString(key: PrefsKeys.userToken, value: token);
  //   final currentToken = locator<MyPrefs>().gettString(key: PrefsKeys.userToken);
  //
  //   log("#UpdatedHeader: \$TOKEN => $currentToken");
  //   dio.options.headers['Authorization'] = 'Bearer $currentToken';
  //   dio.options.headers['Connection'] = 'keep-alive';
  // }

  Future<Response> post(
      String url,
      dynamic params, {
        String? errorMsg,
        String? baseUrl,
        Options? options,
        Map<String, dynamic>? queryParams,
      }) async {
    log("==/@ Url: ${mainUrl + url}");
    log(dio.options.headers.toString());
    //log(dio.options.headers.toString());

    final formData = FormData.fromMap(params);

    log('Params: $params');
    log(" =========== @ END @ ====== ");

    try {
      final response = await dio.post(
          baseUrl ?? mainUrl + url,
          data: formData,
          queryParameters: queryParams,
          options: options
      );

      log('==/@ Response StatusCode: ${response.statusCode}');
      log('==/@ Response Data: ${response.data}');

      ApiChecker.checkApi(response);
      return response;
    } on DioException catch (error, stackTrace) {
      throw RequestException(
        method: "/POST",
        url: baseUrl ?? mainUrl + url,
        data: params,
        error: error,
        msg: errorMsg,
        trace: stackTrace,
        res: error.response,
        statusCode: error.response?.statusCode,
      );
    } catch (error, stackTrace) {
      throw RequestException(
        method: "/POST",
        url: baseUrl ?? mainUrl + url,
        msg: errorMsg,
        data: params,
        error: error,
        trace: stackTrace,
      );
    }
  }

  Future<Response> delete(
      String url,
      dynamic params, {
        String? errorMsg,
        String? baseUrl,
        Options? options,
        Map<String, dynamic>? queryParams,
      }) async {
    log("==/@ Url: ${mainUrl + url}");
    log(dio.options.headers.toString());
    //log(dio.options.headers.toString());
    log(" =========== @ END @ ====== ");

    final formData = FormData.fromMap(params);

    try {
      final response = await dio.delete(
          baseUrl ?? mainUrl + url,
          data: formData,
          queryParameters: queryParams,
          options: options
      );

      log('==/@ Response StatusCode: ${response.statusCode}');
      log('==/@ Response Data: ${response.data}');

      ApiChecker.checkApi(response);
      return response;
    } on DioException catch (error, stackTrace) {
      throw RequestException(
        method: "/DELETE",
        url: baseUrl ?? mainUrl + url,
        data: params,
        error: error,
        msg: errorMsg,
        trace: stackTrace,
        res: error.response,
        statusCode: error.response?.statusCode,
      );
    } catch (error, stackTrace) {
      throw RequestException(
        method: "/DELETE",
        url: baseUrl ?? mainUrl + url,
        msg: errorMsg,
        data: params,
        error: error,
        trace: stackTrace,
      );
    }
  }

  // Future<Response> delete(
  //     String url,
  //     Map<String, dynamic> params, {
  //       bool tokenNeeded = true,
  //       String? errorMsg,
  //       String? baseUrl,
  //       Options? options,
  //       Map<String, dynamic>? queryParams,
  //     }) async {
  //   Response response;
  //   try {
  //     if (tokenNeeded && refreshToken) await attemptReLogin();
  //
  //     response = await dio.delete(
  //       baseUrl ?? mainUrl + url,
  //       data: params,
  //       queryParameters: queryParams,
  //       options: options,
  //     );
  //     return response;
  //   } on DioError catch (error, stracktrace) {
  //     throw RequestException(
  //       method: "/DELETE",
  //       url: baseUrl ?? mainUrl + url,
  //       data: params,
  //       error: error,
  //       msg: errorMsg,
  //       trace: stracktrace,
  //       res: error.response,
  //       statusCode: error.response?.statusCode,
  //     );
  //   } catch (error, stracktrace) {
  //     throw RequestException(
  //       method: "/DELETE",
  //       url: baseUrl ?? mainUrl + url,
  //       msg: errorMsg,
  //       data: params,
  //       error: error,
  //       trace: stracktrace,
  //     );
  //   }
  // }

  Future<Response> get(
      String url, {
        String? errorMsg,
        String? baseUrl,
        Options? options,
        Map<String, dynamic>? queryParams,
      }) async {
    _initialize();
    log("==/@ Url: ${mainUrl + url}");
    log(dio.options.headers.toString());

    log(" =========== @ END @ ====== ");
    try {
      final response = await dio.get(
        baseUrl ?? mainUrl + url,
        options: options,
        queryParameters: queryParams,
      );

      log('==/@ Response StatusCode: ${response.statusCode}');
      log('==/@ Response Data: ${response.data}');

      return response;
    } on DioException catch (error, stackTrace) {
      throw RequestException(
        method: "/GET",
        url: baseUrl ?? mainUrl + url,
        error: error,
        msg: errorMsg,
        trace: stackTrace,
        res: error.response,
        statusCode: error.response?.statusCode,
      );
    } catch (error, stackTrace) {
      throw RequestException(
        method: "/GET",
        url: baseUrl ?? mainUrl + url,
        msg: errorMsg,
        error: error,
        trace: stackTrace,
      );
    }
  }

  Future put(
      String url,
      Map<String, dynamic> params, {
        String? errorMsg,
        String? baseUrl,
        Options? options,
        Map<String, dynamic>? queryParams,
      }) async {
    log("url ${mainUrl + url}");
    //log(dio.options.headers.toString());
    //log(dio.options.headers.toString());
    log(" =========== @ END @ ====== ");
    Response response;
    try {
      response = await dio.put(
        baseUrl ?? mainUrl + url,
        data: params,
        queryParameters: queryParams,
        options: options,
      );
      return response.data;
    } on DioException catch (error, stackTrace) {
      return RequestException(
        method: "/PUT",
        url: baseUrl ?? mainUrl + url,
        data: params,
        error: error,
        msg: errorMsg,
        trace: stackTrace,
        res: error.response,
        statusCode: error.response?.statusCode,
      );
    } catch (error, stackTrace) {
      return RequestException(
        method: "/PUT",
        url: baseUrl ?? mainUrl + url,
        msg: errorMsg,
        data: params,
        error: error,
        trace: stackTrace,
      );
    }
  }

}

class RequestException implements Exception {
  String url;
  String? msg;
  Object error;
  String method;
  Response? res;
  int? statusCode;
  StackTrace trace;
  dynamic data;

  RequestException({
    this.msg,
    this.res,
    this.data,
    this.statusCode,
    required this.url,
    required this.method,
    required this.error,
    required this.trace,
  }) {
    ApiChecker.checkApi(res!);
    log(
      """
==/@
    Method: "$method"
    StatusCode: $statusCode
    Url: "$url
    ErrorMsg: "$msg"
    Data: ${data.toString()}
    Response: $res
==/@
""",
      name: "#RequestException",
      time: DateTime.now(),
      error: error,
      stackTrace: trace,
    );
  }
}

