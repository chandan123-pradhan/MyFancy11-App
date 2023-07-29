import 'package:cricket_fantacy/src/models/get_notification_api_response.dart';
import 'package:cricket_fantacy/src/networking/api_provider.dart';
import 'package:cricket_fantacy/src/networking/network_contant.dart';
import 'package:get/get.dart';

class NotificationController extends GetxController {
  GetNotificationApiResponse? getNotificationApiResponse;
  ApiProvider apiProvider = ApiProvider();
  getNotification() async {
    Map parameter = {};
    var response = await apiProvider.postAfterAuth(
        routeUrl: NetworkConstant.Notification_url, bodyParams: parameter);
  
  getNotificationApiResponse=GetNotificationApiResponse.fromJson(response);
  update();
  }
}
