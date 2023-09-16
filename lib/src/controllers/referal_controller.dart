import 'dart:developer';

import 'package:cricket_fantacy/src/models/my_refferal_api_response.dart';
import 'package:cricket_fantacy/src/models/palyer_profile_api_response.dart';
import 'package:cricket_fantacy/src/networking/api_provider.dart';
import 'package:cricket_fantacy/src/networking/network_contant.dart';
import 'package:get/get.dart';

class RefferalController extends GetxController {
  MyRefferalApiResponse? refferalApiResponse;

  ApiProvider apiProvider = ApiProvider();

  void getMyReffer() async {
    try {
      Map parameter = {};
      // debugger();
      var response = await apiProvider.postAfterAuth(
          routeUrl: NetworkConstant.refferData, bodyParams: parameter);

      refferalApiResponse = MyRefferalApiResponse.fromJson(response);

      update();
    } catch (e) {
      print(e);
    }
  }
}
