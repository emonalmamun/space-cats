import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../utils/app_loading.dart';
import '../../../utils/app_snackbar.dart';
import '../../../utils/app_storage.dart';
import '../model/login_model.dart';
import '../service/login_service.dart';

class LoginController extends GetxController{
  late Data user;
  final isLoading = false.obs;
  final isPasswordHidden = true.obs;


  final phoneTxtController = TextEditingController(text: "1671720228");
  final passwordTxtController = TextEditingController(text: "12345678");
  final macTxtController = "00-B0-D0-63-C2-26"; /// mac address will be return form device currently provide Static


  void loginBtn()async{
    //isLoading.value = true;

    AppLoading.showLoading();
    var response = await LoginService.loginSvc(phoneTxtController.text, passwordTxtController.text, macTxtController);

    try{

      var jsonDecoded = json.decode(response.body);
      debugPrint("jsonDecoded : ${jsonDecoded.toString()}");
      debugPrint("JsonDecodedMessage : ${jsonDecoded['message']}");


      if(response.statusCode == 200){
        //isLoading.value = false;
        AppLoading.hideLoading();
        LoginModel loginModel = loginModelFromJson(response.body);
         user = loginModel.user;
        Authorisation token = loginModel.authorisation;

        print(user.name);
        print(user.email);
        print(user.phone);
        print(token.token);

        getBox.write("name", user.name.toString());
        getBox.write("profilePhoto", user.profilePhoto.toString());
        getBox.write("token", token.token.toString());

        Get.offAllNamed('/home_page');

      }else{
        AppLoading.hideLoading();
        AppSnackBar.warningSnackBar("${jsonDecoded['message']}");
      }

    }on Exception catch(e){
      //isLoading.value = false;
      AppLoading.hideLoading();
      //print("======LoginController======Exception================$e");
      AppSnackBar.warningSnackBar("$e");
    }
  }

  // void printData(){
  //   debugPrint("Username : ${usernameTxtController.text}");
  //   debugPrint("Password : ${passwordTxtController.text}");
  // }
}