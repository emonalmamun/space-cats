import 'dart:convert';
import 'package:get/get.dart';

import '../../../utils/app_snackbar.dart';
import '../../../utils/app_storage.dart';

class HomeController extends GetxController{
  final employeeEnum = EmployeeEnum.attendance.obs;
  final selectedStatus = 'Attendance'.obs;
  final isLoading = false.obs;
  final isInTime = false.obs;
  final isOutTime = false.obs;

  final inTime = ''.obs;
  final outTime = ''.obs;

  @override
  void onInit() {
    //getCurrentAttend();
    super.onInit();
  }

  // void getCurrentAttend()async{
  //   var response = await HomeService.currentAttendSvc("${getBox.read('EmpId')}");
  //
  //   try{
  //
  //     var jsonDecoded = json.decode(response.body);
  //     //debugPrint("jsonDecoded : ${jsonDecoded.toString()}");
  //     //debugPrint("JsonDecodedMessage : ${jsonDecoded['Message']}");
  //
  //
  //     if(response.statusCode == 200){
  //       CurrentAttendModel currentAttendModel = currentAttendModelFromJson(response.body);
  //       inTime.value = currentAttendModel.items![0].attendTime.toString();
  //       outTime.value = currentAttendModel.items![1].attendTime.toString();
  //     }else{
  //       AppSnackBar.warningSnackBar("${jsonDecoded['Message']}");
  //     }
  //
  //   }on Exception catch(e){
  //     //isLoading.value = false;
  //     print("======HomeController======Exception================$e");
  //     AppSnackBar.warningSnackBar("$e");
  //   }
  // }
}

enum EmployeeEnum { attendance, leave, checkInOut }