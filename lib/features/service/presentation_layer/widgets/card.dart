import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test/common/const/constant.dart';
import 'package:test/common/extensions/widget_extensions.dart';
import 'package:test/common/widgets/text.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class CardWidget extends StatelessWidget {
  const CardWidget({
    super.key,
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
                      "title",
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
                  const Row(
                    children: [
                      CircleAvatar(),
                      SizedBox(
                        width: 30,
                      ),
                      TextWidget("Name"),
                    ],
                  ).paddingSymmetric(horizontal: 20, vertical: 10),
                  Column(
                    children: [
                      // Container(
                      //   alignment: Alignment.center,
                      //   width: 75,
                      //   height: 75,
                      //   decoration: BoxDecoration(
                      //     color: AppColors.primeColor,
                      //     shape: BoxShape.circle,
                      //   ),
                      //   child: TextWidget(
                      //     (cardModel.avgRating / 2).toString(),
                      //     size: 24,
                      //     color: Colors.white,
                      //   ),
                      // ),
                      RatingBar.builder(
                        itemSize: 15,
                        initialRating: 1,
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
          // RoutingManager.to(RouteName.cardDetails, arguments: cardModel);
        }),
      ),
    );
  }
}
