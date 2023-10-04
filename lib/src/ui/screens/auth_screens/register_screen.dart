import 'dart:developer';

import 'package:cricket_fantacy/src/controllers/auth_controllers.dart';
import 'package:cricket_fantacy/src/controllers/facebool_auth_controller.dart';
import 'package:cricket_fantacy/src/ui/screens/auth_screens/login_screen.dart';
import 'package:cricket_fantacy/src/ui/screens/auth_screens/otp_screen.dart';
import 'package:cricket_fantacy/src/ui/screens/upcomming_feature_screen.dart';
import 'package:cricket_fantacy/src/utils/color_scheme.dart';
import 'package:cricket_fantacy/src/utils/image_utils.dart';
import 'package:cricket_fantacy/src/utils/messages.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  bool _isActive = true;
  var controller = Get.put(AuthController());
  bool isCheckBottonTrue=false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConstant.bg_color,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: ColorConstant.primaryColor,
        leading: InkWell(
          onTap: () {
            Navigator.pop(context);
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
              "Register",
              style: TextStyle(
                  color: ColorConstant.primaryWhiteColor,
                  fontSize: 17,
                  fontWeight: FontWeight.w600),
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Column(children: [
          Padding(
            padding: const EdgeInsets.all(15.0),
            // child: Row(
            //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //   children: [
                
                // InkWell(
                //   onTap: () {
                //    signInWithFacebook().then((value) {
                //       debugger();
                //     });
                //   },
                //   child: Container(
                //     height: 40,
                //     width: MediaQuery.of(context).size.width / 2.3,
                //     decoration: BoxDecoration(
                //         color: ColorConstant.primaryWhiteColor,
                //         borderRadius: BorderRadius.circular(5),
                //         boxShadow: [
                //           BoxShadow(
                //             color: Colors.grey.withOpacity(0.2),
                //             spreadRadius: 1,
                //             blurRadius: 5,
                //             offset: Offset(0, 3), // changes position of shadow
                //           ),
                //         ],
                //         border: Border.all(
                //             width: 1, color: ColorConstant.deviderColor)),
                //     alignment: Alignment.center,
                //     child: Row(
                //       mainAxisAlignment: MainAxisAlignment.center,
                //       children: [
                //         Icon(
                //           Icons.facebook,
                //           size: 25,
                //           color: Colors.blue,
                //         ),
                //         SizedBox(
                //           width: 10,
                //         ),
                //         Text(
                //           "Facebook",
                //           style: TextStyle(
                //               fontSize: 16,
                //               fontWeight: FontWeight.w600,
                //               color: ColorConstant.primaryBlackColor),
                //         ),
                //       ],
                //     ),
                //   ),
                // ),
             
           child:  
                InkWell(
                  onTap: () {

                     if(isCheckBottonTrue){
                      controller.registerWithGoogle(context);
                    }else{
                      Messages().showErrorMsg(context: context, message: 'Please check Terms & Conditions and Privacy Policy Firtst');
                    }
                   
                    // Navigator.push(context, MaterialPageRoute(builder: (context){
                    //   return UpcommingFeatureScreen();
                    // }));
                  },
                  child: Container(
                    height: 40,
                    width: MediaQuery.of(context).size.width / 1,
                    decoration: BoxDecoration(
                        color: ColorConstant.primaryWhiteColor,
                        borderRadius: BorderRadius.circular(5),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.2),
                            spreadRadius: 1,
                            blurRadius: 5,
                            offset: Offset(0, 3), // changes position of shadow
                          ),
                        ],
                        border: Border.all(
                            width: 1, color: ColorConstant.deviderColor)),
                    alignment: Alignment.center,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "G",
                          style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: ColorConstant.primaryColor),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Text(
                          "Google",
                          style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                              color: ColorConstant.primaryBlackColor),
                        ),
                      ],
                    ),
                  ),
              
              
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: TextFormField(
              controller: controller.referByController,
              onChanged: (val) {},
              decoration: InputDecoration(
                  suffixIcon: Icon(
                    Icons.paste,
                    size: 20,
                    color: ColorConstant.primaryBlackColor,
                  ),
                  filled: true,
                  hintText: "Enter invited code"),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: TextFormField(
              controller: controller.phoneNumberController,
              enabled: true,
              onChanged: (val) {},
              decoration: InputDecoration(
                  filled: true, hintText: "Email or Mobile No."),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(15, 15, 15, 20),
            child: InkWell(
              onTap: () {
                if (isCheckBottonTrue &&  _isActive == true) {
                  controller.verifyRefferalCode(context);
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
                    color: isCheckBottonTrue == true
                        ? ColorConstant.primaryBlackColor
                        : Colors.grey[400]),
                alignment: Alignment.center,
                child: Text(
                  "Next",
                  style: TextStyle(
                      color: ColorConstant.primaryWhiteColor,
                      fontSize: 16,
                      fontWeight: FontWeight.w600),
                ),
              ),
            ),
          ),
          InkWell(
            onTap: () {
              controller.phoneNumberController.clear();
              Get.deleteAll();
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return const LoginScreen();
              }));
            },
            child:
            
             Text(
              "Already have an account? Login",
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 12,
                  fontWeight: FontWeight.w600),
            ),
          ),
          
         Padding(
            padding: const EdgeInsets.all(15.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                InkWell(
                  onTap: () {
                    setState(() {
                      isCheckBottonTrue = !isCheckBottonTrue;
                    });
                  },
                  child: Icon(
                    isCheckBottonTrue == false
                        ? Icons.check_box_outline_blank_outlined
                        : Icons.check_box,
                    size: 20,
                    color: ColorConstant.primaryColor,
                  ),
                ),
                SizedBox(
                  width: 10,
                ),
                Row(
                  children: [
                    Text(
                      "I Agree all ",
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 12,
                          fontWeight: FontWeight.w600),
                    ),
                    InkWell(
                      onTap: () async {
                       openWeb('https://myfancy11.com/terms.html');
                      },
                      child: Text(
                        "Terms & Conditions",
                        style: TextStyle(
                            decoration: TextDecoration.underline,
                            color: Colors.black,
                            fontSize: 12,
                            fontWeight: FontWeight.w600),
                      ),
                    ),
                    Text(
                      " and ",
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 12,
                          fontWeight: FontWeight.w600),
                    ),
                    InkWell(
                      onTap: (){
                        openWeb('https://myfancy11.com/privacy.html');
                      },
                      child: Text(
                        "Privacy Policy",
                        style: TextStyle(
                            decoration: TextDecoration.underline,
                            color: Colors.black,
                            fontSize: 12,
                            fontWeight: FontWeight.w600),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          )
      
        ]),
      ),
    );
  }



    void openWeb(String url){
 launchUrl(Uri.parse(url),
 mode: LaunchMode.inAppWebView,
 );
  }
}
