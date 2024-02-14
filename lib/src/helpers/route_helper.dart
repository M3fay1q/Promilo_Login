import 'package:get/get.dart';
import 'package:promilo_development_task/src/view/description_screen/description_screen.dart';
import 'package:promilo_development_task/src/view/home/home_screen.dart';
import 'package:promilo_development_task/src/view/login_screen/login_screen.dart';

import 'app_routes.dart';

class RouteHelper {
  static List<GetPage> getAllPages() {
    return [
      // GetPage(
      //   name: AppRoutes.splash,
      //   page: () => SplashScreen(),
      // ),
      GetPage(
        name: AppRoutes.login,
        page: () => LoginScreen(),
      ),
      GetPage(
        name: AppRoutes.home,
        page: () => HomeScreen(),
      ),
      GetPage(
        name: AppRoutes.description,
        page: () => DescriptionScreen(),
      ),
    ];
  }
}
