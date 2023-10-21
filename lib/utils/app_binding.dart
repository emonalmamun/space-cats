import 'package:get/get.dart';
import 'package:space_cats_test/features/home_page/controller/home_controller.dart';
import '../features/login_page/controller/login_controller.dart';
import '../features/profile_page/controller/profile_controller.dart';
import 'app_connectivity_controller.dart';

class AppBinding extends Bindings{
  @override
  void dependencies() {
    Get.put(AppConnectivityController());
    Get.put(LoginController());
    Get.put(HomeController());
    Get.put(ProfileController());
  }

}