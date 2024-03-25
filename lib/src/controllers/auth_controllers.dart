import 'dart:developer';
import 'dart:io';

import 'package:cricket_fantacy/src/controllers/google_signing.dart';
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
import 'package:firebase_messaging/firebase_messaging.dart';
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
  void callValidatePhoneApi(context, type, isForResend) async {
    homeController.getSplashData(context, 0);
    if (phoneNumberController.text.length == 10) {
      Map data = {
        NetworkConstant.PHONE_PARAMS: phoneNumberController.text,
        'type': type
      };
      // debugger();
      try {
        showLoaderDialog(context);
        var response = await apiProvider.postBeforeAuth(
            routeUrl: NetworkConstant.VERIFY_MOBILE_NUMBER_URL,
            bodyParams: data);
        Navigator.pop(context);

//  debugger();
        print(response);
        if (response['status'] == 200) {
          if (type == 'register') {
            // validatePhoneNumberApiResponse =
            //     ValidatePhoneNumberApiResponse.fromJson(response);
            messages.showMsg(
                context: context,
                message: "Mobile Number Already Register Please Login");
          } else {
            validatePhoneNumberApiResponse =
                ValidatePhoneNumberApiResponse.fromJson(response);
            messages.showMsg(
                context: context,
                message: "OTP Has been shared on your Number");
            if (isForResend == false) {
              _navigateToOtpPage(context, type);
            }
          }
        } else if (response['status'] == 400) {
          validatePhoneNumberApiResponse =
              ValidatePhoneNumberApiResponse.fromJson(response);
          if (isForResend == false) {
            _navigateToOtpPage(context, type);
          }
        } else {
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

  void subscribeToTopic() {
    FirebaseMessaging.instance.subscribeToTopic('all_users').then((value) {
      print('Subscribed to "all_users" topic');
    }).catchError((error) {
      print('Error subscribing to "all_users" topic: $error');
    });
  }

  void _navigateToOtpPage(context, type) {
    Navigator.push(
      context,
      (MaterialPageRoute(
        builder: (context) {
          return OtpScreen(type: type);
        },
      )),
    );
  }

  void validateOtp(context, type) {
    print(otpController.text);
    if (validatePhoneNumberApiResponse.otp.toString() == otpController.text) {
      messages.showMsg(
          context: context, message: "OTP Verified Successfully Done.");
      otpController.clear();
      // debugger();

      if (type == 'register') {
        callRegisterApi(context);
      } else {
        debugger();
        if (isUnAuthenicated) {
          messages.showErrorMsg(
              context: context,
              message: "You have not registered, please register first.");
          // //for new user.
          // Navigator.pushAndRemoveUntil(context,
          //     MaterialPageRoute(builder: (context) {
          //   return const RegisterScreen();
          // }), (route) => false);
        } else {
          callLoginApi(context);
        }
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
    final fcmToken = await FirebaseMessaging.instance.getToken();
    debugger();
    print("fireabase token = $fcmToken");
    Map parameter = {
      NetworkConstant.Login_Method: 'phone',
      NetworkConstant.Login_Id: phoneNumberController.text,
      NetworkConstant.Device_Name: modelName,
      NetworkConstant.One_Signal: 'ssss',
      'firebase': fcmToken
    };

    //debugger();
    var response = await apiProvider.postBeforeAuthWithAppToken(
        routeUrl: NetworkConstant.LOGIN_ROUTE_URL, bodyParams: parameter);
    //  debugger();
    print(response);
    loginApiResponse = LoginApiResponse.fromJson(response);
    sharedPref.setUserToken(loginApiResponse.data.userToken);
    sharedPref.setProfilepic(loginApiResponse.data.profile);
    sharedPref.setProfileDetails(loginApiResponse.data.name,
        loginApiResponse.data.email, loginApiResponse.data.phone);
    sharedPref.saveAuthToken();
    sharedPref.setLoginStatus();
    subscribeToTopic();
    Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) {
      return DashboardScreen(
        index: 0,
        isFirstTime: true,
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
    final fcmToken = await FirebaseMessaging.instance.getToken();
    Map parameter = {
      NetworkConstant.Login_Method: 'phone',
      NetworkConstant.Login_Id: phoneNumberController.text,
      NetworkConstant.Reffer_By: referByController.text,
      NetworkConstant.Device_Name: modelName,
      NetworkConstant.One_Signal: 'ssss',
      'firebase': fcmToken
    };
    debugger();
    try {
      var response = await apiProvider.postBeforeAuthWithAppToken(
          routeUrl: NetworkConstant.REGISTER_ROUTE_URL, bodyParams: parameter);
      debugger();

      if (response['status'] == 200) {
        loginApiResponse = LoginApiResponse.fromJson(response);
        //debugger();
        sharedPref.setUserToken(loginApiResponse.data.userToken);
        sharedPref.setProfilepic(loginApiResponse.data.profile);
        messages.showMsg(
            context: context, message: 'Registration Successfully Done.');
        sharedPref.saveAuthToken();
        homeController.getSplashData(context, 0);
        subscribeToTopic();
        Navigator.pop(context);
        Navigator.pushAndRemoveUntil(context,
            MaterialPageRoute(builder: (context) {
          return ProfileSetupScreen();
        }), (route) => false);
      } else if (response['status'] == 400) {
        messages.showMsg(context: context, message: response['message']);
        Navigator.pop(context);
      }
    } catch (e) {
      Navigator.pop(context);
      messages.showErrorMsg(
          context: context, message: 'Registration Failed Please Try Again.');
    }
  }

  void verifyRefferalCode(context) async {
    if (referByController.text.isNotEmpty) {
      showLoaderDialog(context);
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
      callValidatePhoneApi(context, 'register', false);
    }
  }

//  callRegisterApi(context);

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

  updateProfile(
    context,
  ) async {
    if (nameController.text.isNotEmpty) {
      if (emailController.text.isNotEmpty && emailController.text.isEmail) {
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
          sharedPref.setProfileDetails(nameController.text,
              emailController.text, updateProfileApiReponse.updatedData.phone);
          sharedPref.setLoginStatus();
          messages.showMsg(
              context: context, message: updateProfileApiReponse.message);

          Navigator.pushAndRemoveUntil(context,
              MaterialPageRoute(builder: (context) {
            return DashboardScreen(
              index: 0,
              isFirstTime: true,
            );
          }), (route) => false);
        } catch (e) {
          //getAwatarList(context);
        }
      } else {
        messages.showErrorMsg(context: context, message: 'Enter A valid Email');
      }
    } else {
      messages.showErrorMsg(context: context, message: 'Enter Name first');
    }
  }

  void selectAwatar(String link) {
    selectedAwatarLink = link;
    update();
  }

  void googleLogin(context) {
    showLoaderDialog(context);
    try {
      GoogleSignInService().signInWithGoogle().then((value) async {
        //  debugger();
        if (value != null) {
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
            NetworkConstant.Login_Method: 'google',
            NetworkConstant.Login_Id: value.email,
            NetworkConstant.Device_Name: modelName,
            NetworkConstant.One_Signal: 'ssss'
          };

          var response = await apiProvider.postBeforeAuthWithAppToken(
              routeUrl: NetworkConstant.LOGIN_ROUTE_URL, bodyParams: parameter);
          //    debugger();
          print(response);
          if (response == null) {
            messages.showErrorMsg(
                context: context, message: 'Account not found');
            // account not found.
            Navigator.pop(context);
          } else {
            loginApiResponse = LoginApiResponse.fromJson(response);
            sharedPref.setUserToken(loginApiResponse.data.userToken);
            sharedPref.setProfilepic(loginApiResponse.data.profile);
            sharedPref.setProfileDetails(loginApiResponse.data.name,
                loginApiResponse.data.email, loginApiResponse.data.phone);
            sharedPref.saveAuthToken();
            sharedPref.setLoginStatus();
            homeController.getSplashData(context, 1);
            // Navigator.pushAndRemoveUntil(context,
            //     MaterialPageRoute(builder: (context) {
            //   return DashboardScreen(
            //     index: 0,
            //   );
            // }), (route) => false);
          }
        }
      });
    } catch (e) {
      Navigator.pop(context);
    }
  }

  void registerWithGoogle(context) {
    showLoaderDialog(context);
    GoogleSignInService().signInWithGoogle().then((value) async {
      if (value != null) {
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
          NetworkConstant.Login_Method: 'google',
          NetworkConstant.Login_Id: value.email,
          NetworkConstant.Reffer_By: referByController.text,
          NetworkConstant.Device_Name: modelName,
          NetworkConstant.One_Signal: 'ssss'
        };
        try {
          var response = await apiProvider.postBeforeAuthWithAppToken(
              routeUrl: NetworkConstant.REGISTER_ROUTE_URL,
              bodyParams: parameter);
          debugger();
          if (response['status'] == 400) {
            Navigator.pop(context);
            messages.showErrorMsg(
                context: context, message: response['message']);
          } else {
            loginApiResponse = LoginApiResponse.fromJson(response);

            sharedPref.setUserToken(loginApiResponse.data.userToken);
            sharedPref.setProfilepic(loginApiResponse.data.profile);
            messages.showMsg(
                context: context, message: 'Registration Successfully Done.');
            sharedPref.saveAuthToken();
            homeController.getSplashData(context, 0);
            Navigator.pop(context);
            Navigator.pushAndRemoveUntil(context,
                MaterialPageRoute(builder: (context) {
              return ProfileSetupScreen(
                email: value.email,
              );
            }), (route) => false);
          }
        } catch (e) {
          Navigator.pop(context);
          messages.showErrorMsg(
              context: context,
              message: 'Registration Failed Please Try Again.');
        }
      }
    });
  }

  void updateEmail(value) {
    if (value != null) {
      emailController.text = value;
    }
    update();
  }
}
