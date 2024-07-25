import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test/common/const/constant.dart';
import 'package:test/common/extensions/widget_extensions.dart';
import 'package:test/common/widgets/text.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:test/core/routing/routing_manager.dart';
import 'package:test/features/service/business_logic_layer/service_controller.dart';
import 'package:test/features/service/data_layer/models/service.dart';

class CardWidget extends StatelessWidget {
  ServiceController serviceController = Get.find<ServiceController>();
final  ServiceModel serviceModel;
   CardWidget({
    super.key,
    required this.serviceModel,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: Get.width,
      height: 175,
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(4),
        ),
        width: Get.width,
        height: 150,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              decoration: BoxDecoration(
                color: AppColors.primeColor,
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(4),
                  topRight: Radius.circular(4),
                ),
              ),
              width: Get.width,
              height: 35,
              child: SizedBox(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    TextWidget(
                      serviceModel.title,
                      size: 12,
                      color: AppColors.borderColor,
                    ).paddingSymmetric(horizontal: 10),
                    const Row(
                      children: [
                        SizedBox(
                          width: 8.5,
                        ),
                      ],
                    ),
                  ],
                ).paddingSymmetric(horizontal: 12),
              ),
            ),
            Container(
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: const BorderRadius.only(
                    bottomLeft: Radius.circular(4),
                    bottomRight: Radius.circular(4),
                  ),
                  border: Border.all(color: AppColors.primeColor)),
              width: Get.width,
              height: 120,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                   Row(
                    children: [
                      CircleAvatar(
                        backgroundImage: NetworkImage(serviceModel.image),
                      ),
                      SizedBox(
                        width: 30,
                      ),
                      TextWidget(serviceModel.name),
                    ],
                  ).paddingSymmetric(horizontal: 20, vertical: 10),
                  Column(
                    children: [
      
                      RatingBar.builder(
                        itemSize: 15,
                        initialRating: serviceModel.rate.toDouble(),
                        minRating: 1,
                        direction: Axis.horizontal,
                        allowHalfRating: true,
                        itemCount: 5,
                        itemPadding: const EdgeInsets.symmetric(horizontal: 2),
                        itemBuilder: (context, _) => Icon(
                          Icons.star,
                          color: AppColors.primeColor,
                        ),
                        onRatingUpdate: (rating) {
                          print(rating);
                        },
                        ignoreGestures: true,
                      ).center()
                    ],
                  ).center().paddingSymmetric(horizontal: 10).paddingSymmetric(horizontal: 10, vertical: 10)

                  // const Divider(
                  //   color: Colors.grey,
                  //   thickness: 1,
                  // ).paddingSymmetric(horizontal: 18),
                ],
              ),
            ),
          ],
        ).onTap(() {

          RoutingManager.to(RouteName.cardDetails);
            serviceController.showService(serviceModel.id);
          // RoutingManager.to(RouteName.cardDetails, arguments: cardModel);
        }),
      ),
    );
  }
}
