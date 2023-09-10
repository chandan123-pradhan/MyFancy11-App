import 'dart:developer';

import 'package:cricket_fantacy/src/models/palyer_profile_api_response.dart';
import 'package:cricket_fantacy/src/networking/api_provider.dart';
import 'package:cricket_fantacy/src/networking/network_contant.dart';
import 'package:get/get.dart';

class PlayerProfileController extends GetxController{
  PlayerProfileApiResponse? playerProfileApiResponse;

  ApiProvider apiProvider = ApiProvider();


void getPlayerProfile(playerId)async{
   try{
    Map parameter = {NetworkConstant.playerid: playerId};
   // debugger();
    var response = await apiProvider.postAfterAuth(
        routeUrl: NetworkConstant.player, bodyParams: parameter);

        playerProfileApiResponse=PlayerProfileApiResponse.fromJson(response);
   
         update();
   }catch(e){
print(e);
   }
  
}

}