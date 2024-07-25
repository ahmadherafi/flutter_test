import 'package:get/get.dart';
import 'package:test/core/local_storage/local_source.dart';
import 'package:test/core/routing/routing_manager.dart';
import 'package:test/core/utils/utils.dart';
import 'package:test/features/auth/data_layer/models/login_request.dart';
import 'package:test/features/auth/data_layer/models/login_response.dart';
import 'package:test/features/auth/data_layer/models/register.dart';
import 'package:test/features/auth/data_layer/source/auth_service.dart';
import 'package:rx_future/rx_future.dart';

class AuthController extends GetxController {
  AuthService authService = AuthService();
// models
  LoginRequestModel loginRequestModel = LoginRequestModel.zero();

  RxFuture<LoginResponseModel> loginState = RxFuture(LoginResponseModel.zero());

  Future<void> login({void Function(LoginResponseModel)? onSuccess , void Function(Object)? onError}) async {
    await loginState.observe(
      (p0) async {
        return authService.login(loginRequestModel);
      },
      onSuccess: (p0) {
        onSuccess?.call(p0);
      LocalStorage().saveToken(p0.token);
      
      },
      onError: (p0) {
        onError?.call(p0);
      },
    );
  }
   RxFuture<LoginResponseModel> registerState = RxFuture(LoginResponseModel.zero());
  Rx< RegisterModel> registerModel = RegisterModel.zero().obs;

  Future<void> register({void Function(LoginResponseModel)? onSuccess , void Function(Object)? onError}) async {
    await loginState.observe(
      (p0) async {
        return authService.register(registerModel.value);
      },
      onSuccess: (p0) {
        onSuccess?.call(p0);
      LocalStorage().saveToken(p0.token);
      
      },
      onError: (p0) {
        onError?.call(p0);
      },
    );
  }

   Future<void> pickImage() async {
    registerModel.value.image = await Utils.pickImage();
    registerModel.update((val) {});
  }

  Future<void> checkToken()async{

    if(LocalStorage().getToken==null){
      RoutingManager.offAll(RouteName.login);
    }
    else{
      RoutingManager.offAll(RouteName.service);
    }
  }
}
