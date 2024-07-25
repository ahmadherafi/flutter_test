import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Snackbar {
  static void error(
    String message, {
    Color? color,
  }) {
    Get.snackbar(
      "",
      message,
      backgroundColor: color,
    );
  }
}
