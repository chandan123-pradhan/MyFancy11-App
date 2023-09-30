import 'dart:developer';

import 'package:cricket_fantacy/src/networking/api_provider.dart';
import 'package:cricket_fantacy/src/networking/network_contant.dart';
import 'package:get/get.dart';

class WinnerController extends GetxController{
  var winnerApiResponse;
  ApiProvider apiProvider = ApiProvider();
  void getWinnerData()async{
     Map parameter = {};
    var response = await apiProvider.postAfterAuth(
        routeUrl: NetworkConstant.winner_api, bodyParams: parameter);
        // debugger();
    if(response['status']==200){
      winnerApiResponse=response;
    }
    
    print("Winner Data featched");
    update();
  }
}