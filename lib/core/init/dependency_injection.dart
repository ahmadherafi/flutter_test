
import 'package:get/get.dart';
import 'package:test/features/auth/business_logic_layer/auth_controller.dart';
import 'package:test/features/service/business_logic_layer/service_controller.dart';



class DependencyInjection {
  static void injectDependencies() {
    Get.put(AuthController());
    Get.put(ServiceController());
   
  }
}
