import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test/common/const/constant.dart';
import 'package:test/common/extensions/widget_extensions.dart';
import 'package:test/common/widgets/button.dart';
import 'package:test/common/widgets/text.dart';
import 'package:test/common/widgets/textfield.dart';
import 'package:test/core/routing/routing_manager.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

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
                    const CircleAvatar(
                      radius: 50,
                      backgroundImage: AssetImage("assets/images/download.png"),
                    ).center(),
                    const Column(
                      // mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Icon(Icons.folder_open),
                      ],
                    )
                  ],
                ).paddingOnly(bottom: 20),
                TextFieldWidget(
                  onChange: (value) {},
                  keyboardType: TextInputType.emailAddress,
                  hint: "Name",
                  validate: (value) {
                    return null;
                  },
                ),
                TextFieldWidget(
                  onChange: (value) {},
                  keyboardType: TextInputType.emailAddress,
                  hint: "Phone",
                  validate: (value) {
                    return null;
                  },
                ),
                TextFieldWidget(
                  onChange: (value) {},
                  keyboardType: TextInputType.emailAddress,
                  hint: "Email",
                  validate: (value) {
                    return null;
                  },
                ),
                TextFieldWidget(
                  onChange: (value) {},
                  keyboardType: TextInputType.emailAddress,
                  hint: "Password",
                  validate: (value) {
                    return null;
                  },
                ),
                TextFieldWidget(
                  onChange: (value) {},
                  keyboardType: TextInputType.emailAddress,
                  hint: "Password confirmation",
                  validate: (value) {
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
                  ButtonWidget(
                    onTap: () {
                      RoutingManager.offAll(RouteName.service);
                    },
                    title: "Create Account",
                    height: 50,
                  ).paddingOnly(bottom: 20),
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
