import 'package:babulandhrm/utils/app_sizes.dart';
import 'package:babulandhrm/views/profile_page/controller/profile_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../utils/app_colors.dart';
class ProfilePage extends StatelessWidget {
  final profileController = Get.find<ProfileController>();
  /*const*/ ProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: _appBar(),
        body: Column(
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
                        color: AppColors.primaryBlue
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
                                Uri phoneNo = Uri.parse('tel:01600000000');
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
                                Uri phoneNo = Uri.parse('sms:01600000000');
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
                                /*child: ClipOval(
                                  child: Container(
                                    //height: 00,
                                    //width: 00,
                                    color: Colors.white70,
                                    child: Container(
                                      color: Colors.white,
                                      //child: const Icon(Icons.account_circle,size: 80,),
                                      child: Image.network("https://avatars.githubusercontent.com/u/92568244?v=4", fit: BoxFit.cover),
                                    ),
                                  ),
                                ),*/
                              ),
                              SizedBox(width: size.width*0.05,),
                              Column(
                                children: [
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: const [
                                      Text("Emon Al Mamun",style: TextStyle(color:AppColors.textBlue,fontWeight: FontWeight.bold, fontSize: AppSizes.size20),),
                                      Text("Mobile App Developer, 0392",style: TextStyle(color:AppColors.textBlue, fontSize: AppSizes.size14),),
                                      //Text("ID : 0392",style: TextStyle(color:AppColors.textWhite),),
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
                      children: const [
                        ListTile(
                          //dense: true,
                          contentPadding: EdgeInsets.zero,
                          leading: Icon(Icons.linear_scale, color: AppColors.primaryBlue, size: AppSizes.size30,),
                          title: Text("30-08-2010", style: TextStyle(fontWeight: FontWeight.bold),),
                          subtitle: Text("Date of Birth"),
                        ),
                        ListTile(
                          //dense: true,
                          contentPadding: EdgeInsets.zero,
                          leading: Icon(Icons.linear_scale, color: AppColors.primaryBlue, size: AppSizes.size30,),
                          title: Text("1234567890", style: TextStyle(fontWeight: FontWeight.bold),),
                          subtitle: Text("National Id"),
                        ),
                        ListTile(
                          //dense: true,
                          contentPadding: EdgeInsets.zero,
                          leading: Icon(Icons.linear_scale, color: AppColors.primaryBlue, size: AppSizes.size30,),
                          title: Text("Bangladeshi", style: TextStyle(fontWeight: FontWeight.bold),),
                          subtitle: Text("Nationality"),
                        ),
                        ListTile(
                          //dense: true,
                          contentPadding: EdgeInsets.zero,
                          leading: Icon(Icons.linear_scale, color: AppColors.primaryBlue, size: AppSizes.size30,),
                          title: Text("example@gmail.com", style: TextStyle(fontWeight: FontWeight.bold),),
                          subtitle: Text("Email"),
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
                          title: Text("0392", style: TextStyle(fontWeight: FontWeight.bold),),
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

  _appBar(){
    return AppBar(
      title: const Text("Profile", style: TextStyle(color: AppColors.textWhite),),
      centerTitle: true,
      elevation: 1,
      //backgroundColor: Colors.transparent,
      backgroundColor: AppColors.primaryBlue,
      iconTheme: const IconThemeData(
          color: AppColors.textWhite
      ),
    );
  }
}
