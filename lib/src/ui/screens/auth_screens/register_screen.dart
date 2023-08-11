import 'package:cricket_fantacy/src/controllers/auth_controllers.dart';
import 'package:cricket_fantacy/src/ui/screens/auth_screens/otp_screen.dart';
import 'package:cricket_fantacy/src/utils/color_scheme.dart';
import 'package:cricket_fantacy/src/utils/image_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:get/get.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  bool _isActive = true;
var controller=Get.put(AuthController());
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
            child: TextFormField(
            controller: controller.referByController,
              onChanged: (val){
                
              },
              decoration: InputDecoration(
                suffixIcon: Icon(Icons.paste,size:20,color: ColorConstant.primaryBlackColor,),
                  filled: true, hintText: "Enter invited code"),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: TextFormField(
              controller:controller.phoneNumberController ,
              enabled: true,
              onChanged: (val){
               
              },
              decoration: InputDecoration(
                  filled: true, hintText: "Email or Mobile No."),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(15, 15, 15, 20),
            child: InkWell(
              onTap: () {
                if (_isActive == true) {
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
                    color: _isActive == true
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
            onTap: (){

              Navigator.pop(context);
                         controller.phoneNumberController.clear();
            },
            child: Text(
              "Already have an account? Login",
              style: TextStyle(
                  color: Colors.black, fontSize: 12, fontWeight: FontWeight.w600),
            ),
          ),
        ]),
      ),
    );
  }
}
