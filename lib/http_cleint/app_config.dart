
import '../getit_locator.dart';
import '../global/constants/enum.dart';
import '../preferences/prefs_keys.dart';
import '../preferences/shared_prefs.dart';

enum AppConfig {
  base,
  baseImage,
  superUrl,
  logInUrl,
  logOutUrl,
  registration1Url,
  registration2Url,
  registration3Url,
  packageUrl,
  superShopCategoryUrl,
  superSubScribePackageUrl,

  // =======================/@ Super Shop Panel @/=====================


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
        _baseUrl = "https://swadhinpos.com";
        // _baseUrl = "https://multipos.softwaresale.xyz";
        _baseImageUrl = "https://swadhinpos.com/super_shop";
        // _baseImageUrl = "https://multipos.softwaresale.xyz/super_shop";

        break;
      case UrlLink.isLocalServer:
      // set up your local server ip address.
        _baseUrl = "http://multi_pos.test/super_shop/";
        break;
    }
  }

  // static String superUrl = "/super_shop";
  static String superUrl = "/${locator<MyPrefs>().gettString(key: PrefsKeys.shopCategoryUrl)}";
  static String? shopCategoryUrl = "/${locator<MyPrefs>().gettString(key: PrefsKeys.shopCategoryUrl)}";

  String get url {
    switch (this) {
      case AppConfig.base:
        return _baseUrl;
      case AppConfig.baseImage:
        return _baseImageUrl;

        /// ==/@ Auth Api Url @/==
      case AppConfig.registration1Url:
        return '/api/user/register_step1';
      case AppConfig.registration2Url:
        return '/api/user/register_step2';
      case AppConfig.registration3Url:
        return '/api/user/register_step3';
      case AppConfig.logInUrl:
        return '/api/user/login';
      case AppConfig.logOutUrl:
        return '/api/user/logout';
      case AppConfig.packageUrl:
        return '/api/user/packages';
      case AppConfig.superShopCategoryUrl:
        return '/api/user/categories';
      case AppConfig.superSubScribePackageUrl:
        return '/api/user/subscription_package';

      default:
    }
    return "";
  }
}
