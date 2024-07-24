import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:test/common/const/constant.dart';
import 'package:test/common/extensions/widget_extensions.dart';

class AppBarWidget extends StatelessWidget implements PreferredSizeWidget {
  // TextEditingController? textEditingController;
  @override
  // TODO: implement preferredSize
  Size get preferredSize => const Size.fromHeight(100);
  const AppBarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 190,
      color: AppColors.primeColor,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Row(
                children: [
                  // CircleAvatarWidget(
                  //   radius: 20,
                  //   isUserAvatar: true,
                  // // ).paddingSymmetric(horizontal: 10),
                  // Obx(() {
                  //   return BoldTextWidget(
                  //     "${homeController.user.value?.firstName}"
                  //     " "
                  //     "${homeController.user.value?.lastName}",
                  //     color: AppColors.textColor,
                  //   ).paddingSymmetric(horizontal: 5);
                  // })
                ],
              ).onTap(() {
                // homeController.onPress(3);
              }),
              // Row(
              //   children: [
              //     SvgPicture.asset("assets/icons/notification.svg").onTap(() {
              //       RoutingManager.to(RouteName.notification);
              //     }),
              //   ],
              // ).paddingSymmetric(horizontal: 10)
            ],
          ).paddingSymmetric(horizontal: 10, vertical: 10),
          Container(
            padding: const EdgeInsets.only(top: 3),
            width: Get.width * .9,
            height: 50,
            child: TextFormField(
              // controller: controller,
              textInputAction: TextInputAction.search,
              // onFieldSubmitted: onFieldSubmitted ??
              //     (value) {
              //       if (Get.currentRoute != RoutesName.search) {
              //         RoutingManager.to(RoutesName.search);
              //         controller!.clear();
              //         FocusManager.instance.primaryFocus
              //             ?.unfocus(disposition: UnfocusDisposition.scope);
              //         return;
              //       }

              //       searchController.search();
              //     },
              cursorColor: AppColors.primeColor,

              style: const TextStyle(
                height: 1.6,
              ),
              onChanged: (value) {},
              keyboardType: TextInputType.text,

              decoration: InputDecoration(
                  fillColor: Colors.white,
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: AppColors.borderColor),
                    borderRadius: BorderRadius.circular(44),
                  ),
                  disabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: AppColors.borderColor),
                    borderRadius: BorderRadius.circular(44),
                  ),
                  isDense: true,
                  filled: true,
                  prefixIcon: IconButton(onPressed: () {}, icon: const Icon(Icons.search)),
                  contentPadding: const EdgeInsets.symmetric(horizontal: 10),
                  hintText: 'search',
                  hintStyle: const TextStyle(fontSize: 14),
                  border: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: AppColors.borderColor,
                    ),
                    borderRadius: BorderRadius.circular(44),
                  )),
            ),
          )
        ],
      ),
    );
  }
}
