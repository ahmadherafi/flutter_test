import 'dart:io';

import 'package:dio/dio.dart';

class RegisterModel {
  String name;
  String phone;
  String email;
  String password;
  String passwordConfirm;
  File? image;

  RegisterModel({
    required this.name,
    required this.phone,
    required this.email,
    required this.password,
    required this.passwordConfirm,
    this.image,
  });

  factory RegisterModel.zero() => RegisterModel(
        name: "",
        phone: "",
        email: "",
        password: "",
        passwordConfirm: "",
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "phone": phone,
        "email": email,
        "password": password,
        "password_confirmation": passwordConfirm,
        if (image != null) "image": MultipartFile.fromFileSync(image!.path),
      };
}
