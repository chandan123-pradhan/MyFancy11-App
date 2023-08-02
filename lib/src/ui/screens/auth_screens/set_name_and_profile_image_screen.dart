import 'dart:io';

import 'package:cricket_fantacy/src/controllers/auth_controllers.dart';
import 'package:cricket_fantacy/src/controllers/splash_controller.dart';
import 'package:cricket_fantacy/src/ui/screens/auth_screens/otp_screen.dart';
import 'package:cricket_fantacy/src/utils/color_scheme.dart';
import 'package:cricket_fantacy/src/utils/image_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class ProfileSetupScreen extends StatefulWidget {
  const ProfileSetupScreen({super.key});

  @override
  State<ProfileSetupScreen> createState() => _ProfileSetupScreenState();
}

class _ProfileSetupScreenState extends State<ProfileSetupScreen> {
  bool _isActive = true;
  var controller = Get.put(AuthController());
  int selectedIndex=-1;

@override
  void initState() {
     controller.getAwatarList(context);
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConstant.bg_color,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: ColorConstant.primaryColor,
        leading: InkWell(
          onTap: () {
           // Navigator.pop(context);
          },
          child: Icon(
            Icons.navigate_before,
            size: 30,
            color: ColorConstant.primaryWhiteColor,
          ),
        ),
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Profie Setup",
              style: TextStyle(
                  color: ColorConstant.primaryWhiteColor,
                  fontSize: 17,
                  fontWeight: FontWeight.w600),
            ),
          ],
        ),
      ),
      body: GetBuilder<AuthController>(
        init: AuthController(),
        builder: (controller) {
          return 
          
          controller.awatarListApiResponse==null?Center(
            child: CircularProgressIndicator(color: ColorConstant.primaryColor,),
          ):
          SingleChildScrollView(
            child: Column(children: [
              SizedBox(
                height: 20,
              ),
               Container(
                alignment: Alignment.centerLeft,
                 child: Padding(
                   padding: const EdgeInsets.only(left:20),
                   child: Text("Select Awatar",style: TextStyle(
                          color: ColorConstant.primaryBlackColor,
                          fontSize: 15,
                          fontWeight: FontWeight.w600
                        ),),
                 ),
               ),
                    SizedBox(
                height: 10,
              ),

              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                   
                    for(int i=0;i<controller.awatarListApiResponse!.data.length;i++)
                     Padding(
                       padding: const EdgeInsets.only(left:10,right: 10),
                       child: InkWell(
                        onTap: (){
                          setState(() {
                            selectedIndex=i;
                          });
                          controller.selectAwatar(controller.awatarListApiResponse!.data[i].avatar);
                        },
                         child: Container(
                          height: 60,
                          width: 60,
decoration: BoxDecoration(
  border: 
  selectedIndex==i?
  Border.all(width: 5,color: ColorConstant.primaryColor):Border.all(
    width: 1,color: Colors.transparent
  ),
  shape: BoxShape.circle,
  image: DecorationImage(image: NetworkImage(controller.awatarListApiResponse!.data[i].avatar))
),                       // backgroundColor: ColorConstant.primaryColor,
                       
                          ),
                       ),
                     ),
                  ],
                ),
              ),
                  
                 
              SizedBox(height: 16),
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: TextFormField(
                  controller: controller.nameController,
                  onChanged: (val) {},
                  decoration: InputDecoration(
                      suffixIcon: Icon(
                        Icons.paste,
                        size: 20,
                        color: ColorConstant.primaryBlackColor,
                      ),
                      filled: true,
                      hintText: "Enter Name"),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: TextFormField(
                  controller: controller.emailController,
                  onChanged: (val) {},
                  decoration: InputDecoration(filled: true, hintText: "Email"),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(15, 15, 15, 20),
                child: InkWell(
                  onTap: () {
                    if (_isActive == true) {
                      controller.updateProfile(context);
                      // Navigator.push(
                      //   context,
                      //   (MaterialPageRoute(
                      //     builder: (context) {
                      //       return OtpScreen();
                      //     },
                      //   )),
                      // );
                    }
                  },
                  child: Container(
                    height: 40,
                    width: MediaQuery.of(context).size.width / 1,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        color: _isActive == true
                            ? ColorConstant.primaryBlackColor
                            : Colors.grey[400]),
                    alignment: Alignment.center,
                    child: Text(
                      "Update",
                      style: TextStyle(
                          color: ColorConstant.primaryWhiteColor,
                          fontSize: 16,
                          fontWeight: FontWeight.w600),
                    ),
                  ),
                ),
              ),
              Text(
                "Not Now? Skip",
                style: TextStyle(
                    color: Colors.black, fontSize: 12, fontWeight: FontWeight.w600),
              ),
            ]),
          );
        }
      ),
    );
  }
}
