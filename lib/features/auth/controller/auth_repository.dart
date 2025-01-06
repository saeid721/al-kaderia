
import '../../../../domain/server/http_client/api_helper.dart';
import '../../../../domain/server/http_client/app_config.dart';
import '../model/login_model.dart';

class AuthRepository extends ApiHelper {

  Future<LogInModel> reqLogIn({
    required String phone,
    required String password,
  }) async {
    Map<String, dynamic> params = {};
    params['mobile_number'] = phone;
    params['password'] = password;

    final response = await requestHandler.post(AppConfig.logInUrl.url, params);
    requestHandler.updateHeader(token: response['token']);
    return LogInModel.fromJson(response);
  }

}
