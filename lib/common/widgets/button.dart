
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test/common/const/constant.dart';
import 'package:test/common/extensions/widget_extensions.dart';
import 'package:test/common/widgets/loader.dart';
import 'package:test/common/widgets/text.dart';


class ButtonWidget extends StatelessWidget {
  final VoidCallback onTap;
  final String title;
  final Color? color;
  final double? width;
  final Color? textColor;
  final bool? isLoading;
  final double? height;

  const ButtonWidget({
    super.key,
    required this.onTap,
    required this.title,
    this.color,
    this.width,
    this.textColor,
    this.isLoading = false,
    this.height,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      width: width ?? Get.width,
      height: height ?? 45,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        color: color ?? AppColors.primeColor,
        boxShadow: 
             [
                BoxShadow(
                  offset: const Offset(0, 2),
                  blurRadius: 2,
                  spreadRadius: 0,
                  color: Colors.black.withOpacity(0.2),
                ),
              ]
            
      ),
      child: !isLoading!
          ? TextWidget(
              title,
              color: textColor ?? Colors.white,
            )
          : Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextWidget(
                  title,
                  color: textColor ?? Colors.white,
                ),
                
                const SizedBox(
                  width: 10,
                ),
                const LoaderWidget(
                  color: Colors.white,
                  width: 20,
                  height: 20,
                ),
                // .expanded(4),
              ],
            ),
    ).onTap(onTap);
  }
}
