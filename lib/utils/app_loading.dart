import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AppLoading{
  //show loading
  static void showLoading([String? message]) {
    Get.dialog(
      barrierDismissible: false,
      Dialog(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const CircularProgressIndicator(),
              const SizedBox(height: 8),
              Text(message ?? 'Loading...'),
            ],
          ),
        ),
      ),
    );
  }

  //hide loading
  static void hideLoading() {
    if (Get.isDialogOpen!) Get.back();
  }
}