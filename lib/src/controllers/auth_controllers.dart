import 'dart:developer';
import 'dart:io';

import 'package:cricket_fantacy/src/controllers/splash_controller.dart';
import 'package:cricket_fantacy/src/dialogs/loadingDialog.dart';
import 'package:cricket_fantacy/src/global_variable.dart';
import 'package:cricket_fantacy/src/models/AwatarApiReponse.dart';
import 'package:cricket_fantacy/src/models/login_api_response.dart';
import 'package:cricket_fantacy/src/models/update_profile_api_response.dart';
import 'package:cricket_fantacy/src/models/validate_phone_number_api_response.dart';
import 'package:cricket_fantacy/src/networking/api_provider.dart';
import 'package:cricket_fantacy/src/networking/network_contant.dart';
import 'package:cricket_fantacy/src/ui/screens/auth_screens/otp_screen.dart';
import 'package:cricket_fantacy/src/ui/screens/auth_screens/register_screen.dart';
import 'package:cricket_fantacy/src/ui/screens/dashboard_screen.dart';
import 'package:cricket_fantacy/src/utils/local_storage/shared_prefrences.dart';
import 'package:cricket_fantacy/src/utils/messages.dart';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:http/http.dart';

import '../ui/screens/auth_screens/set_name_and_profile_image_screen.dart';

class AuthController extends GetxController {
  late ValidatePhoneNumberApiResponse validatePhoneNumberApiResponse;
  TextEditingController phoneNumberController = new TextEditingController();
  TextEditingController otpController = new TextEditingController();
  TextEditingController referByController = new TextEditingController();
  TextEditingController emailController = new TextEditingController();
  TextEditingController nameController = new TextEditingController();
  Messages messages = Messages();
  ApiProvider apiProvider = ApiProvider();
  SharedPref sharedPref = SharedPref();
  late LoginApiResponse loginApiResponse;
  AwatarListApiResponse? awatarListApiResponse;
  String selectedAwatarLink = '';
  late UpdateProfileApiReponse updateProfileApiReponse;
  var homeController = Get.put(HomeController());
  void callValidatePhoneApi(context) async {
    homeController.getSplashData(context, 0);
    if (phoneNumberController.text.length == 10) {
      Map data = {NetworkConstant.PHONE_PARAMS: phoneNumberController.text};
      //  debugger();
      try {
        showLoaderDialog(context);
        var response = await apiProvider.postBeforeAuth(
            routeUrl: NetworkConstant.VERIFY_MOBILE_NUMBER_URL,
            bodyParams: data);
        Navigator.pop(context);
//  debugger();
        print(response);
        if (response['status'] == 200) {
          validatePhoneNumberApiResponse =
              ValidatePhoneNumberApiResponse.fromJson(response);
          messages.showMsg(
              context: context,
              message: "OTP has been sent on your mobile number.");
          _navigateToOtpPage(context);
        }
         else {
          messages.showErrorMsg(context: context, message: response['message']);
        }
      } catch (e) {
        print(e);
        messages.showErrorMsg(
            context: context,
            message: 'Something Went Wrong, Please Try Again');
        //  Navigator.pop(context);
      }
    } else {
      messages.showErrorMsg(context: context, message: 'Invalid Phone Number');
    }
  }

  void _navigateToOtpPage(context) {
    Navigator.push(
      context,
      (MaterialPageRoute(
        builder: (context) {
          return OtpScreen();
        },
      )),
    );
  }

  void validateOtp(context) {
    print(otpController.text);
    if (validatePhoneNumberApiResponse.otp.toString() == otpController.text) {
      messages.showMsg(
          context: context, message: "OTP Verified Successfully Done.");

      if (isUnAuthenicated) {
        // //for new user.
        // Navigator.pushAndRemoveUntil(context,
        //     MaterialPageRoute(builder: (context) {
        //   return const RegisterScreen();
        // }), (route) => false);
      } else {
        callLoginApi(context);
      }
    } else {
      messages.showErrorMsg(context: context, message: "Invalid OTP");
    }
  }

  void callLoginApi(context) async {
    DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();
    String modelName = '';
    if (Platform.isAndroid) {
      AndroidDeviceInfo mName = await deviceInfo.androidInfo;
      modelName = mName.model;
    } else if (Platform.isIOS) {
      IosDeviceInfo iosInfo = await deviceInfo.iosInfo;
      modelName = iosInfo.model;
    }

    Map parameter = {
      NetworkConstant.Login_Method: 'phone',
      NetworkConstant.Login_Id: phoneNumberController.text,
      NetworkConstant.Device_Name: modelName,
      NetworkConstant.One_Signal: 'ssss'
    };
    var response = await apiProvider.postBeforeAuthWithAppToken(
        routeUrl: NetworkConstant.LOGIN_ROUTE_URL, bodyParams: parameter);
    print(response);
    loginApiResponse = LoginApiResponse.fromJson(response);
    sharedPref.setUserToken(loginApiResponse.data.userToken);
    sharedPref.setProfilepic(loginApiResponse.data.profile);
    sharedPref.saveAuthToken();
    sharedPref.setLoginStatus();
    Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) {
      return DashboardScreen(
        index: 0,
      );
    }), (route) => false);
  }

  void callRegisterApi(context) async {
    DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();
    String modelName = '';
    if (Platform.isAndroid) {
      AndroidDeviceInfo mName = await deviceInfo.androidInfo;
      modelName = mName.model;
    } else if (Platform.isIOS) {
      IosDeviceInfo iosInfo = await deviceInfo.iosInfo;
      modelName = iosInfo.model;
    }
    Map parameter = {
      NetworkConstant.Login_Method: 'phone',
      NetworkConstant.Login_Id: phoneNumberController.text,
      NetworkConstant.Reffer_By: referByController.text,
      NetworkConstant.Device_Name: modelName,
      NetworkConstant.One_Signal: 'ssss'
    };
    try {
      var response = await apiProvider.postBeforeAuthWithAppToken(
          routeUrl: NetworkConstant.REGISTER_ROUTE_URL, bodyParams: parameter);

      loginApiResponse = LoginApiResponse.fromJson(response);
      //debugger();
      sharedPref.setUserToken(loginApiResponse.data.userToken);
      sharedPref.setProfilepic(loginApiResponse.data.profile);
      messages.showMsg(
          context: context, message: 'Registration Successfully Done.');
      sharedPref.saveAuthToken();
       homeController.getSplashData(context, 0);
      Navigator.pop(context);
      Navigator.pushAndRemoveUntil(context,
          MaterialPageRoute(builder: (context) {
        return const ProfileSetupScreen();
      }), (route) => false);
    } catch (e) {
      Navigator.pop(context);
      messages.showErrorMsg(
          context: context, message: 'Registration Failed Please Try Again.');
    }
  }

  void verifyRefferalCode(context) async {
    showLoaderDialog(context);
    if (referByController.text.isNotEmpty) {
      Map data = {NetworkConstant.Reffer_By: referByController.text};
      var response = await apiProvider.postBeforeAuthWithAppToken(
          routeUrl: NetworkConstant.REFER_VALIDATION_ROUTE_URL,
          bodyParams: data);
      messages.showMsg(context: context, message: response['message']);
      if (response['status'] == 200) {
        callRegisterApi(context);
      } else {
        Navigator.pop(context);
      }
    } else {
      callRegisterApi(context);
    }
  }

  getAwatarList(context) async {
    Map data = {};
    try {
      var response = await apiProvider.postAfterAuth(
          routeUrl: NetworkConstant.GET_AWATAR_LIST_ROUTE_URL,
          bodyParams: data);

      awatarListApiResponse = AwatarListApiResponse.fromJson(response);
      update();
    } catch (e) {
      //getAwatarList(context);
    }
  }

  updateProfile(context) async {
    showLoaderDialog(context);
    Map data = {
      NetworkConstant.PHONE_PARAMS: phoneNumberController.text,
      NetworkConstant.Email: emailController.text,
      NetworkConstant.Profile: selectedAwatarLink,
      NetworkConstant.Name: nameController.text
    };
    try {
      var response = await apiProvider.postAfterAuth(
          routeUrl: NetworkConstant.ACCOUNT_UPDATE_URL, bodyParams: data);
      Navigator.pop(context);
      updateProfileApiReponse = UpdateProfileApiReponse.fromJson(response);
      sharedPref.setProfilepic(updateProfileApiReponse.updatedData.profile);
      sharedPref.setLoginStatus();
      messages.showMsg(
          context: context, message: updateProfileApiReponse.message);

      Navigator.pushAndRemoveUntil(context,
          MaterialPageRoute(builder: (context) {
        return DashboardScreen(
          index: 0,
        );
      }), (route) => false);
    } catch (e) {
      //getAwatarList(context);
    }
  }

  void selectAwatar(String link) {
    selectedAwatarLink = link;
    update();
  }
}
