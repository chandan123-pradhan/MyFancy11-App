import 'dart:async';
import 'dart:io';

import 'package:cricket_fantacy/src/models/splahs_api_response.dart';
import 'package:cricket_fantacy/src/networking/api_provider.dart';
import 'package:cricket_fantacy/src/networking/network_contant.dart';
import 'package:cricket_fantacy/src/ui/screens/auth_screens/auth_landing_page.dart';
import 'package:cricket_fantacy/src/ui/screens/dashboard_screen.dart';
import 'package:cricket_fantacy/src/utils/app_constant.dart';
import 'package:cricket_fantacy/src/utils/local_storage/shared_prefrences.dart';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

class HomeController extends GetxController {
  ApiProvider apiProvider = ApiProvider();
  SharedPref sharedPref = new SharedPref();
  String profilePicUrl ='https://www.computerhope.com/jargon/g/guest-user.png';
        late SplashDataApiResponse splashDataApiResponse;
  String userToken = '';

  void getSplashData(context) async {
    String? userToken = await sharedPref.getUserToken();
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
      NetworkConstant.Package_Name: AppConstant.packageName,
      NetworkConstant.USER_TOKEN: userToken.toString(),
      NetworkConstant.Device_Name: modelName,
      NetworkConstant.One_Signal: 'ssss'
    };
    var response = await apiProvider.postBeforeAuthStaticToken(
        routeUrl: NetworkConstant.CUSTOMER_DATE_ROUTE_URL,
        bodyParams: parameter);
    print(response);
    splashDataApiResponse = SplashDataApiResponse.fromJson(response);
    sharedPref.setAppToken(splashDataApiResponse.data.appToken);
    update();
    _navigateFromThisPage(context, splashDataApiResponse.islogin);
  }

  void _navigateFromThisPage(BuildContext context, bool islogin) {
    if (islogin == true) {
      Navigator.pushAndRemoveUntil(context,
          MaterialPageRoute(builder: (context) {
        return DashboardScreen(
          index: 0,
        );
      }), (route) => false);
    } else {
      Navigator.pushAndRemoveUntil(context,
          MaterialPageRoute(builder: (context) {
        return  DashboardScreen(index: 0,);
      }), (route) => false);
    }
  }



  void getUsersProfile() async {
    String? picUrl = await sharedPref.getProfilePic();
   // String? token = await sharedPref.getUserToken();
    if (picUrl != null) {
      profilePicUrl = picUrl;
    }
    update();
  }
}
