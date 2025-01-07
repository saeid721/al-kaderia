import 'dart:developer';
import 'package:get/get.dart';
import '../../../../domain/local/preferences/local_storage.dart';
import '../../../../domain/local/preferences/local_storage_keys.dart';
import '../../../../getit_locator.dart';
import '../../dashboard/dashboard_screen.dart';
import '../model/login_model.dart';
import 'auth_repository.dart';

class AuthController extends GetxController implements GetxService {
  static AuthController get current => Get.find();
  final AuthRepository repository = AuthRepository();

  bool _isLoading = false;

  bool get isLoading => _isLoading;

  bool _hasError = false;

  bool get hasError => _hasError;

  // =/@ LogIn Method
  LogInModel? logInModel;

  Future logIn({
    required String email,
    required String password,
  }) async {
    try {
      _isLoading = true;
      _hasError = false;
      update();

      final response = await repository.reqLogIn(email: email, password: password);

      if (response.success == 200) {
        logInModel = response;
        // locator<LocalStorage>().setString(key: StorageKeys.accessToken, value: logInModel?.token?.toString() ?? '');
        Get.offAll(() => const DashboardScreen());
      }
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
