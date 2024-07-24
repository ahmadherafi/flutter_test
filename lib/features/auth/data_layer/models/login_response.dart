class LoginResponseModel {
  String token;
  LoginResponseModel({
    required this.token,
  });

  factory LoginResponseModel.zero() => LoginResponseModel(token: "");

  factory LoginResponseModel.fromJson(Map<String, dynamic> json) => LoginResponseModel(
        token: json["access_token"],
      );


}
