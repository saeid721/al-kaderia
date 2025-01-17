
import '../../../getit_locator.dart';
import '../../../global/constants/enum.dart';
import '../../../preferences/prefs_keys.dart';
import '../../../preferences/shared_prefs.dart';

enum AppConfig {
  base,
  baseImage,
  logInUrl,
  paymentModeUrl,
  categoryModelUrl,
  categoryProductModelUrl,
  serveTypeUrl,
  waiterUrl,
  salesModelUrl,

  // =======================/@ Al-Kaderia Panel @/=====================

}

extension AppUrlExtention on AppConfig {
  static String _baseUrl = "";
  static String _baseImageUrl = "";

  static void setUrl(UrlLink urlLink) {
    switch (urlLink) {
      case UrlLink.isLive:
        _baseUrl = "";
        _baseImageUrl = "";
        break;
      case UrlLink.isDev:
        _baseUrl = "https://testpos.alkaderialtd.com";
        _baseImageUrl = "https://testpos.alkaderialtd.com";

        break;
      case UrlLink.isLocalServer:
      // set up your local server ip address.
        _baseUrl = "https://testpos.alkaderialtd.com";
        break;
    }
  }

  static String superUrl = "/${locator<MyPrefs>().gettString(key: PrefsKeys.shopCategoryUrl)}";
  static String? shopCategoryUrl = "/${locator<MyPrefs>().gettString(key: PrefsKeys.shopCategoryUrl)}";

  String get url {
    switch (this) {
      case AppConfig.base:
        return _baseUrl;
      case AppConfig.baseImage:
        return _baseImageUrl;

    /// ==/@ Auth Api Url @/==
      case AppConfig.logInUrl:
        return '/Api/SalesApi/login';
      case AppConfig.paymentModeUrl:
        return '/Api/SalesApi/fund';
      case AppConfig.categoryModelUrl:
        return '/Api/SalesApi/category';
      case AppConfig.categoryProductModelUrl:
        return '/Api/SalesApi/products';
      case AppConfig.serveTypeUrl:
        return '/Api/SalesApi/types';
      case AppConfig.waiterUrl:
        return '/Api/SalesApi/waiter';
      case AppConfig.salesModelUrl:
        return '/Api/SalesApi/save_to_my_sales';

      default:
    }
    return "";
  }
}
