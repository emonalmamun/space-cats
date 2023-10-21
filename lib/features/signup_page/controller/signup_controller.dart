import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:space_cats_test/features/signup_page/service/signup_service.dart';

import '../../../utils/app_base_url.dart';
import '../../../utils/app_loading.dart';
import '../../../utils/app_snackbar.dart';

class SignupController extends GetxController{
  final isLoading = false.obs;
  final isPasswordHidden = true.obs;
  final isConPasswordHidden = true.obs;
  final selectedDate = DateTime.now().obs;
  final selectedOption = "Male".obs;
  final imageName = ''.obs;
  late ImagePicker _picker;

  File? pickedImage;

  @override
  void onInit() {
    _picker = ImagePicker();
    super.onInit();
  }


  final name = TextEditingController();
  final email = TextEditingController();
  final countryCode = TextEditingController();
  final phone = TextEditingController();

  //final gender = TextEditingController();
  //final dob = TextEditingController();

  final divisionId = TextEditingController();
  final districtId = TextEditingController();
  final address = TextEditingController();
  final password = TextEditingController();
  final confirmPassword = TextEditingController();

  final macAddress = "00-B0-D0-63-C2-26"; // will be collect from device now it is Static

  final profilePhoto = TextEditingController();

  Future<String?> obtainImage(ImageSource source) async {
    final file = await _picker.pickImage(source: source);
    imageName.value = file!.name;

    final tempImage = File(file.path);
    pickedImage = tempImage;

    return file?.path;
  }

  Future<String> uploadImage(pickedImage) async {

    var request = http.MultipartRequest('POST', Uri.parse("${AppBaseUrl.apiBaseUrl}/api/user/signup"));
    //request.headers.addAll({'Authorization': 'Bearer ' + token});
    request.fields['name'] = name.toString();


    //request.files.add(await http.MultipartFile.fromPath('image', pickedImage));
    request.files.add(http.MultipartFile.fromBytes('profile_photo', File(pickedImage).readAsBytesSync(),filename: imageName.value));
    var res = await request.send();

    var response = await http.Response.fromStream(res);
    final responseData = json.decode(response.body);

    if(res.statusCode == 200){
      Get.snackbar("Image upload", "Success!");
      //box.write('image', Constants.apiBaseUrl+"/"+responseData['data']['image']);
      //box.write('image', pickedImage);
      //updateImage(Constants.apiBaseUrl+"/"+responseData['data']['image']);

      //print(_userImage.toString());
      //print(box.read('image'));

    }else{
      Get.snackbar("Image upload", "Error!");
      //print("Error");
      //box.write('image', pickedImage);
    }

    //print("StatueCode ${res.statusCode}");
    //print("StatueCode ${res.reasonPhrase.toString()}");

    //print("====================uploadImage Called======================");

    return res.reasonPhrase.toString();
  }

  void signupBtn()async{
    //isLoading.value = true;
    List<int> imageBytes = pickedImage!.readAsBytesSync();
    String base64Image = base64Encode(imageBytes);

    AppLoading.showLoading();
    var response = await SignupService.signupSvc(
        name.text, email.text, countryCode.text, phone.text, selectedOption.value, selectedDate.value.toIso8601String(),
        divisionId.text, districtId.text, address.text, password.text, macAddress, base64Image
    );

    try{

      var jsonDecoded = json.decode(response.body);
      debugPrint("jsonDecoded : ${jsonDecoded.toString()}");
      debugPrint("JsonDecodedMessage : ${jsonDecoded['message']}");


      if(response.statusCode == 200){
        AppLoading.hideLoading();
        AppSnackBar.snackBar(msg: "Signup Success");
        Get.offAllNamed('/login_page');

      }else{
        AppLoading.hideLoading();
        AppSnackBar.warningSnackBar("${jsonDecoded['message']}");
      }

    }on Exception catch(e){
      AppLoading.hideLoading();
      AppSnackBar.warningSnackBar("$e");
    }
  }


  testPrint(){
    print("Email: ${email.text}");
    print("password: ${password.text}");
    print("confirmPassword: ${confirmPassword.text}");
    print("dob: $selectedDate");
    print("mac: $macAddress");
    print("mac: $pickedImage");
    print("pickedImage: $pickedImage");
    print("maleORfemale: ${selectedOption.value}");

    //List<int> imageBytes = pickedImage!.readAsBytesSync();
    //print("imageBytes : $imageBytes");
    //String base64Image = base64Encode(imageBytes);
    //print("base64Image: $base64Image");
  }
}