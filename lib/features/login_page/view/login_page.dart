import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../utils/app_colors.dart';
import '../../../utils/app_snackbar.dart';
import '../controller/login_controller.dart';
class LoginPage extends StatelessWidget {
  final loginController = Get.find<LoginController>();
  /*const*/ LoginPage({Key? key}) : super(key: key);

  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //appBar: _appBar(),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _inputValidation(context)
              ],
            ),
          ),
        ),
      ),
    );
  }

  _inputValidation(BuildContext context){
    return Column(
      children: [
        SizedBox(
          width: MediaQuery.of(context).size.width-20,
          height: 200,
          child: const Icon(Icons.verified_user_outlined,size: 150, color: AppColors.primaryColor,),
          //child: Image.asset('assets/icons/splash_screen.png',fit: BoxFit.contain,),
        ),
        const SizedBox(height: 20,),
        //Input fields
        Form(
          key: formKey,
          child: Column(
            children: [
              //phone number
              TextFormField(
                keyboardType: TextInputType.number,
                maxLength: 10,
                autocorrect: false,
                autofocus: false,
                controller: loginController.phoneTxtController,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Required';
                  }
                  return null;
                },
                decoration: const InputDecoration(
                    suffixIcon: Icon(Icons.phone),
                    labelText: 'Username',
                    hintText: "1xxxxxxxxx",
                    border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(10)))),
              ),
              const SizedBox(height: 20,),
              //Password
              Obx((){
                return TextFormField(
                  obscureText: loginController.isPasswordHidden.value,
                  keyboardType: TextInputType.text,
                  autocorrect: false,
                  autofocus: false,
                  controller: loginController.passwordTxtController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Required';
                    } else if (value.length < 5) {
                      return 'Too short';
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                      suffixIcon: IconButton(
                        onPressed: (){
                          loginController.isPasswordHidden.toggle();
                        },
                        icon: Icon(loginController.isPasswordHidden.value? Icons.lock_outline : Icons.lock_open_outlined),
                      ),
                      labelText: 'Password',
                      border: const OutlineInputBorder(
                          borderRadius:
                          BorderRadius.all(Radius.circular(10)))),
                );
              }),
              // Row(
              //   mainAxisAlignment: MainAxisAlignment.end,
              //   children: [
              //     TextButton(
              //         onPressed: (){
              //           debugPrint("Forget Password");
              //           Get.toNamed('/forget_pass_page');
              //         },
              //         child: const Text("Forget Password ?", style: TextStyle(color: AppColors.primaryRed),),
              //     ),
              //   ],
              // ),
            ],
          ),
        ),
        const SizedBox(height: 20,),
        //login btn
        InkWell(
          child: Container(
            height: 60,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: AppColors.primaryColor
            ),
            child: Obx((){
              return loginController.isLoading.value ?
              const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CircularProgressIndicator(color: Colors.white,),
                ],
              )
                  :
              const Center(child: Text("Login", style: TextStyle(color: Colors.white,fontWeight: FontWeight.w600,fontSize: 18,letterSpacing: 3)));
            }),

          ),
          onTap: (){
            if (formKey.currentState!.validate()) {
              if(loginController.phoneTxtController.text.length < 10){
                AppSnackBar.warningSnackBar("Less than 10 digit is not allowed");
              }else{
                loginController.loginBtn();
              }
            }
          },
        ),
        //const SizedBox(height: 5,),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            const Text("Don't have an account ?"),
            TextButton(
                onPressed: (){
                  debugPrint("SignUp");
                  Get.toNamed('/signup_page');
                },
                child: const Text("Signup", style: TextStyle(fontWeight: FontWeight.bold, letterSpacing: 1),)
            )
          ],
        ),
      ],
    );
  }
}
