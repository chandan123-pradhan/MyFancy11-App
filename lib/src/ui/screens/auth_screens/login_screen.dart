import 'dart:developer';

import 'package:cricket_fantacy/src/controllers/auth_controllers.dart';
import 'package:cricket_fantacy/src/controllers/facebool_auth_controller.dart';
import 'package:cricket_fantacy/src/ui/screens/auth_screens/otp_screen.dart';
import 'package:cricket_fantacy/src/ui/screens/auth_screens/register_screen.dart';
import 'package:cricket_fantacy/src/ui/screens/upcomming_feature_screen.dart';
import 'package:cricket_fantacy/src/utils/color_scheme.dart';
import 'package:cricket_fantacy/src/utils/image_utils.dart';
import 'package:cricket_fantacy/src/utils/messages.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:get/instance_manager.dart';
import 'package:url_launcher/url_launcher.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool _isActive = false;
  var controller = Get.put(AuthController());
  bool isCheckBottonTrue = false;

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
              "Login",
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
             SizedBox(height: 15,),
          Padding(
            padding: const EdgeInsets.all(0.0),
            child: 
                // InkWell(
                //   onTap: () {
                //     signInWithFacebook().then((value) {
                //       debugger();
                //     });
                //     // Navigator.push(context,
                //     //     MaterialPageRoute(builder: (context) {
                //     //   return UpcommingFeatureScreen();
                //     // }));
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
              
           
                InkWell(
                  onTap: () {
                    if(isCheckBottonTrue){
                      controller.googleLogin(context);
                    }else{
                      Messages().showErrorMsg(context: context, message: 'Please check Terms & Conditions and Privacy Policy Firtst');
                    }
                    // Navigator.push(context, MaterialPageRoute(builder: (context){
                    //   return UpcommingFeatureScreen();
                    // }));
                  },
                  child:  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
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
          ),
             SizedBox(height: 15,),
          Text(
            "Or",
            style: TextStyle(
                color: Colors.black54,
                fontSize: 12,
                fontWeight: FontWeight.w400),
          ),
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: TextFormField(
              controller: controller.phoneNumberController,
              onChanged: (val) {
                if (val.isNotEmpty) {
                  setState(() {
                    _isActive = true;
                  });
                } else {
                  setState(() {
                    _isActive = false;
                  });
                }
              },
              decoration: InputDecoration(
                  filled: true, hintText: "Email or Mobile No."),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(15, 15, 15, 20),
            child: InkWell(
              onTap: () {
                if (_isActive == true && isCheckBottonTrue) {
                  controller.callValidatePhoneApi(context);
                }
              },
              child: Container(
                height: 40,
                width: MediaQuery.of(context).size.width / 1,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    color: isCheckBottonTrue && _isActive == true
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
              Navigator.push(
                context,
                (MaterialPageRoute(
                  builder: (context) {
                    return const RegisterScreen();
                  },
                )),
              );
            },
            child: Text(
              "Not a member? Register",
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
                      "I Agree all to ",
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
