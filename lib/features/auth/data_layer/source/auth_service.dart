import 'package:test/core/api/apis.dart';
import 'package:test/core/network/http.dart';
import 'package:test/features/auth/data_layer/models/login_request.dart';
import 'package:test/features/auth/data_layer/models/login_response.dart';
import 'package:test/features/auth/data_layer/models/register.dart';

class AuthService {
  Future<LoginResponseModel> login(LoginRequestModel loginRequestModel) async {
    Request request = Request(
      EndPoint.login,
      RequestMethod.post,
      body: loginRequestModel.toJson(),
    );

    Map<String , dynamic> response = await request.sendRequest();

    return LoginResponseModel.fromJson(response);
  }
 Future<LoginResponseModel> register(RegisterModel registerModel) async {
    Request request = Request(
      EndPoint.register,
      RequestMethod.post,
      body: registerModel.toJson(),
      isFormData: true
    );

    Map<String , dynamic> response = await request.sendRequest();

    return LoginResponseModel.fromJson(response);
  }
  
}
