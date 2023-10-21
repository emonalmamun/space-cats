import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:space_cats_test/features/home_page/binding/home_binding.dart';
import 'package:space_cats_test/features/home_page/view/home_page.dart';
import 'package:space_cats_test/utils/app_binding.dart';
import 'package:space_cats_test/utils/app_storage.dart';

import 'features/login_page/binding/login_binding.dart';
import 'features/login_page/view/login_page.dart';
import 'features/signup_page/binding/signup_binding.dart';
import 'features/signup_page/view/signup_page.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await GetStorage.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      initialBinding: AppBinding(),
      initialRoute: '/',
      getPages: [
        GetPage(name: '/', page: ()=> LoginPage()),
        GetPage(name: '/login_page', page: () => LoginPage(), binding: LoginBinding(), transition: Transition.noTransition),
        GetPage(name: '/home_page', page: () => HomePage(), binding: HomeBinding(), transition: Transition.noTransition),
        GetPage(name: '/signup_page', page: () => SignupPage(), binding: SignupBinding(), transition: Transition.noTransition),
        //GetPage(name: '/profile_page', page: () => ProfilePage(), binding: ProfileBinding(), transition: Transition.noTransition,),
      ]
    );
  }
}
