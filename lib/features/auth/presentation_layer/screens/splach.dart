import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/utils.dart';
import 'package:test/common/widgets/text.dart';
import 'package:test/features/auth/business_logic_layer/auth_controller.dart';

class SplashScreen extends StatelessWidget {
  AuthController authController = Get.find<AuthController>();
   SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Future.delayed(Duration(seconds: 1), (){
      authController.checkToken();
    });
    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        width: Get.width,
        height: Get.height,

        child: TextWidget("Loading ...",fontWeight: FontWeight.bold,),
      ),
    );
  }
}