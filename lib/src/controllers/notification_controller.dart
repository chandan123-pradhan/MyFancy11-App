import 'dart:developer';

import 'package:cricket_fantacy/src/models/get_notification_api_response.dart';
import 'package:cricket_fantacy/src/networking/api_provider.dart';
import 'package:cricket_fantacy/src/networking/network_contant.dart';
import 'package:get/get.dart';

class NotificationController extends GetxController {
  GetNotificationApiResponse? getNotificationApiResponse;
  ApiProvider apiProvider = ApiProvider();
  bool isNotFound=false;
  getNotification() async {
    Map parameter = {};
    var response = await apiProvider.postAfterAuth(
        routeUrl: NetworkConstant.Notification_url, bodyParams: parameter);
 debugger();
 
 if(response['status']==200){
   isNotFound=false;
  getNotificationApiResponse=GetNotificationApiResponse.fromJson(response);
 }else{
  isNotFound=true;
 }
  update();
  }
}
