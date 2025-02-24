import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test/common/const/constant.dart';
import 'package:test/common/extensions/widget_extensions.dart';
import 'package:test/common/widgets/button.dart';
import 'package:test/common/widgets/text.dart';
import 'package:test/common/widgets/textfield.dart';
import 'package:test/common/widgets/toast.dart';
import 'package:test/core/routing/routing_manager.dart';
import 'package:test/features/auth/business_logic_layer/auth_controller.dart';

class LoginScreen extends StatelessWidget {
  AuthController authController = Get.find<AuthController>();
  LoginScreen({super.key});
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Form(
        key: _formKey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const TextWidget("Welcome Back").paddingSymmetric(vertical: 10),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextFieldWidget(
                  onChange: (value) {
                    authController.loginRequestModel.emailOrPhone = value;
                  },
                  keyboardType: TextInputType.emailAddress,
                  hint: "Email or Phone",
                  validate: (value) {
                    if (value == null || value.isEmpty) {
                      return "The Field is required";
                    }

                    return null;
                  },
                ),
                TextFieldWidget(
                  onChange: (value) {
                    authController.loginRequestModel.password = value;
                  },
                  keyboardType: TextInputType.emailAddress,
                  obscure: true,
                  hint: "Password",
                  validate: (value) {
                    if (value == null || value.isEmpty) {
                      return "The password is required";
                    }
                    if (value.length < 8) {
                      return "password is short";
                    }
                    return null;
                  },
                ).paddingSymmetric(vertical: 10),
              ],
            ).center().expanded(2),
            SizedBox(
              width: Get.width,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Obx(() {
                    return ButtonWidget(
                      isLoading: authController.loginState.loading,
                      onTap: () {
                        if (_formKey.currentState!.validate()) {
                          authController.login(
                            onSuccess: (p0) {
                              RoutingManager.offAll(RouteName.service);
                            },
                            onError: (p0) {
                              Snackbar.error(p0.toString());
                            },
                          );
                        }
                      },
                      title: "Login",
                      height: 50,
                      // width: Get.width * .9,
                    ).center();
                  }),
                  const TextWidget(
                    "Forget password",
                    size: 14,
                  ).paddingSymmetric(vertical: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      TextWidget(
                        "If you are new user you can   ",
                        color: AppColors.borderColor,
                        size: 14,
                      ),
                      const TextWidget(
                        "Create account",
                        fontWeight: FontWeight.bold,
                        size: 14,
                      ).onTap(() {
                        RoutingManager.to(RouteName.register);
                      })
                    ],
                  ),
                ],
              ),
            ).expanded(2),
          ],
        ).paddingSymmetric(horizontal: 20).paddingOnly(top: 30),
      ),
    ).makeSafeArea();
  }
}
