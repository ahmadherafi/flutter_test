import 'package:get/get.dart';
import 'package:test/features/auth/presentation_layer/screens/login.dart';
import 'package:test/features/auth/presentation_layer/screens/register.dart';
import 'package:test/features/auth/presentation_layer/screens/splach.dart';
import 'package:test/features/service/presentation_layer/screens/service.dart';
import 'package:test/features/service/presentation_layer/screens/service_details.dart';


class RouteName {
  static String splash = '/splash';
  static String login = '/login';
  static String register = '/register';
  static String service = '/service';
  static String cardDetails = '/card-details';

}

class RoutingManager {
  static List<GetPage<dynamic>> pages = [
    GetPage(
      name: RouteName.splash,
      page: () =>  SplashScreen(),
    ),
    GetPage(
      name: RouteName.login,
      page: () =>  LoginScreen(),
    ),
     GetPage(
      name: RouteName.register,
      page: () =>  RegisterScreen(),
    ),
      GetPage(
      name: RouteName.service,
      page: () =>  ServiceScreen(),
      middlewares: [ServiceMiddleware()]
    ),
    GetPage(
      name: RouteName.cardDetails,
      page: () =>  CardDetailsScreen(),
    ),
  
  ];

  static void to(String route, {dynamic arguments}) {
    Get.toNamed(route, arguments: arguments);
  }

  static void off(String route) {
    Get.offNamed(route);
  }

  static void offAll(String route, {dynamic arguments}) {
    Get.offAllNamed(route, arguments: arguments);
  }

  static void back() {
    Get.back();
  }
}
