import 'dart:async';

import 'package:cricket_fantacy/src/models/LiveMatchUpdateApiResponse.dart';
import 'package:cricket_fantacy/src/networking/api_provider.dart';
import 'package:cricket_fantacy/src/networking/network_contant.dart';
import 'package:get/get.dart';

class LiveContestController extends GetxController{
   LiveMatchUpdateApiResponse? liveMatchUpdateApiResponse;
Timer? timer;


 ApiProvider apiProvider = ApiProvider();
  getData(matchId) async {
    Timer.periodic(Duration(seconds: 5), (timer)async { 
      Map parameter = {
      NetworkConstant.MatchId:matchId
    };
    var response = await apiProvider.postAfterAuth(
        routeUrl: NetworkConstant.Match_by_id, bodyParams: parameter);
  
  liveMatchUpdateApiResponse=LiveMatchUpdateApiResponse.fromJson(response);
  print("score udpated");
  update();
    });
  }

}


