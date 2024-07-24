import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test/common/extensions/widget_extensions.dart';
import 'package:test/features/service/presentation_layer/widgets/app_bar.dart';
import 'package:test/features/service/presentation_layer/widgets/card.dart';

class ServiceScreen extends StatelessWidget {
  const ServiceScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWidget(),
      backgroundColor: Colors.white,
      body: Container(
        width: Get.width,
        height: Get.height,
        child: ListView.builder(
          itemCount: 10,
          itemBuilder: (BuildContext context , index){
          return CardWidget();
        }),
      ),
    ).makeSafeArea();
  }
}