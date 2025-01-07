
import 'dart:developer';

import '../../../../domain/server/http_client/api_helper.dart';
import '../../../../domain/server/http_client/app_config.dart';
import '../model/login_model.dart';

class AuthRepository extends ApiHelper {

  Future<LogInModel> reqLogIn({
    required String email,
    required String password,
  }) async {
    Map<String, dynamic> params = {};
    params['email'] = email;
    params['password'] = password;

    final response =  await requestHandler.post(AppConfig.logInUrl.url, params);
    requestHandler.updateHeader(token: response['data']['token']);
    //log("Token 1: ${response['data']['token']}");

    return LogInModel.fromJson(response);
  }

}
