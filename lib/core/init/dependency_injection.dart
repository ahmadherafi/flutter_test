
import 'package:get/get.dart';
import 'package:test/features/auth/business_logic_layer/auth_controller.dart';



class DependencyInjection {
  static void injectDependencies() {
    Get.put(AuthController());
   
  }
}
