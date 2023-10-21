
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:space_cats_test/features/login_page/controller/login_controller.dart';
import 'package:space_cats_test/features/login_page/model/login_model.dart';
import 'package:space_cats_test/utils/app_storage.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../utils/app_base_url.dart';
import '../../../utils/app_colors.dart';
import '../../../utils/app_image_string.dart';
import '../../../utils/app_sizes.dart';
import '../../../utils/app_string.dart';
import '../../global_widgets/custom_app_bar.dart';
import '../../profile_page/controller/profile_controller.dart';
import '../controller/home_controller.dart';

class HomePage extends StatelessWidget {
  final homeController = Get.find<HomeController>();
  final profileController = Get.find<ProfileController>();
  final loginController = Get.find<LoginController>();
  HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;


    return WillPopScope(
      onWillPop: showExitPopup,
      child: Scaffold(
        appBar: CustomAppBar(
          backgroundColor: Colors.blue,
          title: "Home",
          action: [
          SizedBox(width: size.width*.04,)
        ],
        ),
        drawer: Drawer(
          child: Container(
            color: AppColors.primaryBlue,
            child: SafeArea(
              child: Column(
                children: [
                  Expanded(
                    child: ListView(
                      padding: EdgeInsets.zero,
                      children: [
                        Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: GestureDetector(
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Container(
                                    height: 84,
                                    width: 84,
                                    padding: const EdgeInsets.all(2),
                                    decoration: const BoxDecoration(
                                        color: AppColors.textWhite,
                                        borderRadius: BorderRadius.only(
                                          topLeft: Radius.circular(42.0),
                                          topRight: Radius.circular(42.0),
                                          bottomLeft: Radius.circular(42.0),
                                          bottomRight: Radius.circular(42.0),
                                        )),
                                    child: ClipOval(
                                      child: Container(
                                        alignment: Alignment.center,
                                        height: 100,
                                        width: 100,
                                        color: Colors.white70,
                                        child: Container(
                                          alignment: Alignment.center,
                                          color: Colors.white,
                                          //child: const Icon(Icons.account_circle,size: 80,),
                                          //child: Image.network("https://avatars.githubusercontent.com/u/92568244?v=4", fit: BoxFit.cover),
                                          //child: Image.network("${AppBaseUrl.apiBaseUrl}${getBox.read('EmpPhoto')}", fit: BoxFit.contain),
                                          child: Image.network("${getBox.read('profilePhoto')}", fit: BoxFit.contain),
                                        ),
                                      ),
                                    ),
                                  ),
                                  const SizedBox(width: 20,),
                                  Column(
                                    children: [
                                      Column(
                                        mainAxisAlignment: MainAxisAlignment.start,
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          //Text("Emon Al Mamun",style: TextStyle(color:AppColors.primaryWhite,fontWeight: FontWeight.bold),),
                                          Text("${getBox.read('name')}",style: const TextStyle(color:AppColors.primaryWhite,fontWeight: FontWeight.bold, overflow: TextOverflow.ellipsis),),
                                        ],
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              onTap: (){
                                Navigator.pop(context);
                                //Get.toNamed('/profile_page');
                              },
                            )),
                        const Divider(
                          height: 1,
                          thickness: 1,
                        ),
                        ListTile(
                          dense: true,
                          title: const Text("Home",style: TextStyle(color:AppColors.textWhite),),
                          //leading:const Icon(Icons.home_outlined,color: AppColors.primaryWhite,size: 24,),
                          leading:SvgPicture.asset(AppImageString.homeSvg, height: 22,width: 22, color: AppColors.primaryWhite,),
                          onTap: (){
                            debugPrint("Home");
                            Navigator.pop(context);
                            //Get.offAllNamed('/home_page');
                          },
                        ),
                        ListTile(
                          dense: true,
                          title: const Text("Logout",style: TextStyle(color:AppColors.textWhite),),
                          leading:const Icon(Icons.logout,color: AppColors.primaryWhite,),
                          onTap: (){
                            debugPrint("Logout");
                            //Get.offAllNamed('/login_page');
                            _logOut();
                          },
                        ),
                      ],
                    ),
                  ),
                  const Text(AppString.appVersion,style: TextStyle(color: AppColors.primaryWhite, fontSize: AppSizes.size12),)
                ],
              ),
            ),
          ),
        ),
        // body: Padding(
        //   padding: const EdgeInsets.symmetric(horizontal: 0.0),
        //   child: Stack(
        //     children: [
        //       Column(
        //         //mainAxisAlignment: MainAxisAlignment.center,
        //         children: [
        //           Container(
        //             height: size.height*0.30,
        //             width: double.maxFinite,
        //             decoration: const BoxDecoration(
        //                 color: AppColors.primaryBlue
        //             ),
        //             //child: Text("bg"),
        //           ),
        //           /*Container(
        //           height: size.height*0.51,
        //           width: double.maxFinite,
        //           decoration: const BoxDecoration(
        //               color: AppColors.primaryColor
        //           ),
        //           child: Text("2"),
        //         ),*/
        //         ],
        //       ),
        //       Padding(
        //         padding: const EdgeInsets.symmetric(horizontal: 18.0),
        //         child: SingleChildScrollView(
        //           child: Column(
        //             mainAxisAlignment: MainAxisAlignment.center,
        //             children: [
        //               //1
        //               Row(
        //                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
        //                 children: [
        //                   GestureDetector(
        //                     child: Container(
        //                       height: size.height*0.10,
        //                       width: size.width*0.43,
        //                       decoration: BoxDecoration(
        //                           color: Colors.white,
        //                           shape: BoxShape.rectangle,
        //                           borderRadius: BorderRadius.circular(5)
        //                       ),
        //                       child: Column(
        //                         mainAxisSize: MainAxisSize.max,
        //                         children:  [
        //                           //old
        //                           /*Obx((){
        //                             return Padding(
        //                               padding: const EdgeInsets.all(4.0),
        //                               child: homeController.isInTime.value?
        //                               Center(child: Text("08:00 AM", overflow: TextOverflow.ellipsis, style: GoogleFonts.poppins(textStyle: const TextStyle(fontSize: 24),color: AppColors.primaryGreen)))
        //                                   :
        //                               Container(
        //                                 height: 40,
        //                                 width: 40,
        //                                 decoration: BoxDecoration(
        //                                     color: AppColors.primaryGreen,
        //                                     shape: BoxShape.rectangle,
        //                                     borderRadius: BorderRadius.circular(20)
        //                                 ),
        //                                 child: Center(child: Text("+", style: GoogleFonts.poppins(textStyle: const TextStyle(fontSize: 26),color: AppColors.textWhite))),
        //                               )
        //                             );
        //                           }),*/
        //                           Obx((){
        //                             return Padding(
        //                                 padding: const EdgeInsets.all(4.0),
        //                                 child: homeController.inTime.value != " "?
        //                                 Center(child: Text("${homeController.inTime.value}", overflow: TextOverflow.ellipsis, style: GoogleFonts.poppins(textStyle: const TextStyle(fontSize: 24),color: AppColors.primaryGreen)))
        //                                     :
        //                                 GestureDetector(
        //                                   child: Container(
        //                                     height: AppSizes.size48,
        //                                     width: AppSizes.size48,
        //                                     decoration: BoxDecoration(
        //                                         color: AppColors.primaryGreen,
        //                                         shape: BoxShape.rectangle,
        //                                         borderRadius: BorderRadius.circular(24)
        //                                     ),
        //                                     child: Center(child: Text("+", style: GoogleFonts.poppins(textStyle: const TextStyle(fontSize: 26),color: AppColors.textWhite))),
        //                                   ),
        //                                   onTap: (){
        //                                     Get.toNamed('/self_attendance_page', arguments: "IN");
        //                                   },
        //                                 )
        //                             );
        //                           }),
        //                           Text("Today's In Time", overflow: TextOverflow.ellipsis, style: GoogleFonts.poppins(textStyle: const TextStyle(fontSize: 14),color: AppColors.textGrey2),),
        //                         ],
        //                       ),
        //                     ),
        //                     onTap: (){
        //                       homeController.isInTime.toggle();
        //                     },
        //                   ),
        //                   GestureDetector(
        //                     child: Container(
        //                       height: size.height*0.10,
        //                       width: size.width*0.43,
        //                       decoration: BoxDecoration(
        //                           color: Colors.white,
        //                           shape: BoxShape.rectangle,
        //                           borderRadius: BorderRadius.circular(5)
        //                       ),
        //                       child: Column(
        //                         mainAxisSize: MainAxisSize.max,
        //                         children:  [
        //                           Obx((){
        //                             return Padding(
        //                                 padding: const EdgeInsets.all(4.0),
        //                                 child: homeController.outTime.value != " "?
        //                                 Center(child: Text("${homeController.outTime.value}", overflow: TextOverflow.ellipsis, style: GoogleFonts.poppins(textStyle: const TextStyle(fontSize: 24),color: AppColors.primaryRed)))
        //                                     :
        //                                 GestureDetector(
        //                                   child: Container(
        //                                     height: AppSizes.size48,
        //                                     width: AppSizes.size48,
        //                                     decoration: BoxDecoration(
        //                                         color: AppColors.primaryRed,
        //                                         shape: BoxShape.rectangle,
        //                                         borderRadius: BorderRadius.circular(24)
        //                                     ),
        //                                     child: Center(child: Text("+", style: GoogleFonts.poppins(textStyle: const TextStyle(fontSize: 26),color: AppColors.textWhite))),
        //                                   ),
        //                                   onTap: (){
        //                                     Get.toNamed('/self_attendance_page', arguments: "OUT");
        //                                   },
        //                                 )
        //                             );
        //                           }),
        //                           Text("Today's Out Time", overflow: TextOverflow.ellipsis, style: GoogleFonts.poppins(textStyle: const TextStyle(fontSize: 14),color: AppColors.textGrey2),),
        //                         ],
        //                       ),
        //                     ),
        //                     onTap: (){
        //                       homeController.isOutTime.toggle();
        //                     },
        //                   ),
        //                 ],
        //               ),
        //               SizedBox(height: size.height*0.02,),
        //               //2
        //               Row(
        //                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
        //                 children: [
        //                   Container(
        //                     height: size.height*0.08,
        //                     width: size.width*0.29,
        //                     decoration: BoxDecoration(
        //                         color: AppColors.textWhite,
        //                         shape: BoxShape.rectangle,
        //                         borderRadius: BorderRadius.circular(5)
        //                     ),
        //                     child: Row(
        //                       children:  [
        //                         Padding(
        //                           padding: const EdgeInsets.all(4.0),
        //                           child: Container(
        //                             height: 50,
        //                             width: 50,
        //                             decoration: BoxDecoration(
        //                                 color: AppColors.primaryGreen,
        //                                 shape: BoxShape.rectangle,
        //                                 borderRadius: BorderRadius.circular(25)
        //                             ),
        //                             child: Center(child: Text("0", style: GoogleFonts.poppins(textStyle: const TextStyle(fontSize: 26),color: AppColors.textWhite))),
        //                           ),
        //                         ),
        //                         Expanded(child: Text("Missed\nAttendance", overflow: TextOverflow.ellipsis, style: GoogleFonts.poppins(textStyle: const TextStyle(fontSize: 12, color: AppColors.textGrey2),),))
        //                       ],
        //                     ),
        //                   ),
        //                   Container(
        //                     height: size.height*0.08,
        //                     width: size.width*0.29,
        //                     decoration: BoxDecoration(
        //                         color: AppColors.textWhite,
        //                         shape: BoxShape.rectangle,
        //                         borderRadius: BorderRadius.circular(5)
        //                     ),
        //                     child: Row(
        //                       children:  [
        //                         Padding(
        //                           padding: const EdgeInsets.all(4.0),
        //                           child: Container(
        //                             height: 50,
        //                             width: 50,
        //                             decoration: BoxDecoration(
        //                                 color: AppColors.primaryBlue,
        //                                 shape: BoxShape.rectangle,
        //                                 borderRadius: BorderRadius.circular(25)
        //                             ),
        //                             child: Center(child: Text("2", style: GoogleFonts.poppins(textStyle: const TextStyle(fontSize: 26),color: AppColors.textWhite))),
        //                           ),
        //                         ),
        //                         Expanded(child: Text("Pending\nApproval", overflow: TextOverflow.ellipsis, style: GoogleFonts.poppins(textStyle: const TextStyle(fontSize: 12, color: AppColors.textGrey2)),))
        //                       ],
        //                     ),
        //                   ),
        //                   Container(
        //                     height: size.height*0.08,
        //                     width: size.width*0.29,
        //                     decoration: BoxDecoration(
        //                         color: Colors.white,
        //                         shape: BoxShape.rectangle,
        //                         borderRadius: BorderRadius.circular(5)
        //                     ),
        //                     child: Row(
        //                       children:  [
        //                         Padding(
        //                           padding: const EdgeInsets.all(4.0),
        //                           child: Container(
        //                             height: 50,
        //                             width: 50,
        //                             decoration: BoxDecoration(
        //                                 color: AppColors.primaryColor,
        //                                 shape: BoxShape.rectangle,
        //                                 borderRadius: BorderRadius.circular(25)
        //                             ),
        //                             child: Center(child: Text("3", style: GoogleFonts.poppins(textStyle: const TextStyle(fontSize: 26),color: AppColors.textWhite))),
        //                           ),
        //                         ),
        //                         Expanded(child: Text("Leave\nSpend", overflow: TextOverflow.ellipsis, style: GoogleFonts.poppins(textStyle: const TextStyle(fontSize: 12, color: AppColors.textGrey2)),))
        //                       ],
        //                     ),
        //                   ),
        //                   /*Container(
        //                     height: size.height*0.08,
        //                     width: size.width*0.28,
        //                     decoration: BoxDecoration(
        //                         color: Colors.white,
        //                         shape: BoxShape.rectangle,
        //                         borderRadius: BorderRadius.circular(5)
        //                     ),
        //                     child: const Text("Box 2"),
        //                   ),
        //                   Container(
        //                     height: size.height*0.08,
        //                     width: size.width*0.28,
        //                     decoration: BoxDecoration(
        //                         color: Colors.white,
        //                         shape: BoxShape.rectangle,
        //                         borderRadius: BorderRadius.circular(5)
        //                     ),
        //                     child: const Text("Box 3"),
        //                   ),*/
        //                 ],
        //               ),
        //               SizedBox(height: size.height*0.02,),
        //               //3
        //               Row(
        //                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
        //                 children: [
        //                   GestureDetector(
        //                     child: Obx((){
        //                       return Container(
        //                         height: size.height*0.13,
        //                         width: size.width*0.285,
        //                         decoration: BoxDecoration(
        //                             color: Colors.white,
        //                             shape: BoxShape.rectangle,
        //                             borderRadius: BorderRadius.circular(5),
        //                             boxShadow:  homeController.employeeEnum.value == EmployeeEnum.attendance?
        //                             [BoxShadow(
        //                               color: Colors.grey.shade600,
        //                               spreadRadius: 1,
        //                               blurRadius: 5,
        //                               offset: const Offset(0, 3),
        //                             )]
        //                                 :
        //                             []
        //                         ),
        //                         child: Stack(
        //                           children: [
        //                             Positioned(
        //                               //top: AppSizes.size14,
        //                               //left: AppSizes.size30,
        //                               top: 20,
        //                               left: 0,
        //                               right: 0,
        //                               child: SvgPicture.asset(AppImageString.attendanceSvg,height: AppSizes.size48,width: AppSizes.size48,alignment: Alignment.center,color: homeController.employeeEnum.value == EmployeeEnum.attendance? AppColors.primaryBlue:AppColors.textGrey2),
        //                             ),
        //                             Positioned(
        //                               bottom: 0,
        //                               child: Obx((){
        //                                 return Container(
        //                                   height: 30,
        //                                   width: size.width*0.285,
        //                                   decoration: BoxDecoration(
        //                                     color: homeController.employeeEnum.value == EmployeeEnum.attendance? AppColors.primaryBlue : AppColors.textGrey2,
        //                                   ),
        //                                   child: const Center(child: Text("Attendance",style: TextStyle(color: AppColors.textWhite),)),
        //                                 );
        //                               }),
        //                             ),
        //                           ],
        //                         ),
        //                       );
        //                     }),
        //                     onTap: (){
        //                       homeController.employeeEnum.value = EmployeeEnum.attendance;
        //                       homeController.selectedStatus.value = AppString.attendance;
        //                     },
        //                   ),
        //                   GestureDetector(
        //                     child: Obx((){
        //                       return Container(
        //                         height: size.height*0.13,
        //                         width: size.width*0.285,
        //                         decoration: BoxDecoration(
        //                             color: Colors.white,
        //                             shape: BoxShape.rectangle,
        //                             borderRadius: BorderRadius.circular(5),
        //                             boxShadow:  homeController.employeeEnum.value == EmployeeEnum.leave?
        //                             [BoxShadow(
        //                               color: Colors.grey.shade600,
        //                               spreadRadius: 1,
        //                               blurRadius: 5,
        //                               offset: const Offset(0, 3),
        //                             )]
        //                                 :
        //                             []
        //                         ),
        //                         child: Stack(
        //                           children: [
        //                             Positioned(
        //                               top: 20,
        //                               left: 0,
        //                               right: 0,
        //                               child: SvgPicture.asset(AppImageString.leaveSvg,height: AppSizes.size48,width: AppSizes.size48,alignment: Alignment.center,color: homeController.employeeEnum.value == EmployeeEnum.leave? AppColors.primaryBlue:AppColors.textGrey2),
        //                             ),
        //                             Positioned(
        //                               bottom: 0,
        //                               child: Obx((){
        //                                 return Container(
        //                                   height: 30,
        //                                   width: size.width*0.285,
        //                                   decoration: BoxDecoration(
        //                                     color: homeController.employeeEnum.value == EmployeeEnum.leave? AppColors.primaryBlue : AppColors.textGrey2,
        //                                   ),
        //                                   child: const Center(child: Text(AppString.leave,style: TextStyle(color: AppColors.textWhite),)),
        //                                 );
        //                               }),
        //                             ),
        //                           ],
        //                         ),
        //                       );
        //                     }),
        //                     onTap: (){
        //                       homeController.employeeEnum.value = EmployeeEnum.leave;
        //                       homeController.selectedStatus.value = AppString.leave;
        //                     },
        //                   ),
        //                   GestureDetector(
        //                     child: Obx((){
        //                       return Container(
        //                         height: size.height*0.13,
        //                         width: size.width*0.285,
        //                         decoration: BoxDecoration(
        //                             color: Colors.white,
        //                             shape: BoxShape.rectangle,
        //                             borderRadius: BorderRadius.circular(5),
        //                             boxShadow:  homeController.employeeEnum.value == EmployeeEnum.checkInOut?
        //                             [BoxShadow(
        //                               color: Colors.grey.shade600,
        //                               spreadRadius: 1,
        //                               blurRadius: 5,
        //                               offset: const Offset(0, 3),
        //                             )]
        //                               :
        //                             []
        //                         ),
        //                         child: Stack(
        //                           children: [
        //                             Positioned(
        //                               top: 20,
        //                               left: 0,
        //                               right: 0,
        //                               child: SvgPicture.asset(AppImageString.checkInOutSvg,height: AppSizes.size48,width: AppSizes.size48,alignment: Alignment.center,color: homeController.employeeEnum.value == EmployeeEnum.checkInOut? AppColors.primaryBlue:AppColors.textGrey2),
        //                             ),
        //                             Positioned(
        //                               bottom: 0,
        //                               child: Obx((){
        //                                 return Container(
        //                                   height: 30,
        //                                   width: size.width*0.285,
        //                                   decoration: BoxDecoration(
        //                                     color: homeController.employeeEnum.value == EmployeeEnum.checkInOut? AppColors.primaryBlue : AppColors.textGrey2,
        //                                   ),
        //                                   child: const Center(child: Text(AppString.checkInOut,style: TextStyle(color: AppColors.textWhite),)),
        //                                 );
        //                               }),
        //                             ),
        //                           ],
        //                         ),
        //                       );
        //                     }),
        //                     onTap: (){
        //                       homeController.employeeEnum.value = EmployeeEnum.checkInOut;
        //                       homeController.selectedStatus.value = AppString.checkInOut;
        //                       ScaffoldMessenger.of(Get.context!).showSnackBar(AppSnackBar.snackBar(msg: 'Yay! A SnackBar!'));
        //
        //                     },
        //                   ),
        //                   /*Container(
        //                     height: size.height*0.13,
        //                     width: size.width*0.285,
        //                     decoration: BoxDecoration(
        //                         color: Colors.white,
        //                         shape: BoxShape.rectangle,
        //                         borderRadius: BorderRadius.circular(5),
        //                         boxShadow: [
        //                           BoxShadow(
        //                             color: Colors.grey.shade600,
        //                             spreadRadius: 1,
        //                             blurRadius: 5,
        //                             offset: const Offset(0, 3),
        //                           ),
        //                         ]
        //                     ),
        //                     child: Stack(
        //                       children: [
        //                         const Positioned(
        //                           top: 30,
        //                           left: 43,
        //                           child: Icon(Icons.access_time),
        //                         ),
        //                         Positioned(
        //                             bottom: 0,
        //                             child: Container(
        //                               height: 30,
        //                               width: 110,
        //                               decoration: const BoxDecoration(
        //                                 color: AppColors.textGrey2,
        //                               ),
        //                               child: const Center(child: Text("Leave",style: TextStyle(color: AppColors.textWhite),)),
        //                             )
        //                         ),
        //                       ],
        //                     ),
        //                   ),*/
        //                   /*Container(
        //                     height: size.height*0.13,
        //                     width: size.width*0.285,
        //                     decoration: BoxDecoration(
        //                         color: Colors.white,
        //                         shape: BoxShape.rectangle,
        //                         borderRadius: BorderRadius.circular(5),
        //                         boxShadow: [
        //                           BoxShadow(
        //                             color: Colors.grey.shade600,
        //                             spreadRadius: 1,
        //                             blurRadius: 5,
        //                             offset: const Offset(0, 3),
        //                           ),
        //                         ]
        //                     ),
        //                     child: Stack(
        //                       children: [
        //                         const Positioned(
        //                           top: 30,
        //                           left: 43,
        //                           child: Icon(Icons.access_time),
        //                         ),
        //                         Positioned(
        //                             bottom: 0,
        //                             child: Container(
        //                               height: 30,
        //                               width: 110,
        //                               decoration: const BoxDecoration(
        //                                 color: AppColors.textGrey2,
        //                               ),
        //                               child: const Center(child: Text("Check In/Out",style: TextStyle(color: AppColors.textWhite),)),
        //                             )
        //                         ),
        //                       ],
        //                     ),
        //                   ),*/
        //                 ],
        //               ),
        //               SizedBox(height: size.height*0.02,),
        //               Obx((){
        //                 return homeController.selectedStatus.value == AppString.attendance?
        //                 Row(
        //                   mainAxisAlignment: MainAxisAlignment.start,
        //                   children: const [Text(AppString.attendance, style: TextStyle(fontSize: AppSizes.size16, color: AppColors.primaryGreen),)],
        //                 )
        //                     :
        //                 homeController.selectedStatus.value == AppString.leave?
        //                 Row(
        //                   mainAxisAlignment: MainAxisAlignment.start,
        //                   children: const [Text(AppString.leave, style: TextStyle(fontSize: AppSizes.size16, color: AppColors.primaryGreen),)],
        //                 )
        //                     :
        //                 homeController.selectedStatus.value == AppString.checkInOut?
        //                 Row(
        //                   mainAxisAlignment: MainAxisAlignment.start,
        //                   children: const [Text(AppString.checkInOut, style: TextStyle(fontSize: AppSizes.size16, color: AppColors.primaryGreen),)],
        //                 )
        //                     :
        //                 Row(
        //                   mainAxisAlignment: MainAxisAlignment.start,
        //                   children: const [Text(AppString.attendance, style: TextStyle(fontSize: AppSizes.size16, color: AppColors.primaryGreen),)],
        //                 );
        //               }),
        //               SizedBox(height: size.height*0.01,),
        //               _selectedWidgetGroup(size),
        //             ],
        //           ),
        //         ),
        //       ),
        //     ],
        //   ),
        // ),
        body:Column(
          //mainAxisAlignment: MainAxisAlignment.start,
          children: [
            //Stack section
            SizedBox(
              height: size.height*0.23,
              child: Stack(
                children: [
                  Container(
                    height: size.height*0.15,
                    decoration: const BoxDecoration(
                        color: Colors.blue
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Container(
                            decoration: BoxDecoration(
                                color: AppColors.primaryWhite,
                                shape: BoxShape.rectangle,
                                borderRadius: BorderRadius.circular(5)
                            ),
                            child: IconButton(
                              color: AppColors.primaryBlue,
                              icon: const Icon(Icons.phone),
                              onPressed: () async{
                                //Uri phoneNo = Uri.parse('tel:01600000000');
                                Uri phoneNo = Uri.parse('tel:${loginController.user.phoneNumber}');
                                if (await launchUrl(phoneNo)) {
                                  //dialer opened
                                }else{
                                  //dailer is not opened
                                }
                              },
                            ),
                          ),
                          const SizedBox(width: 5,),
                          Container(
                            decoration: BoxDecoration(
                                color: AppColors.primaryWhite,
                                shape: BoxShape.rectangle,
                                borderRadius: BorderRadius.circular(5)
                            ),
                            child: IconButton(
                              color: AppColors.primaryBlue,
                              icon: const Icon(Icons.mail),
                              onPressed: () async{
                                //Uri phoneNo = Uri.parse('sms:01600000000');
                                Uri phoneNo = Uri.parse('sms:${loginController.user.phoneNumber}');
                                if (await launchUrl(phoneNo)) {
                                  //dialer opened
                                }else{
                                  //dailer is not opened
                                }
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Positioned(
                    top: size.height*0.10,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10.0),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Container(
                                height: 100,
                                width: 100,
                                padding: const EdgeInsets.all(2),
                                decoration: const BoxDecoration(
                                    color: AppColors.textWhite,
                                    borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(5.0),
                                      topRight: Radius.circular(5.0),
                                      bottomLeft: Radius.circular(5.0),
                                      bottomRight: Radius.circular(5.0),
                                    ),
                                    image: DecorationImage(image: NetworkImage("https://avatars.githubusercontent.com/u/92568244?v=4",),fit: BoxFit.fill)
                                ),
                              ),
                              SizedBox(width: size.width*0.05,),
                              Column(
                                children: [
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text("${loginController.user.name}",style: TextStyle(color:AppColors.textBlue,fontWeight: FontWeight.bold, fontSize: AppSizes.size20),),
                                      Text("Mobile App Developer, 0000",style: TextStyle(color:AppColors.textBlue, fontSize: AppSizes.size14),),
                                    ],
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                ],
                              ),
                            ],
                          ),
                          SizedBox(height: size.height*0.025,),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            //TabBar section
            TabBar(
              controller: profileController.tabController,
              labelColor: AppColors.primaryBlue,
              unselectedLabelColor: AppColors.textGrey2,
              indicatorColor: Colors.transparent,
              tabs: const [
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Icon(Icons.person, size: AppSizes.size33,),
                ),
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Icon(Icons.business_center, size: AppSizes.size33,),
                ),
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Icon(Icons.more_horiz, size: AppSizes.size33,),
                ),
              ],
              onTap: (index){
                //debugPrint(index.toString());
                profileController.tabIndex.value = index;
              },
            ),
            SizedBox(height: size.height*0.01,),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10.0),
                  child: Obx((){
                    return Text(profileController.tabIndex.value==0?"PERSONAL":profileController.tabIndex.value==1?"OFFICIAL":"OTHERS", style: const TextStyle(fontSize: AppSizes.size18, color: AppColors.textGrey2),);
                  }),
                ),
              ],
            ),
            SizedBox(height: size.height*0.02,),
            Expanded(
              child: TabBarView(
                controller: profileController.tabController,
                children: [
                  //Personal
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10.0),
                    child: ListView(
                      children: [
                        ListTile(
                          //dense: true,
                          contentPadding: EdgeInsets.zero,
                          leading: Icon(Icons.linear_scale, color: AppColors.primaryBlue, size: AppSizes.size30,),
                          title: Text("${loginController.user.name}", style: TextStyle(fontWeight: FontWeight.bold),),
                          subtitle: Text("Name"),
                        ),
                        ListTile(
                          //dense: true,
                          contentPadding: EdgeInsets.zero,
                          leading: Icon(Icons.linear_scale, color: AppColors.primaryBlue, size: AppSizes.size30,),
                          title: Text("${loginController.user.email}", style: TextStyle(fontWeight: FontWeight.bold),),
                          subtitle: Text("email"),
                        ),
                        ListTile(
                          //dense: true,
                          contentPadding: EdgeInsets.zero,
                          leading: Icon(Icons.linear_scale, color: AppColors.primaryBlue, size: AppSizes.size30,),
                          title: Text("${loginController.user.countryCode}", style: TextStyle(fontWeight: FontWeight.bold),),
                          subtitle: Text("Country code"),
                        ),
                        ListTile(
                          //dense: true,
                          contentPadding: EdgeInsets.zero,
                          leading: Icon(Icons.linear_scale, color: AppColors.primaryBlue, size: AppSizes.size30,),
                          title: Text("${loginController.user.phone}", style: TextStyle(fontWeight: FontWeight.bold),),
                          subtitle: Text("Phone"),
                        ),
                        ListTile(
                          //dense: true,
                          contentPadding: EdgeInsets.zero,
                          leading: Icon(Icons.linear_scale, color: AppColors.primaryBlue, size: AppSizes.size30,),
                          title: Text("${loginController.user.gender}", style: TextStyle(fontWeight: FontWeight.bold),),
                          subtitle: Text("Gender"),
                        ),
                        ListTile(
                          //dense: true,
                          contentPadding: EdgeInsets.zero,
                          leading: Icon(Icons.linear_scale, color: AppColors.primaryBlue, size: AppSizes.size30,),
                          title: Text("${loginController.user.dob}", style: TextStyle(fontWeight: FontWeight.bold),),
                          subtitle: Text("Date of birth"),
                        ),
                        ListTile(
                          //dense: true,
                          contentPadding: EdgeInsets.zero,
                          leading: Icon(Icons.linear_scale, color: AppColors.primaryBlue, size: AppSizes.size30,),
                          title: Text("${loginController.user.divisionId}", style: TextStyle(fontWeight: FontWeight.bold),),
                          subtitle: Text("Division id"),
                        ),
                        ListTile(
                          //dense: true,
                          contentPadding: EdgeInsets.zero,
                          leading: Icon(Icons.linear_scale, color: AppColors.primaryBlue, size: AppSizes.size30,),
                          title: Text("${loginController.user.divisionName}", style: TextStyle(fontWeight: FontWeight.bold),),
                          subtitle: Text("Division name"),
                        ),
                        ListTile(
                          //dense: true,
                          contentPadding: EdgeInsets.zero,
                          leading: Icon(Icons.linear_scale, color: AppColors.primaryBlue, size: AppSizes.size30,),
                          title: Text("${loginController.user.districtId}", style: TextStyle(fontWeight: FontWeight.bold),),
                          subtitle: Text("District id"),
                        ),
                        ListTile(
                          //dense: true,
                          contentPadding: EdgeInsets.zero,
                          leading: Icon(Icons.linear_scale, color: AppColors.primaryBlue, size: AppSizes.size30,),
                          title: Text("${loginController.user.districtName}", style: TextStyle(fontWeight: FontWeight.bold),),
                          subtitle: Text("District name"),
                        ),
                        ListTile(
                          //dense: true,
                          contentPadding: EdgeInsets.zero,
                          leading: Icon(Icons.linear_scale, color: AppColors.primaryBlue, size: AppSizes.size30,),
                          title: Text("${loginController.user.address}", style: TextStyle(fontWeight: FontWeight.bold),),
                          subtitle: Text("Address"),
                        ),
                      ],
                    ),
                  ),
                  //Officials
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10.0),
                    child: ListView(
                      children: const [
                        ListTile(
                          //dense: true,
                          contentPadding: EdgeInsets.zero,
                          leading: Icon(Icons.linear_scale, color: AppColors.primaryBlue, size: AppSizes.size30,),
                          title: Text("0000", style: TextStyle(fontWeight: FontWeight.bold),),
                          subtitle: Text("Employee Code"),
                        ),
                        ListTile(
                          //dense: true,
                          contentPadding: EdgeInsets.zero,
                          leading: Icon(Icons.linear_scale, color: AppColors.primaryBlue, size: AppSizes.size30,),
                          title: Text("01-12-2022", style: TextStyle(fontWeight: FontWeight.bold),),
                          subtitle: Text("Join Date"),
                        ),
                        ListTile(
                          //dense: true,
                          contentPadding: EdgeInsets.zero,
                          leading: Icon(Icons.linear_scale, color: AppColors.primaryBlue, size: AppSizes.size30,),
                          title: Text("Mobile App Developer", style: TextStyle(fontWeight: FontWeight.bold),),
                          subtitle: Text("Designation"),
                        ),
                        ListTile(
                          //dense: true,
                          contentPadding: EdgeInsets.zero,
                          leading: Icon(Icons.linear_scale, color: AppColors.primaryBlue, size: AppSizes.size30,),
                          title: Text("Not Defined", style: TextStyle(fontWeight: FontWeight.bold),),
                          subtitle: Text("Functional Designation"),
                        ),
                        ListTile(
                          //dense: true,
                          contentPadding: EdgeInsets.zero,
                          leading: Icon(Icons.linear_scale, color: AppColors.primaryBlue, size: AppSizes.size30,),
                          title: Text("Active", style: TextStyle(fontWeight: FontWeight.bold),),
                          subtitle: Text("Job Status"),
                        ),
                        ListTile(
                          //dense: true,
                          contentPadding: EdgeInsets.zero,
                          leading: Icon(Icons.linear_scale, color: AppColors.primaryBlue, size: AppSizes.size30,),
                          title: Text("Probationary", style: TextStyle(fontWeight: FontWeight.bold),),
                          subtitle: Text("Job Base"),
                        ),
                        ListTile(
                          //dense: true,
                          contentPadding: EdgeInsets.zero,
                          leading: Icon(Icons.linear_scale, color: AppColors.primaryBlue, size: AppSizes.size30,),
                          title: Text("Not Defined", style: TextStyle(fontWeight: FontWeight.bold),),
                          subtitle: Text("Job Level"),
                        ),
                        ListTile(
                          //dense: true,
                          contentPadding: EdgeInsets.zero,
                          leading: Icon(Icons.linear_scale, color: AppColors.primaryBlue, size: AppSizes.size30,),
                          title: Text("Employee", style: TextStyle(fontWeight: FontWeight.bold),),
                          subtitle: Text("Employment Category"),
                        ),
                        ListTile(
                          //dense: true,
                          contentPadding: EdgeInsets.zero,
                          leading: Icon(Icons.linear_scale, color: AppColors.primaryBlue, size: AppSizes.size30,),
                          title: Text("IT", style: TextStyle(fontWeight: FontWeight.bold),),
                          subtitle: Text("Department"),
                        ),
                        ListTile(
                          //dense: true,
                          contentPadding: EdgeInsets.zero,
                          leading: Icon(Icons.linear_scale, color: AppColors.primaryBlue, size: AppSizes.size30,),
                          title: Text("Head Office", style: TextStyle(fontWeight: FontWeight.bold),),
                          subtitle: Text("Branch"),
                        ),
                        ListTile(
                          //dense: true,
                          contentPadding: EdgeInsets.zero,
                          leading: Icon(Icons.linear_scale, color: AppColors.primaryBlue, size: AppSizes.size30,),
                          title: Text("Dhaka", style: TextStyle(fontWeight: FontWeight.bold),),
                          subtitle: Text("Division"),
                        ),
                        ListTile(
                          //dense: true,
                          contentPadding: EdgeInsets.zero,
                          leading: Icon(Icons.linear_scale, color: AppColors.primaryBlue, size: AppSizes.size30,),
                          title: Text("Not Defined", style: TextStyle(fontWeight: FontWeight.bold),),
                          subtitle: Text("Unit"),
                        ),
                      ],
                    ),
                  ),
                  //Others
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10.0),
                    child: ListView(
                      children: const [
                        ListTile(
                          //dense: true,
                          contentPadding: EdgeInsets.zero,
                          leading: Icon(Icons.linear_scale, color: AppColors.primaryBlue, size: AppSizes.size30,),
                          title: Text("O+", style: TextStyle(fontWeight: FontWeight.bold),),
                          subtitle: Text("Blood Group"),
                        ),
                        ListTile(
                          //dense: true,
                          contentPadding: EdgeInsets.zero,
                          leading: Icon(Icons.linear_scale, color: AppColors.primaryBlue, size: AppSizes.size30,),
                          title: Text("01600000000", style: TextStyle(fontWeight: FontWeight.bold),),
                          subtitle: Text("Mobile Number"),
                        ),
                        ListTile(
                          //dense: true,
                          contentPadding: EdgeInsets.zero,
                          leading: Icon(Icons.linear_scale, color: AppColors.primaryBlue, size: AppSizes.size30,),
                          title: Text("Islam", style: TextStyle(fontWeight: FontWeight.bold),),
                          subtitle: Text("Religion"),
                        ),
                        ListTile(
                          //dense: true,
                          contentPadding: EdgeInsets.zero,
                          leading: Icon(Icons.linear_scale, color: AppColors.primaryBlue, size: AppSizes.size30,),
                          title: Text("Male", style: TextStyle(fontWeight: FontWeight.bold),),
                          subtitle: Text("Gender"),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<bool> showExitPopup() async {
    return await showDialog(
      //show confirm dialogue
      //the return value will be from "Yes" or "No" options
      context: Get.context!,
      builder: (context) => AlertDialog(
        /*title: Container(
              child: Image.asset('assets/icons/host_logo.png',fit: BoxFit.contain,),
            height: 50,
            width: 50,
          ),*/
        content: const Text(
          'Do you want to exit?',
          textAlign: TextAlign.center,
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(false),
            //return false when click on "NO"
            child: const Text(
              'No',
            ),
          ),
          TextButton(
            onPressed: () => Navigator.of(context).pop(true),
            //return true when click on "Yes"
            child: const Text(
              'Yes',
            ),
          ),
        ],
      ),
    ) ?? false; //if showDialog had returned null, then return false
  }


  // _selectedWidgetGroup(Size size){
  //   return Obx((){
  //     return homeController.selectedStatus.value == AppString.attendance?
  //     _attendanceWidgetGroup(size)
  //         :
  //     //homeController.selectedStatus.value == AppString.leave?
  //     _leaveWidgetGroup(size);
  //     //     :
  //     // //const SizedBox();
  //     // (){
  //     //   ScaffoldMessenger.of(Get.context!).showSnackBar(snackBar);
  //     // };
  //
  //   });
  // }
  //
  // _attendanceWidgetGroup(Size size){
  //   return Column(
  //     children: [
  //       //4
  //       Row(
  //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //         children: [
  //           // GestureDetector(
  //           //   child: Card(
  //           //     elevation: 1,
  //           //     child: Container(
  //           //       height: size.height*0.18,
  //           //       width: size.width*0.280,
  //           //       decoration: BoxDecoration(
  //           //           color: Colors.white,
  //           //           shape: BoxShape.rectangle,
  //           //           borderRadius: BorderRadius.circular(5)
  //           //       ),
  //           //       child: Stack(
  //           //         children: [
  //           //           Positioned(
  //           //             top: AppSizes.size33,
  //           //             left: AppSizes.size33,
  //           //             child:SvgPicture.asset(AppImageString.myAttendanceSvg,height: AppSizes.size48,width: AppSizes.size48,alignment: Alignment.center,color: AppColors.primaryGreen,)
  //           //           ),
  //           //           Positioned(
  //           //             bottom: 0,
  //           //             child: Container(
  //           //               //height: 30,
  //           //               width: 110,
  //           //               decoration: const BoxDecoration(
  //           //                 //color: homeController.employeeEnum.value == EmployeeEnum.attendance? AppColors.primaryBlue : AppColors.textGrey2,
  //           //               ),
  //           //               child: const Center(child: Text("MY\nATTENDANCE",overflow: TextOverflow.ellipsis, style: TextStyle(color: AppColors.primaryGreen, fontSize: AppSizes.size10),textAlign: TextAlign.center,)),
  //           //             ),
  //           //           ),
  //           //         ],
  //           //       ),
  //           //     ),
  //           //   ),
  //           //   onTap: (){
  //           //     Get.toNamed('/my_attendance_page');
  //           //   },
  //           // ),
  //           GestureDetector(
  //             child: const CustomCard(svgString: AppImageString.myAttendanceSvg, title: "MY\nATTENDANCE"),
  //             onTap: (){
  //               Get.toNamed('/my_attendance_page');
  //             },
  //           ),
  //           GestureDetector(
  //             child: const CustomCard(myIcon: Icons.access_time, title: "VIEW\nATTENDANCE"),
  //             onTap: (){
  //               //Get.toNamed('/my_attendance_page');
  //             },
  //           ),
  //           GestureDetector(
  //             child: const CustomCard(myIcon: Icons.access_time, title: "ATTENDANCE\nIN/OUT"),
  //             onTap: (){
  //               //Get.toNamed('/my_attendance_page');
  //             },
  //           ),
  //           // Card(
  //           //   elevation: 1,
  //           //   child: Container(
  //           //     height: size.height*0.18,
  //           //     width: size.width*0.280,
  //           //     decoration: BoxDecoration(
  //           //         color: Colors.white,
  //           //         shape: BoxShape.rectangle,
  //           //         borderRadius: BorderRadius.circular(5)
  //           //     ),
  //           //     child: Stack(
  //           //       children: [
  //           //         const Positioned(
  //           //           top: 60,
  //           //           left: 0,
  //           //           right: 0,
  //           //           child: Icon(Icons.access_time),
  //           //         ),
  //           //         Positioned(
  //           //           left: 0,
  //           //           right: 0,
  //           //           bottom:5,
  //           //           child: Container(
  //           //             //height: 30,
  //           //             width: 110,
  //           //             decoration: const BoxDecoration(
  //           //               //color: homeController.employeeEnum.value == EmployeeEnum.attendance? AppColors.primaryBlue : AppColors.textGrey2,
  //           //             ),
  //           //             child: const Center(child: Text("VIEW\nATTENDANCE",overflow: TextOverflow.ellipsis, style: TextStyle(color: AppColors.primaryGreen, fontSize: AppSizes.size10),textAlign: TextAlign.center,)),
  //           //           ),
  //           //         ),
  //           //       ],
  //           //     ),
  //           //   ),
  //           // ),
  //           // Card(
  //           //   elevation: 1,
  //           //   child: Container(
  //           //     height: size.height*0.18,
  //           //     width: size.width*0.280,
  //           //     decoration: BoxDecoration(
  //           //         color: Colors.white,
  //           //         shape: BoxShape.rectangle,
  //           //         borderRadius: BorderRadius.circular(5)
  //           //     ),
  //           //     child: Stack(
  //           //       children: [
  //           //         const Positioned(
  //           //           top: 60,
  //           //           left: 0,
  //           //           right: 0,
  //           //           child: Icon(Icons.access_time),
  //           //         ),
  //           //         Positioned(
  //           //           left: 0,
  //           //           right: 0,
  //           //           bottom:5,
  //           //           child: Container(
  //           //             //height: 30,
  //           //             width: 110,
  //           //             decoration: const BoxDecoration(
  //           //               //color: homeController.employeeEnum.value == EmployeeEnum.attendance? AppColors.primaryBlue : AppColors.textGrey2,
  //           //             ),
  //           //             child: const Center(child: Text("ATTENDANCE\nIN/OUT",overflow: TextOverflow.ellipsis, style: TextStyle(color: AppColors.primaryGreen, fontSize: AppSizes.size10),textAlign: TextAlign.center,)),
  //           //           ),
  //           //         ),
  //           //       ],
  //           //     ),
  //           //   ),
  //           // ),
  //         ],
  //       ),
  //       SizedBox(height: size.height*0.02,),
  //       //5
  //       Row(
  //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //         children: [
  //           const CustomCard(svgString: AppImageString.reConApprovalSvg, title: "RECONCILIATION\nAPPROVAL"),
  //           const CustomCard(svgString: AppImageString.reConApplicationSvg, title: "RECONCILIATION\nAPPLICATIONS"),
  //           GestureDetector(
  //             child: const CustomCard(myIcon: Icons.access_time, title: "MONITOR\nEMPLOYEES"),
  //             onTap: (){
  //               //Get.toNamed('/my_attendance_page');
  //             },
  //           ),
  //           // Card(
  //           //   elevation: 1,
  //           //   child: Container(
  //           //     height: size.height*0.18,
  //           //     width: size.width*0.280,
  //           //     decoration: BoxDecoration(
  //           //         color: Colors.white,
  //           //         shape: BoxShape.rectangle,
  //           //         borderRadius: BorderRadius.circular(5)
  //           //     ),
  //           //     child: Stack(
  //           //       children: [
  //           //         const Positioned(
  //           //           top: 60,
  //           //           left: 0,
  //           //           right: 0,
  //           //           child: Icon(Icons.access_time),
  //           //         ),
  //           //         Positioned(
  //           //           left: 0,
  //           //           right: 0,
  //           //           bottom:5,
  //           //           child: Container(
  //           //             //height: 30,
  //           //             width: 110,
  //           //             decoration: const BoxDecoration(
  //           //               //color: homeController.employeeEnum.value == EmployeeEnum.attendance? AppColors.primaryBlue : AppColors.textGrey2,
  //           //             ),
  //           //             child: const Center(child: Text("MONITOR\nEMPLOYEES",overflow: TextOverflow.ellipsis, style: TextStyle(color: AppColors.primaryGreen, fontSize: AppSizes.size10),textAlign: TextAlign.center,)),
  //           //           ),
  //           //         ),
  //           //       ],
  //           //     ),
  //           //   ),
  //           // ),
  //         ],
  //       ),
  //     ],
  //   );
  // }
  //
  // _leaveWidgetGroup(Size size){
  //   return Column(
  //     children: [
  //       //4
  //       Row(
  //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //         children: [
  //           // Card(
  //           //   elevation: 1,
  //           //   child: Container(
  //           //     height: size.height*0.18,
  //           //     width: size.width*0.280,
  //           //     decoration: BoxDecoration(
  //           //         color: Colors.white,
  //           //         shape: BoxShape.rectangle,
  //           //         borderRadius: BorderRadius.circular(5)
  //           //     ),
  //           //     child: Stack(
  //           //       children: [
  //           //         const Positioned(
  //           //           top: 60,
  //           //           left: 0,
  //           //           right: 0,
  //           //           child: Icon(Icons.account_circle),
  //           //         ),
  //           //         Positioned(
  //           //           left: 0,
  //           //           right: 0,
  //           //           bottom: 5,
  //           //           child: Container(
  //           //             //height: 30,
  //           //             width: 110,
  //           //             decoration: const BoxDecoration(
  //           //               //color: homeController.employeeEnum.value == EmployeeEnum.attendance? AppColors.primaryBlue : AppColors.textGrey2,
  //           //             ),
  //           //             child: const Center(child: Text("${AppString.leaveUP}\n${AppString.calenderUP}",overflow: TextOverflow.ellipsis, style: TextStyle(color: AppColors.primaryGreen, fontSize: 12),textAlign: TextAlign.center,)),
  //           //           ),
  //           //         ),
  //           //       ],
  //           //     ),
  //           //   ),
  //           // ),
  //           GestureDetector(
  //             child: const CustomCard(myIcon: Icons.access_time, title: "${AppString.leaveUP}\n${AppString.calenderUP}"),
  //             onTap: (){
  //               //Get.toNamed('/my_attendance_page');
  //             },
  //           ),
  //           GestureDetector(
  //             child: const CustomCard(myIcon: Icons.access_time, title: "${AppString.employeeUP}\n${AppString.leaveBalanceUP}"),
  //             onTap: (){
  //               //Get.toNamed('/my_attendance_page');
  //             },
  //           ),
  //           GestureDetector(
  //             child: const CustomCard(myIcon: Icons.balance, title: "MY\n${AppString.leaveBalanceUP}"),
  //             onTap: (){
  //               Get.toNamed('/leave_balance_page');
  //             },
  //           ),
  //           // Card(
  //           //   elevation: 1,
  //           //   child: Container(
  //           //     height: size.height*0.18,
  //           //     width: size.width*0.280,
  //           //     decoration: BoxDecoration(
  //           //         color: Colors.white,
  //           //         shape: BoxShape.rectangle,
  //           //         borderRadius: BorderRadius.circular(5)
  //           //     ),
  //           //     child: Stack(
  //           //       children: [
  //           //         const Positioned(
  //           //           top: 60,
  //           //           left: 0,
  //           //           right: 0,
  //           //           child: Icon(Icons.account_circle),
  //           //         ),
  //           //         Positioned(
  //           //           left: 0,
  //           //           right: 0,
  //           //           bottom: 0,
  //           //           child: Container(
  //           //             //height: 30,
  //           //             width: 110,
  //           //             decoration: const BoxDecoration(
  //           //               //color: homeController.employeeEnum.value == EmployeeEnum.attendance? AppColors.primaryBlue : AppColors.textGrey2,
  //           //             ),
  //           //             child: const Center(child: Text("${AppString.employeeUP}\n${AppString.leaveBalanceUP}",overflow: TextOverflow.ellipsis, style: TextStyle(color: AppColors.primaryGreen, fontSize: 12),textAlign: TextAlign.center,)),
  //           //           ),
  //           //         ),
  //           //       ],
  //           //     ),
  //           //   ),
  //           // ),
  //           // GestureDetector(
  //           //   child: Card(
  //           //     elevation: 1,
  //           //     child: Container(
  //           //       height: size.height*0.18,
  //           //       width: size.width*0.280,
  //           //       decoration: BoxDecoration(
  //           //           color: Colors.white,
  //           //           shape: BoxShape.rectangle,
  //           //           borderRadius: BorderRadius.circular(5)
  //           //       ),
  //           //       child: Stack(
  //           //         children: [
  //           //           Positioned(
  //           //             top: 30,
  //           //             left: 0,
  //           //             right: 0,
  //           //             child: Container(
  //           //               height: 80,
  //           //               width: 80,
  //           //               decoration: BoxDecoration(color: AppColors.yellow100, shape: BoxShape.circle),
  //           //               child: Icon(Icons.balance,size: 48,color: AppColors.primaryBlue,)
  //           //             ),
  //           //           ),
  //           //           Positioned(
  //           //             left: 0,
  //           //             right: 0,
  //           //             bottom: 5,
  //           //             child: Container(
  //           //               //height: 30,
  //           //               width: 110,
  //           //               decoration: const BoxDecoration(
  //           //                 //color: homeController.employeeEnum.value == EmployeeEnum.attendance? AppColors.primaryBlue : AppColors.textGrey2,
  //           //               ),
  //           //               child: const Center(child: Text("${AppString.myLeaveUP}\n${AppString.balanceUP}",overflow: TextOverflow.ellipsis, style: TextStyle(color: AppColors.primaryGreen, fontSize: 12),textAlign: TextAlign.center,)),
  //           //             ),
  //           //           ),
  //           //         ],
  //           //       ),
  //           //     ),
  //           //   ),
  //           //   onTap: (){
  //           //     debugPrint('My Leave Balance Pressed');
  //           //     Get.toNamed('/leave_balance_page');
  //           //   },
  //           // ),
  //           /*Container(
  //                           height: size.height*0.18,
  //                           width: size.width*0.285,
  //                           decoration: BoxDecoration(
  //                               color: Colors.white,
  //                               shape: BoxShape.rectangle,
  //                               borderRadius: BorderRadius.circular(5)
  //                           ),
  //                           child: const Text("Box 1"),
  //                         ),*/
  //         ],
  //       ),
  //       SizedBox(height: size.height*0.02,),
  //       //5
  //       Row(
  //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //         children: [
  //           // Card(
  //           //   elevation: 1,
  //           //   child: Container(
  //           //     height: size.height*0.18,
  //           //     width: size.width*0.280,
  //           //     decoration: BoxDecoration(
  //           //         color: Colors.white,
  //           //         shape: BoxShape.rectangle,
  //           //         borderRadius: BorderRadius.circular(5)
  //           //     ),
  //           //     child: Stack(
  //           //       children: [
  //           //         const Positioned(
  //           //           top: 60,
  //           //           left: 0,
  //           //           right: 0,
  //           //           child: Icon(Icons.account_circle),
  //           //         ),
  //           //         Positioned(
  //           //           left: 0,
  //           //           right: 0,
  //           //           bottom: 5,
  //           //           child: Container(
  //           //             //height: 30,
  //           //             width: 110,
  //           //             decoration: const BoxDecoration(
  //           //               //color: homeController.employeeEnum.value == EmployeeEnum.attendance? AppColors.primaryBlue : AppColors.textGrey2,
  //           //             ),
  //           //             child: const Center(child: Text("${AppString.leaveUP}\n${AppString.calenderUP}",overflow: TextOverflow.ellipsis, style: TextStyle(color: AppColors.primaryGreen, fontSize: 12),textAlign: TextAlign.center,)),
  //           //           ),
  //           //         ),
  //           //       ],
  //           //     ),
  //           //   ),
  //           // ),
  //           GestureDetector(
  //             child: const CustomCard(svgString: AppImageString.leaveApplicationSvg, title: "ALL\nLEAVE APPLICATION"),
  //             onTap: (){
  //               //Get.toNamed('/my_attendance_page');
  //             },
  //           ),
  //           // Card(
  //           //   elevation: 1,
  //           //   child: Container(
  //           //     height: size.height*0.18,
  //           //     width: size.width*0.280,
  //           //     decoration: BoxDecoration(
  //           //         color: Colors.white,
  //           //         shape: BoxShape.rectangle,
  //           //         borderRadius: BorderRadius.circular(5)
  //           //     ),
  //           //     child: Stack(
  //           //       children: [
  //           //         const Positioned(
  //           //           top: 60,
  //           //           left: 0,
  //           //           right: 0,
  //           //           child: Icon(Icons.account_circle),
  //           //         ),
  //           //         Positioned(
  //           //           left: 0,
  //           //           right: 0,
  //           //           bottom: 5,
  //           //           child: Container(
  //           //             //height: 30,
  //           //             width: 110,
  //           //             decoration: const BoxDecoration(
  //           //               //color: homeController.employeeEnum.value == EmployeeEnum.attendance? AppColors.primaryBlue : AppColors.textGrey2,
  //           //             ),
  //           //             child: const Center(child: Text("${AppString.employeeUP}\n${AppString.leaveBalanceUP}",overflow: TextOverflow.ellipsis, style: TextStyle(color: AppColors.primaryGreen, fontSize: 12),textAlign: TextAlign.center,)),
  //           //           ),
  //           //         ),
  //           //       ],
  //           //     ),
  //           //   ),
  //           // ),
  //           GestureDetector(
  //             child: const CustomCard(myIcon: Icons.access_time, title: "${AppString.employeeUP}\n${AppString.leaveBalanceUP}"),
  //             onTap: (){
  //               //Get.toNamed('/my_attendance_page');
  //             },
  //           ),
  //           // Card(
  //           //   elevation: 1,
  //           //   child: Container(
  //           //     height: size.height*0.18,
  //           //     width: size.width*0.280,
  //           //     decoration: BoxDecoration(
  //           //         color: Colors.white,
  //           //         shape: BoxShape.rectangle,
  //           //         borderRadius: BorderRadius.circular(5)
  //           //     ),
  //           //     child: Stack(
  //           //       children: [
  //           //         const Positioned(
  //           //           top: 60,
  //           //           left: 0,
  //           //           right: 0,
  //           //           child: Icon(Icons.account_circle),
  //           //         ),
  //           //         Positioned(
  //           //           left: 0,
  //           //           right: 0,
  //           //           bottom: 5,
  //           //           child: Container(
  //           //             //height: 30,
  //           //             width: 110,
  //           //             decoration: const BoxDecoration(
  //           //               //color: homeController.employeeEnum.value == EmployeeEnum.attendance? AppColors.primaryBlue : AppColors.textGrey2,
  //           //             ),
  //           //             child: const Center(child: Text("${AppString.myLeaveUP}\n${AppString.balanceUP}",overflow: TextOverflow.ellipsis, style: TextStyle(color: AppColors.primaryGreen, fontSize: 12),textAlign: TextAlign.center,)),
  //           //           ),
  //           //         ),
  //           //       ],
  //           //     ),
  //           //   ),
  //           // ),
  //           GestureDetector(
  //             child: const CustomCard(myIcon: Icons.access_time, title: "${AppString.myLeaveUP}\n${AppString.balanceUP}"),
  //             onTap: (){
  //               //Get.toNamed('/my_attendance_page');
  //             },
  //           ),
  //           /*Container(
  //                           height: size.height*0.18,
  //                           width: size.width*0.285,
  //                           decoration: BoxDecoration(
  //                               color: Colors.white,
  //                               shape: BoxShape.rectangle,
  //                               borderRadius: BorderRadius.circular(5)
  //                           ),
  //                           child: const Text("Box 1"),
  //                         ),*/
  //         ],
  //       ),
  //     ],
  //   );
  // }

  _logOut() async {
    return showDialog<void>(
      context: Get.context!,
      barrierDismissible: true, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Center(child: Text('>>>>> LOGOUT <<<<<', style: TextStyle(color: AppColors.primaryBlue),)),
          content: const SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text('Are you sure you want to logout?',textAlign: TextAlign.center,style: TextStyle(color: AppColors.primaryRed)),
              ],
            ),
          ),
          actions: <Widget>[
            OutlinedButton(
              child: const Text('Cancel'),
              onPressed: () {
                Navigator.of(context).pop(); // Dismiss the Dialog
              },
            ),
            OutlinedButton(
              child: const Text('Logout'),
              onPressed: () {
                //Navigator.of(context).pop(); // Navigate to login
                Get.offAllNamed('/login_page');
                getBox.remove('name');
                getBox.remove('profilePhoto');
                getBox.remove('token');
              },
            ),
          ],
        );
      },
    );
  }

}
