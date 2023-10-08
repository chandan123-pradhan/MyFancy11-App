import 'package:cricket_fantacy/src/controllers/auth_controllers.dart';
import 'package:cricket_fantacy/src/ui/screens/dashboard_screen.dart';
import 'package:cricket_fantacy/src/utils/color_scheme.dart';
import 'package:cricket_fantacy/src/utils/image_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:get/get.dart';
import 'package:pinput/pinput.dart';

class OtpScreen extends StatefulWidget {
  String type;
  OtpScreen({required this.type});
  // const OtpScreen({super.key});

  @override
  State<OtpScreen> createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
  bool _isActive = false;
  var controller = Get.put(AuthController());
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
              "Verify OTP",
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
            padding: const EdgeInsets.all(15),
            child: Container(
              alignment: Alignment.centerLeft,
              child: Text(
                "Otp sent to ${controller.phoneNumberController.text}",
                style: TextStyle(
                    color: ColorConstant.disableColor,
                    fontSize: 14,
                    fontWeight: FontWeight.w400),
              ),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  border: Border.all(width: 1, color: Colors.black54)),
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  children: [
                    Text(
                      "Enter the OTP you received",
                      style: TextStyle(
                          color: ColorConstant.primaryBlackColor,
                          fontSize: 14,
                          fontWeight: FontWeight.w400),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width/1,
                      height: 50,
                      child: Pinput(
                        onChanged: (val){
                          if(val!=null){
                            setState(() {
                              _isActive=true;
                            });
                          }else{
                            setState(() {
                              _isActive=false;
                            });
                          }
                        },
                        controller: controller.otpController,
                        length: 5,
                        onCompleted: (pin) => print(pin),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
         
         
          Padding(
            padding: const EdgeInsets.fromLTRB(15, 15, 15, 20),
            child: InkWell(
              onTap: () {
                if (_isActive == true) {
                  controller.validateOtp(context,widget.type);
                  // Navigator.push(
                  //   context,
                  //   (MaterialPageRoute(
                  //     builder: (context) {
                  //       return DashboardScreen(index: 0,);
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
        ]),
      ),
    );
  }
}
