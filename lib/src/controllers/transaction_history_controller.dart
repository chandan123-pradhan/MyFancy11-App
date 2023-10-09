import 'dart:developer';

import 'package:cricket_fantacy/src/models/get_notification_api_response.dart';
import 'package:cricket_fantacy/src/models/transaction_history_api_response.dart';
import 'package:cricket_fantacy/src/networking/api_provider.dart';
import 'package:cricket_fantacy/src/networking/network_contant.dart';
import 'package:get/get.dart';

class TransactionHistoryController extends GetxController {
  GetTransactionHistoryApiResponse? getTransactionHistoryApiResponse;
  bool isEmpty=false;
  bool isDataFetching=true;
  ApiProvider apiProvider = ApiProvider();
  getTransactionHistory() async {
    Map parameter = {};
    var response = await apiProvider.postAfterAuth(
        routeUrl: NetworkConstant.Get_transaction_history_url, bodyParams: parameter);
    // debugger();
   if(response['status']==404){
isEmpty=true;
   }else{
  getTransactionHistoryApiResponse=GetTransactionHistoryApiResponse.fromJson(response);
   }
   isDataFetching=false;
  update();
  }
}
