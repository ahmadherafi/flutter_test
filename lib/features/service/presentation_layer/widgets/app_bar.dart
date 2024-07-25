import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:test/common/const/constant.dart';
import 'package:test/common/extensions/widget_extensions.dart';
import 'package:test/features/service/business_logic_layer/service_controller.dart';

class AppBarWidget extends StatelessWidget implements PreferredSizeWidget {
  ServiceController serviceController = Get.find<ServiceController>();

  @override
  // TODO: implement preferredSize
  Size get preferredSize => const Size.fromHeight(100);
   AppBarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 190,
      color: AppColors.primeColor,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
         
          Container(
            padding: const EdgeInsets.only(top: 3),
            width: Get.width * .9,
            height: 50,
            child: TextFormField(
              // controller: controller,
              textInputAction: TextInputAction.search,
              onFieldSubmitted:
                  (value) {
                    serviceController.getServices(name: value);
                  },
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
