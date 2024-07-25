import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test/common/const/constant.dart';
import 'package:test/common/extensions/widget_extensions.dart';
import 'package:test/common/widgets/loader.dart';
import 'package:test/features/service/business_logic_layer/service_controller.dart';
import 'package:test/features/service/presentation_layer/widgets/app_bar.dart';
import 'package:test/features/service/presentation_layer/widgets/card.dart';
class ServiceMiddleware extends GetMiddleware {
  ServiceController serviceController = Get.find<ServiceController>();

  @override
  GetPageBuilder? onPageBuildStart(GetPageBuilder? page) {
     if(serviceController.servicesState.result.isFirstPage){
      serviceController.getServices();
     }
    return super.onPageBuildStart(page);
  }
}

class ServiceScreen extends StatelessWidget {
    ServiceController serviceController = Get.find<ServiceController>();

   ServiceScreen({super.key});
   ScrollController scrollController = ScrollController();
     void moreData() {
    scrollController.addListener(() {
      if (scrollController.position.atEdge && scrollController.offset != 0) {
        serviceController.getServices();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    moreData();
    return Scaffold(
      appBar: AppBarWidget(),
      backgroundColor: Colors.white,
      body: Obx(
         () {
          return serviceController.servicesState.loading&&serviceController.servicesState.result.isFirstPage?
          LoaderWidget(color: AppColors.primeColor,).center():
           Container(
            width: Get.width,
            height: Get.height,
            child: ListView.builder(
              controller: scrollController,
              itemCount: serviceController.servicesState.result.data.length,
              itemBuilder: (BuildContext context , index){
              return CardWidget(
                serviceModel:serviceController.servicesState.result.data[index] ,
              );
            }),
          );
        }
      ),
    ).makeSafeArea();
  }
}