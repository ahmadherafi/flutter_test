import 'dart:ffi';

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

class RegisterScreen extends StatelessWidget {
  AuthController authController = Get.find<AuthController>();
  RegisterScreen({super.key});
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const TextWidget("Create Account").paddingSymmetric(vertical: 0),
            Column(
              // mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Stack(
                  alignment: Alignment.bottomCenter,
                  children: [
                    Obx(() {
                      return CircleAvatar(
                        radius: 50,
                        backgroundImage: authController.registerModel.value.image == null
                            ? const AssetImage("assets/images/download.png")
                            : FileImage(authController.registerModel.value.image!) as ImageProvider,
                      ).center();
                    }),
                    Form(
                      key: _formKey,
                      child: const Column(
                        // mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Icon(Icons.folder_open),
                        ],
                      ),
                    )
                  ],
                ).onTap(() {
                  authController.pickImage();
                }).paddingOnly(bottom: 20),
                TextFieldWidget(
                  onChange: (value) {
                    authController.registerModel.value.name = value;
                  },
                  keyboardType: TextInputType.emailAddress,
                  hint: "Name",
                  validate: (value) {
                    if (value == null || value.isEmpty) {
                      return "The name is required";
                    }
                    return null;
                  },
                ),
                TextFieldWidget(
                  onChange: (value) {
                    authController.registerModel.value.phone = value;
                  },
                  keyboardType: TextInputType.emailAddress,
                  hint: "Phone",
                  validate: (value) {
                    if (value == null || value.isEmpty) {
                      return "The phone is required";
                    }
                    return null;
                  },
                ),
                TextFieldWidget(
                  onChange: (value) {
                    authController.registerModel.value.email = value;
                  },
                  keyboardType: TextInputType.emailAddress,
                  hint: "Email",
                  validate: (value) {
                    if (value == null || value.isEmpty) {
                      return "The email is required";
                    }
                    return null;
                  },
                ),
                TextFieldWidget(
                  onChange: (value) {
                    authController.registerModel.value.password = value;
                  },
                  keyboardType: TextInputType.emailAddress,
                  hint: "Password",
                  obscure: true,
                  validate: (value) {
                    if (value == null || value.isEmpty) {
                      return "The password is required";
                    }
                    if (value.length < 8) {
                      return "password is short";
                    }
                    return null;
                  },
                ),
                TextFieldWidget(
                  onChange: (value) {
                    authController.registerModel.value.passwordConfirm = value;
                  },
                  keyboardType: TextInputType.emailAddress,
                  hint: "Password confirmation",
                  obscure: true,
                  validate: (value) {
                    if (value == null || value.isEmpty) {
                      return "Confirm Password is required".tr;
                    }
                    if (value != authController.registerModel.value.password) {
                      return "Password did't identical".tr;
                    }
                    return null;
                  },
                ),
              ],
            ).paddingOnly(top: 40).center(),
            SizedBox(
              width: Get.width,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Obx(() {
                    return ButtonWidget(
                      isLoading: authController.registerState.loading,
                      onTap: () {
                        if (_formKey.currentState!.validate()) {
                          authController.register(
                            onSuccess: (p0) {
                              RoutingManager.offAll(RouteName.service);
                            },
                            onError: (p0) {
                              Snackbar.error(p0.toString());
                            },
                          );
                        }
                      },
                      title: "Create Account",
                      height: 50,
                    ).paddingOnly(bottom: 20);
                  }),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      TextWidget(
                        "Do you have account? ",
                        color: AppColors.borderColor,
                        size: 14,
                      ),
                      const TextWidget(
                        "Log in",
                        fontWeight: FontWeight.bold,
                      ).onTap(() {
                        RoutingManager.offAll(RouteName.login);
                      })
                    ],
                  ),
                ],
              ),
            ).paddingOnly(top: 10),
          ],
        ).paddingSymmetric(horizontal: 20).paddingOnly(top: 30),
      ),
    ).makeSafeArea();
  }
}
