import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AppSnackBar{
  static void warningSnackBar(String messageText){
    Get.snackbar(
      "Warning",
      "Password not match",
      titleText: const SizedBox(),
      //messageText: const Text("Password not match!"),
      messageText: Text(messageText),
      snackPosition: SnackPosition.BOTTOM,
      isDismissible: true,
      borderRadius: 5,
      //padding: EdgeInsets.symmetric(horizontal: 10),
      margin: const EdgeInsets.only(left: 10,right: 10, bottom: 10),
      icon: const Icon(Icons.warning_amber_rounded, color: Colors.red,),
      dismissDirection: DismissDirection.horizontal,
      showProgressIndicator: false,
      leftBarIndicatorColor: Colors.red,
      duration: const Duration(seconds: 3),
    );
  }

  static SnackBar snackBar({required String msg}){
    return SnackBar(
      content: Text(msg),
    );
  }

  // static const snackBar = SnackBar(
  //   content: Text('Yay! A SnackBar!'),
  // );
}