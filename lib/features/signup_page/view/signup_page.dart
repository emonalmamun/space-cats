
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';

import '../../../utils/app_colors.dart';
import '../../../utils/app_snackbar.dart';
import '../../global_widgets/image_widget.dart';
import '../../global_widgets/input_field.dart';
import '../controller/signup_controller.dart';

class SignupPage extends StatelessWidget {
  final signupController = Get.find<SignupController>();
  SignupPage({Key? key}) : super(key: key);

  final _formKey = GlobalKey<FormState>();



  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: _appBar(),
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

  _appBar(){
    return AppBar(
      title: const Text("Signup new account", style: TextStyle(color: AppColors.primaryColor),),
      centerTitle: false,
      elevation: 0,
      backgroundColor: Colors.transparent,
      iconTheme: const IconThemeData(
          color: AppColors.primaryColor
      ),
    );
  }

  _inputValidation(BuildContext context){
    return Column(
      children: [

        const SizedBox(
          //width: MediaQuery.of(context).size.width-20,
          //height: 100,
          child: Icon(Icons.verified_user_outlined,size: 150, color: AppColors.primaryColor,),
          //child: Image.asset('assets/icons/host_logo.png',fit: BoxFit.contain,),
        ),
        const SizedBox(height: 10,),
        //Input fields
        Form(
          key: _formKey,
          child: Column(
            children: [

              //Name
              TextFormField(
                keyboardType: TextInputType.text,
                autocorrect: false,
                autofocus: false,
                controller: signupController.name,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'required';
                  }
                  return null;
                },
                decoration: const InputDecoration(
                    //suffixIcon: Icon(Icons.account_balance_rounded),
                    labelText: 'Name',
                    border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(10)))),
              ),

              const SizedBox(height: 10,),

              //Email
              TextFormField(
                //obscureText: loginController.isOldPassHidden.value,
                keyboardType: TextInputType.emailAddress,
                autocorrect: false,
                autofocus: false,
                controller: signupController.email,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'required';
                  } else if (!value.isEmail) {
                    return 'Invalid email';
                  }
                  return null;
                },
                decoration: const InputDecoration(
                  //suffixIcon: Icon(Icons.alternate_email),
                    labelText: 'Email',
                    border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(10)))),
              ),

              const SizedBox(height: 10,),

              //Country code
              TextFormField(
                //maxLength: 11,
                keyboardType: TextInputType.phone,
                autocorrect: false,
                autofocus: false,
                controller: signupController.countryCode,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'required';
                  }
                  return null;
                },
                decoration: const InputDecoration(
                    //suffixIcon: Icon(Icons.phone_android_rounded),
                    labelText: 'Country code',
                    border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(10)))),
              ),

              const SizedBox(height: 10,),

              //Phone
              TextFormField(
                maxLength: 10,
                keyboardType: TextInputType.phone,
                autocorrect: false,
                autofocus: false,
                controller: signupController.phone,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'required';
                  }
                  return null;
                },
                decoration: const InputDecoration(
                    //suffixIcon: Icon(Icons.account_circle),
                    labelText: 'Phone',
                    border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(10)))),
              ),

              //const SizedBox(height: 10,),


              //Dob
              Obx((){
                return MyInputField(title: "Date", hint: DateFormat.yMMMMd().format(signupController.selectedDate.value), widget: IconButton(
                    onPressed: (){
                      _getDateFromUser(context);
                    },
                    icon: const Icon(Icons.calendar_today_outlined,color: Colors.grey,),
                  ),
                );
              },),

              const SizedBox(height: 10,),

              //photo
              Obx((){
                return MyInputField(title: "Photo",hint: signupController.imageName.value, widget: IconButton(
                  onPressed: (){
                    //_getDateFromUser(context);
                    showDialog(
                      context: context,
                      builder: (context) => imagePickAlert(
                        onCameraPressed: () async {
                          final imgPath = await signupController.obtainImage(ImageSource.camera);
                          if (imgPath == null) return;
                          Navigator.of(Get.context!).pop();
                          //processImage(imgPath);
                          print("=============$imgPath");
                        },
                        onGalleryPressed: () async {
                          final imgPath = await signupController.obtainImage(ImageSource.gallery);
                          if (imgPath == null) return;
                          Navigator.of(Get.context!).pop();
                          //processImage(imgPath);
                          print("=============$imgPath");
                        },
                      ),
                    );
                  },
                  icon: const Icon(Icons.photo,color: Colors.grey,),
                ),
                );
              },),

              const SizedBox(height: 10,),

              //Division
              TextFormField(
                keyboardType: TextInputType.number,
                autocorrect: false,
                autofocus: false,
                controller: signupController.divisionId,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'required';
                  }
                  return null;
                },
                decoration: const InputDecoration(
                  //suffixIcon: Icon(Icons.account_box),
                    labelText: 'Division id',
                    border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(10)))),
              ),

              const SizedBox(height: 10,),

              TextFormField(
                keyboardType: TextInputType.number,
                autocorrect: false,
                autofocus: false,
                controller: signupController.districtId,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'required';
                  }
                  return null;
                },
                decoration: const InputDecoration(
                  //suffixIcon: Icon(Icons.account_box),
                    labelText: 'District id',
                    border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(10)))),
              ),

              //address
              const SizedBox(height: 10,),

              TextFormField(
                keyboardType: TextInputType.text,
                autocorrect: false,
                autofocus: false,
                controller: signupController.address,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'required';
                  }
                  return null;
                },
                decoration: const InputDecoration(
                  //suffixIcon: Icon(Icons.account_box),
                    labelText: 'Address',
                    border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(10)))),
              ),

              const SizedBox(height: 10,),
              //Password
              Obx((){
                return TextFormField(
                  obscureText: signupController.isPasswordHidden.value,
                  keyboardType: TextInputType.text,
                  autocorrect: false,
                  autofocus: false,
                  controller: signupController.password,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'required';
                    } else if (value.length < 5) {
                      return 'too short';
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                      suffixIcon: IconButton(
                        onPressed: (){
                          signupController.isPasswordHidden.toggle();
                        },
                        icon: Icon(signupController.isPasswordHidden.value? Icons.lock_outline : Icons.lock_open_outlined),
                      ),
                      labelText: 'Password',
                      border: const OutlineInputBorder(
                          borderRadius:
                          BorderRadius.all(Radius.circular(10)))),
                );
              }),

              const SizedBox(height: 10,),
              //Confirm Password
              Obx((){
                return TextFormField(
                  obscureText: signupController.isConPasswordHidden.value,
                  keyboardType: TextInputType.text,
                  autocorrect: false,
                  autofocus: false,
                  controller: signupController.confirmPassword,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'required';
                    } else if (value.length < 5) {
                      return 'too short';
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                      suffixIcon: IconButton(
                        onPressed: (){
                          signupController.isConPasswordHidden.toggle();
                        },
                        icon: Icon(signupController.isConPasswordHidden.value? Icons.lock_outline : Icons.lock_open_outlined),
                      ),
                      labelText: 'Confirm password',
                      border: const OutlineInputBorder(
                          borderRadius:
                          BorderRadius.all(Radius.circular(10)))),
                );
              }),
            ],
          ),
        ),

        // Gender
        Obx((){
          return Container(
            width: double.maxFinite,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Radio(
                  value: "Male",
                  groupValue: signupController.selectedOption.value,
                  onChanged: (value) {
                    signupController.selectedOption.value = value!;
                  },
                ),
                const Text("Male"),
                const SizedBox(width: 20,),
                Radio(
                  value: "Female",
                  groupValue: signupController.selectedOption.value,
                  onChanged: (value) {
                    signupController.selectedOption.value = value!;
                  },
                ),
                const Text("Female"),
              ],
            ),
          );
        }),

        const SizedBox(height: 10,),

        //Signup btn
        InkWell(
          child: Container(
            height: 60,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: AppColors.primaryColor
            ),
            child: Obx((){
              return signupController.isLoading.value ?
              const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CircularProgressIndicator(color: Colors.white,),
                ],
              )
                  :
              const Center(child: Text("Signup", style: TextStyle(color: Colors.white,fontWeight: FontWeight.w600,fontSize: 18,letterSpacing: 3)));
            }),
          ),
          onTap: (){
            //signupController.testPrint();
            if (_formKey.currentState!.validate()) {
              if(signupController.password.text == signupController.confirmPassword.text){
                debugPrint("Signup()");
                signupController.signupBtn();
              }else{
                debugPrint("Password not match");
                AppSnackBar.warningSnackBar("Password not match!");
              }

            }
          },
        ),
        //const SizedBox(height: 5,),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            const Text("Already have an account ?"),
            TextButton(
                onPressed: (){
                  debugPrint("Login");
                  Get.toNamed('/login_page');
                },
                child: const Text("Login.",style: TextStyle(fontWeight: FontWeight.bold,letterSpacing: 1),)
            )
          ],
        ),

      ],
    );
  }

  _getDateFromUser(BuildContext context)async{
    DateTime? pickerDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1970),
      lastDate: DateTime.now(),
    );

    if(pickerDate!=null){
      signupController.selectedDate.value = pickerDate;
    }else{
      print("it's null or something is wrong");
    }
  }
}
