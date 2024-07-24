class LoginRequestModel {
  String emailOrPhone;
  String password;

  LoginRequestModel({
    required this.emailOrPhone,
    required this.password,
  });

  factory LoginRequestModel.zero() => LoginRequestModel(
        emailOrPhone: "",
        password: "",
      );

  Map<String , dynamic> toJson()=>{

    isEmailValid(emailOrPhone)? "email":"phone":emailOrPhone,
    "password":password,
  };

  bool isEmailValid(String email) {
    const regex = r'^[\w-]+(\.[\w-]+)*@([\w-]+\.)+[a-zA-Z]{2,7}$';

    final emailRegExp = RegExp(regex);

    return emailRegExp.hasMatch(email);
  }
}
