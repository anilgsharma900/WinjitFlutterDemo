import 'package:get/get.dart';
import 'package:winjit_lutter_emo/dashboard/applicaiton/bindings/home_binding.dart';
import 'package:winjit_lutter_emo/dashboard/applicaiton/bindings/login_binding.dart';
import 'package:winjit_lutter_emo/dashboard/presentation/home_page.dart';
import 'package:winjit_lutter_emo/login/login_page.dart';
import 'package:winjit_lutter_emo/splash/splash_page.dart';

import 'app_routes.dart';

class AppPages {
  static final String InitalPage = AppRoutes.splash;
  static final List<GetPage> routePages = [
    GetPage(
      name: AppRoutes.splash,
      page: () => SplashPage(),
    ),
    GetPage(
        name: AppRoutes.login,
        page: () => LoginPage(),
        binding: LoginBinding()),
    GetPage(
        name: AppRoutes.home, page: () => HomePage(), binding: HomeBinding()),
  ];
}
